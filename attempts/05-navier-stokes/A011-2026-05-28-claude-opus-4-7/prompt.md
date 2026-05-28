# Prompt — record of the standard prompt used

This file preserves the ID and input variables of the standard prompt
used in this attempt, plus a copy of the exact prompt sent to the
model. The prompt library lives at
[`../../prompts/_INDEX.md`](../../prompts/_INDEX.md).

---

## Standard prompt used

- Prompt ID: `P03-lemma-extraction`
- Variant: `minor (reason: not extracting lemmas from an existing
  proof. Repurposed for conjecture-from-attempts synthesis:
  consolidate the gap labels (G_T1b_1, G_T1b_3, G_T1b_4) + A010's
  global-vs-local structural finding into a unified conjecture
  statement following the C-001 / C-002 precedents. Output
  restricted to §1 (synthesis), §4 (delta against A005-A010's
  individual gap labels), §5 (registration metadata for the new
  C-### file).)`
- Input variables:
  - `${ATTEMPT_PATH}`: A005–A010 (the full (α) arc).
  - `${PROBLEM_ID}`: `05-navier-stokes`
  - `${PROOF_TEXT}`: the cross-approach finding from A009 (direct
    degeneration) and A010 (paraproduct-hybrid non-existence +
    literature audit) — to be unified into C-003.

## Prerequisite-reading files

- `attempts/05-navier-stokes/A005-...result.md` (commitment).
- `attempts/05-navier-stokes/A007-...result.md` (T1b
  decomposition; G_T1b_1).
- `attempts/05-navier-stokes/A009-...result.md` (direct
  approaches degenerate; G_T1b_3 / G_T1b_4).
- `attempts/05-navier-stokes/A010-...result.md` (paraproduct
  hybrid non-existence; intrinsic-wall structural finding).
- `conjectures/C-001-boolean-rigidity-sheaf-obstruction/statement.md`
  (precedent: how a negative finding is registered as a
  conjecture).
- `conjectures/C-002-discrete-continuous-wall/statement.md`
  (precedent: how a route-independent wall is stated).

## Final prompt copy

```text
Per A010 follow-up §1, register the (α)-arc's distilled negative
finding as conjecture C-003.

Inputs to unify into the C-003 statement:
  - G_T1b_1 (A007): unique bottleneck of T1b's Duhamel decomposition
    is auxiliary L^q control.
  - G_T1b_3 (A009): direct L^p energy method on u relocates G_T1b_1
    to L^∞_t L^∞_x control — equivalent in difficulty.
  - G_T1b_4 (A009): vorticity L^p method relocates to
    vorticity-direction Lipschitz — equivalent in difficulty.
  - A010 structural finding: ∇·u = 0 cancellation is global in
    frequency; BMO^{-1} → L^q requires local-per-frequency-block
    estimates; the two are structurally incompatible across
    the surveyed proof family (energy, vorticity, paraproduct,
    literature).

Output:

  §1 — C-003 statement: a unified meta-conjecture asserting no
       proof exists that simultaneously (a) passes Tao-barrier
       audit and (b) reduces to LP/Bony-local estimates.

  §4 — Delta against A005-A010 individual gap labels: C-003
       absorbs G_T1b_1, G_T1b_3, G_T1b_4 into a single
       route-independent statement, analogous to C-002 absorbing
       C-001 for the dormant program.

  §5 — Registration metadata: parent_problem 05-navier-stokes,
       parent_attempt A011, numerical_evidence_status partial,
       lean_status none, references list.

Hold to the verification bar: L1 at best.
```
