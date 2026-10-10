#!/usr/bin/env python3
"""Vendor David A. Madore's original public-domain Cubic Surfaces DVD source.

Input must be the author's unmodified cubic-dvd.tar.gz archive.  This script
does not execute any upstream source or build tools.  It unpacks safe text
source files while preserving the upstream archive paths, records omitted
members, and keeps a verbatim copy of the archive when reasonably small.

Original author: David A. Madore
Original project and source: http://www.madore.org/cubic-dvd/
Archive: http://www.madore.org/cubic-dvd/SOURCE/cubic-dvd.tar.gz
"""

from __future__ import annotations

import hashlib
import io
import json
import os
from pathlib import Path, PurePosixPath
import shutil
import sys
import tarfile

ROOT = Path("vendor/david-madore/cubic-dvd")
UPSTREAM = ROOT / "upstream"
ARCHIVE_COPY = ROOT / "original" / "cubic-dvd.tar.gz"
MAX_ARCHIVE_COPY_BYTES = 18 * 1024 * 1024
MAX_SINGLE_SOURCE_BYTES = 5 * 1024 * 1024
MAX_TOTAL_SOURCE_BYTES = 65 * 1024 * 1024
MAX_FILES = 5000

# Source code, build scripts, and small text assets are useful in Git; the
# original downloadable archive remains the authoritative complete source.
GENERATED_OR_BINARY = {
    ".mpg", ".mpeg", ".mp4", ".m4v", ".avi", ".mov", ".vob", ".iso",
    ".wav", ".mp3", ".flac", ".ogg", ".png", ".jpg", ".jpeg", ".gif",
    ".bmp", ".tif", ".tiff", ".tga", ".pdf", ".ps", ".dvi",
    ".gz", ".bz2", ".xz", ".zip", ".7z", ".rar", ".tar", ".torrent",
    ".o", ".so", ".a", ".dll", ".exe", ".class", ".pyc",
}
def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()

def clean_member_path(name: str) -> PurePosixPath | None:
    """Reject absolute, escaping, and non-canonical paths."""
    if not name or name.startswith("/") or "\\" in name or "\x00" in name:
        return None
    parts = [part for part in name.split("/") if part and part != "."]
    if not parts or any(part == ".." for part in parts):
        return None
    return PurePosixPath(*parts)

def main(filename: str) -> None:
    source_archive = Path(filename)
    if not source_archive.is_file():
        raise SystemExit(f"Missing upstream archive: {source_archive}")
    archive_hash = hashlib.file_digest(source_archive.open("rb"), "sha256").hexdigest()
    archive_size = source_archive.stat().st_size

    if UPSTREAM.exists() or ARCHIVE_COPY.exists():
        raise SystemExit("Vendor destination is already populated; will not overwrite.")

    records: list[dict[str, object]] = []
    imported_count = 0
    imported_size = 0
    with tarfile.open(source_archive, mode="r:gz") as tar:
        members = tar.getmembers()
        for member in members:
            original_name = member.name
            clean_path = clean_member_path(original_name)
            entry: dict[str, object] = {"name": original_name, "bytes": member.size}
            if not clean_path:
                entry["status"] = "omitted: unsafe path"
            elif member.isdir():
                continue
            elif not member.isfile():
                entry["status"] = "omitted: symlink, hardlink, or special entry"
                if member.issym() or member.islnk():
                    entry["link_target"] = member.linkname
            elif clean_path.suffix.lower() in GENERATED_OR_BINARY:
                entry["status"] = "omitted: generated media or binary"
            elif member.size > MAX_SINGLE_SOURCE_BYTES:
                entry["status"] = "omitted: larger than source-file limit"
            elif imported_count >= MAX_FILES or imported_size + member.size > MAX_TOTAL_SOURCE_BYTES:
                entry["status"] = "omitted: source import safety cap"
            else:
                reader = tar.extractfile(member)
                if reader is None:
                    entry["status"] = "omitted: unreadable tar member"
                else:
                    data = reader.read(MAX_SINGLE_SOURCE_BYTES + 1)
                    if len(data) != member.size:
                        entry["status"] = "omitted: member length mismatch"
                    elif b"\x00" in data[:8192]:
                        entry["status"] = "omitted: probable binary file"
                    else:
                        path = UPSTREAM.joinpath(*clean_path.parts)
                        if path.exists():
                            entry["status"] = "omitted: duplicate path"
                        else:
                            path.parent.mkdir(parents=True, exist_ok=True)
                            path.write_bytes(data)  # byte-for-byte, no added credits or edits
                            entry["status"] = "imported"
                            entry["sha256"] = sha256(data)
                            imported_count += 1
                            imported_size += len(data)
            records.append(entry)

    archived = False
    if archive_size <= MAX_ARCHIVE_COPY_BYTES:
        ARCHIVE_COPY.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(source_archive, ARCHIVE_COPY)
        archived = True

    manifest = {
        "original_author": "David A. Madore",
        "original_project": "http://www.madore.org/cubic-dvd/",
        "original_source_archive": "http://www.madore.org/cubic-dvd/SOURCE/cubic-dvd.tar.gz",
        "original_source_archive_sha256": archive_hash,
        "original_source_archive_bytes": archive_size,
        "verbatim_archive_in_git": archived,
        "files_imported": imported_count,
        "bytes_imported": imported_size,
        "files_listed": len(records),
        "entries": records,
    }
    ROOT.mkdir(parents=True, exist_ok=True)
    (ROOT / "SOURCE-MANIFEST.json").write_text(
        json.dumps(manifest, ensure_ascii=False, indent=2) + "\n", encoding="utf-8"
    )
    print(json.dumps({
        "original_sha256": archive_hash,
        "archive_bytes": archive_size,
        "archived": archived,
        "imported_files": imported_count,
        "imported_bytes": imported_size,
        "listed_entries": len(records),
    }, indent=2))
    if imported_count == 0:
        raise SystemExit("No source files imported: refusing a provenance-only success.")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        raise SystemExit(f"Usage: {sys.argv[0]} path/to/cubic-dvd.tar.gz")
    main(sys.argv[1])
