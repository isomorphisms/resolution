# Audio models

Do not force one sound system to represent every object. Three mathematically different systems are available.

## 1. Character timbre: Madore's principal-`SU(2)` method

This answers:

> What does a selected representation of an ADE Lie group sound like after restriction to one distinguished circle?

For a representation with weights `μ`, evaluate the weights on the half-sum of positive coroots `ρ∨`. The resulting integers or half-integers give harmonic numbers; their multiplicities give amplitudes.

A waveform has the form

```text
s(t)=Σ a_n sin(2π n f₀ t)
```

or the corresponding half-integer-frequency version, where `a_n` is a weight multiplicity and Madore used `f₀=110 Hz`.

### Best use here

Use this as a **static timbral signature** for a named ADE type:

- select `A₁`, hear one set of characters;
- select `D₄`, hear another;
- select `E₈`, hear selected fundamental or adjoint characters.

This sound belongs to the Lie-theoretic side of the ADE correspondence. It does not narrate the blowups.

### Visual pairing

Display at once:

- Dynkin diagram;
- selected highest weight;
- restricted weight multiplicities;
- harmonic bar graph;
- waveform;
- sound.

This can be reused far beyond the resolution project.

## 2. Intersection resonance: make the exceptional fibre ring

This answers:

> What are the normal modes of the configuration of exceptional curves?

Let `Q` be the intersection matrix of the exceptional curves. For a resolved rational double point,

```text
Q = −C_ADE,
```

where `C_ADE` is the positive-definite Cartan matrix.

Treat

```text
K = −Q
```

as a stiffness matrix for coupled unit-mass oscillators. Then

```text
u''(t)+K u(t)=0.
```

The modal angular frequencies are

```text
ω_j = sqrt(λ_j(K)).
```

This is not the acoustics of a literal arrangement of spheres. It is a direct sonification of the intersection form.

### Why this is a strong resolution sound

Every birational step changes concrete entries of `Q`:

- a new exceptional curve adds a row and column;
- blowing up a point on a curve lowers that curve's self-intersection by one;
- blowing up an intersection point changes the local incidence pattern;
- a transverse intersection gives an off-diagonal entry `1` in `Q`, hence `−1` in `K`;
- the final Du Val configuration gives the Cartan matrix exactly.

The sound can therefore be recomputed after each verified step. No arbitrary note is assigned to a vertex.

### `E₈` endpoint

For `E₈`, the Coxeter number is

```text
h=30
```

and the exponents are

```text
1, 7, 11, 13, 17, 19, 23, 29.
```

The eigenvalues of the `E₈` Cartan matrix may be written

```text
λ_m = 4 sin²(πm/(2h))
```

for those exponents `m`. With unit masses, the corresponding modal frequencies are proportional to

```text
2 sin(πm/60).
```

This gives an exact eight-frequency final chord. A global scale factor can put one chosen mode at an audible reference pitch without changing the ratios.

### Excitation choices

The frequency ratios are data. Excitation is a model choice.

- strike one curve: initial displacement or velocity in one coordinate;
- strike the numerical cycle: initial vector from its coefficients;
- strike all curves equally;
- strike the most recently created component;
- excite an eigenmode directly for analysis.

Show the initial vector on screen. Do not hide it as an audio-production choice.

### Damping

A simple damped model is

```text
u''+2γu'+Ku=0.
```

A common `γ` preserves modal ratios. Mode-dependent damping can improve the sound but adds another noncanonical choice.

## 3. Coxeter and monodromy phases

This answers:

> How do the vanishing cycles transform when one goes around the singular value?

For simple ADE singularities, the Coxeter transformation describes the monodromy action on the vanishing-cycle lattice. Its eigenvalues are

```text
exp(2πi m/h),
```

where `m` runs through the exponents and `h` is the Coxeter number.

For `E₈`, use the same eight exponents listed above.

Possible mappings:

- phase offset of each intersection-resonance mode;
- position around a stereo or multichannel circle;
- rhythmic onset within a period of length `h`;
- rotation of a complex waveform while the Milnor-fibre parameter circles zero.

This system belongs naturally to a smoothing/Milnor-fibre film, not to the blowup sequence alone. It can connect the deformation film to the resolution film without claiming they are the same operation.

## 4. Laplace-spectrum strike: Madore's second method

For a compact Lie group and dominant weight `v`, use

```text
C(v)=<v,v+2ρ>
```

and frequency proportional to `sqrt(C(v))`. The multiplicity on the group is `N(v)²`, where `N(v)` is the representation dimension.

This produces the sound of the associated compact Lie group under a spectral model. It is useful as another ADE-side comparison:

```text
E₈ surface singularity
E₈ exceptional intersection lattice
E₈ Dynkin diagram
E₈ compact Lie group spectrum
```

These share structure but are not interchangeable objects.

## 5. Resolution event grammar

The intersection-resonance model supplies sustained sound. A sparse event layer can expose the algebraic steps.

| event | proposed sound |
| --- | --- |
| choose blowup centre | dry short marker |
| open a chart | spatial split into left/right/centre variants |
| chart is regular | quiet resolved click |
| residual singular point found | unresolved beating pair |
| new exceptional curve | new oscillator enters |
| new intersection verified | coupling becomes audible |
| self-intersection changes | brief pitch glide to recomputed spectrum |
| final matrix equals `−C_ADE` | stable full chord |
| contraction | voices merge into a single impulse |

This table is an interface proposal, not a theorem. Every event should still have a visual and textual explanation.

## 6. A practical layered soundtrack

### Layer A — proof cues

Quiet, short sounds tied to chart and regularity checks.

### Layer B — exceptional-fibre resonance

Continuous sound from the current `−Q` matrix.

### Layer C — ADE identity

Optional Madore-style character timbre for the current named singularity.

### Layer D — monodromy

Optional phase or surround motion during a loop around the smoothing parameter.

The default should use only A and B. C and D are comparison modes.

## 7. Data versus artistic choices

Keep a visible ledger.

### Mathematical data

- intersection matrix;
- Cartan eigenvalues;
- Coxeter number and exponents;
- representation weights and multiplicities;
- Casimir eigenvalues;
- Laplace multiplicities;
- monodromy eigenvalues.

### Production choices

- overall pitch scale;
- amplitudes;
- phase convention;
- damping;
- waveform shape;
- dynamic-range compression;
- stereo placement;
- transition length.

The repository should preserve these separately so a pleasing mix cannot silently replace the mathematical source.

## 8. First audio experiment

Before rendering `E₈`, make a three-stage comparison from exact matrices:

```text
A₁ Cartan matrix
D₄ Cartan matrix
E₈ Cartan matrix
```

For each:

1. display the graph and matrix;
2. compute its eigenvalues;
3. use their square roots as modal frequencies;
4. strike one endpoint vertex and then all vertices equally;
5. use the same pitch normalization and damping across all three.

This will test whether the branching and increasing rank create an audible distinction before any arbitrary orchestration is added.