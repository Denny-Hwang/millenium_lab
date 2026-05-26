# Prompt — record of the standard prompt used

This file preserves the ID and input variables of the standard prompt
used in this attempt, plus a copy of the exact prompt sent to the
model. The prompt library lives at
[`../../prompts/_INDEX.md`](../../prompts/_INDEX.md).

---

## Standard prompt used

- Prompt ID: `P02-bridge-discovery`
- Variant: `none`
- Input variables:
  - `${DOMAIN_A}`: `computational-fluid-dynamics`
  - `${DOMAIN_B}`: `nonlinear-pde`
  - `${PROBLEM_IDS}`: `[05-navier-stokes]`
  - `${CONTEXT_TRIGGER}`: A001 P01 panel C3 finding (continuum vs
    discretized framing — CFD numerical "no observed blowup" vs
    PDE asymptotic question — real conflict at different epistemic
    standards). The bridge should formalize the
    sub-Kolmogorov-scale-to-continuum question.

## Prerequisite-reading files

- `bridges/_INDEX.md`
- `bridges/_TEMPLATE.md`
- `docs/methodology/proof-pipeline.md`
- `docs/problems/05-navier-stokes/README.md`
- `docs/problems/05-navier-stokes/known-results.md` §9 (numerical
  evidence)
- `attempts/05-navier-stokes/A001-...result.md` §C3
- `bridges/B-003-critical-norm-equivalence-along-flow.md` (companion
  bridge from A003)

## Final prompt copy

```text
You are tasked with discovering and evaluating a possible bridge
between computational-fluid-dynamics and nonlinear-pde.

Context: A001 (P01 panel) surfaced C3 — CFD numerical "no observed
blowup" at high Reynolds vs the PDE asymptotic question. Different
epistemic standards: CFD evidence does not lift to a continuum
bound; PDE cannot reproduce CFD intuition rigorously.

Candidate target problems: [05-navier-stokes].

Follow P02 procedure (per prompts/P02-bridge-discovery.md):
  §1 — Five candidate shared objects.
  §2 — Maturity for each (established / emerging / speculative /
       ai-discovered).
  §3 — Strongest candidate + 1-3 transformations contributing to
       05-navier-stokes.
  §4 — One false-bridge possibility.
  §5 — Populate the six sections of bridges/_TEMPLATE.md.

Be honest. The continuum-limit gap is well-known to be hard. The
bridge's value may turn out to be its delineation of the gap
rather than a positive theorem.
```
