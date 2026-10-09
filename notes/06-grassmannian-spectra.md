# David A. Madore: *The sound of some grassmannians*

## Verified video

- Author: **David A. Madore**.
- Title: *The sound of some grassmannians*.
- Video: https://www.youtube.com/watch?v=lDPaVD-ZrcQ
- Author's YouTube channel (from the video's YouTube oEmbed metadata): https://www.youtube.com/@davidamadore/videos
- Further discussion linked in the video description: https://twitter.com/gro_tsen/status/1164864635163545601

The description states that Madore converted **vibrational mode spectra** into sound for several compact Riemannian symmetric spaces:

- real Grassmannians;
- complex Grassmannians;
- quaternionic Grassmannians;
- the octonionic projective plane (the Cayley plane).

The linked social-media discussion has **not** yet been read or checked line by line. In particular, the video's description does not disclose every synthesis parameter. Do not present the proposed reconstruction below as Madore's confirmed implementation.

## Which of Madore's three sound experiments is this?

This link identifies a **third, distinct** experiment, rather than the 2017 character-waveform experiment or the 2018 struck-compact-Lie-group experiment documented in [03-david-madore.md](03-david-madore.md).

| Project | Mathematical input | Output |
| --- | --- | --- |
| Lie-group character sounds (2017) | Principal-`SU(2)` restriction of characters, weight multiplicities | Integer/half-integer harmonic amplitudes |
| Struck compact Lie groups (2018) | Laplacian/Casimir spectrum of the **group** | Damped resonant spectrum |
| Sound of some Grassmannians (video supplied by user) | Vibrational spectra of **compact symmetric spaces** `G/K` | Audible comparison of homogeneous manifolds |

A Grassmannian is not the same as the compact group acting on it. The change from `G` to `G/K` changes which irreducible representations contribute and with what multiplicities.

## Mathematical reconstruction worth testing

For a compact Riemannian symmetric space `M = G/K`, the positive Laplace–Beltrami operator has a discrete spectrum:

```text
−Δ φ_j = λ_j φ_j,     λ_j ≥ 0.
```

If we model a vibrating space with the wave equation, each mode has angular frequency proportional to the square root of its eigenvalue:

```text
ω_j = c sqrt(λ_j).
```

A possible synthesized sound is then

```text
s(t) = Σ_j A_j exp(−γ_j t) sin(ω_j t + θ_j).
```

**Important:** This formula is a reasonable candidate for reproducing the idea, **not** a verified transcription of Madore's actual algorithm. The metric scale, normalization, amplitude, damping, phase, and cutoff need checking.

Representation theory makes the spectral calculation tractable. A schematic decomposition is

```text
L²(G/K) ≅ ⊕_V V ⊗ (V* )^K
```

over suitable irreducible `G`-representations `V`. The contributing representations must contain `K`-fixed vectors, and Laplace eigenvalues arise from corresponding Casimir values. For a compact symmetric pair the spherical representation generally has a one-dimensional `K`-fixed subspace. An eigenspace can therefore have dimension `dim(V)` (or the sum of such dimensions when Casimir eigenvalues coincide), unlike the `dim(V)²` multiplicity of a matrix coefficient on `G` itself.

The `λ=0` constant mode is not an audible oscillation and should be handled separately.

## Exact implementation questions still open

1. What invariant Riemannian metric and overall frequency normalization did Madore choose for each space?
2. Did he take square roots of eigenvalues as wave frequencies, as in the conventional wave equation?
3. Which irreducible spherical representations and eigenvalue cutoffs did he include?
4. How did eigenvalue multiplicities affect mode amplitudes?
5. What excitation, damping, amplitude normalization, mixing, and fade settings did he use?
6. Is original source code or an explicit coefficient table published separately from the video and its linked thread?

Answers should come from the author's explanation or code, not guesses made from the sound.

## Uses and limitations for these repositories

- **`resolution`**: soundtrack comparison between spaces and structures involved in ADE, but this does **not** sonify a blowup, and a Grassmannian spectrum is not an exceptional intersection matrix.
- **`Fourier-voice` / audio experiments**: spectral additive synthesis where pitch ratios are derived from precise eigenvalues; musical treatment stays an explicitly separate layer.
- **Higher-dimensional geometry viewers**: Grassmannians are spaces of subspaces, so they are useful testbeds for displaying a selected plane, moving it under group action, and projecting higher-dimensional geometry.
- **`resolution` source atlas**: keep the sonification, the cubic-surface deformation films, and actual birational resolutions as three separately labeled mathematical operations.

## Wider visual/source index

Madore's primary software catalog (https://www.madore.org/~david/programs/programs.html) also documents code for projections of four-dimensional regular polytopes, sphere/hyperbolic-plane projections, Kerr visualizations, `E₈` root-system visuals, and Mandelbrot zooms. These are useful adjacent references, but this note does not pretend to be an exhaustive inventory of his YouTube channel.

His earlier **54-film Cubic Surfaces DVD**, its primary descriptions and public-domain source, are at http://www.madore.org/cubic-dvd/. Its films chiefly show deformations and rotations of cubic surfaces, **not** maps resolving singularities. Madore requests credit when his source or films are reused.

**Credit:** David A. Madore for the cited video, sound experiments, source code, and visual work.
