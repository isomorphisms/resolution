# David A. Madore: Fourier transform of an icosahedron

## Source and verification status

- **David A. Madore**, *Fourier transform of an icosahedron*:
  https://www.youtube.com/watch?v=uyitkl00Ey4
- Source status (2026-10-09): **video title, author, and description retrieved; no frame-by-frame viewing, transcript, or source-code inspection claimed**.
- Madore describes a three-dimensional Fourier transform displayed through two-dimensional grayscale slices.
- The description calls the configuration an icosahedron, gives the twelve icosahedral vertex coordinates below, **but also says “dodecahedron” once** in describing the Dirac masses. Those statements cannot both be right: an icosahedron has 12 vertices; a dodecahedron has 20. The coordinates explicitly define an icosahedron.

This is a **geometric Fourier visualization**. Unlike Madore's cubic-surface films it is not a deformation of an algebraic surface, and unlike a genuine resolution it introduces no exceptional curves or birational map.

## The finite Fourier sum (derived here, not quoted from Madore)

Write the golden ratio as

```text
φ = (1 + √5)/2.
```

The twelve vertices are

```text
(0, ±1, ±φ),  (±1, ±φ, 0),  (±φ, 0, ±1),
```

with each pair of signs independent. Let `V` be this set and form the point-mass measure on `R³`

```text
μ = Σ_{v∈V} δ_v.
```

Using `F[μ](k) = ∫ exp(−2πi k·x) dμ(x)` with `k=(k_x,k_y,k_z)`,

```text
F[μ](k) = Σ_{v∈V} exp(−2πi k·v).
```

Opposite vertices cancel all imaginary terms. Pairing the signs gives an analytic, real-valued field:

```text
F[μ](k_x,k_y,k_z) = 4 [
    cos(2π k_y) cos(2π φ k_z)
  + cos(2π k_x) cos(2π φ k_y)
  + cos(2π φ k_x) cos(2π k_z)
].
```

Checks: `F[μ](0)=12`, `−12 ≤ F[μ](k) ≤ 12`, and `F[μ](−k)=F[μ](k)`. The normalized amplitude `F[μ]/12` lies in `[−1,1]`.

Because rotations preserving `V` also preserve `μ`, the field has full icosahedral rotational symmetry. A generic axis-aligned two-dimensional slice need not exhibit fivefold symmetry in the image, even though the original three-dimensional function does.

Because the coordinate frequencies include both `1` and irrational `φ`, a generic straight-line probe gives a quasiperiodic trigonometric signal rather than an ordinary periodic one. **This does not imply** that the original set of only twelve points is an infinite quasicrystal.

## A genuinely useful renderer experiment

1. Render the twelve original vertices as a rotatable reference polyhedron.
2. Render a rotatable plane `k = k₀ + s u + t v` through the transform field, with `u,v` orthonormal. Color by signed `F[μ]/12`, not by magnitude only: magnitude discards the sign changes and creates different nodal structure. Provide optional `|F[μ]|`, squared magnitude, and zero contours as separate modes.
3. Sweep the plane offset `k₀` and hold camera, exposure, and scale fixed. Include one plane normal to an icosahedron vertex axis such as `(0,1,φ)` to reveal fivefold symmetry.
4. Draw the 3D zero-level set `F[μ](k)=0` by mesh/volume methods as an **implicit level set of the Fourier field**, not an algebraic surface singularity being resolved.
5. Make the coordinates and Fourier convention inspectable so symmetry and sign assertions can be checked numerically.

This can be evaluated *directly* per fragment; there is no need to generate a voxel grid or run an FFT. A later general polyhedron implementation can sum `exp(−2πi k·v)` from an arbitrary vertex list. For a non-centrosymmetric list, the result is complex and needs separate real/imaginary or phase/magnitude display.

## From the 3D field to sound (new proposal)

Move the probe along a line `k(t)=t u` in Fourier space. Then

```text
s_u(t) = F[μ](t u) = Σ_{v∈V} cos(2π t · (u·v)),
```

with identical terms combined and an appropriate time/frequency scale for audibility. Frequencies are **projections of the vertex coordinates** onto the probe direction. Turning `u` changes frequency ratios continuously. In special directions, degeneracies create reinforced partials; generically, ratios need not be rational.

This offers a particularly clear link between a rotatable polyhedron, a 2D slice of a Fourier field, and a sound. The formula is our proposed extension, **not** a claim about Madore's audio algorithm. Compare separately with his Lie-character harmonic synthesis and Laplacian/Casimir modal sonifications in [03-david-madore.md](03-david-madore.md) and [06-grassmannian-spectra.md](06-grassmannian-spectra.md).

## Cross-repository relevance

- **`resolution`**: a reference for clearly distinguishing original geometry, 3D field, and 2D slice. Not itself a singularity-resolution film.
- **Fourier/Wegert audio and graphics projects**: a cheap, exact geometry-to-spectrum benchmark; compare `Re F`, `Im F`, `|F|`, and changing section/probe.
- **Polyhedra, tilings, and higher-dimensional geometry**: test the dodecahedral dual, other Platonic solids, and 4D vertex sets under 3D projection, labeling each operation honestly.

**Credit:** David A. Madore for the original film and mathematical visualization. The explicit cosine reduction, proposed renderer modes, and line-probe sonification above are independent derivations and suggestions pending comparison with his implementation.
