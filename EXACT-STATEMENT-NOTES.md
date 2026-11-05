# Exact independent statement compatibility

Challenge exposes the original derivative, quadratic cut, positive-curvature
ratio range and clipped scale definitions with Mathlib-only imports. Solution
imports the full unchanged source proofs and never imports Challenge.

The pinned Comparator compares transitive constants syntactically, including
compiler-generated numeral witnesses. Because the cut and scale originally
came from separate modules, an inline Challenge needs the scale witness's exact
name, raw natural literal and existing Mathlib witness term. This is spelled
out in Challenge; it changes no mathematical definition or hypothesis. The
actual final Comparator and all three bundled kernels pass. Earlier local
compatibility failures are retained outside this source-only export; they were
packaging failures, not mathematical disproofs. The accepted proof modules remain
byte-identical to their qualified sources.
