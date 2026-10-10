# Executable surface-rendering comparison

This directory turns the rendering notes into two deliberately separate lanes.

1. **Native lane** — exercises the existing portable SURFER C ray tracer from
   `isomorphismes/algebraic-variety-explorer-mobile` at the commit pinned in
   [`SURFER.lock`](SURFER.lock). It writes raw ARGB pixels and has no Android,
   JVM, window-system, or GPU dependency.
2. **Madore reference lane** — downloads David A. Madore's original *Cubic
   Surfaces DVD* source archive and asks POV-Ray to render one unchanged scene.
   It records the archive checksum, source inventory, chosen scene, logs, and
   output checksum.

Do not merge these lanes conceptually. The native images are new renderings that
use Madore's presentation discipline. The reference image is generated from
Madore's actual source.

## Why the older native renderer is the right base

The pinned C core already has the machinery needed here:

- sparse implicit polynomials and prepared derivatives;
- exact specialization of a polynomial along a ray;
- first-visible-root selection, including even-multiplicity tangent roots;
- unit-sphere clipping that preserves one ray parameter across camera,
  clipping, and surface coordinate systems;
- gradient normals, front/back materials, multiple lights, and ARGB output;
- an orthographic yaw/pitch/zoom camera.

That is more useful than importing POV-Ray as the application architecture.
POV-Ray remains the visual and historical oracle. The native renderer is the
interactive numerical engine.

## First native exercise

[`native/madore_demo.c`](native/madore_demo.c) renders:

- four frames of `x² + y² − z² = ε`, with the singular `A₁` frame at frame 75;
- the affine Cayley cubic `xyz + xy + xz + yz = 0`;
- a neutral material under fixed green-above, red-above/right, and blue-below
  lights;
- every surface inside the renderer's fixed unit clipping sphere.

The film clock has 300 frames, corresponding to Madore's 12 seconds at 25 fps.
Our deformation curve is explicitly new: it is not claimed to be copied from
Madore. It merely puts its singular member at frame 75 so comparisons line up.

## Run the native lane

Check out the pinned renderer next to this repository path:

```sh
git clone https://github.com/isomorphismes/algebraic-variety-explorer-mobile.git \
  .deps/algebraic-variety-explorer-mobile
git -C .deps/algebraic-variety-explorer-mobile \
  checkout 3928dcd1d023baab7c44bb4fc34f0ebe331f6237
render/native/build-and-render.sh out/native
render/native/verify_outputs.py out/native
```

Or set `SURFER_ROOT` to an existing checkout. The same command is used in CI.

## Run Madore's original lane

With `curl`, `tar`, and POV-Ray installed:

```sh
render/reference/fetch-and-render-madore.sh out/madore-reference
```

The source archive is not silently vendored. Each run records its SHA-256 hash
before extraction. The script prefers the `A₁`, Cayley, and `E₆` film families,
then tries the remaining `.pov` scenes until one renders. The selected original
filename is written to `RENDERED_SCENE`.

## Camera and Android boundary

The numerical scene must not know about Android camera APIs. Here “camera” means
an algebraic map from a pixel coordinate to a ray bundle. Android supplies only:

- touch gestures converted to yaw, pitch, zoom, or a future perspective pose;
- an output buffer or texture with width, height, stride, and pixel format;
- lifecycle, cancellation, and presentation.

The current renderer assumes a tightly packed `uint32_t` ARGB array and an
orthographic camera. An NDK adapter should therefore translate
`ANativeWindow_Buffer` or an uploaded texture into that contract; it should not
move the polynomial solver, clipping rule, or light semantics into JNI.

The next shared-renderer changes belong upstream in
`algebraic-variety-explorer-mobile`, not as local forks here:

1. add output stride and explicit row orientation;
2. expose perspective and general camera-to-surface transforms;
3. allow a clipping sphere with configurable centre/radius while keeping the
   unit-sphere fast path;
4. accept a frame/time parameter separately from camera motion;
5. add tiled rendering and cancellation for Android;
6. keep a platform-neutral image oracle so CPU, OpenGL ES, Sokol, and Android
   adapters can be compared pixelwise or geometrically.

## Attribution

David A. Madore created *The Cubic Surfaces DVD* (2006), published its POV-Ray
source, placed that DVD project and source in the public domain, and requested
recognition. The reference script downloads his archive from the original
project site. The new native scene is **inspired by**, not adapted from, his
source until exact source-level derivation is documented.

The native numerical renderer is derived from Christian Stussak's jsurf/SURFER
renderer under Apache-2.0. Preserve the upstream `LICENSE`, `NOTICE`, and source
headers when copying or redistributing it. This repository pins it as an
external source rather than stripping that provenance.
