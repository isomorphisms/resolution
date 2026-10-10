# David Madore's YouTube channel: thematic map

## Channel identity

- creator: **David A. Madore**
- channel: <https://www.youtube.com/@davidamadore>
- channel description: mostly mathematical, computer-generated videos, generally without audio
- indexed size on 2026-10-09: **104 videos**

This is not one coherent lecture course or one series on singularities. It is better understood as a long-running visual laboratory attached to Madore's Web site, programs, and mathematical WebLog. The useful map is therefore by mathematical object and rendering method, not merely by upload date.

This file is the channel-level map. [`03-david-madore.md`](03-david-madore.md) contains the detailed notes on the cubic-surface films and the two Lie-theoretic sound experiments.

## Source-status convention

The channel, Madore's own Web site, and his WebLog do not expose the same metadata in the same form. The map distinguishes:

- **verified YouTube title**: an exact title exposed by the channel index;
- **verified project or WebLog title**: Madore's own page names the mathematical project and links one or more videos, but the precise upload title has not yet been paired with it;
- **project cluster**: several videos belong to a documented program or DVD, even where the individual YouTube entries have not yet been enumerated.

No inferred title below should be silently promoted to an exact YouTube title.

# 1. Algebraic surfaces and singularities

## 1.1 The Cubic Surfaces DVD

Primary project page:

- <http://www.madore.org/cubic-dvd/>

This is the most directly useful cluster for `resolution`. The [corresponding YouTube *Cubic surfaces* playlist](08-cubic-surfaces-youtube-playlist.md) currently exposes **32 exact video titles and links**; the original DVD contains **54 twelve-second computer-generated films** made with POV-Ray. They form a controlled atlas of cubic surfaces and deformations. Madore fixes the clipping sphere and the three colored lights throughout, so changes in the image come from the mathematical surface rather than presentation drift.

The channel map should treat the DVD as six visual subseries.

### Smooth and comparison baselines

- smooth cubic, simple rotation;
- smooth cubic, compound rotation;
- Clebsch cubic;
- conic point smoothing;
- reducible surfaces smoothing to a smooth cubic;
- random cubic deformations.

These establish the camera, clipping, lighting, and outer-boundary conventions against which singular examples can be read.

### `E_6` neighbourhood

- `E_6` singularity, simple rotation;
- `E_6 → 2A_2`;
- `E_6 → D_5`;
- `E_6 → D_4`;
- `E_6 → A_5`;
- a line of singular points specializing to `E_6`.

This is the top exceptional type available inside Madore's ordinary cubic-surface atlas. It is the nearest visual precedent for an eventual `E_8` film, but it is not itself an `E_8` model.

### `D_4` and branching

- conic point specializing to `D_4`;
- `D_4 → 3A_1`;
- `D_4` smoothing;
- line of singular points specializing to `D_4`;
- `E_6 → D_4`.

This cluster is especially important because `D_4` is the first ADE resolution graph with a branch vertex. It is a good intermediate film between `A_1` and `E_8` even though Madore's movies show deformation adjacency rather than exceptional curves.

### `A_n` chain behaviour

- isolated rotations of `A_4` and `A_5`;
- same-type deformations of `A_4` and `A_5`;
- `A_5 → A_4`;
- `A_5 → 2A_2`;
- `A_4 → 2A_2`;
- `A_3 → A_2`;
- several `A_2 → A_1` and staged `A_1` or `A_2` deformations.

This is the cleanest visual source for learning how increasing tangency and collision complexity appears before attempting a chain of exceptional curves.

### Multiple isolated singularities

- Cayley cubic with four `A_1` points;
- three `A_2` points;
- two `A_2` points;
- transitions among several `A_1` and `A_2` points.

These films help separate the **type of each local singularity** from the **number and placement of singular points on the global surface**.

### Nonisolated and reducible singular loci

- Whitney umbrella;
- cones and surfaces with a line of singular points;
- three planes;
- plane-plus-sphere reducible surfaces.

These are useful negative controls. They prevent the project from treating every sharp-looking or self-intersecting real image as an isolated normal surface singularity.

## 1.2 What the singularity cluster is and is not

Madore's films principally show:

```text
one member of a family
        ↓ parameter changes
special singular member
        ↓ parameter changes again
nearby member of another or smoother type
```

They do **not** show:

```text
smooth resolved surface Y
        ↓ proper birational map
singular surface X
```

Therefore the channel gives us a strong visual grammar for singular fibres, real slices, clipping, lighting, and deformation adjacency. It does not give the chart-by-chart blowup movie, exceptional divisor, contraction map, or intersection matrix needed for an actual resolution.

# 2. Lie groups represented as sound

## 2.1 Character sonification

**Verified YouTube title:** *Sounds of Lie group representations*

Primary mathematical note:

- <http://www.madore.org/~david/weblog/d.2017-06-26.2447.lie-group-sounds.html>

The construction is:

```text
fundamental or adjoint representation
        ↓ restrict to Kostant's principal SU(2)
weight multiplicities at integer or half-integer heights
        ↓ read heights as harmonic numbers
finite trigonometric polynomial
        ↓ use coefficients as amplitudes
waveform
```

Important production choices:

- fundamental frequency `110 Hz`;
- cosine terms replaced by sine terms;
- constant term removed;
- the phase choice makes transitions pass through zero and avoids hard cuts;
- group and representation labels advance while the corresponding waveform is played and graphed.

This is more useful than arbitrary “assign a note to a Dynkin vertex” sonification because the partials and their amplitudes come from exact representation-theoretic multiplicities.

## 2.2 Spectral or struck-group sonification

Primary notes:

- <http://www.madore.org/~david/weblog/d.2018-06-18.2528.html>
- <http://www.madore.org/~david/weblog/d.2018-06-25.2531.spectra.html>

This is a distinct experiment. A compact Lie group is treated as though it had been struck, using:

- Casimir or Laplace eigenvalues for modal frequencies;
- representation dimensions and Peter-Weyl multiplicities;
- a chosen excitation envelope and high-frequency damping;
- comparisons among different compact forms of the same Lie algebra.

Relevant families include classical groups and `G_2`, `F_4`, `E_6`, and `E_8`.

For `resolution`, the first sound experiment suggests exact harmonic fingerprints. The second suggests reading an intersection or Laplacian matrix as a resonant system. Neither one directly sonifies blowups.

# 3. `E_8`, root systems, Weyl groups, and Coxeter/Fourier views

This cluster is mathematically adjacent to the desired `E_8` resolution even though it usually visualizes the root system, lattice, or Weyl action rather than the surface singularity.

Documented projects and posts include:

- *Jouons avec le système de racines E8*;
- *La beauté du système de racines E8*;
- *Sections du diagramme de Voronoï du réseau E8*;
- *Jouons avec le groupe de Weyl de E8 et cherchons la logique*;
- *Jouons maintenant avec le groupe de Weyl de F4 parce que c'est plus facile*;
- an interactive exploration of the `E_8` root system, its Weyl group, and a `G_2` rotation;
- **verified YouTube title:** *Fourier transform of an icosahedron*;
- a channel-indexed Coxeter-plane variant of the icosahedron Fourier transform;
- Fourier and quasiperiodic-image experiments from April 2018.

### Why this matters to `resolution`

A minimal `E_8` resolution produces eight exceptional curves whose intersection graph is the `E_8` Dynkin diagram. Madore's root-system films visualize a related but different realization of the same diagrammatic type. They are useful for:

- consistent labeling and coloring of eight nodes;
- Coxeter-plane projections;
- Weyl-orbit motion;
- showing symmetry without pretending that the exceptional fibre itself has the full geometry of the 240-root configuration;
- constructing a final “algebraic shadow” panel beside the geometric exceptional curves.

The film must keep these objects distinct:

```text
surface singularity x²+y³+z⁵=0
minimal resolution and eight exceptional curves
E8 Dynkin graph
E8 root system with 240 roots
E8 lattice and its Voronoi geometry
E8 Weyl group action
```

They are tightly related, but no pair is literally the same object.

# 4. Waves and spectral geometry

Documented channel-linked projects include:

- *Une envoûtante animation d'ondes sur la sphère*;
- a supplementary sphere-wave animation;
- *Petite animation … d'ondes sur un tore plat*.

These are useful for three reasons:

1. they show a scalar field evolving continuously over a curved surface;
2. the camera does not need to move for the viewer to perceive geometry;
3. nodal lines, phase, and amplitude can supply a second layer of information without recoloring the underlying surface arbitrarily.

For a resolution movie, analogous overlays could show:

- distance to the exceptional set;
- magnitude of the Jacobian;
- chart validity or overlap weight;
- a selected differential form;
- eigenmodes of the exceptional-curve intersection graph.

# 5. Four-dimensional polytopes and the `3`-sphere

Primary program description:

- <http://www.madore.org/~david/programs/programs.html>

Documented video groups include:

- regular four-dimensional polytopes;
- the `120`-cell and `600`-cell;
- navigation through tessellations of the `3`-sphere;
- separate display conventions for the camera-side (“cis”) and far-side (“trans”) hemispheres.

Madore uses a gnomonic projection centered at the observer. Edges in the cis hemisphere are textured tubes; trans-hemisphere edges are thin red lines. This is a good example of displaying one compact higher-dimensional object with two deliberately different depth conventions rather than pretending an ordinary perspective view is sufficient.

### Relevance to complex surfaces

A complex surface has four real dimensions. Its complete local geometry cannot be embedded faithfully in one ordinary three-dimensional frame. The `3`-sphere and four-polytope videos provide reusable camera ideas for:

- moving through a link of a singularity;
- distinguishing near and far hemispheres;
- showing a three-dimensional boundary of a four-dimensional neighbourhood;
- maintaining continuity while the displayed projection changes.

# 6. Spherical and hyperbolic geometry

Documented projects include:

- visualization of parallel projections of the sphere and hyperbolic plane;
- a hyperbolic maze and associated navigation video;
- experiments with spherical and hyperbolic geometry and tessellations.

The main lesson is to expose the projection model. Madore does not merely draw an exotic-looking grid; he compares several projections and shows what each preserves or distorts.

That principle should carry into `resolution`: every displayed three-dimensional view should say whether it is a real locus, a slice, a projection, a link, a Milnor fibre, or an exceptional-divisor model.

# 7. Relativity and black-hole ray tracing

Documented channel-linked projects include:

- uniform acceleration to `99.93%` of the speed of light in `100` seconds, showing Doppler shift, aberration, and time dilation;
- Kerr black-hole ray tracing from first integrals of null geodesics;
- a video of falling into a black hole;
- a longer five-act explanation of the fall.

These are not algebraic-geometry references, but they demonstrate a strong presentational rule: when ordinary camera intuition fails, the renderer should expose the transformation being applied rather than fake a familiar camera.

# 8. Rigid-body motion and rotating rings

Documented projects include:

- four videos of nested rings rotating inertially;
- a related Poinsot-polhode video;
- other small rotating-system animations.

This cluster is useful for:

- compound rotations with no arbitrary “animation force”;
- keeping a fixed reference frame while an object's intrinsic axes evolve;
- distinguishing physical motion from camera motion.

For singularity films, this warns against rotating both the slice and the camera without labeling which parameter changed.

# 9. Mandelbrot, Fourier, and quasiperiodic imagery

Documented projects include:

- arbitrary-precision Mandelbrot deep zooms;
- at least two Mandelbrot videos;
- Fourier-transform images;
- quasiperiodic images;
- icosahedral-invariant “psychedelic icosahedra.”

The Mandelbrot films are also among the unusual channel items with an added music track. Most of the mathematical uploads contain no audio channel at all; Madore generated frames and assembled them with `ffmpeg`.

For `resolution`, the practical lesson is that deterministic frame generation plus an explicit parameter ledger is enough. A full interactive engine is not required for the first mathematically controlled films.

# 10. Suggested viewing order for `resolution`

A useful order is not chronological.

1. **Smooth cubic rotation** — establish Madore's fixed camera, clipping sphere, and colored-light convention.
2. **`A_1`, `A_2`, and `A_3` deformation films** — learn how a simple singular point reads in a real implicit rendering.
3. **`D_4` rotation/deformations** — introduce visible branching and distinguish one `D_4` from three `A_1` points.
4. **`E_6` rotation and its adjacencies** — inspect the most complicated exceptional cubic-surface example.
5. **`E_8` root, Voronoi, Weyl, and Coxeter-plane films** — collect a separate algebraic visual language for the final intersection graph.
6. **Sphere-wave and torus-wave films** — study mathematical overlays that evolve without destroying surface legibility.
7. **`3`-sphere and four-polytope films** — study projection and higher-dimensional camera conventions.
8. **Sounds of Lie group representations** — record exactly how coefficients become partial amplitudes.
9. **Struck-group spectra** — compare spectral frequencies, multiplicities, damping, and compact forms.

# 11. What to copy and what not to copy

## Copy or adapt

- one fixed clipping region for comparisons;
- fixed lights across a family;
- a colorless or neutral base surface;
- short seamless loops;
- explicit timing of the special fibre;
- deterministic frame generation;
- identical camera parameters across ADE comparisons;
- mathematical coefficients driving both graph and audio;
- source publication and explicit reuse terms;
- separate near/far conventions when one projection cannot display the whole object honestly.

## Do not copy uncritically

- treating deformation as resolution;
- calling a real three-dimensional slice “the singularity” without qualification;
- identifying the `E_8` root system with the exceptional fibre;
- morphing a singular mesh into eight spheres without the resolution map;
- moving camera, slice, deformation parameter, and blowup chart simultaneously;
- assigning notes or colors to nodes without recording whether the assignment is mathematical or merely editorial.

# 12. Per-video catalog still to be completed

The exact upload-by-upload inventory should use one row per channel item with these fields:

```text
YouTube title
video ID and canonical URL
upload date
duration
project/series
mathematical object
ambient dimension and displayed dimension
real locus / slice / projection / link / fibre / other
animation parameter
camera motion
object motion
clipping convention
lighting convention
audio construction
source-code location
license or reuse statement
relevance to resolution
notes and mathematical cautions
```

The series-level map above is already enough to select the important material. The remaining mechanical task is pairing all 104 upload records with the corresponding WebLog and source-code pages, without inventing titles when YouTube's index collapses them.

# Primary sources

- YouTube channel: <https://www.youtube.com/@davidamadore>
- program and source index: <http://www.madore.org/~david/programs/programs.html>
- complete WebLog title index: <http://www.madore.org/~david/weblog/weblog-index.html>
- Cubic Surfaces DVD: <http://www.madore.org/cubic-dvd/>
- character sounds: <http://www.madore.org/~david/weblog/d.2017-06-26.2447.lie-group-sounds.html>
- first struck-spectrum note: <http://www.madore.org/~david/weblog/d.2018-06-18.2528.html>
- follow-up spectral note: <http://www.madore.org/~david/weblog/d.2018-06-25.2531.spectra.html>

Credit all reused mathematics, footage, source code, and rendering conventions to **David A. Madore**, even where the material is released into the public domain.