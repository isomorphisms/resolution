# David A. Madore — navigating four-dimensional polytopes from inside $S^3$

**Source status:** Madore's explanatory posts and program index read; his published video description checked for the 120-cell. The playlist itself did not expose a reliable current item-by-item listing, so this note **does not** claim its current ordering, length, or complete inventory.

**Author:** **David A. Madore**. Credit him for the films, mathematics exposition, and original code. His public program page calls the 4-polytope Perl script **public domain**. No source or footage is vendored here.

## Primary references and recordings

- YouTube playlist supplied by the user: https://www.youtube.com/playlist?list=PL09DF17B94CA3C6FD
- Verified example, *Navigating in a 120-cell*: https://www.youtube.com/watch?v=_RCAlhVlsWY
- Madore, *Naviguons dans des pavages de la 3-sphère* (12 November 2010): http://www.madore.org/~david/weblog/d.2010-11-12.1808.html
- Madore, *Affichage de l'hémisphère « trans » de la 3-sphère* (14 November 2010): http://www.madore.org/~david/weblog/d.2010-11-14.1809.html
- His program notes, under “Compute projections of 4-polytopes”: http://www.madore.org/~david/programs/programs.html
- High-quality AVI files and old versions: http://www.madore.org/~david/math/4polytopes/

The author's high-quality download directory contains **five named films** (not necessarily an independently verified count of current YouTube playlist items):

| Author-hosted file | Object | Camera orientation |
| --- | --- | --- |
| `120cell.avi` | 120-cell, 120 dodecahedral chambers | forward |
| `120cell-side.avi` | 120-cell | side |
| `600cell.avi` | 600-cell, 600 tetrahedral chambers | forward |
| `600cell-side.avi` | 600-cell | side |
| `24cell.avi` | 24-cell, 24 octahedral chambers | author's additional example |

The source blog says the denser 120-cell and 600-cell yield more informative imagery; the 24-cell and other regular 4-polytopes look sparse with this treatment. The later revision includes the distant hemisphere as red lines and corrects an orientation issue in earlier forward/side views; older renders remain in the `old/` directory.

## What is being shown

Each convex regular 4-polytope has its boundary radially projected to a regular decomposition of the **unit 3-sphere**, $S^3 \subset \mathbb R^4$. The observer then *lives in that curved three-dimensional space*, moving through its chambers. It is **not** simply an orthographic movie of a rotating object in $\mathbb R^4$ projected to $\mathbb R^3$.

- 120-cell $\{5,3,3\}$: 120 dodecahedral cells, 720 pentagonal faces, 1,200 edges, 600 vertices.
- 600-cell $\{3,3,5\}$: 600 tetrahedral cells, 1,200 triangular faces, 720 edges, 120 vertices.
- 24-cell $\{3,4,3\}$: 24 octahedral cells, 96 triangular faces, 96 edges, 24 vertices.

The 120-cell and 600-cell are dual. These tilings require the positive curvature of $S^3$; 120 ordinary dodecahedra do not tessellate Euclidean three-space in the corresponding regular way.

The verified 120-cell video description says that the observer traverses **one complete great circle** in $S^3$, while near-hemisphere edges appear as textured tubes and far-hemisphere edges as red lines.

## Rendering construction: gnomonic $S^3\to\mathbb R^3$

Let the observer's position be $p\in S^3\subset\mathbb R^4$. Choose a positively oriented orthonormal basis $e_1,e_2,e_3$ of $T_pS^3$. For $q\in S^3$, write

$$
c = \langle p,q\rangle,\qquad
u_i = \langle e_i,q\rangle .
$$

The coordinates in the tangent plane, translated to the origin of the observer's 3-space, are

$$
G_p(q)=\left(\frac{u_1}{c},\frac{u_2}{c},\frac{u_3}{c}\right),\qquad c\ne0.
$$

This is **gnomonic** (central) projection, not stereographic projection. On the near hemisphere $c>0$, it sends great-circle arcs to straight Euclidean lines and preserves angles *at the observer*. Hence an ordinary Euclidean raytracer can draw the projected edges. Madore's original script computes POV-Ray input using this geometry.

One-dimensional test: for $p=(1,0,0,0)$, $e_1=(0,1,0,0)$, and $q=(\cos\theta,\sin\theta,0,0)$,

$$
G_p(q)=(\tan\theta,0,0).
$$

So the horizon at $\theta=\pi/2$ goes to infinity. For the far hemisphere, $c<0$, the coordinates reappear after the horizon with reversed interpretation. Also $G_p(q)=G_p(-q)$: the formula on its own forgets which hemisphere a point inhabits. This is **why geometry and near/far labeling must remain separate inputs**.

In a renderer, preserve the four-dimensional endpoints and an explicit near/far hemisphere tag; split an edge where (c=0) rather than hoping a regular 3D clipping function will handle it. A purely gnomonic view is unbounded at that boundary. Madore's second revision draws distant (“trans”) edges as thin red wireframes, not physically modeled tubes: he explicitly warns that physically correct apparent thickness in that hemisphere would be counterintuitive and was not rendered.

Camera path: choose orthonormal $p_0,v\in\mathbb R^4$ and set $p(t)=\cos t\,p_0+\sin t\,v$, $0\le t\le2\pi$. Transport a three-vector camera frame with the motion; optionally aim forward or sideways. The side view reveals that traversing a great circle is simultaneously a rotation about an orthogonal great-circle axis. The movie is a direct tool for building intuition about $S^3$, even without showing a polytope.

**Candidate implementation contract** (ours, not attributed to Madore): `vertices_R4 + edges + observer_S3 + tangent_frame + hemisphere_policy -> projected_segments_R3 + metadata`. Keep adjacency in four dimensions, exact polytope type, camera motion, projection, and presentational color independent. Include unit tests near $\langle p,q\rangle=0$, under $q\mapsto-q$, and after one full camera circuit.

## Unexpectedly direct connection to resolution: the $E_8$ link

This playlist is **not** another set of singularity-resolution films. Its strongest relevance is the topology of the **link** of the complex $E_8$ singularity.

Consider

$$
X = \{(x,y,z)\in\mathbb C^3\mid x^2+y^3+z^5=0\}.
$$

Intersect $X$ with a sufficiently small ordinary $S^5$ in (mathbb C^3). The result is a real **3-manifold**, the link $L_{E_8}$. Up to diffeomorphism,

$$
L_{E_8} \cong \Sigma(2,3,5)
\cong S^3/2I,
$$

where $2I\subset SU(2)\cong S^3$ is the binary icosahedral group of order 120. The quotient is the **Poincaré homology 3-sphere**. It can also be constructed by identifying the paired faces of a single dodecahedron with the appropriate twist.

**Now the point:** the 120 dodecahedral chambers of Madore's 120-cell are a tessellation of the **universal cover** $S^3$ of that manifold. A dodecahedron is a fundamental domain for the $2I$ action on $S^3$. Thus his navigation film depicts the covering-space geometry needed to visualize the $E_8$ link, *but it does not itself perform the quotient or display the singularity*.

The minimal resolution has **eight** exceptional rational curves with self-intersections $-2$, meeting in the $E_8$ graph. A small regular neighborhood of their union is a plumbing of disk bundles whose boundary is (with orientation convention specified) the same Poincaré homology sphere. In other words, a single closed 3-manifold is seen from at least three distinct descriptions:

```text
120-cell tessellation of S³
        │ quotient by binary icosahedral group 2I
        ▼
Poincaré sphere Σ(2,3,5) ≅ S³/2I
        ▲                         ▲
        │ link of                │ boundary of
x² + y³ + z⁵ = 0         negative E₈ plumbing
(near its origin)         (eight $-2$-spheres)
```

**Proposed film extension** (not something Madore claimed to have done):

1. Let the viewer navigate the 120-cell's 120 chambers in $S^3$.
2. Show the action identifying chambers under $2I$. Transition to one dodecahedral fundamental domain with paired faces.
3. Label the quotient $S^3/2I$ as the **link** of $E_8$, without pretending a link is itself the resolution.
4. Separately expose the eight ($-2$)-spheres and their $E_8$ plumbing; relate the boundary of their neighborhood to the same quotient three-manifold.
5. Only then place this boundary alongside the actual local resolution map $Y\to X$, with algebraic coordinate charts as in this repository's main storyboard.

This joins the project's 3D navigation, singularity topology, and exceptional-divisor graph using **an actual mathematical equivalence**, not a merely visual resemblance.

## Independent source checking and credit

- **Robion C. Kirby** and **Martin G. Scharlemann**, *Eight Faces of the Poincaré Homology 3-Sphere* (1979), https://math.berkeley.edu/~kirby/papers/Kirby%20and%20Scharlemann%20-%20Eight%20faces%20of%20the%20Poincar%C3%A9%20homology%203-sphere%20-%20MR0537730.pdf . Their first page explicitly lists eight equivalent descriptions: $E_8$ plumbing; $E_8$ surgery; $x^2+y^3+z^5=0$ link; $S^3/2I$; dodecahedral space; Seifert bundle; trefoil surgery; branched torus-knot cover.
- **Laurentiu Maxim**, *Notes on Vanishing Cycles and Applications*, Example 2.22, https://people.math.wisc.edu/~maxim/vanishing.pdf . Identifies the $E_8$ quotient singularity, the binary icosahedral group and its link.
- **John Stillwell**, *The Story of the 120-Cell*, *Notices of the AMS* 48 (2001), https://www.ams.org/notices/200101/fea-stillwell.pdf . Gives the history of 120-cell/600-cell duality, the binary icosahedral group, and Poincaré's space.
- **David A. Madore**, the two 2010 notes and public-domain Perl script above. The specific gnomonic projection and the near/far wireframe convention are Madore's rendering choices.

Do not confuse: $S^3$ with $S^3/2I$; the $E_8$ link with the four-real-dimensional singular surface germ; or the Milnor fibre of a **smoothing** with the exceptional curves of a **resolution**.

## Verification still open

- Get the current full playlist items, canonical video IDs, lengths, and titles directly, if YouTube exposes them; avoid claiming the five hosted files are exactly the YouTube list.
- Pin the **direct** URL of Madore's `.pl` source (the verified program index links to it, but its href has not been extracted here).
- Investigate the finite group action and dodecahedral face-pairing representation carefully before specifying actual UI gestures.
