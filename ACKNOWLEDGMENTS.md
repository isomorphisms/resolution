# Acknowledgments and source provenance

## Special thanks to David A. Madore

**Thank you, David A. Madore**, for making difficult geometry possible to *see*, and for publishing both the mathematics and the means of producing the pictures.

Madore's **[The Cubic Surfaces DVD](http://www.madore.org/cubic-dvd/)** (2006) is an unusually generous piece of mathematical work: **54 short, reproducible animations** of smooth and singular cubic surfaces, including controlled deformations among `A_n`, `D_n`, and `E_6` singularities, the Cayley cubic, and nonisolated singular loci. Rather than simply releasing attractive pictures, Madore explained the rendering conventions and **made the POV-Ray source code available**. The original DVD, source, and associated material were explicitly placed **in the public domain**, with a request that subsequent users acknowledge him.

That combination—mathematical care, clearly controlled visualization, documented methods, public source, and permission to reuse—provides a foundation for what this repository is trying to learn to show. In particular, his *fixed lights*, *fixed clipping sphere*, *repeatable short loops*, and *precisely located singular members of a family* are examples of visual discipline worth preserving. The project's goal of showing an actual **birational resolution**, its charts and exceptional curves, goes beyond his deformation films; we do **not** claim that Madore made those resolution animations.

**Madore deserves explicit credit in any source, still image, animation, documentation, or demonstration that actually reuses his work.** Giving something to the public domain does not erase who created it. We are grateful that he published the underlying code, and that he did so in a form that other people can study, reproduce, and extend.

### Direct links

- **Original work and downloadable source:** David A. Madore, *[The Cubic Surfaces DVD](http://www.madore.org/cubic-dvd/)* (2006). This is the authoritative page for the original films, explanations, public-domain statement, and POV-Ray source tarball.
- **[Madore's YouTube Cubic surfaces playlist](https://www.youtube.com/playlist?list=PL1AE045877D932E6A)** — 32 catalogued entries from the 54-film DVD project.
- **[Our complete 32-video catalog](notes/08-cubic-surfaces-youtube-playlist.md)** — titles, links, mathematical connections, and limitations of the comparison.
- **[Detailed technical notes on Madore's work](notes/03-david-madore.md)** — singularity films and related mathematical sound experiments.
- **[Madore's broader mathematical video work](notes/07-david-madore-youtube-channel-map.md)** — further geometric and sonification experiments, each with its own attribution and reuse status.

### Citation for reuse

> David A. Madore, *The Cubic Surfaces DVD* (2006), http://www.madore.org/cubic-dvd/. Original films and POV-Ray source code released into the public domain by their author.

When using a particular animation, cite its exact [playlist entry](notes/08-cubic-surfaces-youtube-playlist.md) too.

### File-level credit in future rendering source

**Current status:** this repository contains notes and proposed rendering methods; it does **not** yet contain imported Madore POV-Ray source. Do not assert that existing code was copied from him when it was not.

When source code is added, place a comment near the beginning of **every file directly adapted from Madore's published source**, not merely a generic project-wide acknowledgment. Adapt this comment to the programming language and fill in the specific provenance:

```c
/*
 * David A. Madore — The Cubic Surfaces DVD (2006)
 * Original project, animations, and POV-Ray source:
 *   http://www.madore.org/cubic-dvd/
 * Related YouTube playlist:
 *   https://www.youtube.com/playlist?list=PL1AE045877D932E6A
 *
 * Credit: David A. Madore created the original mathematical animations
 * and released the DVD and its source into the public domain.
 *
 * Relationship to original: [inspired by / adapted from]
 * Original file(s): [exact filenames or links, if adapted]
 * Our changes: [brief summary of changes, if adapted]
 *
 * This comment credits the original work; it does not claim that
 * Madore authored or endorsed this repository's extensions.
 */
```

For files that merely take inspiration from the *presentation*, say **“inspired by”**. Reserve **“adapted from”** for code or content actually derived from his published source, with precise file references.

The public-domain statement on the *Cubic Surfaces DVD* must **not** be assumed to apply automatically to unrelated work elsewhere on Madore's website or YouTube channel. Check each source's reuse terms separately.

## Other foundational sources

This project's [source ledger](sources/README.md) and [main README](README.md) also credit Patrick du Val, David Eisenbud, Miles Reid, Richard E. Borcherds, and the other mathematicians whose results and exposition make the proposed resolution animations possible. The special acknowledgment above recognizes Madore's particular contribution to their **visual and reproducible** side; it does not claim the underlying ADE and resolution mathematics as his invention.
