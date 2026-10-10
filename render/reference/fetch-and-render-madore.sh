#!/usr/bin/env bash
set -euo pipefail

output_directory=${1:-out/madore-reference}
work_directory=${2:-.build/madore-reference}
archive="$work_directory/cubic-dvd.tar.gz"
source_directory="$work_directory/source"
source_url_https='https://www.madore.org/cubic-dvd/SOURCE/cubic-dvd.tar.gz'
source_url_http='http://www.madore.org/cubic-dvd/SOURCE/cubic-dvd.tar.gz'

mkdir -p "$output_directory" "$work_directory"
rm -rf "$source_directory"
mkdir -p "$source_directory"

fetch_archive() {
    local url
    for url in "$source_url_https" "$source_url_http"; do
        if curl --fail --location --retry 3 --retry-all-errors \
            --connect-timeout 20 --max-time 300 \
            "$url" --output "$archive"; then
            printf '%s\n' "$url" > "$output_directory/SOURCE_URL"
            return 0
        fi
    done
    return 1
}

fetch_archive
sha256sum "$archive" | sed "s#${archive}#cubic-dvd.tar.gz#" \
    > "$output_directory/SOURCE_SHA256"
tar -tzf "$archive" > "$output_directory/archive-inventory.txt"
tar -xzf "$archive" -C "$source_directory"
find "$source_directory" -type f -printf '%P\n' | LC_ALL=C sort \
    > "$output_directory/extracted-files.txt"

if ! command -v povray >/dev/null 2>&1; then
    printf 'povray is required to exercise the original scene files\n' >&2
    exit 2
fi

mapfile -t preferred_scenes < <(
    find "$source_directory" -type f -iname '*.pov' -print | LC_ALL=C sort |
        grep -E '/(18s01a|06s02a|03s01a)[^/]*\.pov$' || true
)
mapfile -t all_scenes < <(
    find "$source_directory" -type f -iname '*.pov' -print | LC_ALL=C sort
)

if ((${#all_scenes[@]} == 0)); then
    printf 'archive contains no .pov scene files; inspect extracted-files.txt\n' >&2
    exit 3
fi

candidates=("${preferred_scenes[@]}" "${all_scenes[@]}")
: > "$output_directory/render-attempts.log"
rendered_scene=''

for scene in "${candidates[@]}"; do
    [[ -n "$scene" ]] || continue
    scene_directory=$(dirname -- "$scene")
    scene_file=$(basename -- "$scene")
    scene_relative=${scene#"$source_directory"/}
    printf '\n===== %s =====\n' "$scene_relative" \
        >> "$output_directory/render-attempts.log"
    rm -f "$output_directory/madore-reference.png"
    if (
        cd "$scene_directory"
        povray \
            "+I$scene_file" \
            "+O$(realpath -m "$output_directory/madore-reference.png")" \
            +W320 +H240 +FN -D +V +A0.1 +K0.25
    ) >> "$output_directory/render-attempts.log" 2>&1 &&
        [[ -s "$output_directory/madore-reference.png" ]]; then
        rendered_scene=$scene_relative
        break
    fi
done

if [[ -z "$rendered_scene" ]]; then
    printf 'no original POV-Ray scene rendered; inspect render-attempts.log\n' >&2
    exit 4
fi

printf '%s\n' "$rendered_scene" > "$output_directory/RENDERED_SCENE"
sha256sum "$output_directory/madore-reference.png" \
    > "$output_directory/RENDERED_SHA256"
printf 'original Madore scene rendered: %s\n' "$rendered_scene"
