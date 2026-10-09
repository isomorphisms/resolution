# Mathematical background

## 1. Local algebra before pictures

Let a surface near a point be given by

```text
A = k[x,y,z]/(f)
```

and let `m=(x,y,z)` be the maximal ideal of the point. Several related constructions answer different questions.

### Jacobian and tangent space

The singular locus of a hypersurface is detected by

```text
f = ∂f/∂x = ∂f/∂y = ∂f/∂z = 0
```

under the usual characteristic hypotheses. Algebraically, the cotangent space is `m/m²`; its dual is the Zariski tangent space.

For

```text
f = x² + y³ + z⁵,
```

the gradient is

```text
(2x, 3y², 5z⁴).
```

It vanishes at the origin, so the tangent space there is all of `k³`, while the surface has dimension two. This detects singularity but does not distinguish `E₈` from many simpler singularities.

### Tangent cone

The associated graded ring

```text
gr_m(A) = ⊕ mⁿ/mⁿ⁺¹
```

records the ordinary tangent cone. For `E₈`, the lowest ordinary-degree term is `x²`, so the tangent cone is the doubled plane `x²=0`. That picture alone hides almost all of the `E₈` structure.

The equation is weighted homogeneous with weights

```text
weight(x)=15, weight(y)=10, weight(z)=6
```

and weighted degree `30`. A weighted zoom therefore preserves all three monomials. The film should contrast an ordinary zoom, which collapses toward a doubled plane, with the weighted zoom, which keeps the `E₈` equation fixed.

### Normalization

Normalization replaces a domain by its integral closure in its function field. It repairs the cusp

```text
y²=x³
```

through the parametrization `x=t²`, `y=t³`.

Normalization is not the same as resolution. Du Val singularities are normal already. Normalizing `E₈` therefore does not remove its singular point.

### Deformation and smoothing

A family such as

```text
x² + y³ + z⁵ = t
```

is a deformation. For suitable nonzero `t`, the fibre is smooth. Flatness is the algebraic condition that stops the fibres from changing size in the most destructive ways, but flat families may still pass from smooth to singular fibres.

This is the algebra behind Madore's deformation films. It is not the algebra of a resolution map.

## 2. Blowup as recorded geometry

For an ideal `I⊂A`, the blowup is

```text
Bl_I(Spec A) = Proj(⊕_{n≥0} Iⁿ).
```

For the origin, take `I=m`. The exceptional divisor is controlled by

```text
Proj(gr_m A).
```

Geometrically, the blowup records limiting directions into the point. Computationally, it is covered by charts. In the `x`-chart one substitutes

```text
y=xv,  z=xw,
```

removes the largest common power of `x`, and studies the strict transform. The other charts make the analogous substitutions using `y` or `z` as the distinguished coordinate.

A correct animation should expose this chart structure. Simply inflating the singular point into a sphere is not enough.

## 3. The ordinary double point `A₁`

Two convenient equations are

```text
xz-y²=0
```

and, over the complex numbers after a linear change of coordinates,

```text
x²+y²+z²=0.
```

Blow up the origin. In the second form, the strict transform meets the exceptional projective plane in the smooth conic

```text
x²+y²+z²=0  in P².
```

A smooth projective conic over `C` is `P¹`. Thus the singular point is replaced by one rational curve. Its self-intersection on the resolved surface is `−2`.

This is the first prototype because the whole exceptional fibre is one curve. The film can show:

1. the singular point;
2. the projective directions introduced by the blowup;
3. the conic inside those directions;
4. the smooth strict transform;
5. the contraction of the conic back to the point.

## 4. `D₄` as the first branching example

A standard form is

```text
x² + y²z + z³ = 0.
```

An especially legible equivalent form is arranged so that three branches in the relevant projective-direction calculation are visible. In Reid's explicit account, the first blowup produces the central exceptional curve and leaves three ordinary double points on it. Resolving those three points produces three additional `(-2)`-curves. The result is the four-vertex `D₄` tree.

This is the right intermediate film:

```text
one point
   ↓ first blowup
one central curve with three marked residual singularities
   ↓ three local resolutions
four curves with D₄ incidence
```

It makes clear that the vertices of the Dynkin diagram are curves, not points, and that its edges mean transverse intersections.

## 5. Du Val equations

Over `C`, convenient hypersurface forms are:

| type | equation |
| --- | --- |
| `A_n` | `x²+y²+zⁿ⁺¹=0` |
| `D_n` | `x²+y²z+zⁿ⁻¹=0` |
| `E₆` | `x²+y³+z⁴=0` |
| `E₇` | `x²+y³+yz³=0` |
| `E₈` | `x²+y³+z⁵=0` |

The subscript equals the number of irreducible exceptional curves in the minimal resolution. All of them are rational `(-2)`-curves. Their dual intersection graph is the corresponding ADE Dynkin diagram.

These singularities have several equivalent descriptions that the project should eventually cross-link:

- rational double points;
- Kleinian or simple surface singularities;
- quotient singularities `C²/G` for finite `G⊂SL(2,C)`;
- canonical surface singularities;
- hypersurfaces with ADE equations;
- resolutions whose intersection matrices are negative ADE Cartan matrices.

## 6. The `E₈` singularity

Use

```text
X = {x²+y³+z⁵=0} ⊂ C³.
```

Basic checks:

- complex dimension: `2`;
- real dimension: `4`;
- isolated singularity at the origin;
- weighted homogeneous of degree `30` with weights `(15,10,6)`;
- Milnor number: `(2−1)(3−1)(5−1)=8`;
- link: the Brieskorn manifold `Σ(2,3,5)`, the Poincaré homology 3-sphere;
- exceptional fibre of the minimal resolution: eight `P¹`s;
- every component has self-intersection `−2`;
- intersection matrix: `−C_E8`.

A common drawing convention for the graph is

```text
    o
    |
o—o—o—o—o—o—o
```

The exact placement of the short branch on paper is conventional. The abstract tree and its intersection matrix are the invariant data.

The eight exceptional curves should not all appear at once without cause. A chart ledger must record, for every birational step:

- which point or ideal is blown up;
- the coordinate charts;
- the strict-transform equation;
- remaining singular points;
- new exceptional components;
- changes in self-intersection;
- the map back to the preceding surface.

The exact economical chart sequence for `E₈` remains to be worked out in a later computational pass. The first visual notes should not pretend otherwise.

## 7. Why a three-dimensional picture is necessarily partial

The real locus

```text
x²+y³+z⁵=0  in R³
```

can be drawn as the two sheets

```text
x = ±sqrt(−y³−z⁵)
```

where `−y³−z⁵≥0`. This is useful, but it is only the fixed real form inside the complex surface.

Other honest but partial pictures include:

- fixing one imaginary coordinate and drawing a real 3D slice;
- projecting a 4-real-dimensional local model into `R³`;
- drawing level sets of `|f|` or `arg(f)`;
- drawing a Milnor fibre `f=ε`;
- using a surgery or fibration picture for the link;
- drawing the exceptional curves and their dual graph.

Each view loses different information. The film should use several views rather than claiming one magic picture is the singularity.

## 8. Eisenbud-style computation ledger

The earlier commutative-algebra notes suggest a repeatable pipeline for every example:

1. define the coordinate ring and localize at the singular point;
2. compute the Jacobian ideal and singular locus;
3. compute `m/m²` and the tangent-space dimension;
4. compute the associated graded ring and tangent cone;
5. test normality and compute normalization when needed;
6. record multiplicity and Hilbert–Samuel data;
7. construct the Rees algebra for the blowup ideal;
8. compute affine blowup charts and strict transforms;
9. repeat until every chart is regular;
10. compute the exceptional curves and their intersection matrix.

Gröbner bases are useful for chart simplification, saturation, elimination, and singular-locus checks. Kähler differentials supply a coordinate-independent singularity test. Neither replaces the geometric interpretation.

## 9. Fidelity tests for any future renderer

A rendering counts as a resolution visualization only if it can answer:

- What map `Y→X` is being shown?
- Which displayed object is the exceptional fibre?
- Which components are `P¹`s?
- Where do two components intersect?
- What are their self-intersections?
- Which chart contains the current residual singularity?
- Is the current motion a blowup, a coordinate change, a deformation, or only a camera move?
- Can the final intersection matrix be read as `−C_ADE`?

Without those answers, the result may still be a good singularity film, but it is not yet a film of resolution.