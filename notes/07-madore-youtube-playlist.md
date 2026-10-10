# David A. Madore — *Miscellaneous mathematical* YouTube playlist

Source: [the playlist](https://www.youtube.com/playlist?list=PL49430773AD2E9BE8), supplied by the user on 2026-10-09. Curator/author: **David A. Madore**. [YouTube channel](https://www.youtube.com/channel/UCZCKUVFCmgvjhYhZPL7xvow).

This is an **inventory of one playlist (20 entries)**, not a claim to have inventoried Madore's entire channel. Titles, order, and durations were checked against the playlist's machine-readable metadata. The subject column below is **our indexing**, not a quotation of Madore's classification. More detailed descriptions below are based on the videos' published descriptions and his own explanatory pages; they are *not* claims of frame-by-frame viewing.

## Complete playlist index

| # | Video | Duration | Subject |
| ---: | --- | ---: | --- |
| 1 | [The beauty of E8](https://www.youtube.com/watch?v=E-LC_l3gNuc) | 4:01 | E8 roots and projection |
| 2 | [Rotation of the E8 root system](https://www.youtube.com/watch?v=aBYNpCffYX8) | 5:15 | E8 roots, octonions, G2 |
| 3 | [Transitive permutation groups on six objects](https://www.youtube.com/watch?v=9KRVK1_2QXs) | 6:57 | finite groups, permutation animation |
| 4 | [Projections of the Higman-Sims graph from the Leech lattice](https://www.youtube.com/watch?v=neUd794Gbg0) | 0:24 | sporadic geometry, projection |
| 5 | [Diving in a reflective tetrahedron](https://www.youtube.com/watch?v=oV7jxebR6Y8) | 1:22 | reflection groups, camera |
| 6 | [Freely rotating rings](https://www.youtube.com/watch?v=P-3s8AhMbK4) | 1:41 | rigid-body dynamics |
| 7 | [Poinsot polhode](https://www.youtube.com/watch?v=zmXpSL91fzk) | 0:49 | rotational dynamics |
| 8 | [Rotation of the A3 lattice](https://www.youtube.com/watch?v=nRC2sN_MQdI) | 1:00 | lattice and projection |
| 9 | [The sound of the Cantor set](https://www.youtube.com/watch?v=y3ZpbWjvWhI) | 1:04 | sonification |
| 10 | [Visualizing the sphere and the hyperbolic plane: five projections of each](https://www.youtube.com/watch?v=xHvAqDuWG2M) | 12:47 | map projections, geometric models |
| 11 | [Visualizing the Earth in different projections](https://www.youtube.com/watch?v=LKcTbIsWS9c) | 4:31 | map projections |
| 12 | [Hyperbolic kaleidoscope](https://www.youtube.com/watch?v=p7HB2cfZ4mw) | 1:21 | hyperbolic reflection groups |
| 13 | [Ideal rotation of the hyperbolic plane](https://www.youtube.com/watch?v=P0s7wGkdEDM) | 2:41 | hyperbolic isometries |
| 14 | [Deforming a rotation by 2 full turns to a trivial one (illustrating the Spin group)](https://www.youtube.com/watch?v=HK7KksT1nYw) | 0:49 | Spin/SO(3), homotopy |
| 15 | [Deforming a rotation by 2 full turns to a trivial one (sequential version)](https://www.youtube.com/watch?v=fiatLbvsObs) | 3:21 | Spin/SO(3), animation variant |
| 16 | [Spherical Waves](https://www.youtube.com/watch?v=T9y22RNj69c) | 2:41 | wave equation |
| 17 | [Voronoi cells of the E8 lattice: a random three-dimensional cross-section](https://www.youtube.com/watch?v=VSAnezNAjLg) | 0:49 | 8D tessellation, section through time |
| 18 | [Fourier transform of the E8 root system](https://www.youtube.com/watch?v=uFo5raItNtU) | 1:37 | 8D Fourier field, Coxeter-plane section |
| 19 | [Fourier transform of a dodecahedron (Coxeter plane view)](https://www.youtube.com/watch?v=EURtsN_MpIY) | 0:49 | Fourier and Coxeter projections |
| 20 | [Random waves on a flat torus (triangular lattice)](https://www.youtube.com/watch?v=suCnNWG7W8s) | 3:01 | spectral dynamics and lattice |

## Mathematics and implementation notes

### E8 root geometry: high-dimensional rotation versus a surface singularity

[The beauty of E8](https://www.youtube.com/watch?v=E-LC_l3gNuc) and [Rotation of the E8 root system](https://www.youtube.com/watch?v=aBYNpCffYX8) are visualizations of the **240 roots of the eight-dimensional E8 lattice/root system**, not the complex surface singularity `x² + y³ + z⁵ = 0`. They share ADE combinatorics but cannot be substituted for one another.

- The *beauty* film rotates a fixed 8-dimensional configuration and shows its **2-dimensional projections**. The author's description highlights projected symmetries of orders 30 (Petrie/Coxeter-related), 20, 24, 18, and 14, followed by a sample of Weyl symmetries.
- The *rotation* film runs a one-parameter rotation in the exceptional 14-dimensional Lie group `G2`, acting as automorphisms of the octonions. Madore chooses irrationally related angular speeds; `+1` and `−1` octonionic root-points stay fixed.
- An [interactive Javascript example by Madore](http://www.madore.org/~david/math/e8rotate.html) is especially worth examining before inventing a new viewer.
- For `resolution`, show the `E8` Dynkin diagram and its 8 exceptional curves separately from the 8D root-system projection. Cross-highlight the common incidence/Coxeter data, while keeping the displayed spaces and maps explicitly typed.

### Slicing eight-dimensional objects in a way a screen can show

[Voronoi cells of the E8 lattice](https://www.youtube.com/watch?v=VSAnezNAjLg) is a useful display technique: a **3-dimensional affine section of an 8-dimensional Voronoi tessellation**, shown as **two visible spatial coordinates and one coordinate advancing through time**. Three extra transverse directions supply the color map; the section crosses a lattice origin at the midpoint.

[Fourier transform of the E8 root system](https://www.youtube.com/watch?v=uFo5raItNtU) uses a closely related `(screen x, screen y, time)` section. For roots `α` and spatial variable `u∈R⁸`, Madore describes the Fourier transform of point masses on the roots as

```text
F(u) = sum_{α in E8 roots} exp(2πi <α,u>)
     = sum over opposite pairs of 2 cos(2π<α,u>).
```

The output is real because roots occur in opposite pairs. It is periodic under the dual (again E8) lattice; the author's chosen section is aligned with a Coxeter plane, giving striking 30-fold patterns near a lattice point. The author explicitly specifies the special value `240` at lattice points and a colored scale in his description.

**Transferable idea**: preserve a higher-dimensional data object and a well-defined map to display coordinates. Label the map as either (a) linear projection, (b) an affine section, (c) time-evolving section, (d) stereographic or another nonlinear projection, or (e) an arbitrary color encoding. They are different mathematical operations. A 4-real-dimensional complex algebraic surface requires the same honesty.

A viewer could synchronize: a movable 3D slice of a 4D variety; 2D moving section; equation and Jacobian of the section; and, for a true resolution, charts and exceptional fibres upstairs. The 8D Madore videos illustrate the *display method*, not the blowup.

### Geometry and camera projections

[Visualizing the sphere and the hyperbolic plane](https://www.youtube.com/watch?v=xHvAqDuWG2M) systematically pairs corresponding projection models: orthographic, gnomonic, stereographic, equal-area and the author's fifth comparison. The video explanation distinguishes straight-line preservation (gnomonic), angle preservation (stereographic), and area preservation (Lambert azimuthal). This is particularly good practice for a geometry viewer: **name the mapping before interpreting the appearance**.

[Hyperbolic kaleidoscope](https://www.youtube.com/watch?v=p7HB2cfZ4mw), [Ideal rotation](https://www.youtube.com/watch?v=P0s7wGkdEDM), and [Diving in a reflective tetrahedron](https://www.youtube.com/watch?v=oV7jxebR6Y8) are candidate camera/reflection references. Their title alone does not establish their exact geometric implementation, which needs source-code or description verification before copying.

### Homotopies of rotations are not resolutions of singularities

[Deforming a rotation by 2 full turns to a trivial one](https://www.youtube.com/watch?v=HK7KksT1nYw) and its [sequential version](https://www.youtube.com/watch?v=fiatLbvsObs) visualize a null-homotopy of a 4π rotation loop in `SO(3)`. The author uses an array of spheres to display nearby motions side by side. The technique of showing a **family of nearby transformations simultaneously** may help with chart or parameter comparisons.

It does not depict a birational map `Y → X`, a deformation of singular points, or a minimal resolution.

### Sound and wave films

- [The sound of the Cantor set](https://www.youtube.com/watch?v=y3ZpbWjvWhI) provides another sonification target; its exact audio mapping was **not** extracted and should not be inferred from the title.
- [Spherical Waves](https://www.youtube.com/watch?v=T9y22RNj69c) and [Random waves on a flat torus](https://www.youtube.com/watch?v=suCnNWG7W8s) are useful to compare wave equations, eigenmodes, and random initial data. Madore's torus video explicitly refers to his earlier spherical-wave example and a separate torus-wave example.
- [Fourier transform of a dodecahedron](https://www.youtube.com/watch?v=EURtsN_MpIY) connects Fourier plots to Coxeter planes, a promising visual-plus-sound comparison for the user's Fourier experiments.
- Keep separate: (1) weight-multiplicity harmonic synthesis; (2) Casimir/Laplace-spectrum sonification of a Lie group or homogeneous space; (3) wave-equation visualization; (4) sonification invented for an exceptional divisor/intersection matrix.

### Non-E8 entries worth preserving

- [Transitive permutation groups on six objects](https://www.youtube.com/watch?v=9KRVK1_2QXs) visualizes each of the 16 degree-six transitive permutation groups up to conjugacy through actions on colored discs.
- [Freely rotating rings](https://www.youtube.com/watch?v=P-3s8AhMbK4) and [Poinsot polhode](https://www.youtube.com/watch?v=zmXpSL91fzk) could serve as physically exact rotation/camera benchmarks, although their trajectories are not group-theoretic ADE resolutions.
- [Rotation of the A3 lattice](https://www.youtube.com/watch?v=nRC2sN_MQdI) is another potential example for separating high-dimensional geometry from its chosen screen projection.
- [Projections of the Higman–Sims graph from the Leech lattice](https://www.youtube.com/watch?v=neUd794Gbg0) is a reminder that combinatorial data can be arranged inside higher-dimensional geometry and projected. Do not assume the projected crossings encode graph edges or intersections without checking.

## Separate Madore work **not contained in this playlist**

These should remain part of the channel/source atlas even though they do not appear in the twenty entries above:

1. [*The Cubic Surfaces DVD*](http://www.madore.org/cubic-dvd/) — 54 short POV-Ray animations, with source files and descriptions including `E6`, `D5`, `D4`, `A_n`, Whitney umbrellas, Cayley cubic. **Mostly rotations and deformations, not actual resolutions.** The author puts the DVD and code in the public domain and requests recognition. See [03-david-madore.md](03-david-madore.md).
2. [*Sons et graphes de caractères de groupes de Lie*](http://www.madore.org/~david/weblog/d.2017-06-26.2447.lie-group-sounds.html) — 2017 fundamental/adjoint-character sounds by principal-`SU(2)` restriction, based on representation-theoretic harmonic multiplicities; not in this playlist. The blog links its YouTube video; **identifier still to be pinned**.
3. [*Spectres*](http://www.madore.org/~david/weblog/d.2018-06-25.2531.spectra.html) — 2018 ideas using Laplace/Casimir eigenfrequencies to sonify compact Lie groups; see [03-david-madore.md](03-david-madore.md) and [04-audio.md](04-audio.md).
4. [*The sound of some grassmannians*](https://www.youtube.com/watch?v=lDPaVD-ZrcQ) — the user's previously supplied video, whose description explicitly includes real, complex, quaternionic Grassmannians and the octonionic projective plane. See [06-grassmannian-spectra.md](06-grassmannian-spectra.md).

## Suggested experiments, not claims about Madore's implementation

1. Use the **same dataset** (ADE root coordinates, intersection matrix, or sampled polynomial) with toggles for orthographic / stereographic / affine slice / moving slice to see exactly which mathematical invariants survive.
2. Add synchronized **screen-plane + time-direction** sliders using Madore's E8 Fourier and Voronoi studies as models; show the actual high-dimensional plane/subspace definition numerically.
3. Compare **2D complex-surface section** and **4D→3D projection** in a simple `A1` example before advancing to `E8` resolution charts.
4. Consider Madore's fixed light and clipping conventions (documented in the DVD, not this playlist) so changes across singularities can be attributed to the surface rather than the camera.
5. Prototype sonification of the exact `-Q` exceptional intersection form independently of Madore's group and Grassmannian sound experiments; label each method's mathematical input explicitly.

## Authorship and provenance

Thanks to **David A. Madore** for making his mathematical animations, published descriptions, interactive demonstrations, and code available. The author's source pages and video descriptions are the primary sources above. The index is based on publicly visible playlist metadata; it is **not** a transcript and **not** an exhaustive channel scrape.
