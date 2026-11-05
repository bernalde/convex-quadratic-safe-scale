# Clipped sufficient scales for convex quadratic cuts

**Submission candidate; preserved historical mechanical verification; hosted preflight pending.**

A clipped sufficient scale for convex C² quadratic cuts. Global ambient convexity and C² regularity are required. The anchor need not lie in B. The scale is not claimed maximal, positive or computable.

## Precise mathematical scope

For globally convex C² real-valued f on the full joint real coordinate space, arbitrary anchor a and retained set B, the explicit sufficient scale is min(1,2*infimum of the positive-curvature ratio range), or 1 when that domain is empty. It lies in [0,1]; all nonnegative coefficients below it give tangent <= cut <= f and cut <= unit-scale Taylor cut on B. Derivatives are actual first/nested Frechet derivatives. B may retain domain/integer restrictions; a need not belong to B. Empty B and zero curvature are retained. No maximal/necessary/strictly-positive/computable scale, strict dominance, algorithmic return, master attainment, solver or performance claim is included.

The human-auditable definitions and exact advertised types are in Challenge.lean.
Its intentional statement placeholders are never imported by Solution.lean.
Solution uses the full copied source proof development. Only exported wrapper
names are new; mathematical definitions/hypotheses/conclusions are preserved.
The source files retain their original names so their provenance can be checked.

The prior accepted scientific review and Lean 4.35 migration evidence are reused
at their exact scopes; this is packaging, not a new theorem or external review.
The original thesis and source article are bibliographic sources, not included
assets. Dependencies retain their own licences. The owner selected Apache-2.0 for project-owned proof code, tools and software
documentation on 3 November 2026. This supersedes the earlier pending-licence
status; see LICENSE and the scoped NOTICE.md. Dependencies keep their own terms.

## Reproduction

Use Lean 4.35.0, the committed Mathlib dependency manifest, Python 3 and bubblewrap.

```sh
MATHLIB_NO_CACHE_ON_UPDATE=1 lake update
lake exe cache get
python3 scripts/verify.py --evidence-dir .lake/verification-01
```

Use a new evidence directory each time. The script builds both environments,
prints each Solution theorem's transitive axioms, and runs the real sandboxed
Comparator with the selected toolchain's bundled Lean, NanoDa and con-ron.
It does not disable sandboxing or put machine-specific kernel paths into the
submitted comparator.json. Matching upstream objects may be reused locally and
are disclosed in the preparation receipts; they are never exported.

The unchanged VERIFICATION.json preserves the earlier successful mechanical
checks and exact proof-input hashes. Its historical licence-pending and release
fields describe that earlier issuance and are superseded by this metadata refresh.
The refreshed source-type vocabulary and Apache-2.0 metadata require current
policy/schema and release checks before hosted preflight. No new build, hosted
Palomar verdict or registration is claimed. See PREPARATION.md and
RELEASE-STATUS.md.
