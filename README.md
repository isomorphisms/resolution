# resolution

Visual and auditory notes toward an honest animation of a surface singularity being resolved.

The first target is not merely a rotating implicit surface. It is a film that keeps four different objects straight:

1. the singular surface;
2. a real three-dimensional slice or projection of it;
3. the sequence of blowups or other birational modifications;
4. the exceptional curves and their intersection graph on the resolved surface.

## First correction

A **deformation** or **smoothing** is not a **resolution**.

A smoothing changes the equation in a family, for example

```text
x² + y³ + z⁵ = 0
```

to

```text
x² + y³ + z⁵ = ε.
```

A resolution keeps the original singular surface as the target of a map

```text
Y → X
```

and replaces the singular point upstairs by an exceptional configuration of curves. David A. Madore's short cubic-surface films are valuable visual references, but their moving families are chiefly deformations, smoothings, rotations, and changes of coefficients. They do not by themselves show the birational resolution map.

The project should show both operations and label them.

## First comparison

The phrase “normal singularity” is ambiguous here. A Du Val singularity is already a **normal** surface singularity. The useful first three-way comparison is:

- `A₀`: a smooth point;
- `A₁`: the ordinary double point;
- `E₈`: the most complicated exceptional Du Val surface singularity.

A standard equation for `E₈` is

```text
x² + y³ + z⁵ = 0.
```

This is a complex surface: two complex dimensions, hence four real dimensions. No ordinary three-dimensional image can display it faithfully. Every 3D image must therefore declare what it is:

- the real locus in `R³`;
- a slice of the complex surface;
- a projection of a higher-dimensional object;
- its link;
- its Milnor fibre;
- or a schematic picture of the exceptional curves.

## What the resolved E₈ contains

The minimal resolution replaces the singular point by eight rational curves. Each curve is a copy of `P¹`, hence topologically a 2-sphere over the complex numbers. Each has self-intersection `−2`. Their pairwise intersections form the `E₈` Dynkin tree. The intersection matrix is the negative `E₈` Cartan matrix.

Rendering each exceptional `P¹` as a sphere is reasonable, but it must be labeled as a model of a complex curve. Those spheres are not literally sitting inside the original real locus in `R³`.

## Proposed first film

Use four synchronized panels:

1. **Local picture** — an implicit real slice or projection of the singular surface.
2. **Chart picture** — the active blowup chart, coordinate substitution, and residual equation.
3. **Exceptional fibre** — the rational curves introduced so far, rendered schematically as spheres meeting at points.
4. **Combinatorics** — the partial dual graph, self-intersections, and intersection matrix.

The viewer should be able to rotate panels 1 and 3. Panel 2 prevents the animation from becoming decorative fiction. Panel 4 shows what survives every choice of camera and projection.

Prototype in this order:

```text
A₁ → D₄ → E₈
```

`A₁` makes one exceptional curve visible. `D₄` introduces branching. `E₈` then presents the full eight-curve tree.

## Notes

- [`notes/01-mathematical-background.md`](notes/01-mathematical-background.md) — local algebra, normalization, blowups, Du Val equations, and exceptional curves.
- [`notes/02-rendering-storyboard.md`](notes/02-rendering-storyboard.md) — concrete guesses for a three-dimensional rendering and film sequence.
- [`notes/03-david-madore.md`](notes/03-david-madore.md) — notes on Madore's singularity films and Lie-theoretic sonification.
- [`notes/04-audio.md`](notes/04-audio.md) — three mathematically distinct audio systems.
- [`sources/README.md`](sources/README.md) — source ledger and links into the other repositories.
- [`papers/README.md`](papers/README.md) — Patrick du Val's original three-part paper and modern guides.

## Source policy

These notes adapt and cross-link earlier notes rather than copying books or papers at length. Immediate sources include:

- David Eisenbud, *Commutative Algebra with a View Toward Algebraic Geometry*;
- Miles Reid, *Chapters on Algebraic Surfaces* and *The Du Val Singularities Aₙ, Dₙ, E₆, E₇, E₈*;
- Patrick du Val's 1934 trilogy on isolated surface singularities that do not affect adjunction;
- David A. Madore's cubic-surface animations and Lie-group sound experiments.

Credit belongs to the original authors and to the older work they cite, especially Patrick du Val, Michael Artin, Henry Laufer, Friedrich Hirzebruch, Heinrich Jung, John McKay, Bertram Kostant, Hermann Weyl, and the many people behind the ADE correspondence.