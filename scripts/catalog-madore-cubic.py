#!/usr/bin/env python3
"""Inventory all 54 original Madore POV-Ray cubic surfaces, without eval.

The inputs are the original files copied byte-for-byte into vendor/.
Creates notes/10-madore-source-polynomial-atlas.md and
data/madore-cubic-polynomials.json. Fails closed on missing/corrupted sources.

Original source/mathematics: David A. Madore, The Cubic Surfaces DVD (2006),
http://www.madore.org/cubic-dvd/ (public domain, attribution requested).
"""
from __future__ import annotations

import hashlib
import html
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ARCHIVE = ROOT / "vendor/david-madore/cubic-dvd"
ORIGINALS = ARCHIVE / "upstream/cubic-dvd"
OUTPUT_JSON = ROOT / "data/madore-cubic-polynomials.json"
OUTPUT_NOTES = ROOT / "notes/10-madore-source-polynomial-atlas.md"

# Verified directly from POV-Ray 3.7's cubic coefficient-order documentation.
# https://www.povray.org/documentation/view/3.7.1/298/
TERMS = [
    "x^3", "x^2*y", "x^2*z", "x^2", "x*y^2", "x*y*z", "x*y",
    "x*z^2", "x*z", "x", "y^3", "y^2*z", "y^2", "y*z^2", "y*z",
    "y", "z^3", "z^2", "z", "1",
]
CUBIC = re.compile(r"\bcubic\s*\{\s*<([^>]*)>", re.DOTALL)
VIDEO = re.compile(
    r'<a\b[^>]*href="ANIM/([A-Za-z0-9]+)\.short\.mpg"[^>]*>(.*?)</a>',
    re.IGNORECASE | re.DOTALL,
)
FILM_COUNT = 54

def fail(message: str) -> None:
    raise SystemExit("Madore catalog: " + message)

def formula_from_coefficients(coefficients: list[str]) -> str:
    summands = []
    for coefficient, monomial in zip(coefficients, TERMS):
        c = coefficient.strip()
        if c in ("0", "0.0", "0.00", "+0", "-0"):
            continue
        if monomial == "1":
            summands.append(c)
        elif c == "1":
            summands.append(monomial)
        elif c == "-1":
            summands.append("-" + monomial)
        else:
            summands.append("(" + c + ")*" + monomial)
    return " + ".join(summands).replace("+ -", "- ") if summands else "0"

def main() -> None:
    original_manifest = json.loads((ARCHIVE / "SOURCE-MANIFEST.json").read_text())
    hash_by_name = {
        entry["name"]: entry["sha256"] for entry in original_manifest["entries"]
        if entry.get("status") == "imported"
    }
    names = (ORIGINALS / "list").read_text().split()
    if len(names) != FILM_COUNT or len(set(names)) != FILM_COUNT:
        fail("original list does not contain 54 distinct film names")

    original_html = (ORIGINALS / "cubic-dvd.html").read_text(encoding="iso-8859-1")
    descriptions: dict[str, str] = {}
    for match in VIDEO.finditer(original_html):
        title = re.sub(r"<[^>]*>", " ", match.group(2))
        title = html.unescape(re.sub(r"\s+", " ", title).strip())
        descriptions[match.group(1)] = title
    if len(descriptions) != FILM_COUNT or set(descriptions) != set(names):
        fail("original HTML film index does not agree with the 54-item list")

    items = []
    for index, stem in enumerate(names, 1):
        source = ORIGINALS / (stem + ".pov")
        raw = source.read_bytes()
        actual_hash = hashlib.sha256(raw).hexdigest()
        expected_hash = hash_by_name.get("cubic-dvd/" + source.name)
        if not expected_hash or actual_hash != expected_hash:
            fail("original file missing or modified: " + source.name)
        code = raw.decode("utf-8")
        # Strip ordinary POV-Ray line comments for metadata parsing only.
        active = "\n".join(line.split("//")[0] for line in code.splitlines())
        cubic_blocks = [m.group(1).split(",") for m in CUBIC.finditer(active)]
        if len(cubic_blocks) != 2 or any(len(block) != 20 for block in cubic_blocks):
            fail(source.name + ": expected two 20-coefficient cubic solids")
        vectors = [[x.strip() for x in block] for block in cubic_blocks]
        first_constant = vectors[0][19]
        if not re.search(r"-\s*0\.0001\s*$", first_constant):
            fail(source.name + ": absent expected -0.0001 skin tolerance")
        coefficients = list(vectors[0])
        coefficients[19] = (
            re.sub(r"-\s*0\.0001\s*$", "", first_constant).strip() or "0"
        )
        rotation = re.search(r"\brotate\s*<([^>]*)>", active)
        camera = re.search(r"\bcamera\s*\{([^}]*)}", active, re.DOTALL)
        sphere = re.search(
            r"\bsphere\s*\{\s*<0,\s*0,\s*0>,\s*([^\s}]+)", active
        )
        obj = {
            "index": index,
            "stem": stem,
            "original_description": descriptions[stem],
            "source": "vendor/david-madore/cubic-dvd/upstream/cubic-dvd/" + source.name,
            "source_sha256": actual_hash,
            "original_animation": (
                "http://www.madore.org/cubic-dvd/ANIM/" + stem + ".short.mpg"
            ),
            "polynomial_F": formula_from_coefficients(coefficients),
            "coefficients_F": coefficients,
            "original_first_cubic": vectors[0],
            "original_second_cubic": vectors[1],
            "original_thickness": 0.0001,
            "camera": re.sub(r"\s+", " ", camera.group(1)).strip() if camera else None,
            "rotation": rotation.group(1).strip() if rotation else None,
            "clipping_sphere_radius": sphere.group(1) if sphere else None,
            "animated_coefficients": any("clock" in s for s in coefficients),
            "animated_rotation": bool(rotation and "clock" in rotation.group(1)),
        }
        items.append(obj)

    by_stem = {o["stem"]: o for o in items}
    e6 = by_stem["03s01a"]["coefficients_F"]
    if any(e6[i] != ("1" if i in (3, 7, 10) else "0") for i in range(20)):
        fail("E6 polynomial regression against original source")
    cayley = by_stem["06s02a"]["coefficients_F"]
    for index, value in ((3, "-1.2"), (5, "2"), (12, "-1.2"), (17, "-1.2"), (19, "1.728")):
        if cayley[index] != value:
            fail("Cayley polynomial regression against original source")

    output = {
        "schema": "madore-2006-cubic-polynomials-v1",
        "original_author": "David A. Madore",
        "original_project": "http://www.madore.org/cubic-dvd/",
        "original_archive_sha256": original_manifest["original_source_archive_sha256"],
        "license": "Original DVD project and source explicitly public domain; credit requested",
        "original_film_count": FILM_COUNT,
        "coefficient_monomials": TERMS,
        "notes": [
            "The first source cubic is F - 0.0001 and the second is -F - 0.0001.",
            "Coefficients_F remove only the thin-band offset from the first vector.",
            "All textual formula expressions remain unexecuted POV-Ray expressions.",
            "Classification labels are copied from Madore's source index, not independently proved.",
        ],
        "films": items,
    }
    OUTPUT_JSON.parent.mkdir(parents=True, exist_ok=True)
    OUTPUT_JSON.write_text(
        json.dumps(output, ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8",
    )

    rotations = sum(o["animated_rotation"] and not o["animated_coefficients"] for o in items)
    deformations = sum(o["animated_coefficients"] for o in items)
    backtick = chr(96)
    md = [
        "# David A. Madore — source equations for all 54 cubic-surface films",
        "",
        "**Credit: David A. Madore**, *The Cubic Surfaces DVD* (2006).",
        "[Original films, full public-domain source and author notice]"
        "(http://www.madore.org/cubic-dvd/). Thank you to Madore for publishing"
        " the mathematical images and the source used to construct them.",
        "",
        "**Complete coverage:** 54/54 source films, in original DVD order. "
        "The [machine-readable exact coefficient ledger]"
        "(../data/madore-cubic-polynomials.json) preserves 20 polynomial "
        "coefficient expressions for each film, both original cubic vectors, "
        "SHA-256 for each source, camera and rotation parameters.",
        "",
        "We found " + str(rotations) + " movies driven by rotation alone and "
        + str(deformations) + " movies with time-dependent polynomial "
        "coefficients. Several remaining examples have constant equations "
        "but other time-dependent scene motions.",
        "",
        "## POV-Ray cubic coefficient order",
        "",
        "Official documentation: "
        "https://www.povray.org/documentation/view/3.7.1/298/",
        "",
        "A01 x³; A02 x²y; A03 x²z; A04 x²; A05 xy²; "
        "A06 xyz; A07 xy; A08 xz²; A09 xz; A10 x; "
        "A11 y³; A12 y²z; A13 y²; A14 yz²; A15 yz; "
        "A16 y; A17 z³; A18 z²; A19 z; A20 1.",
        "",
        "Each first cubic defines F−0.0001; the second defines −F−0.0001. "
        "Their intersection creates a thin shell around the real zero set. "
        "The expressions in the table have the fixed offset removed; "
        "they do not remove mathematical terms that vary with the animation clock.",
        "",
        "## All 54 sources",
        "",
        "| # | Original description and source | Polynomial F(x,y,z;clock) | Motion |",
        "|---:|---|---|---|",
    ]
    for item in items:
        source = "../" + item["source"]
        name_link = f"[{backtick}{item['stem']}{backtick}]({source})"
        polynomial = item["polynomial_F"]
        if len(polynomial) > 230:
            polynomial = polynomial[:195] + " … (full terms in JSON)"
        motion = (
            "coefficients" if item["animated_coefficients"] else
            "rotation" if item["animated_rotation"] else "other/static"
        )
        description = item["original_description"].replace("|", "/")
        md.append(
            f"| {item['index']} | {name_link} — {description} | "
            f"{backtick}{polynomial}{backtick} | {motion} |"
        )

    md.extend([
        "",
        "## Mathematical checks suggested by the verified source equations",
        "",
        "### E6 baseline: 03s01a",
        "",
        "F=x²+xz²+y³. Completing the square yields "
        "(x+z²/2)²+y³−z⁴/4, a complex-analytic E6 singularity.",
        "This equation is now independently rendered by original POV-Ray "
        "and by real SURFER/jsurf. See [the dual-render note]"
        "(09-madore-e6-cross-render.md).",
        "",
        "### E6 to two A2 points: 03s02a",
        "",
        "F_t=x²+xz²+y³+c*x, c=cos(2πt). For nonzero c, "
        "two complex A2 points occur at (x,y,z)=(0,0,±√(-c)); "
        "when c>0 they are nonreal in these coordinates. "
        "They coalesce to E6 at c=0.",
        "",
        "### E6 to D5: 03s03a",
        "",
        "F_t=x²+xz²+sin(2πt)y³+cos(2πt)y²z. "
        "At t=0, completing the square in x yields "
        "u²+y²z−z⁴/4, of type D5. At t=1/4 the member is E6.",
        "",
        "### Four nodes of the Cayley cubic: 06s02a",
        "",
        "F=2xyz−1.2(x²+y²+z²)+1.728. Its nodes are "
        "(±1.2,±1.2,±1.2) with an even number of negative signs. "
        "The four global A1 points are different from a single D4 resolution graph.",
        "",
        "### D4 to three A1 nodes: 10s01a",
        "",
        "Let c=cos(2πt). The exact source gives "
        "F_t=−x³+3cx²+3xz²+y²+3cz²−4c³. "
        "At c=0 it has one D4 singularity. For c≠0 the three "
        "A1 singularities are at (2c,0,0), "
        "(−c,0,√3*c), (−c,0,−√3*c). "
        "This is deformation adjacency, not a blowup.",
        "",
        "## Boundaries of the extraction",
        "",
        "The 54 filenames and film descriptions come directly from Madore's "
        "original list and HTML index; every input .pov byte SHA-256 was "
        "checked against the original archive's import manifest. "
        "No expression was dynamically evaluated. Longer random-polynomial "
        "examples are shortened only in this Markdown table; full "
        "coefficients are preserved in the JSON. "
        "Actual surface singularities should still be proved individually "
        "rather than inferred from the film titles.",
        "",
        "Original source and attribution: http://www.madore.org/cubic-dvd/ · "
        "[Project acknowledgment](../ACKNOWLEDGMENTS.md) · "
        "[SURFER movie PR](https://github.com/isomorphismes/algebraic-variety-explorer-mobile/pull/29).",
        "",
    ])
    OUTPUT_NOTES.parent.mkdir(parents=True, exist_ok=True)
    OUTPUT_NOTES.write_text("\n".join(md), encoding="utf-8")
    print(json.dumps({
        "original_films": len(items),
        "source_hashes_verified": len(items),
        "pure_rotation_movies": rotations,
        "coefficient_animated_movies": deformations,
        "data": str(OUTPUT_JSON.relative_to(ROOT)),
        "notes": str(OUTPUT_NOTES.relative_to(ROOT)),
    }, indent=2))

if __name__ == "__main__":
    main()
