#!/usr/bin/env python3
"""Structural acceptance checks for deterministic native render artifacts."""

from __future__ import annotations

import hashlib
import pathlib
import sys

EXPECTED = (
    "a1-frame-000.ppm",
    "a1-frame-075.ppm",
    "a1-frame-150.ppm",
    "a1-frame-225.ppm",
    "cayley-affine.ppm",
    "madore-03s01a-native.ppm",
)


def read_ppm(path: pathlib.Path) -> tuple[int, int, bytes]:
    data = path.read_bytes()
    parts = data.split(b"\n", 3)
    if len(parts) != 4 or parts[0] != b"P6" or parts[2] != b"255":
        raise ValueError(f"{path}: unsupported PPM header")
    width_text, height_text = parts[1].split()
    width = int(width_text)
    height = int(height_text)
    pixels = parts[3]
    if len(pixels) != width * height * 3:
        raise ValueError(
            f"{path}: expected {width * height * 3} pixel bytes, got {len(pixels)}"
        )
    return width, height, pixels


def main() -> int:
    if len(sys.argv) != 2:
        print(f"usage: {sys.argv[0]} OUTPUT_DIRECTORY", file=sys.stderr)
        return 64

    output_directory = pathlib.Path(sys.argv[1])
    digests: dict[str, str] = {}
    for name in EXPECTED:
        path = output_directory / name
        width, height, pixels = read_ppm(path)
        if (width, height) != (320, 320):
            raise ValueError(f"{path}: expected 320x320, got {width}x{height}")
        colors = {pixels[index : index + 3] for index in range(0, len(pixels), 3)}
        if len(colors) < 32:
            raise ValueError(f"{path}: only {len(colors)} distinct colors")
        digests[name] = hashlib.sha256(path.read_bytes()).hexdigest()

    if digests["a1-frame-000.ppm"] != digests["a1-frame-150.ppm"]:
        raise ValueError("symmetric frames 0 and 150 should be byte-identical")

    distinct_images = {
        digests["a1-frame-000.ppm"],
        digests["a1-frame-075.ppm"],
        digests["a1-frame-225.ppm"],
        digests["cayley-affine.ppm"],
        digests["madore-03s01a-native.ppm"],
    }
    if len(distinct_images) != 5:
        raise ValueError(
            "nearby smooth, singular, maximal deformation, Cayley, and "
            "Madore 03s01a frames must be distinct"
        )

    manifest = (output_directory / "manifest.tsv").read_text(encoding="utf-8")
    if "a1\t75\t0\t" not in manifest:
        raise ValueError("manifest does not mark frame 75 as the singular parameter value")
    if "madore-03s01a\t75\t0\t" not in manifest:
        raise ValueError("manifest does not record the adapted Madore scene")

    print("native render acceptance: ok")
    for name in EXPECTED:
        print(f"{digests[name]}  {name}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
