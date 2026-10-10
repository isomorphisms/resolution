# David A. Madore — original Cubic Surfaces DVD source

**Original author:** **David A. Madore**  
**Original project:** http://www.madore.org/cubic-dvd/  
**Original source archive:** http://www.madore.org/cubic-dvd/SOURCE/cubic-dvd.tar.gz  
**YouTube playlist:** https://www.youtube.com/playlist?list=PL1AE045877D932E6A  
**Publication:** 2006, DVD version 2006-10-22

**Thank you, David A. Madore**, for the original mathematical visualizations and for making the source public.

## Reuse notice

On the original project page, Madore states that he places the entire *Cubic Surfaces DVD*, its source code, and associated materials **in the public domain**, permits copying or reuse for any purpose, and asks for recognition as the original author. **This vendored code is credited to David A. Madore.**

This permission is documented for the *Cubic Surfaces DVD project*. Do not assume it covers unrelated software or media on his wider website. Do not imply Madore endorses any extensions made in this repository.

## Import policy

- `upstream/`: original source file **contents preserved byte for byte**, keeping paths from Madore's tarball; no automatic banners, renaming, or rewriting.
- `SOURCE-MANIFEST.json`: upstream archive SHA-256, sizes, and a per-entry list of included and omitted members. Check this to verify exactly what was copied.
- `original/cubic-dvd.tar.gz`: unmodified original tarball **when its size permits** (up to 18 MiB); otherwise download it from Madore's authoritative URL above.
- Generated movie/image/audio binaries, archives-within-archives, unsafe paths, symlinks and exceptionally large files are **not expanded** into the readable source tree. Omissions are itemized in the manifest. The complete original archive remains the source of truth.

The upstream source is a historical **2006** POV-Ray/DVD production working directory, not a currently supported build or a working minimal-resolution renderer. Imported sources have not been executed, compiled, or modernized merely by being copied. No dependency or compatible license status is asserted for files outside the cited DVD project.

The import is implemented by [`scripts/import_madore_cubic_dvd.py`](../../../scripts/import_madore_cubic_dvd.py), which requires the original tarball as its sole argument. The purpose of the import is to **read the real original rendering code** before adapting its techniques for a mathematically distinct project.

See the [complete acknowledgment](../../../ACKNOWLEDGMENTS.md), [Madore notes](../../../notes/03-david-madore.md), and [32-video catalog](../../../notes/08-cubic-surfaces-youtube-playlist.md).
