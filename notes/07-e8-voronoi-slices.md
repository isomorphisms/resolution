# David A. Madore: E₈ Voronoi cells through moving 2D sections

## Source status

- **Author:** David A. Madore.
- **Video:** [*Voronoi cells of the E8 lattice: a random three-dimensional cross-section*](https://www.youtube.com/watch?v=VSAnezNAjLg).
- **Evidence read:** public video description, not a frame-by-frame visual transcription or original rendering code.
- **Companion primary reference:** [Madore's interactive E₈ root-system viewer](https://www.madore.org/~david/math/e8w.html). This is a root-system projection, **not** the same object as the Voronoi-cell movie.

This link was supplied as part of the search through Madore's mathematical visualization videos. It is especially relevant to the user's higher-dimensional tessellation and viewing experiments, and only indirectly to actual resolutions of singularities.

## 1. What the film depicts

The underlying object is the Voronoi tessellation of the eight-dimensional E₈ lattice. Each lattice point has a Voronoi cell: all points in `R⁸` at least as close to it as to any other lattice point.

Madore states that each cell has:

- **240 facets** (codimension-one faces);
- **19,440 vertices**;
- of those vertices, **2,160 deep-hole** vertices and **17,280 shallow-hole** vertices.

These counts refer to the **Voronoi cell**. Do **not** confuse it with the Gosset/root polytope, which has **240 vertices**, one for each root. In this normalization the Voronoi cell is the polar dual of the convex hull of the 240 roots; the numbers 240 and 19,440 therefore switch roles between these dual descriptions.

The apparent “3D section” of the video is made into a film as follows:

1. Choose a random three-dimensional affine section of the eight-dimensional tessellation.
2. Show **two spatial dimensions** as screen coordinates.
3. Sweep the displayed plane uniformly through the **third section dimension** as time advances.
4. Give each displayed Voronoi region a color using **three other orthogonal directions**. The precise color transfer function is not specified in the description.

A lattice point designated the origin occurs **at the screen center, at the exact midpoint of the film**. The construction is centrally symmetric about this event, providing a convenient visual and algorithmic check.

This is a moving **section**, not an orthogonal projection of all cells on top of one another. A section partitions the displayed plane into regions; a projection would overlap huge numbers of cells.

## 2. An exact mathematical model of the film

Let `Λ ⊂ R⁸` be the E₈ lattice and let `u,v,w` be orthonormal vectors in `R⁸`. Fix a point `a ∈ R⁸`. At screen coordinates `(s,t)` and movie time `τ`, sample

```text
p(s,t,τ) = a + s u + t v + τ w.
```

Color a pixel according to the nearest lattice point

```text
L(s,t,τ) = argmin_(q∈Λ) ||p(s,t,τ) − q||².
```

Ties are Voronoi boundaries. The cell boundaries appear where two or more lattice points have exactly equal smallest squared distance. To reproduce Madore's centered event, select `a` and the time origin so that `p(0,0,0)` is a lattice point, then display `τ=0` at the film midpoint.

A useful and somewhat surprising exact fact: the two-dimensional frame is a **power diagram**, generally **not** an ordinary unweighted 2D Voronoi diagram of projected lattice sites. Indeed, for each site `q`, split its difference from the moving plane into the `u,v` coordinates and their orthogonal complement:

```text
c_q(τ) = (u·(q−a−τw), v·(q−a−τw))
h_q(τ)² = ||(I − uuᵀ − vvᵀ)(q−a−τw)||²

||p(s,t,τ)−q||²
    = ||(s,t)−c_q(τ)||² + h_q(τ)².
```

Hence the section minimizes a planar squared distance **plus a site-dependent weight**. With `w ⟂ u,v`, each projected site `c_q` stays fixed while the weights change as the plane moves. Regions can appear, disappear, and gain or lose polygon edges as the weights change; each individual slice of a convex Voronoi cell remains convex, so it cannot split into disconnected pieces. These are slicing events, not topological changes in the full 8D tessellation.

For the origin-centered cell, the 240 roots `r` of squared norm `2` give the facet inequalities

```text
V(0) = { x∈R⁸ : x·r ≤ 1 for every E₈ root r }.
```

Thus the origin cell can also be drawn as the intersection of **240 half-spaces**. The root polytope is `conv({r})`, and this cell is its polar under the same normalization.

## 3. Reconstructing the 8D nearest-lattice-point operation

A standard coordinate realization of the E₈ lattice is

```text
D₈ = { n ∈ Z⁸ : sum(n_i) is even }
h  = (½,½,½,½,½,½,½,½)

E₈ = D₈ ∪ (D₈ + h).
```

This gives an inexpensive exact nearest-point method, not requiring enumeration of an 8D neighborhood:

1. For a point `p ∈ R⁸`, find the nearest point in `D₈`. Round each coordinate to the closest integer; if the sum of those rounded integers is odd, flip the rounded value in the coordinate with the smallest cost of moving to the next-nearest integer.
2. Repeat the same computation for `p−h` to get the nearest point of the shifted coset; add `h` back.
3. Compare the two squared distances. The winner is the nearest E₈ lattice point.
4. Detect ties explicitly if a boundary representation is needed; a deterministic tie-break alone conceals cell facets.

Step 1 works because the only additional restriction on `Z⁸` is the parity of the coordinate sum. If the independently rounded point has the wrong parity, changing exactly one coordinate at the lowest squared-distance penalty repairs it optimally. The two-coset comparison is therefore exact.

**Checks:** the origin classifies to itself; for any root `r`, the point `r/2` is on the common facet of the cells of `0` and `r`; the full nearest-point rule is equivariant under lattice translations.

For a prototype, this nearest-lattice calculation can label every pixel without constructing all 19,440 vertices or an unbounded collection of Voronoi cells. Boundary strokes require either tie-sensitive distance evaluation or extracting contours between region labels.

## 4. What is reusable for higher-dimensional rendering

The method deliberately allocates independent data channels:

| Mathematical direction | Presentation |
| --- | --- |
| First selected basis vector `u` | horizontal pixel coordinate |
| Second `v` | vertical pixel coordinate |
| Third `w` | time / moving plane |
| Three more orthogonal directions | region color |
| Two remaining directions | still not displayed |

This is a useful control scheme for 4D, 6D or 8D geometry **provided the viewer knows what is discarded**. Four-dimensional geometry is especially straightforward: two screen axes, a third time axis and one remaining scalar color channel; alternatively display an interactive 3D slice and vary the fourth coordinate with a slider.

Reproducible scenes should record the eight-dimensional origin and orthonormal frame, the time interval, pixel scale, nearest-point tie policy, and color mapping. Choosing a random frame is fine, but persist its seed and exact resulting matrix. A color value is not a substitute for the hidden dimensions.

Possible rendering progression:

- begin with `Z²` square Voronoi cells and a moving line;
- extend to `Z³` cubic cells and a moving plane;
- then `D₄`, whose 24-cell geometry gives a practical four-dimensional stepping stone;
- finally `E₈` using the two-coset nearest-site rule;
- compare an **animated slice** to a **rotatable 3D slice** and a separate **projection**.

The section/power-diagram construction is more fundamental here than any particular rendering engine.

## 5. Relationship to the E₈ surface singularity

The Kleinian/Du Val `E₈` singularity may be written

```text
x² + y³ + z⁵ = 0   in C³.
```

Its minimal resolution has eight exceptional rational curves. Their intersection matrix is **minus the E₈ Cartan matrix**. Consequently, the abstract lattice on their homology classes is the **negative-definite E₈ root lattice**.

That is a real mathematical bridge to this Voronoi example, but not an identification of the pictures:

- E₈'s **positive-definite root lattice** and its Euclidean Voronoi regions are a separate 8D construction.
- The **exceptional curves** on the resolved **complex surface** are not the 240 facets of a Voronoi cell.
- The moving cross-sections of a fixed tessellation are not blowups, smoothings, or resolution maps.

A productive comparison scene could place (a) the eight-vertex Dynkin tree and negative intersection matrix beside (b) the E₈ roots and their Voronoi section. It would explain the shared **Cartan/root data** while refusing a spurious geometry equivalence.

## 6. Further original work and credit

- **David A. Madore**, [*Voronoi cells of the E8 lattice: a random three-dimensional cross-section*](https://www.youtube.com/watch?v=VSAnezNAjLg): primary video description for counts, section/time convention, color directions and midpoint symmetry. Rendering source/code availability **not verified**.
- **David A. Madore**, [*The E8 root system*](https://www.madore.org/~david/math/e8w.html): interactive root-system projection; 112 integer roots plus 128 half-integer roots, Weyl-group actions, and alternative projection directions.
- **Mathieu Dutour Sikirić, David Madore, Philippe Moustrou, and Frank Vallentin**, [*Coloring the Voronoi tessellation of lattices*](https://arxiv.org/abs/1907.09751): related work on coloring lattice Voronoi cells. **Not established** as the algorithm used to assign the film's RGB colors; do not conflate them.
- For root/intersection conventions, compare Miles Reid's Du Val guide recorded in [the source ledger](../sources/README.md).

Thanks to Madore for publishing the film and explanations, and to all four authors of the Voronoi-coloring paper. Original mathematical/rendering authorship should remain visible in any derivative experiment.
