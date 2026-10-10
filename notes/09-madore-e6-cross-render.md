# David A. Madore's exact cubic `E₆` — two working renderers

**Original artist, mathematician, and author of the source:** **David A. Madore**.  
**His original project and public-domain source:** http://www.madore.org/cubic-dvd/  
**Original file copied without modification:** [`03s01a.pov`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/03s01a.pov)  
**Original complete source archive:** [`cubic-dvd.tar.gz`](../vendor/david-madore/cubic-dvd/original/cubic-dvd.tar.gz)  
**Matched YouTube film:** [*An E6 singularity (simple rotation)*](https://www.youtube.com/watch?v=B0jwiY6TKf0)  
**Independent Java renderer:** Christian Stussak / IMAGINARY's Apache-2.0 `jsurf` core, maintained in [`isomorphismes/algebraic-variety-explorer-mobile`](https://github.com/isomorphismes/algebraic-variety-explorer-mobile).

## Original equation, extracted from Madore's actual source

The 20 coefficients in the first `cubic{}` of `03s01a.pov` are:

```text
<0,0,0, 1,0,0,0, 1,0,0, 1,0,0,0,0,0,0,0,0, -0.0001>
```

The authoritative [POV-Ray polynomial-coefficient ordering](https://www.povray.org/documentation/view/3.7.1/298/) assigns `A4=x²`, `A8=xz²`, and `A11=y³`; so Madore's exact cubic is

```text
F(x,y,z) = x² + xz² + y³.
```

Here

```text
∂F/∂x=2x+z²,   ∂F/∂y=3y²,   ∂F/∂z=2xz.
```

The common zero of `F` and its gradient over `C³` is the origin. Completing the square gives

```text
(x+z²/2)² + y³ - z⁴/4 = 0.
```

This is complex-analytically equivalent to `u²+v³+w⁴=0`, the simple `E₆` surface singularity. It is two *complex* dimensional. A real 3D movie displays only its **real locus**, with its chosen projection and clipping.

**Important: the original code has two cubic solids**, `F−ε<0` and `−F−ε<0`, for `ε=0.0001`. Their intersection draws the thin band `−ε < F < ε` around the real zero set (with boundary), not an exact zero-thickness mathematical surface. Madore then intersects it with `x²+y²+z²≤16`, the radius-4 sphere. The camera is a perspective camera at `(0,5,-20)`, looking at the origin, angle 30°. His colored lights stay fixed (red at `(1000,2000,-1732)`, green at `(0,5000,0)`, blue at `(-500,-2000,0)`).

## Rendered-film comparison

| | **Original POV-Ray** | **SURFER/jsurf** |
|---|---|---|
| Source | Madore's unmodified `03s01a.pov` | Christian Stussak's actual Java `de.mfo.jsurf` CPU renderer |
| Polynomial | `x² + xz² + y³` ± thickness | `x² + xz² + y³ = 0` |
| View | Perspective, radius-4 sphere, neutral material, three RGB lights | Orthographic, unit-sphere clipping, orange/gold materials, three white lights |
| Spin | Madore's `rotate <0,360*clock,0>` | JSURF view yaw varies by `2πi/N`, pitch fixed |
| Movies | [MP4](../renders/madore-e6/madore-e6-povray.mp4), [animated GIF](../renders/madore-e6/madore-e6-povray.gif) | [SURFER MP4](https://github.com/isomorphismes/algebraic-variety-explorer-mobile/blob/feature/madore-e6-orbit/renders/madore-e6/madore-e6-surfer.mp4), [SURFER GIF](https://github.com/isomorphismes/algebraic-variety-explorer-mobile/blob/feature/madore-e6-orbit/renders/madore-e6/madore-e6-surfer.gif) |
| Stills | [POV-Ray PNG](../renders/madore-e6/madore-e6-povray.png) | [SURFER PNG](https://github.com/isomorphismes/algebraic-variety-explorer-mobile/blob/feature/madore-e6-orbit/renders/madore-e6/madore-e6-surfer.png) |

These are views of the **same polynomial**, but are not expected to be pixel-identical: POV-Ray draws a thin thickened band, and each renderer uses different clipping, camera projection and lighting.

## Reproduce, inspect, and test the actual rendering scripts

POV-Ray (Linux with POV-Ray 3.7, `ffmpeg`, `ffprobe` and Python 3):

```sh
bash scripts/render-madore-e6-povray.sh renders/madore-e6
```

SURFER Java (JDK 17 and exact dependencies pinned in that repository):

```sh
bash tools/render-madore-e6.sh renders/madore-e6
```

Defaults for both scripts are **32 real rendered frames**, **320×320**, **16 fps**, giving a two-second seam-free yaw orbit. Neither script uses hand-painted or synthesized image frames. Each script also produces a GitHub-friendly GIF, PNG poster, and JSON evidence manifest.

The validation checks: every expected frame exists; every frame decodes at the requested dimensions; foreground and background are both present; colors vary; at least a third of frames have distinct image hashes; the encoded MP4 decodes to the expected number of frames. These checks demonstrate that a **render took place and camera changed**, *not* a proof of the complex singularity type (which comes from the polynomial computation above).

## Completed rendering evidence (2026-10-09)

Both rendering pipelines actually ran, verified their source inputs, decoded all 32 frames, and published encoded artifacts.

- **Madore's original POV-Ray scene:** 32/32 distinct 320×320 frames, 16 fps, [MP4](../renders/madore-e6/madore-e6-povray.mp4) (79,380 bytes), [GIF](../renders/madore-e6/madore-e6-povray.gif) (457,654 bytes), [PNG](../renders/madore-e6/madore-e6-povray.png), and [evidence](../renders/madore-e6/madore-e6-povray-manifest.json). Source `03s01a.pov` was compared byte-for-byte with the imported archive manifest before rendering.
- **Christian Stussak / IMAGINARY SURFER/jsurf:** 32/32 distinct 320×320 frames, 16 fps, [MP4](https://github.com/isomorphismes/algebraic-variety-explorer-mobile/blob/feature/madore-e6-orbit/renders/madore-e6/madore-e6-surfer.mp4) (77,619 bytes), [GIF](https://github.com/isomorphismes/algebraic-variety-explorer-mobile/blob/feature/madore-e6-orbit/renders/madore-e6/madore-e6-surfer.gif) (644,000 bytes), [PNG](https://github.com/isomorphismes/algebraic-variety-explorer-mobile/blob/feature/madore-e6-orbit/renders/madore-e6/madore-e6-surfer.png), and [evidence](https://github.com/isomorphismes/algebraic-variety-explorer-mobile/blob/feature/madore-e6-orbit/renders/madore-e6/madore-e6-surfer-manifest.json). The unchanged sphere preview checksum also passed, as did Java renderer tests and the original Android CI smoke checks on the code-changing commit.

A passing movie verifier establishes that frames were actually rendered, contain nontrivial foreground, and vary under rotation. It is not a proof of a full complex surface visualization or an (E_6) resolution map.

## Source responsibility, credit, and future resolution

**Special thanks to David A. Madore** for the detailed and open mathematical films, fixed-light design, and public-domain source. The original 54-film DVD and source should remain credited even when code is reused indirectly or the graphics are re-rendered.

**Special thanks to Christian Stussak** and **IMAGINARY / Mathematisches Forschungsinstitut Oberwolfach** for the distinct Apache-2.0 SURFER/jsurf renderer. Madore did not write jsurf; Stussak did not author Madore's 2006 cubic/DVD. These renderers have different copyright provenance.

Neither rotating movie is a *resolution*. The next independent experiment is to synchronize this real slice with actual blowup charts and an exceptional `E₆` tree of six `(-2)` curves, then move to `D₄` and `E₈`. Changes in a deformation family must never be mislabeled as blowups.

See [Madore's full credit](../ACKNOWLEDGMENTS.md), the [DVD video catalog](08-cubic-surfaces-youtube-playlist.md) and the [SURFER source and tests](https://github.com/isomorphismes/algebraic-variety-explorer-mobile/pull/29).
