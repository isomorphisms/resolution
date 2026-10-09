# Rendering proposals and storyboard

## 1. Start by naming every kind of motion

A future film should place a small persistent label in a corner:

```text
CAMERA
COORDINATE CHANGE
WEIGHTED ZOOM
DEFORMATION
BLOWUP
CHART CHANGE
CONTRACTION
PROJECTION
```

Many mathematical animations become misleading because all eight operations look like “the shape moves.” Here they mean different things.

## 2. Opening comparison: smooth, `A₁`, `E₈`

Do not compare `E₈` with a “normal singularity.” Du Val singularities are normal. Compare it with a smooth point and the simplest singularity.

Use three adjacent viewports with the same camera, clipping ball, axes, and scale.

### Smooth point `A₀`

Use a graph such as

```text
x+y²+z²=0.
```

The gradient is nonzero at the origin. A small neighborhood is visibly one smooth sheet.

### Ordinary double point `A₁`

For a useful real picture, use the real form

```text
x²+y²−z²=0.
```

Over the complex numbers this represents the same ordinary-double-point type as `x²+y²+z²=0`, but its real locus is a visible double cone rather than a single point.

### `E₈`

Use

```text
x²+y³+z⁵=0.
```

Show both sheets

```text
x=±sqrt(−y³−z⁵)
```

inside a fixed clipping ball. The surface should not be advertised as the whole complex singularity. Label it

```text
REAL LOCUS OF ONE REAL FORM
```

Beside each picture, show compact algebraic data:

| object | tangent-space dimension | ordinary tangent cone | exceptional curves after minimal resolution |
| --- | ---: | --- | ---: |
| smooth point | 2 | one plane | 0 |
| `A₁` | 3 | quadratic cone | 1 |
| `E₈` | 3 | doubled plane | 8 |

The table explains why visual sharpness is not a measure of mathematical complexity.

## 3. The two zooms

The most revealing first effect is not a rotation. It is a comparison of zoom rules.

### Ordinary zoom

Scale all coordinates together. At smaller scales, `x²` dominates `y³` and `z⁵`, so `E₈` tends toward the doubled plane `x²=0`.

### Weighted zoom

Use the weighted dilation

```text
(x,y,z) ↦ (r¹⁵x, r¹⁰y, r⁶z).
```

Every term then scales by `r³⁰`. The `E₈` surface is invariant up to overall scale.

Show the two views side by side. The ordinary camera says “the first nonzero ordinary-degree term is `x²`.” The weighted camera says “the full singularity has a natural anisotropic scaling law.”

This gives a concrete reason for weighted projective geometry before introducing it formally.

## 4. Three films, not one confused film

### Film A — deformation atlas

Purpose: compare the visible forms of singular and nearby smooth fibres.

Show

```text
x²+y³+z⁵=t
```

for changing `t`, with the singular fibre held long enough to inspect. This follows the spirit of Madore's cubic-surface films.

Label this `DEFORMATION`, never `RESOLUTION`.

### Film B — chart resolution

Purpose: show the actual birational operation.

For each blowup or weighted blowup:

1. mark the centre;
2. display the defining ideal;
3. fan the view into affine charts;
4. substitute chart coordinates;
5. divide out the exceptional factor to obtain the strict transform;
6. test the remaining singular points;
7. add the new exceptional component to the ledger.

This film may be visually plainer, but it is the mathematical core.

### Film C — exceptional-fibre model

Purpose: make the resolved configuration memorable.

Represent every exceptional `P¹` by a separate topological sphere. Put a marked bead on each sphere for every intersection with another component. Connect corresponding beads by a short bridge or identify them in a schematic cutaway.

Do **not** pretend that this is an embedding of the exceptional fibre in ordinary `R³`. Two real 2-surfaces in `R³` do not model transverse intersection of complex curves in a complex surface correctly. This is an incidence model.

## 5. Four synchronized panels

The strongest single presentation combines the three films with a combinatorial panel.

### Panel 1 — local surface

- implicit real surface, slice, or projection;
- clipping ball kept fixed;
- optional cutaway plane;
- singular locus highlighted;
- ordinary and weighted grids available.

### Panel 2 — chart notebook

- current equation;
- substitution defining the chart;
- exceptional coordinate;
- strict-transform equation;
- Jacobian rank check;
- arrows to sibling charts.

This panel should look like an executable notebook even before it becomes one.

### Panel 3 — exceptional fibre

- one sphere per `P¹`;
- generation of appearance encoded visually;
- self-intersection written directly on the component;
- current component emphasized;
- residual singular points shown as warning markers.

### Panel 4 — graph and matrix

- dual graph grows one vertex or edge at a time;
- diagonal matrix entries show self-intersection;
- off-diagonal entries flash when two curves meet;
- final matrix changes label to `−C_ADE` after verification.

The four panels should share selection. Touching a graph vertex selects its curve, its chart history, and its image under the resolution map.

## 6. Prototype 1: `A₁`

A complete first prototype can be mathematically honest without being long.

1. Rotate the real double cone.
2. Freeze the camera and mark the origin.
3. Replace ordinary radial scale by direction plus distance.
4. Open the three projective charts.
5. Show the strict transform becoming smooth.
6. Show the exceptional conic in `P²`.
7. Re-express that conic as `P¹` and then as a schematic sphere.
8. Write `E²=−2` on it.
9. Reverse the map: contract the curve and recover the node.

The reverse contraction is especially useful. It shows that resolution does not sand down a sharp object. It maps an entire curve to one point.

## 7. Prototype 2: `D₄`

Use the first blowup to introduce residual singularities.

1. Begin with a real slice of a `D₄` equation.
2. Blow up the origin.
3. Show the new central exceptional curve.
4. Mark the three remaining `A₁` points on it.
5. Open three local windows simultaneously.
6. Resolve each `A₁` using the first prototype.
7. Add the three outer curves.
8. Grow the `D₄` graph and intersection matrix.
9. Contract all four curves in reverse order.

This supplies the first visual distinction between:

- one exceptional component;
- several disjoint components;
- and several components joined in a branching tree.

## 8. Prototype 3: `E₈`

The exact chart sequence should be generated and checked before it is animated. The initial design can still be fixed.

### Stage 1 — recognize the singularity

- equation and gradient;
- isolated singular point;
- ordinary tangent cone `x²=0`;
- weighted degrees `(15,10,6;30)`;
- Milnor number `8`.

### Stage 2 — enter resolution mode

- lock the deformation parameter at zero;
- show the birational map ledger;
- perform the verified sequence of local modifications;
- never interpolate between algebraic stages without labeling the interpolation as graphic continuity.

### Stage 3 — accumulate the exceptional fibre

As each irreducible curve becomes available:

- assign it a stable name;
- show the chart in which it first appears;
- record intersections;
- update self-intersection after later blowups;
- add its graph vertex only after irreducibility has been checked.

### Stage 4 — identify `E₈`

When the eight curves and all intersections are established:

- reorder the matrix into a standard `E₈` basis;
- display the negative Cartan matrix;
- pulse the corresponding graph edges;
- show that the determinant is `1`;
- display the link name `Σ(2,3,5)` as a separate topological invariant, not as the exceptional fibre.

### Stage 5 — reverse contraction

Begin with the resolved local surface and its eight curves. Collapse the whole tree through the resolution map. The graph remains visible as a ghost while its image becomes one point.

This reverse view may be the clearest main film. The forward blowups can remain available as an expanded proof mode.

## 9. Visual encoding guesses

These are proposals, not mathematical invariants.

### Color

Use color for **generation or role**, not for arbitrary beauty:

- neutral material for the ordinary surface;
- one hue family for exceptional curves;
- brightness for the current chart;
- white warning point for unresolved singularities;
- red only for a failed regularity check.

A color-blind-safe texture or label must duplicate every color distinction.

### Surface texture

Draw coordinate-grid curves on the local surface. Under a blowup, let the grid stretch toward projective directions. This makes the change of coordinates visible without pretending the mesh itself is invariant.

### Intersection

Use a bead labeled `E_i·E_j=1` rather than making two spheres merely touch. Tangent spheres in `R³` suggest the wrong local geometry.

### Self-intersection

Write `−2` on every final Du Val component. During intermediate steps, retain the actual current value instead of setting all labels to `−2` prematurely.

### Numerical cycle

A later mode can set line thickness or sphere size from coefficients of the fundamental/numerical cycle. This would add information, but it should not be mixed into the first film until the basic incidence picture is clear.

## 10. Slice and projection controls

For a complex equation, provide an explicit slice card:

```text
Re(x), Im(x), Re(y), Im(y), Re(z), Im(z)
```

The user chooses which three coordinates are axes and which three are fixed or animated. Presets may include:

- all imaginary parts zero: real locus;
- one imaginary coordinate varying as time;
- fixed argument of `f`;
- Milnor fibre `f=εe^{iθ}`;
- weighted radial section.

Every preset should preserve its definition on screen. Otherwise a beautiful projection can quietly change the object.

## 11. Camera behavior

- Keep a fixed world frame during a birational step.
- Move the camera only during segments labeled `CAMERA`.
- Offer orthographic projection for comparing scales.
- Use perspective only when depth aids the topology.
- Keep a small orientation triad visible.
- Permit clipping planes, but display their equations.
- Avoid lighting that hides one sheet of a real locus.

Madore's red, green, and blue directional lighting is a useful reference because it lets surface orientation be read without painting mathematical regions arbitrary colors.

## 12. What not to do

- Do not morph an `E₈` real locus into eight floating spheres and call the morph a resolution.
- Do not show the Dynkin diagram alone and call it the singularity.
- Do not call a smoothing a blowup.
- Do not treat normalization as sufficient for a normal singularity.
- Do not let a camera cut stand in for a coordinate chart.
- Do not use the ordinary tangent cone as if it classified the singularity.
- Do not suppress components because they project on top of one another.
- Do not claim that an attractive real slice is canonical.

## 13. Minimal deliverable before code

The next mathematical asset should be a checked ledger for `A₁`, `D₄`, and `E₈` with one row per chart:

| step | centre | chart | substitution | strict transform | singular points | exceptional components | intersections |
| --- | --- | --- | --- | --- | --- | --- | --- |

Once that exists, almost every frame of the resolution film can be generated from data rather than improvised by hand.