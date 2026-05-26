# Prompt — record of the standard prompt used

This file preserves the ID and input variables of the standard prompt
used in this attempt, plus a copy of the exact prompt sent to the
model. The prompt library lives at
[`../../prompts/_INDEX.md`](../../prompts/_INDEX.md).

---

## Standard prompt used

- Prompt ID: `P03-lemma-extraction`
- Variant: `minor (reason: not extracting lemmas from an existing
  proof, but extracting a *structured catalog* — the critical-norm
  ladder for NSE — as the dependency-graph backbone for future
  technical attempts. Output template restricted to §1 (catalog),
  §4 (delta against A001's panel finding C1), §5 (open
  inequalities).)`
- Input variables:
  - `${ATTEMPT_PATH}`:
    `attempts/05-navier-stokes/A001-2026-05-26-claude-opus-4-7/`
    (the panel that surfaced the non-equivalence of candidate Φ).
  - `${PROBLEM_ID}`: `05-navier-stokes`
  - `${PROOF_TEXT}`: A001's C1 finding + the critical-norm
    discussion in
    `docs/problems/05-navier-stokes/equivalent-forms.md` §3.

## Prerequisite-reading files

- `attempts/05-navier-stokes/A001-2026-05-26-claude-opus-4-7/result.md`
  (P01 panel; C1; weakened reformulation).
- `docs/problems/05-navier-stokes/statement.md` (CMI statement).
- `docs/problems/05-navier-stokes/equivalent-forms.md` §3
  (critical-norm ladder).
- `docs/problems/05-navier-stokes/known-results.md` §4 (critical
  norms — Koch–Tataru, ESS).
- `docs/primer/field-primers/05-navier-stokes.md` (vocabulary).

## Final prompt copy

```text
A001 surfaced C1: the candidate critical functionals across the
five consilient fields are NOT equivalent norms; the strict "single
Φ" hypothesis fails. A weakened version survives:

  "Global regularity of 3D NSE is decided by SOME element of an
   ordered family of critical functionals; identify the family
   and the open inequalities."

Catalog the critical-norm ladder for 3D NSE:

  §1 — Enumerate critical norms in the strict-inclusion order, with
       precise definitions and the known best implication
       theorems each yields.

  §4 — State the delta against A001's C1: where exactly does the
       ladder structure refine the panel's qualitative finding?

  §5 — Identify the open one-sided embedding inequalities — for
       which pairs (X, Y) in the ladder is "smooth flow bounded in
       X implies bounded in Y" open, and which are known?

Be honest. The goal is a CLEAN map of the field, not a proof.
Mark every open question with a follow-up. The output is the
"dependency-graph backbone" for future technical attempts.

Hold to the verification bar: L1 at best.
```
