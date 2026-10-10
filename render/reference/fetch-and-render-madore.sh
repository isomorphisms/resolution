#!/usr/bin/env bash
set -euo pipefail

requested_output_directory=${1:-out/madore-reference}
requested_work_directory=${2:-.build/madore-reference}
mkdir -p "$requested_output_directory" "$requested_work_directory"
output_directory=$(CDPATH= cd -- "$requested_output_directory" && pwd)
work_directory=$(CDPATH= cd -- "$requested_work_directory" && pwd)

archive="$work_directory/cubic-dvd.tar.gz"
source_directory="$work_directory/source"
source_url_http='http://www.madore.org/cubic-dvd/SOURCE/cubic-dvd.tar.gz'
source_url_https='https://www.madore.org/cubic-dvd/SOURCE/cubic-dvd.tar.gz'
expected_source_sha256='4996b498815783ab8f968022b8720cb5fad02ca8c7a40b82386978e5acdc2528'

rm -rf "$source_directory"
mkdir -p "$source_directory"

fetch_archive() {
    local url
    for url in "$source_url_http" "$source_url_https"; do
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
actual_source_sha256=$(sha256sum "$archive" | awk '{print $1}')
printf '%s  cubic-dvd.tar.gz\n' "$actual_source_sha256" \
    > "$output_directory/SOURCE_SHA256"
if [[ "$actual_source_sha256" != "$expected_source_sha256" ]]; then
    printf 'Madore source archive hash mismatch: expected %s, got %s\n' \
        "$expected_source_sha256" "$actual_source_sha256" >&2
    exit 1
fi

tar -tzf "$archive" > "$output_directory/archive-inventory.txt"
tar -xzf "$archive" -C "$source_directory"
find "$source_directory" -type f -printf '%P\n' | LC_ALL=C sort \
    > "$output_directory/extracted-files.txt"
if [[ -f "$source_directory/cubic-dvd/list" ]]; then
    cp "$source_directory/cubic-dvd/list" "$output_directory/original-catalog.txt"
fi

if ! command -v povray >/dev/null 2>&1; then
    printf 'povray is required to exercise the original scene files\n' >&2
    exit 2
fi
povray --version > "$output_directory/POVRAY_VERSION" 2>&1 || true

mapfile -t preferred_scenes < <(
    find "$source_directory" -type f -iname '*.pov' -print | LC_ALL=C sort |
        grep -E '/(03s01a|06s02a|18s01a)\.pov$' || true
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
rendered_source=''

for scene in "${candidates[@]}"; do
    [[ -n "$scene" ]] || continue
    scene_directory=$(dirname -- "$scene")
    scene_file=$(basename -- "$scene")
    scene_relative=${scene#"$source_directory"/}
    local_output="$scene_directory/resolution-reference.png"
    printf '\n===== %s =====\n' "$scene_relative" \
        >> "$output_directory/render-attempts.log"
    rm -f "$local_output"
    if (
        cd "$scene_directory"
        povray \
            "+I$scene_file" \
            '+Oresolution-reference.png' \
            +W320 +H240 +FN -D +V +A0.1 +K0.25
    ) >> "$output_directory/render-attempts.log" 2>&1 &&
        [[ -s "$local_output" ]]; then
        rendered_scene=$scene_relative
        rendered_source=$scene
        cp "$local_output" "$output_directory/madore-reference.png"
        break
    fi
done

if [[ -z "$rendered_scene" ]]; then
    printf 'no original POV-Ray scene rendered; inspect render-attempts.log\n' >&2
    exit 4
fi

printf '%s\n' "$rendered_scene" > "$output_directory/RENDERED_SCENE"
cp "$rendered_source" \
    "$output_directory/original-$(basename -- "$rendered_source")"
sha256sum "$output_directory/madore-reference.png" \
    > "$output_directory/RENDERED_SHA256"
printf 'original Madore scene rendered: %s\n' "$rendered_scene"
