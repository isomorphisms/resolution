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

- **[Special thanks to David A. Madore, original source links, and source-code attribution rules](../ACKNOWLEDGMENTS.md)**
- *The Cubic Surfaces DVD*
- http://www.madore.org/cubic-dvd/

Status: **primary project page read**, including the complete 54-film index, technical format, deformation timing, lighting, clipping convention, source availability, and public-domain statement. **Original 2006 POV-Ray and production source has also been acquired and vendored:** [94 original source files](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/), [the complete original tarball](../vendor/david-madore/cubic-dvd/original/cubic-dvd.tar.gz), and [a source SHA-256 and member manifest](../vendor/david-madore/cubic-dvd/SOURCE-MANIFEST.json). The mathematical parameters in individual .pov files still require a systematic reading.

The linked [*Cubic surfaces* YouTube playlist](https://www.youtube.com/playlist?list=PL1AE045877D932E6A) has **32 verified video-title/ID pairs** in order; see the [complete 32-item index](../notes/08-cubic-surfaces-youtube-playlist.md). Playlist metadata was checked on 2026-10-09. The YouTube clip descriptions include an error for the Cayley cubic: the correct singularities are **four A₁**, not the “four A4” printed in that one description.

The films are deformations, rotations, and real implicit-surface views. They are not footage of minimal resolutions.

### Spherical 4-polytope navigation films

- 120-cell/600-cell/24-cell YouTube playlist supplied by the user: https://www.youtube.com/playlist?list=PL09DF17B94CA3C6FD
- David A. Madore, *Naviguons dans des pavages de la 3-sphère* (2010): http://www.madore.org/~david/weblog/d.2010-11-12.1808.html
- David A. Madore, *Affichage de l'hémisphère « trans » de la 3-sphère* (2010): http://www.madore.org/~david/weblog/d.2010-11-14.1809.html
- Original Perl-script description (public domain): http://www.madore.org/~david/programs/programs.html
- High-quality movie directory with five named AVI files: http://www.madore.org/~david/math/4polytopes/

Status: **author's notes, video description and movie directory read**. The live YouTube playlist's current complete item list, ordering, and the Perl source's direct download URL have not been independently established. Gnomonic projection, the observer's great-circle navigation, and the near/far hemispheres are attributable to Madore.

**The direct mathematical bridge to this repository:** the 120-cell decomposes the universal cover of the Poincaré sphere, which is the link of the \(E_8\) surface singularity and the boundary of its negative-\(E_8\) plumbing. Sources checked:

- **Robion C. Kirby** and **Martin G. Scharlemann**, *Eight Faces of the Poincaré Homology 3-Sphere* (1979): https://math.berkeley.edu/~kirby/papers/Kirby%20and%20Scharlemann%20-%20Eight%20faces%20of%20the%20Poincar%C3%A9%20homology%203-sphere%20-%20MR0537730.pdf
- **Laurentiu Maxim**, *Notes on Vanishing Cycles and Applications*, Example 2.22: https://people.math.wisc.edu/~maxim/vanishing.pdf
- **John Stillwell**, *The Story of the 120-Cell*: https://www.ams.org/notices/200101/fea-stillwell.pdf

See [the detailed geometry and \(E_8\)-link notes](../notes/06-david-madore-s3-polytopes.md). Do **not** attribute the proposed resolution-movie extension to Madore; he made spherical-navigation films, not that extension.

### Individual DVD video: `A₅ → A₄`

- David A. Madore, *Cubic surface: deformation of an A5 singularity to an A4 singularity*: https://www.youtube.com/watch?v=VDaEZpKbYqQ
- Entry 31 of 54 on the DVD index. The video description identifies the special `A₅` surface at 3 s and 9 s; most of the loop shows `A₄`.
- A local `uv+w^6+t w^5=0` model is a **separate illustrative calculation** in [the Madore note](../notes/03-david-madore.md), not the verified cubic equation in the video.
- Status: **video title/description and Madore's DVD index checked; video frames and original POV-Ray source not independently examined**.

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

### E₈ Voronoi moving cross-sections

- David A. Madore, *Voronoi cells of the E8 lattice: a random three-dimensional cross-section*: https://www.youtube.com/watch?v=VSAnezNAjLg
- Madore's separate interactive E₈ root-system viewer: https://www.madore.org/~david/math/e8w.html
- Mathieu Dutour Sikirić, David Madore, Philippe Moustrou, and Frank Vallentin, *Coloring the Voronoi tessellation of lattices*: https://arxiv.org/abs/1907.09751

Status: **video description read**, including 240 Voronoi facets, 19,440 vertices, the 2D-frame/1D-time section, three extra color directions, and midpoint symmetry. **Frames and author source code not independently checked.** The nearest-point and power-diagram method in [07-e8-voronoi-slices.md](../notes/07-e8-voronoi-slices.md) is a mathematical reconstruction, **not a claim about Madore's implementation**. The four-author coloring paper is a related reference, not an identified source for the film's colors.

## 5. Richard E. Borcherds — an explicit E₈ resolution

- *Algebraic geometry 39: Du Val singularities* (2020):
  https://www.youtube.com/watch?v=s2LYtd_UPY8
- Independent catalogue: https://mathvideos.org/2020/richard-borcherds-algebraic-geometry-xxxix/
- Detailed notes and rederived equations: [`../notes/06-richard-borcherds-du-val.md`](../notes/06-richard-borcherds-du-val.md)
- Closely related lectures: 34–35 (*Blowing up a point*, *More on blowups*); 37–38 (*Singular points*, *The Zariski tangent space*); 40 (*Examples of resolutions*).

Status: **lecture transcript examined; substitutions rederived**. The automatic transcript contains symbol and name errors, so the mathematical equations in our notes were checked by substitution rather than transcribed verbatim. No claim to have checked the on-screen handwriting frame by frame. In particular, the A₁ and D₄ residual singularities and three A₁ points over D₄ can be derived from those equations.

This lecture gives an explicit blowup computation; it is **not** one of David A. Madore's rendered surface movies. Its ordinary point-blowup sequence provides concrete input for a true resolution animation, while the full exceptional-intersection ledger remains to be completed.

## 6. Attribution trail

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
- **David A. Madore** — films and sound experiments used as design references;
- **Richard E. Borcherds** — explicit E₈ point-blowup computation in algebraic geometry lecture 39.

When a later note relies on a joint paper, credit every author rather than attaching the result only to the best-known name.

## 7. Copyright and vendoring

- Summarize copyrighted books and papers; do not paste long passages.
- Link Reid's author-posted PDFs unless a redistribution license is verified.
- Link the Cambridge versions of du Val's papers; do not mirror publisher PDFs merely because they are old.
- Madore explicitly placed the Cubic Surfaces DVD, source, and related material in the public domain. It can be vendored later, but retain his name and the provenance notice.
- Every imported code package should carry its original license and an unmodified source link.

## 8. Reading still needed

1. Extend the Borcherds E₈ chart sequence into a complete exceptional-component ledger and independently calculate the intersection matrix, cross-checking Reid.
2. Read all three du Val papers with a notation concordance.
3. Compare an ordinary-blowup resolution with an economical weighted-blowup or toric route.
4. Read the relevant Artin and Laufer sources named by Reid.
5. Check the ADE/Milnor-lattice side against a primary singularity-theory source before animating monodromy.
6. Locate and archive the exact Madore YouTube links and metadata without relying on guessed titles.