# Prompt — record of the standard prompt used

This file preserves the ID and input variables of the standard prompt
used in this attempt, plus a copy of the exact prompt sent to the
model. The prompt library lives at
[`../../prompts/_INDEX.md`](../../prompts/_INDEX.md).

---

## Standard prompt used

- Prompt ID: `P03-lemma-extraction`
- Variant: `minor (reason: as in A005, repurposed for STRATEGIC
  sub-goal decomposition — here, evaluating three pivot options
  given C-003. Output template: §1 (pivot selection with
  reasoning), §2 (new mini-trigger window for A013+), §5
  (verification-bar pre-audit on the chosen pivot).)`
- Input variables:
  - `${ATTEMPT_PATH}`: A005 (commitment + trigger), A011 (C-003
    registration), A010 (paraproduct wall).
  - `${PROBLEM_ID}`: `05-navier-stokes`
  - `${PROOF_TEXT}`: C-003 statement; A010 §5 pivot options
    list.

## Prerequisite-reading files

- `attempts/05-navier-stokes/A005-...result.md` (3-pivot ladder).
- `attempts/05-navier-stokes/A010-...result.md` (intrinsic wall;
  Pivot 1 = B-004+T2 most plausible).
- `attempts/05-navier-stokes/A011-...result.md` (C-003 +
  follow-ups).
- `conjectures/C-003-...statement.md` (the wall to escape).
- `bridges/B-003-...md` (current load-bearing; walled).
- `bridges/B-004-...md` (candidate next route).

## Final prompt copy

```text
Final attempt of A005's 7-attempt budget. C-003 (A011) registers
the (α) route's intrinsic wall: no proof in the surveyed
direct-PDE family satisfies both Tao-barrier + LP/Bony locality.

Per A005's pivot ladder:
  Pivot 1: route change within (α) → B-004 + T2 (sub-Kolmogorov
           / CFD-PDE bridge; structurally orthogonal to direct
           PDE).
  Pivot 2: switch to (β) blowup → B-004 / T3 (Hou-Luo Type-II).
  Pivot 3: dormancy recommendation (user-approval-required).

Decide:
  §1 — Select one pivot with explicit reasoning. Use C-003 to
       check whether the selected pivot is C-003-orthogonal
       (escapes the wall) or C-003-blocked.

  §2 — Set up the new mini-trigger window for A013+. Concrete
       falsifiability conditions analogous to A005's (3-attempt
       window with explicit pass/fail criteria).

  §5 — Verification-bar pre-audit on the chosen pivot per
       docs/problems/05-navier-stokes/verification-bar.md §7.

Apply the 03-p-vs-np precedent: this is the analog of when the
dormant program needed to make its (R1)→(R2) pivot at A009. The
selected option here is the analog of (R2) for 05-NS.

Hold to the verification bar: L1 at best.
```
