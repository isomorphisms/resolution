# Madore `03s01a`: code study and renderer integration

This note records what was learned by executing David A. Madore's unmodified
`03s01a.pov` and translating the same implicit surface into the existing native
SURFER-derived C renderer.

The exact upstream file is preserved at
[`vendor/david-madore/cubic-dvd/upstream/cubic-dvd/03s01a.pov`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/03s01a.pov).
The executable comparison lives under [`render/`](../render/).

## 1. What the original scene actually does

POV-Ray orders the twenty coefficients of a cubic as

```text
x³, x²y, x²z, x², xy², xyz, xy, xz², xz, x,
y³, y²z, y², yz², yz, y, z³, z², z, 1.
```

Madore's first polynomial is therefore

```text
F(X,Y,Z) - δ = X² + X Z² + Y³ - 0.0001,
```

and the second is

```text
-F(X,Y,Z) - δ.
```

POV-Ray treats the negative side of a polynomial as its interior. Intersecting
those two solids gives the thin shell

```text
|F(X,Y,Z)| ≤ 0.0001.
```

That shell is then intersected with

```text
X² + Y² + Z² ≤ 16.
```

So the original is not directly shading an infinitesimally thin zero set. It
turns the zero set into a narrow solid, clips the result by a radius-four ball,
and sends rays through that constructive-solid-geometry object. Both cubic
objects request POV-Ray's slower `sturm` root solver.

Completing the square,

```text
X² + X Z² + Y³
  = (X + Z²/2)² + Y³ - Z⁴/4.
```

Over the complex numbers this is an `E₆` germ after rescaling. The minus sign on
the fourth-power term matters for its real picture even though it does not
change the complex analytic type.

## 2. Original camera, motion, material, and lights

The scene uses a perspective camera:

```text
location <0, 5, -20>
look_at  <0, 0, 0>
angle    30 degrees
```

The object, not the camera, rotates by

```text
<0, 360*clock, 0>.
```

That distinction should survive in our scene model. Camera motion, object
motion, deformation time, and resolution/blowup time are different parameters.
They may be synchronized by a film, but the renderer should not identify them.

The surface is white and uses

```text
ambient .2
diffuse .4
phong .3
reflection .2
```

under three fixed point lights:

```text
red:   <1000,  2000, -1732>
green: <   0,  5000,     0>
blue:  <-500, -2000,     0>
```

The color is geometric orientation data. Green indicates the upper-facing
regions, red separates the upper/right direction, and blue identifies lower
regions. Keeping those lights fixed makes rotation and deformation legible.

## 3. Translation into the native unit-ball renderer

The native core clips against the unit ball. Put

```text
X = 4x,  Y = 4y,  Z = 4z.
```

Then divide the original polynomial by `16`:

```text
f(x,y,z) = x² + 4xz² + 4y³.
```

Its prepared derivatives are

```text
∂f/∂x = 2x + 4z²,
∂f/∂y = 12y²,
∂f/∂z = 8xz.
```

[`render/native/madore_demo.c`](../render/native/madore_demo.c) supplies those
terms directly to the existing sparse-polynomial interface. The native engine
specializes `f` along each ray, isolates the first visible real root in the
clipping interval, evaluates the gradient, and shades the hit.

This is intentionally not a pixel reproduction of POV-Ray:

- POV-Ray renders `|F| ≤ 0.0001`; native renders `f = 0` exactly.
- POV-Ray is perspective; the current native camera is orthographic.
- POV-Ray includes reflection and CSG interior semantics; native currently has
  ambient, diffuse, and specular shading without recursive reflection.
- Madore's lights are fixed in world space while his object rotates. The present
  native demo keeps lights fixed in camera space.
- POV-Ray's shell has two nearby boundary sheets. The native zero set has one
  mathematical sheet and an undefined gradient exactly at a singular point.

The useful comparison is therefore geometry, silhouette, root behavior, and
orientation cues—not bytewise image equality.

## 4. What Madore's shell teaches us

The thin-shell construction is a reusable rendering mode, not an accidental
POV-Ray workaround.

It provides:

- a genuine solid with an inside and outside;
- stable surface normals on two nearby regular level sets when `δ` is chosen
  away from a critical value;
- something conventional raster, CSG, shadow, and reflection systems can see;
- a controlled visual thickness around a singular zero set.

It also changes the mathematics shown. Near a singular point, `|F| ≤ δ` can
round, bridge, or obscure the exact locus `F=0`. A resolution visualizer should
therefore expose the mode explicitly:

```text
exact zero set
level set F = c
thin shell |F-c| ≤ δ
extracted mesh with declared tolerance
```

No backend should silently substitute one for another.

## 5. Shared scene contract

The portable layer should grow toward a backend-independent scene description:

```text
PolynomialSurface
  sparse terms
  prepared derivatives
  declared degree

SurfacePlacement
  surface-to-world transform
  normalization transform
  object transform as a function of time

Visibility
  exact zero / level set / shell
  clipping volume
  front/back convention

Camera
  pixel-to-ray generator
  orthographic or perspective projection
  camera-to-world transform

Appearance
  material
  lights with an explicit coordinate space
  background

FilmState
  object time
  deformation parameter
  blowup/chart parameter
  camera time
```

This contract should be owned by neither Android nor POV-Ray. Backends consume
it:

- the existing CPU C renderer remains the exact-root oracle for low-degree
  polynomial surfaces;
- POV-Ray remains a historical and visual reference backend;
- an OpenGL ES or Sokol backend may use analytic ray/polynomial intersection,
  interval-guided ray marching, or an explicitly generated mesh;
- image and geometric receipts compare the backends without forcing identical
  lighting implementations.

## 6. Android NDK boundary

Android should adapt platform resources to the portable renderer, not absorb the
mathematics. The NDK boundary needs:

- width, height, stride, row order, and pixel format for
  `ANativeWindow_Buffer` or a texture upload;
- touch gestures converted into camera or object transforms;
- cancellation and tiled rendering so a stale frame can stop;
- lifecycle and surface-loss handling;
- no JNI representation of polynomial solving, clipping, or singularity type.

The current C interface assumes a tightly packed ARGB buffer and constructs its
own orthographic rays. The first upstream changes should be output stride and
row orientation, followed by a general pixel-to-ray camera interface. A
perspective implementation can then reproduce Madore's camera without changing
surface code.

## 7. Consequences for resolution of singularities

Madore's films show implicit surfaces and deformations. They do not show a
birational resolution. The shared renderer can still supply the base layer, but
a resolution film additionally needs:

- an atlas of source and blowup charts;
- the map from each chart back to the singular surface;
- exceptional divisors and their intersections;
- chart-transition checks;
- labels distinguishing deformation time from resolution steps.

A useful eventual frame can combine three synchronized views:

1. Madore-style bounded implicit surface;
2. local chart or exceptional-curve view;
3. resolution graph and current algebraic map.

Fixed clipping and lights should remain constant across those views whenever
possible. The mathematical map, rather than a camera dissolve, must explain how
one view corresponds to another.

## 8. Immediate implementation order

1. Add stride and row-orientation parameters to the portable C output.
2. Replace the hard-coded orthographic constructor with a general ray generator,
   retaining orthographic and adding Madore-compatible perspective.
3. Separate object transform, camera transform, and deformation time.
4. Add explicit exact-zero and thin-shell visibility modes.
5. Declare whether each light is in camera, world, or object coordinates.
6. Add cancellation and tile scheduling for the Android NDK adapter.
7. Keep the CPU render and the unmodified POV-Ray scene as acceptance oracles
   while adding OpenGL ES or Sokol backends.
