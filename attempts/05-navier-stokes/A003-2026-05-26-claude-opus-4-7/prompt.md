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
  - `${DOMAIN_A}`: `harmonic-analysis`
  - `${DOMAIN_B}`: `nonlinear-pde`
  - `${PROBLEM_IDS}`: `[05-navier-stokes]`
  - `${CONTEXT_TRIGGER}`: A001 P01 panel C1 finding (candidate
    critical Φ's across fields are not equivalent norms) and
    A002's refinement (the candidates form a strict-inclusion
    chain; the question is which step admits a large-data
    along-flow bound).

## Prerequisite-reading files

- `bridges/_INDEX.md`
- `bridges/_TEMPLATE.md`
- `docs/methodology/proof-pipeline.md`
- `docs/problems/05-navier-stokes/README.md`
- `docs/problems/05-navier-stokes/known-results.md`
- `attempts/05-navier-stokes/A001-...result.md`
- `attempts/05-navier-stokes/A002-...result.md`

## Final prompt copy

```text
You are tasked with discovering and evaluating a possible bridge
between harmonic-analysis and nonlinear-pde.

Context: A001 (P01 panel) surfaced C1 — candidate critical Φ's
across the five consilient fields are not equivalent norms. A002
(P03 ladder catalog) refined this to: the candidates form a
strict-inclusion chain Ḣ^{1/2} ⊂ L^3 ⊂ ... ⊂ Ḃ^{-1}_{∞,∞}; the
operational question is which step admits a large-data L^∞_t bound
along smooth NSE flows.

Candidate target problems: [05-navier-stokes].

Follow P02 procedure:
  1. List five candidate shared objects.
  2. Label maturity (established / emerging / speculative /
     ai-discovered).
  3. Pick the strongest candidate; propose 1-3 transformations
     contributing to 05-navier-stokes.
  4. Provide one false-bridge possibility.
  5. Populate the six sections of bridges/_TEMPLATE.md.
```
