# David A. Madore: singularity films and Lie-theoretic sound

The “David” in both memories is David A. Madore.

Two projects matter here:

1. *The Cubic Surfaces DVD* — short rendered films of cubic surfaces and their deformations;
2. *Sons et graphes de caractères de groupes de Lie* — a YouTube sound experiment built from Lie-group characters.

A later project of his used Laplace spectra and Casimir eigenvalues to make compact Lie groups “ring” after an imagined strike.

A further video, **[The sound of some grassmannians](https://www.youtube.com/watch?v=lDPaVD-ZrcQ)**, was identified by the user. It sonifies vibrational spectra of real, complex, and quaternionic Grassmannians and the octonionic projective plane. Its confirmed title, author's YouTube channel, mathematical setting, and outstanding source-code questions are recorded in [06-grassmannian-spectra.md](06-grassmannian-spectra.md). This is not the 2017 character video or the compact-*group* strike experiment.

## 1. The Cubic Surfaces DVD

Primary page:

- http://www.madore.org/cubic-dvd/

Madore made 54 computer-generated animations. The entire DVD, source, and related material are placed in the public domain by Madore, with a request for credit.

### Technical setup

- renderer: Persistence of Vision Raytracer, or POV-Ray;
- operating system used: Debian GNU/Linux;
- output: PAL MPEG-2, `720×576`, `25` frames per second;
- duration: twelve seconds per clip;
- intended playback: seamless loop;
- typical file size: roughly two megabytes;
- surface material: colorless;
- fixed lights: green above, red above/right, blue below;
- clipping: every surface is intersected with the same fixed sphere, giving a bounded view and smooth outer border.

The fixed lighting is especially worth copying. It lets the viewer recognize orientation and curvature while keeping mathematical color available for other data.

### Timing convention

For a clip described as “deformation of foo to bar,” most frames display `bar`. The special fibre `foo` appears exactly three seconds after the start, at frame 75, and then disappears again. Madore chose this so the special member is visible inside a loop rather than hidden at its cut.

That convention is useful for comparison films:

```text
generic fibre → special singular fibre → generic fibre
```

It should not be copied into the resolution film without a label, because it depicts specialization in a family.

### Relevant clips

The full set contains several clusters useful for this repository.

#### Baselines

- smooth cubic, simple rotation;
- smooth cubic, more complex rotation;
- Clebsch cubic, simple rotation;
- conic point deforming to a smooth surface;
- three planes deforming to a smooth cubic;
- reducible plane-plus-sphere surfaces deforming to smooth cubics.

#### `E₆` cluster

- an `E₆` singularity, simple rotation;
- `E₆` deforming to two `A₂` singularities;
- `E₆` deforming to `D₅`;
- `E₆` deforming to `D₄`;
- `E₆` deforming to `A₅`;
- a line of singular points deforming to `E₆`.

#### `D₄` cluster

- a conic point deforming to `D₄`;
- `D₄` deforming to three `A₁` singularities;
- `D₄` deforming to a smooth surface;
- a line of singular points deforming to `D₄`;
- `E₆` deforming to `D₄`.

#### `A_n` cluster

- isolated rotations of `A₅` and `A₄`;
- `A₅` deforming within its own type;
- `A₅` deforming to `A₄` or two `A₂`s;
- `A₄` deforming within its own type;
- `A₄` deforming to two `A₂`s;
- several `A₂→A₁`, `A₃→A₂`, and staged `A₁`/`A₂` deformations.

#### Pinned clip: `A₅ → A₄` (user-provided link)

- **David A. Madore**, *Cubic surface: deformation of an A5 singularity to an A4 singularity*: https://www.youtube.com/watch?v=VDaEZpKbYqQ
- This is **film 31 of 54** in *The Cubic Surfaces DVD* index, rather than a separate filmed resolution.
- Madore's video description identifies the **`A₅` singularity at approximately 3 s and 9 s**. The rest of the loop chiefly shows a cubic surface with an `A₄` singularity. Thus the exceptional `A₅` member is the **special fibre** in a family, despite the title's arrow.
- A minimal local analytic *example of the same adjacency*, not an identification of Madore's actual cubic or rendering parameters, is
  ```text
  X_t : u v + w^6 + t w^5 = 0.
  ```
  For `t = 0`, the singularity at the origin is `A₅`; for any fixed `t ≠ 0`, its germ at the origin is `A₄`, since `w+t` is a holomorphic unit there. This illustrates why the more singular type appears at a special parameter value.
- **Proposed comparison shot**, not an observation from the footage: synchronize a rotating/implicit 3D view with a symbolic resolution graph. The minimal `A₅` resolution has a five-vertex `(-2)` chain, versus a four-vertex chain for `A₄`. These are **resolutions of two different fibres**, not a blowup seen within the deformation film.
- **Verification status:** title, author, video description, and DVD index verified; no frame-by-frame video inspection, transcription, or extraction of the actual POV-Ray equations. For those coefficients inspect Madore's publicly released project source, not the illustrative germ above.

#### Multiple singular points and nonisolated loci

- Cayley cubic with four `A₁` points;
- three `A₂` points;
- two `A₂` points;
- Whitney umbrella and its deformations;
- cones or surfaces with lines of singular points;
- reducible surfaces.

### What the films actually teach

They provide a visual atlas of:

- real forms of algebraic surfaces;
- how singularities appear in a bounded implicit rendering;
- adjacency between singularity types under deformation;
- the difference between isolated and nonisolated singular sets;
- how fixed lights and a fixed clipping sphere make comparisons legible.

They do **not** display a minimal resolution. In particular:

- a change from `E₆` to `D₄` is a change of fibre in a family;
- the exceptional curves are not shown;
- no birational map back to the singular surface is shown;
- the Dynkin diagram in a resolution is not the same object as the list of singularities appearing in a deformation.

This distinction should be stated whenever the clips are used as reference footage.

### Why no `E₈` clip appears here

The project is about cubic surfaces. The simple singularities occurring in this cubic-surface atlas reach `E₆`, along with `D₅`, `D₄`, and `A_n` types. An `E₈` hypersurface model such as `x²+y³+z⁵=0` is not a cubic surface in ordinary affine coordinates. The `E₆` clips are therefore a rendering reference, not an `E₈` source film.

## 2. Sounds and graphs of Lie-group characters

Primary note:

- http://www.madore.org/~david/weblog/d.2017-06-26.2447.lie-group-sounds.html

The blog entry links the YouTube video the user remembered. The exact YouTube title and video identifier should be pinned from the embedded link during a later media-ingest pass rather than guessed from search-engine titles.

### Mathematical object

For each compact real simple Lie group, Madore considered:

- every fundamental character;
- the adjoint character when it was not already among the fundamental ones.

A character is a function on the group. Madore reduced it to one variable by restricting it to the maximal torus inside Kostant's principal `SU(2)`.

Let `ρ∨` be half the sum of the positive coroots, equivalently the sum of the fundamental coweights. Given the weights `μ` of a representation, evaluate

```text
<μ,ρ∨>.
```

The resulting half-integers, counted with multiplicity, are the weights of the restricted `SU(2)` representation. They define a finite trigonometric polynomial.

Conceptually:

```text
representation weights
    ↓ evaluate on principal SU(2)
integer or half-integer harmonic numbers
    ↓ add multiplicities
trigonometric polynomial
    ↓ interpret as waveform
sound
```

### Weyl-character computation

Madore also gave a Sage route. He used a `WeylCharacterRing`, the positive roots and associated coroots, and a one-variable form of the Weyl character formula. For dominant highest weight `λ`, a quotient of products of terms of the form

```text
t^<λ+ρ,α∨>−1
```

by the analogous product with `λ=0` gives a polynomial. After centering its degree, the coefficients give the harmonic multiplicities.

For type `F₄`, his example begins with

```text
WeylCharacterRing("F4", style="coroots")
```

and computes all four fundamental characters.

This is a strong method because the audio is not assigned arbitrarily to Dynkin vertices. Every partial amplitude comes from a representation weight multiplicity.

### Audio choices

- fundamental frequency: `110 Hz`, musical `A2`;
- coefficients of the restricted character: harmonic amplitudes;
- original cosine sums changed to sine sums;
- constant term removed;
- phase shift: every harmonic moved by one quarter-cycle;
- reason: avoid clipping under the chosen normalization and permit seamless transitions, since every sine sum vanishes at the cut point;
- output: sounds for fundamental and adjoint characters of 26 compact real simple Lie groups.

The phase change should not alter a monophonic steady timbre in the simple frequency-domain sense, but it changes transitions and waveform peaks.

### Specific observations

- The `F₄` passage corresponding to his displayed four curves occurs near 49.5–55.5 seconds in the linked video.
- In `D₆`, a half-spin character uses only odd harmonics of a fundamental an octave lower. The difference is both audible and visible in the graph's symmetry.
- `E₆` gives another plotted example, including unusual behavior of the adjoint character's minimum.
- He graphed selected `E₈` fundamental characters but omitted `E₈` from the audio video because the high-rank harmonic content was already very strident.
- The value of a character at the identity is the dimension of its representation, explaining the large spike at the graph origin.

Madore regarded the first sound experiment as less melodious than hoped. That negative result is useful: natural mathematics does not guarantee pleasant audio.

## 3. Striking a compact Lie group

Primary notes:

- http://www.madore.org/~david/weblog/d.2018-06-18.2528.html
- http://www.madore.org/~david/weblog/d.2018-06-25.2531.spectra.html

This second method is different from character-waveform sonification.

### Frequencies

For dominant weight `v`, the Casimir/Laplacian eigenvalue is proportional to

```text
C(v)=<v,v+2ρ>.
```

The corresponding wave frequency is proportional to

```text
sqrt(C(v)).
```

Madore normalized the adjoint representation's mode to `440 Hz`.

### Multiplicities

If `N(v)` is the dimension of the irreducible representation, Peter–Weyl theory gives multiplicity

```text
N(v)²
```

for the corresponding Laplace eigenvalue on the group itself.

### Amplitudes and damping

A localized strike suggests weighting modes by multiplicity, but the resulting series diverges without high-frequency damping. Madore experimented with heat-kernel/Gaussian-style factors depending exponentially on `C(v)` and with time decay. He openly treated the exact amplitude law as a modeling choice rather than a theorem forced by the spectrum.

That distinction should be preserved:

```text
frequency set and multiplicities: mathematical data
excitation, phase, damping, stereo placement: sonification model
```

### Objects rendered as sound

His first batch included:

- `A₁`, `A₂`, `B₂`, `G₂`;
- `A₄`, `B₄`, `C₄`, `D₄`, `F₄`;
- `E₆` and `E₈`;
- comparisons of simply connected and adjoint forms, such as `Spin(5)` versus `SO(5)` and `SU(3)` versus `PSU(3)`.

The sounds lasted six seconds. Unlike the first character experiment, Madore found these struck-spectrum sounds reasonably pleasant and bell-like in some cases.

## 4. Uses in `resolution`

### Directly reusable visual ideas

- fixed clipping sphere;
- fixed directional lights;
- colorless mathematical surface;
- short loops;
- a precisely timed special frame;
- several singularity types rendered with identical camera and lighting;
- source code made available with explicit reuse terms.

### Directly reusable audio ideas

- principal-`SU(2)` restriction converts representation weights into exact harmonics;
- Casimir data converts dominant weights into inharmonic modal frequencies;
- multiplicities remain visible in amplitudes or power;
- graph and sound can be generated from the same coefficient list.

### What still requires invention

Neither Madore method sonifies a sequence of blowups. A resolution-native audio system must decide what changes when:

- a new exceptional curve appears;
- two curves intersect;
- a self-intersection number changes;
- a residual singularity disappears;
- the final intersection matrix becomes `−C_E8`.

Those proposals are separated in [`04-audio.md`](04-audio.md) so they are not falsely attributed to Madore.

## 5. Credit

Any reused footage, source, rendering convention, or code should credit **David A. Madore** and link the primary project page. The public-domain grant permits reuse; it does not erase authorship.