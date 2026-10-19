# Executable surface-rendering comparison

This directory turns the rendering notes into two deliberately separate but
mathematically connected lanes.

1. **Native lane** — exercises the portable SURFER-derived C ray tracer from
   `isomorphismes/algebraic-variety-explorer-mobile` at the commit pinned in
   [`SURFER.lock`](SURFER.lock). It writes raw ARGB pixels and has no Android,
   JVM, window-system, or GPU dependency.
2. **Madore reference lane** — verifies and renders David A. Madore's
   byte-preserved `03s01a.pov` from the vendored *Cubic Surfaces DVD* source.
   It checks both the original tarball and scene hashes, proves the requested
   POV-Ray clock value, and records source, log, and output receipts.

POV-Ray remains the historical and visual oracle. The native renderer is the
portable numerical engine. They share an equation but intentionally do not
pretend to have identical cameras, materials, or visibility semantics.

See [`notes/09-madore-renderer-integration.md`](../notes/09-madore-renderer-integration.md)
for the source-level comparison and Android/renderer architecture.

## Why the older native renderer is the right base

The pinned C core already provides:

- sparse implicit polynomials and prepared derivatives;
- exact specialization of a polynomial along a ray;
- first-visible-root selection, including even-multiplicity tangent roots;
- unit-sphere clipping that preserves one ray parameter across camera,
  clipping, and surface coordinate systems;
- gradient normals, front/back materials, multiple lights, and ARGB output;
- an orthographic yaw/pitch/zoom camera.

That is more useful than making POV-Ray the application architecture. It also
creates a stable CPU oracle for future Android, OpenGL ES, Sokol, or mesh
backends.

## Native exercises

[`native/madore_demo.c`](native/madore_demo.c) renders:

- four frames of `x² + y² − z² = ε`, with the singular `A₁` frame at frame 75;
- the affine Cayley cubic `xyz + xy + xz + yz = 0`;
- Madore `03s01a`'s exact zero set, normalized from a radius-four ball to the
  unit ball:

  ```text
  X² + XZ² + Y³ = 0
            ↓ X=4x, Y=4y, Z=4z
  x² + 4xz² + 4y³ = 0;
  ```

- a neutral material under fixed green, red, and blue lights;
- every surface inside the renderer's fixed unit clipping sphere.

The `A₁` film clock has 300 frames, corresponding to Madore's 12 seconds at
25 fps. That deformation curve is new; it is not copied from Madore. The
`03s01a` polynomial is directly adapted from his imported source and is credited
at file level.

## What the original scene renders

Madore's two opposite POV-Ray cubics form a thin solid shell around

```text
F(X,Y,Z) = X² + XZ² + Y³:

|F(X,Y,Z)| ≤ 0.0001.
```

He intersects that shell with a sphere of radius four, uses a 30-degree
perspective camera, rotates the object about the vertical axis with `clock`, and
lights the white reflective material with fixed red, green, and blue point
lights. Both cubic boundaries request POV-Ray's `sturm` solver.

The native lane instead traces the first exact root of `F=0`, uses an
orthographic camera, and does not implement recursive reflection. Compare the
geometry and root behavior, not the PNG bytes.

## Run the native lane

Check out the pinned renderer next to this repository:

```sh
git clone https://github.com/isomorphismes/algebraic-variety-explorer-mobile.git \
  .deps/algebraic-variety-explorer-mobile
git -C .deps/algebraic-variety-explorer-mobile \
  checkout 3928dcd1d023baab7c44bb4fc34f0ebe331f6237
bash render/native/build-and-render.sh out/native
python3 render/native/verify_outputs.py out/native
```

Set `SURFER_ROOT` to reuse another checkout. CI runs the same acceptance path.

## Run Madore's original lane

The byte-preserved source and original tarball are already under
`vendor/david-madore/cubic-dvd/`. With POV-Ray installed:

```sh
bash render/reference/fetch-and-render-madore.sh out/madore-reference
```

Despite its historical filename, the script does not fetch an unpinned network
copy. It verifies the vendored archive SHA-256
`4996b498815783ab8f968022b8720cb5fad02ca8c7a40b82386978e5acdc2528`
and the exact `03s01a.pov` SHA-256
`064429bbdd8f6ebc5d36d49e0c0254edeed597f34643d702ee6cfc7d9cd508c0`.
It renders an unmodified copy through a tiny wrapper that reports the active
POV-Ray `clock`; the wrapper changes no scene declaration.

The output directory contains the selected source, hashes, original catalog,
POV-Ray version, exercised clock, complete render log, PNG, and PNG checksum.

## Camera and Android boundary

The numerical scene must not know about Android camera APIs. Here “camera” means
a map from a pixel coordinate to a ray bundle. Android supplies only:

- touch gestures converted to camera or object transforms;
- an output buffer or texture with width, height, stride, row order, and pixel
  format;
- lifecycle, cancellation, tile scheduling, and presentation.

The current renderer assumes a tightly packed `uint32_t` ARGB array and builds
orthographic rays internally. An NDK adapter should translate
`ANativeWindow_Buffer` or an uploaded texture into that contract; it should not
move the polynomial solver, clipping rule, or singularity semantics into JNI.

The next shared-renderer changes belong upstream in
`algebraic-variety-explorer-mobile`, not in a local fork:

1. output stride and explicit row orientation;
2. a general pixel-to-ray interface with orthographic and perspective cameras;
3. separate surface, object, camera, deformation, and blowup transforms/times;
4. exact-zero, level-set, and thin-shell visibility modes;
5. lights with explicit camera/world/object coordinate spaces;
6. configurable clipping volumes while retaining the unit-sphere fast path;
7. tiled rendering and cancellation for Android;
8. a platform-neutral oracle for CPU, OpenGL ES, Sokol, and Android comparisons.

## Attribution

David A. Madore created *The Cubic Surfaces DVD* (2006), published its POV-Ray
source, placed that DVD project and source in the public domain, and requested
recognition. The imported source remains byte-preserved and the adapted native
scene identifies the exact original file and changes.

The native numerical renderer is derived from Christian Stussak's jsurf/SURFER
renderer under Apache-2.0. Preserve the upstream `LICENSE`, `NOTICE`, and source
headers when copying or redistributing it. This repository pins that renderer as
an external source rather than stripping its provenance.
