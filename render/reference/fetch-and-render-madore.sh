#!/usr/bin/env bash
set -euo pipefail

script_directory=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
repository_root=$(CDPATH= cd -- "$script_directory/../.." && pwd)
requested_output_directory=${1:-"$repository_root/out/madore-reference"}
requested_work_directory=${2:-"$repository_root/.build/madore-reference"}
mkdir -p "$requested_output_directory" "$requested_work_directory"
output_directory=$(CDPATH= cd -- "$requested_output_directory" && pwd)
work_directory=$(CDPATH= cd -- "$requested_work_directory" && pwd)

vendor_root="$repository_root/vendor/david-madore/cubic-dvd"
archive="$vendor_root/original/cubic-dvd.tar.gz"
source_root="$vendor_root/upstream/cubic-dvd"
source_scene="$source_root/03s01a.pov"
source_catalog="$source_root/list"
source_url='http://www.madore.org/cubic-dvd/SOURCE/cubic-dvd.tar.gz'
expected_archive_sha256='4996b498815783ab8f968022b8720cb5fad02ca8c7a40b82386978e5acdc2528'
expected_scene_sha256='064429bbdd8f6ebc5d36d49e0c0254edeed597f34643d702ee6cfc7d9cd508c0'
exercised_clock='0.25'

for required in "$archive" "$source_scene" "$source_catalog"; do
    if [[ ! -f "$required" ]]; then
        printf 'missing vendored Madore source: %s\n' "$required" >&2
        exit 1
    fi
done

actual_archive_sha256=$(sha256sum "$archive" | awk '{print $1}')
actual_scene_sha256=$(sha256sum "$source_scene" | awk '{print $1}')
printf '%s\n' "$source_url" > "$output_directory/SOURCE_URL"
printf '%s  cubic-dvd.tar.gz\n' "$actual_archive_sha256" \
    > "$output_directory/SOURCE_SHA256"
printf '%s  cubic-dvd/03s01a.pov\n' "$actual_scene_sha256" \
    > "$output_directory/SCENE_SHA256"
printf '%s\n' "$exercised_clock" > "$output_directory/EXERCISED_CLOCK"

if [[ "$actual_archive_sha256" != "$expected_archive_sha256" ]]; then
    printf 'vendored Madore archive hash mismatch: expected %s, got %s\n' \
        "$expected_archive_sha256" "$actual_archive_sha256" >&2
    exit 1
fi
if [[ "$actual_scene_sha256" != "$expected_scene_sha256" ]]; then
    printf 'vendored Madore scene hash mismatch: expected %s, got %s\n' \
        "$expected_scene_sha256" "$actual_scene_sha256" >&2
    exit 1
fi

tar -tzf "$archive" > "$output_directory/archive-inventory.txt"
find "$source_root" -type f -printf '%P\n' | LC_ALL=C sort \
    > "$output_directory/vendored-files.txt"
cp "$source_catalog" "$output_directory/original-catalog.txt"
cp "$source_scene" "$output_directory/original-03s01a.pov"
printf '%s\n' 'vendor/david-madore/cubic-dvd/upstream/cubic-dvd/03s01a.pov' \
    > "$output_directory/RENDERED_SCENE"

if ! command -v povray >/dev/null 2>&1; then
    printf 'povray is required to exercise the original scene file\n' >&2
    exit 2
fi
povray --version > "$output_directory/POVRAY_VERSION" 2>&1 || true

rm -rf "$work_directory/scene"
mkdir -p "$work_directory/scene"
cp "$source_scene" "$work_directory/scene/03s01a.pov"
if ! cmp -s "$source_scene" "$work_directory/scene/03s01a.pov"; then
    printf 'working scene copy differs from vendored source\n' >&2
    exit 3
fi
cat > "$work_directory/scene/clock-probe.pov" <<'POV'
#debug concat("RESOLUTION_CLOCK=", str(clock, 0, 6), "\n")
#include "03s01a.pov"
POV

: > "$output_directory/render.log"
(
    cd "$work_directory/scene"
    povray \
        "+K$exercised_clock" \
        '+Iclock-probe.pov' \
        '+Omadore-reference.png' \
        +W320 +H240 +FN -D +V +A0.1
) >> "$output_directory/render.log" 2>&1

if ! grep -q 'RESOLUTION_CLOCK=0.250000' "$output_directory/render.log"; then
    printf 'POV-Ray did not report the requested clock value; inspect render.log\n' >&2
    exit 4
fi
working_output="$work_directory/scene/madore-reference.png"
if [[ ! -s "$working_output" ]]; then
    printf 'original Madore scene produced no PNG; inspect render.log\n' >&2
    exit 5
fi
cp "$working_output" "$output_directory/madore-reference.png"
(
    cd "$output_directory"
    sha256sum madore-reference.png > RENDERED_SHA256
)
printf 'vendored original Madore scene rendered at clock %s: %s\n' \
    "$exercised_clock" \
    'vendor/david-madore/cubic-dvd/upstream/cubic-dvd/03s01a.pov'
