# David A. Madore — source equations for all 54 cubic-surface films

**Credit: David A. Madore**, *The Cubic Surfaces DVD* (2006).
[Original films, full public-domain source and author notice](http://www.madore.org/cubic-dvd/). Thank you to Madore for publishing the mathematical images and the source used to construct them.

**Complete coverage:** 54/54 source films, in original DVD order. The [machine-readable exact coefficient ledger](../data/madore-cubic-polynomials.json) preserves 20 polynomial coefficient expressions for each film, both original cubic vectors, SHA-256 for each source, camera and rotation parameters.

We found 10 films driven by object rotation alone and 44 films with time-dependent polynomial coefficients. Every source scene also has explicit camera and lighting settings.

## POV-Ray cubic coefficient order

Official documentation: https://www.povray.org/documentation/view/3.7.1/298/

A01 x³; A02 x²y; A03 x²z; A04 x²; A05 xy²; A06 xyz; A07 xy; A08 xz²; A09 xz; A10 x; A11 y³; A12 y²z; A13 y²; A14 yz²; A15 yz; A16 y; A17 z³; A18 z²; A19 z; A20 1.

Each first cubic defines F−0.0001; the second defines −F−0.0001. Their intersection creates a thin shell around the real zero set. The expressions in the table have the fixed offset removed; they do not remove mathematical terms that vary with the animation clock.

## All 54 sources

| # | Original description and source | Polynomial F(x,y,z;clock) | Motion |
|---:|---|---|---|
| 1 | [`01s01a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/01s01a.pov) — A smooth surface (simple rotation). | `(3)*x^2*y - y^3 - z^3 + (3)*z` | rotation |
| 2 | [`01s02a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/01s02a.pov) — A smooth surface (more complex rotation). | `(3)*x^2*y - y^3 - z^3 + (3)*z` | rotation |
| 3 | [`01s03a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/01s03a.pov) — Deformation of a conic point to a smooth surface. | `(3)*x^2*y - y^3 - z^3 + (3*cos(2*pi*clock))*z` | coefficients |
| 4 | [`02s01a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/02s01a.pov) — The Clebsch (smooth) cubic (simple rotation). | `(0.62853936105)*x^3 + (-1.33333333333)*x^2*y - x^2 + (-1.88561808316)*x*z^2 + (0.88888888889)*y^3 - y^2 + (-1.33333333333)*y*z^2 - z^2 + 0.9375` | rotation |
| 5 | [`03s01a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/03s01a.pov) — An E6 singularity (simple rotation). | `x^2 + x*z^2 + y^3` | rotation |
| 6 | [`03s02a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/03s02a.pov) — Deformation of an E6 singularity to two A2 singularities. | `x^2 + x*z^2 + (cos(2*pi*clock))*x + y^3` | coefficients |
| 7 | [`03s03a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/03s03a.pov) — Deformation of an E6 singularity to a D5 singularity. | `x^2 + x*z^2 + (sin(2*pi*clock))*y^3 + (cos(2*pi*clock))*y^2*z` | coefficients |
| 8 | [`03s04a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/03s04a.pov) — Deformation of an E6 singularity to a D4 singularity. | `x^2 + (sin(2*pi*clock))*x*z^2 + y^3 + (-3*cos(2*pi*clock))*y*z^2` | coefficients |
| 9 | [`04s01a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/04s01a.pov) — Whitney's Umbrella (a line of singular points) (simple rotation). | `x^2 + y^2*z` | rotation |
| 10 | [`04s02a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/04s02a.pov) — Deformation of Whitney's Umbrella to a smooth surface. | `x^2 + (cos(2*pi*clock))*x + y^2*z` | coefficients |
| 11 | [`04s03a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/04s03a.pov) — Deformation of Whitney's Umbrella to two A1 singularities. | `x^2 + y^2*z + (cos(2*pi*clock))*z` | coefficients |
| 12 | [`04s04a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/04s04a.pov) — Deformation of Whitney's Umbrella to an A3 singularity. | `x^2 + y^2*z + (cos(2*pi*clock))*z^2` | coefficients |
| 13 | [`05s01a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/05s01a.pov) — Deformation of three planes to a smooth surface. | `(0.5*cos(2*pi*clock))*x^2 - x*y*z + (-0.5*cos(2*pi*clock))*y^2 + (0.5*cos(2*pi*clock))*z^2 + 0.125*cos(2*pi*clock)*cos(2*pi*clock)*cos(2*pi*clock)` | coefficients |
| 14 | [`06s01a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/06s01a.pov) — Deformation of three planes to the Cayley cubic surface (having four A1 singularities). | `(-cos(2*pi*clock))*x^2 + (2)*x*y*z + (-cos(2*pi*clock))*y^2 + (-cos(2*pi*clock))*z^2 + cos(2*pi*clock)*cos(2*pi*clock)*cos(2*pi*clock)` | coefficients |
| 15 | [`06s02a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/06s02a.pov) — The Cayley cubic surface (having four A1 singularities) (simple rotation). | `(-1.2)*x^2 + (2)*x*y*z + (-1.2)*y^2 + (-1.2)*z^2 + 1.728` | rotation |
| 16 | [`06s03a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/06s03a.pov) — Deformation of the Cayley cubic surface (having four A1 singularities) or of a single A1 singularity (with conjugate planes) to a smooth surface. | `-x^2 + (2)*x*y*z - y^2 - z^2 + (1+4*cos(2*pi*clock))` | coefficients |
| 17 | [`07s01a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/07s01a.pov) — Deformation of a single A2 singularity (with conjugate planes) to a smooth surface. | `x^2 + y^3 + (2*cos(2*pi*clock))*y + z^2` | coefficients |
| 18 | [`07s02a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/07s02a.pov) — Deformation of a single A2 singularity (with conjugate planes) to an A1 singularity. | `x^2 + y^3 + (cos(2*pi*clock))*y^2 + z^2` | coefficients |
| 19 | [`07s03a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/07s03a.pov) — Deformation of a cone with a line of singular points to an A2 singularity. | `(cos(2*pi*clock))*x^2 + y^3 + z^2` | coefficients |
| 20 | [`08s01a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/08s01a.pov) — Three A2 singularities (with real planes). | `-x^3 + (1.5)*x^2 + (3)*x*z^2 + y^3 + (1.5)*z^2 - 0.5` | rotation |
| 21 | [`08s02a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/08s02a.pov) — Deformation of three A2 singularities (with real planes) to a smooth surface. | `-x^3 + (1.5)*x^2 + (3)*x*z^2 + y^3 + (2*cos(2*pi*clock))*y + (1.5)*z^2 - 0.5` | coefficients |
| 22 | [`08s03a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/08s03a.pov) — Deformation of three A2 singularities (with real planes) to three A1 singularities. | `-x^3 + (1.5)*x^2 + (3)*x*z^2 + y^3 + (cos(2*pi*clock))*y^2 + (1.5)*z^2 - 0.5` | coefficients |
| 23 | [`09s01a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/09s01a.pov) — Deformation of a conic point to a D4 singularity. | `-x^3 + (3)*x*z^2 + (sin(2*pi*clock))*y^3 + (cos(2*pi*clock))*y^2` | coefficients |
| 24 | [`10s01a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/10s01a.pov) — Deformation of a D4 singularity to three A1 singularities. | `-x^3 + (3*cos(2*pi*clock))*x^2 + (3)*x*z^2 + y^2 + (3*cos(2*pi*clock))*z^2 - 4*cos(2*pi*clock)*cos(2*pi*clock)*cos(2*pi*clock)` | coefficients |
| 25 | [`10s02a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/10s02a.pov) — Deformation of a D4 singularity to a smooth surface. | `-x^3 + (3)*x*z^2 + y^2 - cos(2*pi*clock)` | coefficients |
| 26 | [`11s01a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/11s01a.pov) — An A5 singularity (simple rotation). | `x^3 + x*y + y^3 + y*z^2` | rotation |
| 27 | [`11s02a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/11s02a.pov) — Deformation of an A5 singularity (as such). | `x^3 + x*y + (cos(2*pi*clock))*y^3 + y*z^2` | coefficients |
| 28 | [`11s03a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/11s03a.pov) — Deformation of an E6 singularity to an A5 singularity. | `x^3 + (cos(2*pi*clock))*x*y + y^3 + (sin(2*pi*clock))*y^2 + y*z^2` | coefficients |
| 29 | [`11s04a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/11s04a.pov) — Deformation of a reducible surface (union of a plane and a sphere) to an A5 singularity. | `(cos(2*pi*clock))*x^3 + (sin(2*pi*clock))*x^2*y + x*y + y^3 + y*z^2` | coefficients |
| 30 | [`11s05a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/11s05a.pov) — Deformation of an A5 singularity to two A2 singularities. | `x^3 + (sin(2*pi*clock))*x*y + y^3 + y*z^2 + (-cos(2*pi*clock))*y` | coefficients |
| 31 | [`11s06a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/11s06a.pov) — Deformation of an A5 singularity to an A4 singularity. | `(sin(2*pi*clock))*x^3 + (cos(2*pi*clock))*x^2*z + x*y + y^3 + y*z^2` | coefficients |
| 32 | [`12s01a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/12s01a.pov) — Deformation of an A3 singularity (with conjugate planes) to an A2 singularity. | `(cos(2*pi*clock))*x^3 + (sin(2*pi*clock))*x^2*y + y^2 + z^2` | coefficients |
| 33 | [`13s01a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/13s01a.pov) — Deformation of a reducible surface (union of a plane and a sphere) to a smooth surface. | `x^2*y + (-2*cos(2*pi*clock))*x*z + y^3 + y*z^2 - y` | coefficients |
| 34 | [`13s02a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/13s02a.pov) — Deformation of a reducible surface (union of a plane and a sphere) to a smooth surface. | `x^2*y + y^3 + y*z^2 - y + 2*cos(2*pi*clock)` | coefficients |
| 35 | [`13s03a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/13s03a.pov) — Deformation of a reducible surface (union of a plane and a sphere) to a smooth surface. | `(sin(2*pi*clock))*x^2*y + (cos(2*pi*clock))*x^2 + y^3 + (sin(2*pi*clock))*y*z^2 - y + (cos(2*pi*clock))*z^2` | coefficients |
| 36 | [`14s01a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/14s01a.pov) — Deformation of a twist of the Cayley cubic surface (having four A1 singularities) to a smooth surface. | `-x^2*y + x^2 - y^2 + y*z^2 + z^2 + (1+4*cos(2*pi*clock))` | coefficients |
| 37 | [`15s01a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/15s01a.pov) — Two A2 singularities (with real planes) (simple rotation). | `x^3 + y^3 + y*z^2 - y` | rotation |
| 38 | [`15s02a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/15s02a.pov) — Deformation of two A2 singularities (with real planes) to two A1 singularities. | `x^3 + (cos(2*pi*clock))*x^2 + y^3 + y*z^2 - y` | coefficients |
| 39 | [`16s01a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/16s01a.pov) — Deformation of an A3 singularity (with real planes) to an A2 singularity. | `(cos(2*pi*clock))*x^3 + (sin(2*pi*clock))*x^2*y - y^2 + z^2` | coefficients |
| 40 | [`17s01a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/17s01a.pov) — Deformation of a line of singular points to a D4 singularity. | `x^2 + x*y*z + y^3 + (cos(2*pi*clock))*y*z^2` | coefficients |
| 41 | [`17s02a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/17s02a.pov) — Deformation of a line of singular points to an E6 singularity. | `x^2 + (sin(2*pi*clock))*x*y*z + (cos(2*pi*clock))*x*z^2 + y^3` | coefficients |
| 42 | [`18s01a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/18s01a.pov) — Deformation of an A1 singularity (through various stages). | `(sin(2*pi*clock))*x^3 + x^2 + (cos(2*pi*clock))*y^3 - y^2 + (sin(2*pi*clock))*z^3 - z^2` | coefficients |
| 43 | [`19s01a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/19s01a.pov) — Deformation of an A2 singularity (with real planes) (through various stages). | `(sin(2*pi*clock))*x^3 + x^2 + (cos(2*pi*clock))*y^3 - y^2 + (sin(2*pi*clock))*z^3` | coefficients |
| 44 | [`19s02a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/19s02a.pov) — Deformation of an A2 singularity (with real planes) to an A1 singularity. | `x^3 + x^2 - y^2 + z^3 + (-cos(2*pi*clock))*z^2` | coefficients |
| 45 | [`20s01a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/20s01a.pov) — Deformation of an A2 singularity (with conjugate planes) (through various stages). | `(sin(2*pi*clock))*x^3 - x^2 + (cos(2*pi*clock))*y^3 - y^2 + (sin(2*pi*clock))*z^3` | coefficients |
| 46 | [`20s02a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/20s02a.pov) — Deformation of an A2 singularity (with conjugate planes) to an A1 singularity. | `x^3 - x^2 - y^2 + z^3 + (-cos(2*pi*clock))*z^2` | coefficients |
| 47 | [`21s01a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/21s01a.pov) — An A4 singularity (simple rotation). | `-x^2*z + x*y + y^3 + y*z^2` | rotation |
| 48 | [`21s02a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/21s02a.pov) — Deformation of an A4 singularity (as such). | `-x^2*z + x*y + (cos(2*pi*clock))*y^3 + y*z^2` | coefficients |
| 49 | [`21s03a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/21s03a.pov) — Deformation of a D5 singularity to an A4 singularity. | `-x^2*z + (cos(2*pi*clock))*x*y + y^3 + (sin(2*pi*clock))*y^2 + y*z^2` | coefficients |
| 50 | [`21s04a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/21s04a.pov) — Deformation of a reducible surface (union of a plane and a sphere) to an A4 singularity. | `(sin(2*pi*clock))*x^2*y + (-cos(2*pi*clock))*x^2*z + x*y + y^3 + y*z^2` | coefficients |
| 51 | [`21s05a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/21s05a.pov) — Deformation of an A4 singularity to two A2 singularities. | `-x^2*z + (sin(2*pi*clock))*x*y + y^3 + y*z^2 + (-cos(2*pi*clock))*y` | coefficients |
| 52 | [`99s01a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/99s01a.pov) — A random cubic surface deformation. | `((-1.2427)*cos(pi*clock)+(0.0133)*sin(pi*clock))*x^3 + ((1.3507)*cos(pi*clock)+(0.0284)*sin(pi*clock))*x^2*y + ((0.8456)*cos(pi*clock)+(-0.7093)*sin(pi*clock))*x^2*z + ((0.6593)*cos(pi*clock)+(0. … (full terms in JSON)` | coefficients |
| 53 | [`99s02a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/99s02a.pov) — A random cubic surface deformation. | `((-0.1434)*cos(pi*clock)+(2.8190)*sin(pi*clock))*x^3 + ((-0.9222)*cos(pi*clock)+(1.1931)*sin(pi*clock))*x^2*y + ((-0.0458)*cos(pi*clock)+(-0.8651)*sin(pi*clock))*x^2*z + ((-0.7110)*cos(pi*clock)+ … (full terms in JSON)` | coefficients |
| 54 | [`99s03a`](../vendor/david-madore/cubic-dvd/upstream/cubic-dvd/99s03a.pov) — A random cubic surface deformation. | `((0.4703)*cos(pi*clock)+(0.2846)*sin(pi*clock))*x^3 + ((-1.2598)*cos(pi*clock)+(-0.7666)*sin(pi*clock))*x^2*y + ((-0.2251)*cos(pi*clock)+(-0.8733)*sin(pi*clock))*x^2*z + ((-0.7690)*cos(pi*clock)+ … (full terms in JSON)` | coefficients |

## Mathematical checks suggested by the verified source equations

### E6 baseline: 03s01a

F=x²+xz²+y³. Completing the square yields (x+z²/2)²+y³−z⁴/4, a complex-analytic E6 singularity.
This equation is now independently rendered by original POV-Ray and by real SURFER/jsurf. See [the dual-render note](09-madore-e6-cross-render.md).

### E6 to two A2 points: 03s02a

F_t=x²+xz²+y³+c*x, c=cos(2πt). For nonzero c, two complex A2 points occur at (x,y,z)=(0,0,±√(-c)); when c>0 they are nonreal in these coordinates. They coalesce to E6 at c=0.

### E6 to D5: 03s03a

F_t=x²+xz²+sin(2πt)y³+cos(2πt)y²z. At t=0, completing the square in x yields u²+y²z−z⁴/4, of type D5. At t=1/4 the member is E6.

### Four nodes of the Cayley cubic: 06s02a

F=2xyz−1.2(x²+y²+z²)+1.728. Its nodes are (±1.2,±1.2,±1.2) with an even number of negative signs. The four global A1 points are different from a single D4 resolution graph.

### D4 to three A1 nodes: 10s01a

Let c=cos(2πt). The exact source gives F_t=−x³+3cx²+3xz²+y²+3cz²−4c³. At c=0 it has one D4 singularity. For c≠0 the three A1 singularities are at (2c,0,0), (−c,0,√3*c), (−c,0,−√3*c). This is deformation adjacency, not a blowup.

## Boundaries of the extraction

The 54 filenames and film descriptions come directly from Madore's original list and HTML index; every input .pov byte SHA-256 was checked against the original archive's import manifest. The two opposed cubics were numerically cross-checked at six clock values by a restricted arithmetic evaluator; original upstream code was not executed. Longer random-polynomial examples are shortened only in this Markdown table; full coefficients are preserved in the JSON. Actual surface singularities should still be proved individually rather than inferred from the film titles.

Original source and attribution: http://www.madore.org/cubic-dvd/ · [Project acknowledgment](../ACKNOWLEDGMENTS.md) · [SURFER movie PR](https://github.com/isomorphismes/algebraic-variety-explorer-mobile/pull/29).
