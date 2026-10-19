#!/usr/bin/env bash
set -euo pipefail

script_directory=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
repository_root=$(CDPATH= cd -- "$script_directory/../.." && pwd)
surfer_root=${SURFER_ROOT:-"$repository_root/.deps/algebraic-variety-explorer-mobile"}
output_directory=${1:-"$repository_root/out/native"}
build_directory=${BUILD_DIRECTORY:-"$repository_root/.build/native"}
compiler=${CC:-cc}

header="$surfer_root/native/surfer_raytracer.h"
source="$surfer_root/native/surfer_raytracer.c"
for required in "$header" "$source"; do
    if [[ ! -f "$required" ]]; then
        printf 'missing pinned SURFER dependency: %s\n' "$required" >&2
        printf 'see render/README.md for checkout instructions\n' >&2
        exit 2
    fi
done

mkdir -p "$build_directory" "$output_directory"

"$compiler" \
    -std=c17 -Wall -Wextra -Werror -pedantic -O2 \
    -fno-fast-math -ffp-contract=off \
    -I"$surfer_root/native" \
    "$source" \
    "$script_directory/madore_demo.c" \
    -lm \
    -o "$build_directory/madore-demo"

"$build_directory/madore-demo" "$output_directory"
(
    cd "$output_directory"
    sha256sum -- *.ppm > SHA256SUMS
)

printf 'native render outputs: %s\n' "$output_directory"
