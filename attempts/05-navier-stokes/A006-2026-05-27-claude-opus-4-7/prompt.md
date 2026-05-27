# Prompt — record of the standard prompt used

This file preserves the ID and input variables of the standard prompt
used in this attempt, plus a copy of the exact prompt sent to the
model. The prompt library lives at
[`../../prompts/_INDEX.md`](../../prompts/_INDEX.md).

---

## Standard prompt used

- Prompt ID: `P03-lemma-extraction`
- Variant: `none`
- Input variables:
  - `${ATTEMPT_PATH}`:
    `attempts/05-navier-stokes/A005-2026-05-26-claude-opus-4-7/`
    (the (α) commitment and T1 sub-goal decomposition).
  - `${PROBLEM_ID}`: `05-navier-stokes`
  - `${PROOF_TEXT}`: T1a as stated in A005 §2 — for small enough
    $u_0$ in $\mathrm{BMO}^{-1}$, the Koch–Tataru global mild
    solution lies in $L^\infty_t L^3$.

## Prerequisite-reading files

- `attempts/05-navier-stokes/A005-...result.md` (T1a statement
  and the program's commitment).
- `bridges/B-003-critical-norm-equivalence-along-flow.md` §2 (Koch–
  Tataru 2001; small-data global mild solution structure) and §3
  (stuck points).
- `docs/problems/05-navier-stokes/equivalent-forms.md` §3
  (critical-norm ladder).
- `docs/problems/05-navier-stokes/known-results.md` §4 (critical
  norms: Koch–Tataru and Kato endpoint comparisons).
- `docs/problems/05-navier-stokes/verification-bar.md` §2 (NSE-
  specific L1 audit — regularity / solution class / scaling
  discipline).
- `docs/problems/05-navier-stokes/statement.md` §"Conventions"
  (CMI initial-data class; smooth, decaying).

## Final prompt copy

```text
First technical attempt under the (α) direction commitment from
A005. Target: T1a (small-data BMO^{-1} → L^3 along-flow).

T1a (A005 §2 statement). For u_0 sufficiently small in BMO^{-1},
the Koch-Tataru 2001 global mild solution lies in L^∞_t L^3.

Apply P03 lemma extraction:

  §1 — Decompose T1a into smaller lemmas. State each precisely
       with its solution class.

  §2 — For each lemma, classify difficulty (low / medium / high)
       and identify dependencies.

  §3 — Identify gaps. Use the G### labeling convention from the
       dormant 03-p-vs-np program. Mark severity (minor / major /
       lethal-if-unresolved).

  §4 — Delta against A005's T1a. Specifically: is T1a, restricted
       to the CMI initial-data class (smooth, decaying), trivial
       (Kato 1964 + uniqueness gives an immediate proof) or
       substantive?

  §5 — Verification-bar pre-audit (statement.md §"What does NOT
       count": numerical-only evidence; surrogate-model reductions;
       conditional theorems). T1a is a conditional theorem; the
       audit must explicitly state how T1a contributes to (A)
       even though it does not by itself resolve (A).

Be honest about which sub-lemmas are routine and which are
non-trivial inside CMI scope. If T1a is trivially true inside CMI
(small-data BMO^{-1} small in L^3 too, by embedding + Kato), say
so plainly — that is itself a useful structural observation that
shifts the program's work to T1b.

Hold to the verification bar: L1 at best.
```
