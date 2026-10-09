# Complex slice atlas

A hypersurface

```text
f(x,y,z)=0  in C³
```

has six real input coordinates:

```text
x_r, x_i, y_r, y_i, z_r, z_i
```

and two real output equations:

```text
Re(f)=0,
Im(f)=0.
```

This accounting must remain visible. Treating a generic complex hypersurface as one ordinary implicit surface in `R³` loses an equation.

## 1. Twenty coordinate triples

There are

```text
choose(6,3)=20
```

ways to choose three of the six real input channels as display axes. For each triple:

- vary the selected three inputs;
- fix the complementary three;
- draw `Re(f)=0` as one translucent implicit surface;
- draw `Im(f)=0` as a second translucent implicit surface;
- emphasize their intersection.

The actual complex hypersurface inside that 3D input slice is generically the intersection curve of the two surfaces. Special slices, including the ordinary real locus, may collapse the two conditions into one visible surface.

A contact sheet of all twenty triples gives a more honest first survey than selecting one attractive projection.

## 2. SURFER-style one-bit scan

A coarse diagnostic can assign one bit to each voxel or sample cell:

```text
1  if the cell may contain a simultaneous zero of Re(f) and Im(f)
0  otherwise.
```

Possible tests include:

- `|f|<ε` at a sample;
- interval bounds for `Re(f)` and `Im(f)` both containing zero;
- sign changes on cell edges or faces;
- a certified interval-arithmetic exclusion test.

The bit scan is not the final geometry. It is a quick way to search every coordinate triple, locate useful windows, and avoid choosing slices by aesthetic accident.

Keep false positives rather than risk deleting a branch. Refinement can follow near occupied cells.

## 3. Input motion versus output probing

Two different animations are easy to confuse.

### Move the input slice

Change one or more of the three fixed real coordinates. This moves the chosen affine `R³` through `R⁶`.

Label:

```text
INPUT SLICE MOVING
```

### Move the output probe

Keep the input slice fixed while changing:

- the tolerance `ε` in `|f|<ε`;
- the phase condition `arg(f)=θ`;
- the value in a fibre `f=t`;
- an isovalue of `Re(f)` or `Im(f)`.

Label:

```text
OUTPUT PROBE MOVING
```

A film may combine both, but their controls and traces should stay separate.

## 4. The real locus as one preset

For a polynomial with real coefficients, set

```text
x_i=y_i=z_i=0.
```

Then `Im(f)=0` automatically, and `Re(f)=0` becomes one real equation in three variables. For

```text
f=x²+y³+z⁵,
```

this gives the real surface already used in the main storyboard.

Call it

```text
REAL-LOCUS PRESET
```

rather than the default meaning of the complex singularity.

## 5. Phase slices

Another useful family fixes the argument of the output:

```text
arg(f)=θ.
```

Equivalently, rotate the output and impose

```text
Im(e^(−iθ)f)=0,
Re(e^(−iθ)f)≥0.
```

As `θ` moves around the circle, this can expose the Milnor-fibration structure near the link. This is output motion. The input coordinates need not move.

## 6. Small sphere and link view

Intersect a small neighborhood with

```text
|x|²+|y|²+|z|²=ε².
```

For `E₈`, the link is

```text
{x²+y³+z⁵=0} ∩ S⁵_ε.
```

It is a real 3-manifold inside `S⁵`, not a surface naturally embedded in `R³`. A display therefore needs a projection, fibration, surgery picture, or lower-dimensional section. Every such choice should remain labeled.

A useful synchronized view is:

1. a selected 3-input slice;
2. the two output-zero surfaces;
3. the intersection with the radius constraint;
4. a phase wheel for `arg(f)`.

## 7. Compactify ratio coordinates

Blowup charts introduce ratios such as

```text
y/x,
z/x
```

or their siblings. A ratio becoming infinite does not mean that the geometry disappears. It means the current affine chart has reached its boundary and a sibling projective chart takes over.

Whenever one complex ratio is displayed, compactify its plane to

```text
C ∪ {∞} = P¹(C),
```

the Riemann sphere.

Keep visible markers for:

- `0`;
- `∞`;
- zeros of the current rational function;
- poles;
- multiplicities;
- current scale.

This makes chart transitions geometric instead of abrupt.

## 8. Homographies and quaternionic rotations

Two transformation families have different jobs.

### Homographies

Möbius transformations act on `P¹`. Use them to recenter a ratio coordinate while keeping `0`, `∞`, zeros, and poles traceable. A chart switch can then be shown as an explicit homography rather than a camera cut.

Patrick du Val's later book *Homographies, Quaternions and Rotations* is a relevant historical source for this transformation language, separate from his 1934 singularity papers.

### Quaternionic rotations

Use quaternions for actual rotations of a three-dimensional viewport or for controlled rotations of selected real coordinate triples. Do not let a quaternionic camera motion stand in for a birational transformation.

Persistent corner labels should say whether the active transformation is:

```text
MÖBIUS / CHART
QUATERNION / CAMERA
BLOWUP / GEOMETRY
```

## 9. Weighted slice motion for `E₈`

For

```text
f=x²+y³+z⁵,
```

use weighted radial coordinates compatible with weights `(15,10,6)`:

```text
x=r¹⁵X,
y=r¹⁰Y,
z=r⁶Z.
```

Changing `r` is a weighted input zoom. Changing a fibre value in

```text
f=t
```

is output motion. Display both parameters separately.

A good diagnostic grid has axes:

```text
horizontal: weighted radius r
vertical: output value or phase t
```

Each cell contains the same chosen input slice. This separates “approach the singular point” from “move off the singular fibre.”

## 10. Suggested first contact sheet

For `A₁`, `D₄`, and `E₈`:

1. render the real-locus preset;
2. render all twenty coordinate triples with the other channels zero;
3. repeat with a few small nonzero complementary coordinates;
4. show `Re(f)=0` and `Im(f)=0` separately;
5. show their intersection;
6. rank views by topological stability under a small change of fixed coordinates;
7. retain unstable views as deformation evidence rather than deleting them.

The best main view should be chosen only after this atlas exists.

## 11. Relation to the resolution film

The slice atlas describes the singular space and nearby fibres. The blowup atlas describes the resolved source and its map to the singular target.

Synchronize them through selected points:

- choose a point in a blowup chart;
- map it to `C³`;
- show its six real coordinates;
- identify which slice views contain it;
- trace the limit as the point approaches an exceptional curve;
- show that a whole exceptional curve maps to the singular point.

This is more informative than morphing one rendered mesh into another. It makes the map itself inspectable.