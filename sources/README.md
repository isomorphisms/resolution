# Source and attribution ledger

This repository should keep source status visible. A useful claim must say whether it came from a primary source, a substantial reading note, an abstract, or an unverified lead.

## 1. Existing notes in the user's repositories

### Eisenbud: commutative algebra

Repository:

- https://github.com/walnut-burgundy/Eisenbud-Harris

Relevant files:

- [`01-basic-constructions.md`](https://github.com/walnut-burgundy/Eisenbud-Harris/blob/main/books/eisenbud-commutative-algebra/notes/01-basic-constructions.md)
- [`03-grobner-bases-and-differentials.md`](https://github.com/walnut-burgundy/Eisenbud-Harris/blob/main/books/eisenbud-commutative-algebra/notes/03-grobner-bases-and-differentials.md)
- [`05-worked-examples.md`](https://github.com/walnut-burgundy/Eisenbud-Harris/blob/main/books/eisenbud-commutative-algebra/notes/05-worked-examples.md)

Material adapted into this repository:

- ideals versus radicals and the geometric information lost on reduction;
- localization at the singular point;
- normalization and the cusp example;
- associated graded rings and tangent cones;
- flat versus nonflat families;
- Kähler differentials, cotangent spaces, and the Jacobian criterion;
- Gröbner-basis workflow for chart calculations;
- the distinction between singularity, normality, Cohen–Macaulayness, and Gorensteinness.

Status: **adapted from the user's existing reading notes**. These files are not a substitute for checking Eisenbud's book when a theorem's exact hypotheses matter.

Primary book:

- David Eisenbud, *Commutative Algebra with a View Toward Algebraic Geometry*, Graduate Texts in Mathematics 150, Springer.

### Miles Reid

Repository:

- https://github.com/walnut-burgundy/alphabet-of-mathematics/tree/master/research/Miles%20Reid

Relevant files:

- [`README.md`](https://github.com/walnut-burgundy/alphabet-of-mathematics/blob/master/research/Miles%20Reid/README.md)
- [`Undergraduate Algebraic Geometry.md`](https://github.com/walnut-burgundy/alphabet-of-mathematics/blob/master/research/Miles%20Reid/books/Undergraduate%20Algebraic%20Geometry.md)
- [`Chapters on Algebraic Surfaces.md`](https://github.com/walnut-burgundy/alphabet-of-mathematics/blob/master/research/Miles%20Reid/books/Chapters%20on%20Algebraic%20Surfaces.md)
- [`McKay-correspondence.md`](https://github.com/walnut-burgundy/alphabet-of-mathematics/blob/master/research/Miles%20Reid/topics/McKay-correspondence.md)
- [`threefolds-and-singularities.md`](https://github.com/walnut-burgundy/alphabet-of-mathematics/blob/master/research/Miles%20Reid/topics/threefolds-and-singularities.md)

Material adapted here:

- blowup as replacement of a bad point by direction data;
- a normal isolated surface singularity `P∈X` and a resolution `Y→X`;
- exceptional fibres as configurations of curves;
- the ordinary double point as first laboratory;
- Du Val, rational, and elliptic Gorenstein singularities as distinct classes;
- exceptional intersection matrices;
- cyclic quotient singularities and Hirzebruch–Jung continued fractions;
- quotient description `C²/G` and the McKay correspondence;
- the ADE list and `(-2)`-curve configurations.

Status: mixed. The existing Reid notes explicitly distinguish **source-read**, **contents-read**, **abstract-read**, and **index-only** material. Preserve those labels when material is moved.

## 2. Primary modern guide to Du Val singularities

Miles Reid:

- *The Du Val singularities A_n, D_n, E_6, E_7, E_8*
- https://mreid.warwick.ac.uk/surf/more/DuVal.pdf

Important items checked in this pass:

- the ordinary double point `xz=y²`;
- blowup charts and the exceptional `(-2)`-curve;
- the explicit `D₄` resolution picture;
- the ADE equation table;
- the statement that the subscript counts exceptional curves;
- the Dynkin graph as the dual graph of the exceptional fibre;
- crepantness and the unchanged canonical class;
- attribution to Patrick du Val, Michael Artin, and Henry Laufer.

Status: **source-read for the introduction, ordinary double point, `D₄` example, equation table, and summary characterizations**. A later pass should work through every proposition and exercise needed by the chart ledger.

Related Reid sources:

- surfaces page: https://mreid.warwick.ac.uk/surf/
- cyclic quotient chapter: https://mreid.warwick.ac.uk/surf/more/cyclic.pdf
- McKay lectures: https://arxiv.org/abs/alg-geom/9702016

## 3. Patrick du Val's original papers

The exact three-part 1934 source is recorded in [`../papers/README.md`](../papers/README.md).

Status: **bibliographic record and publisher extracts checked**. The papers themselves still need a careful mathematical reading and modern notation guide.

## 4. David A. Madore

### Cubic-surface films

- *The Cubic Surfaces DVD*
- http://www.madore.org/cubic-dvd/

Status: **primary project page read**, including the complete 54-film index, technical format, deformation timing, lighting, clipping convention, source availability, and public-domain statement.

The films are deformations, rotations, and real implicit-surface views. They are not footage of minimal resolutions.

### Character sounds

- *Sons et graphes de caractères de groupes de Lie*
- http://www.madore.org/~david/weblog/d.2017-06-26.2447.lie-group-sounds.html

Status: **primary explanatory post read**.

Checked points:

- principal `SU(2)` of Kostant;
- evaluation of representation weights on `ρ∨`;
- one-variable Weyl-character calculation;
- harmonic multiplicities;
- `110 Hz` base frequency;
- cosine-to-sine phase change and removed constant term;
- examples `F₄`, `D₆`, `E₆`, and graphed `E₈`.

The post links the remembered YouTube video. Its exact YouTube identifier has not yet been pinned in this repository.

### Spectral sounds

- *Le Spectre d'Atacama — et quelques spectres de groupes de Lie à écouter*
- http://www.madore.org/~david/weblog/d.2018-06-18.2528.html
- follow-up: http://www.madore.org/~david/weblog/d.2018-06-25.2531.spectra.html

Status: **primary explanatory posts read**.

Checked points:

- Casimir values `C(v)=<v,v+2ρ>`;
- modal frequencies proportional to `sqrt(C(v))`;
- Peter–Weyl multiplicity `dim(V_v)²`;
- high-frequency damping and time decay as modeling choices;
- adjoint mode normalized to `440 Hz`;
- examples through `E₈`.

### Grassmannian spectra video

- David A. Madore, *The sound of some grassmannians*: https://www.youtube.com/watch?v=lDPaVD-ZrcQ
- Author's YouTube channel, resolved from video oEmbed: https://www.youtube.com/@davidamadore/videos
- Author's linked further discussion: https://twitter.com/gro_tsen/status/1164864635163545601

Status: **video metadata and description checked; video audio and linked thread not independently transcribed**. The description says the spectra are of real, complex, quaternionic Grassmannians and the octonionic projective plane. Exact amplitude, metric normalization, and synthesis details are still unverified. See [the dedicated note](../notes/06-grassmannian-spectra.md).

## 5. Attribution trail

Names that should remain visible as the project grows:

- **Patrick du Val** — original classification and adjunction condition;
- **Michael Artin** — rational surface singularities and contraction theory;
- **Henry Laufer** — surface singularity and resolution results used by Reid;
- **Friedrich Hirzebruch** and **Heinrich Jung** — continued-fraction resolution tradition;
- **John McKay** — representation/Dynkin correspondence;
- **Bertram Kostant** — principal `SU(2)`/`sl₂`;
- **Hermann Weyl** — character, dimension, integration, and spectral formulas;
- **Fritz Peter** — Peter–Weyl theory;
- **David Eisenbud** — immediate commutative-algebra exposition used here;
- **Miles Reid** — immediate surface-singularity exposition used here;
- **David A. Madore** — films and sound experiments used as design references.

When a later note relies on a joint paper, credit every author rather than attaching the result only to the best-known name.

## 6. Copyright and vendoring

- Summarize copyrighted books and papers; do not paste long passages.
- Link Reid's author-posted PDFs unless a redistribution license is verified.
- Link the Cambridge versions of du Val's papers; do not mirror publisher PDFs merely because they are old.
- Madore explicitly placed the Cubic Surfaces DVD, source, and related material in the public domain. It can be vendored later, but retain his name and the provenance notice.
- Every imported code package should carry its original license and an unmodified source link.

## 7. Reading still needed

1. Work through Reid's `E₈` calculations deeply enough to produce a chart-by-chart ledger.
2. Read all three du Val papers with a notation concordance.
3. Compare an ordinary-blowup resolution with an economical weighted-blowup or toric route.
4. Read the relevant Artin and Laufer sources named by Reid.
5. Check the ADE/Milnor-lattice side against a primary singularity-theory source before animating monodromy.
6. Locate and archive the exact Madore YouTube links and metadata without relying on guessed titles.