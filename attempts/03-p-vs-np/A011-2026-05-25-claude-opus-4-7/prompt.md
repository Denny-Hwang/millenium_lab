# Prompt — record of the standard prompt used

This file preserves the ID and input variables of the standard prompt
used in this attempt, plus a copy of the exact prompt sent to the
model. The prompt library lives at
[`../../prompts/_INDEX.md`](../../prompts/_INDEX.md).

---

## Standard prompt used

- Prompt ID: `P03-lemma-extraction`
- Variant: `minor (reason: states a single candidate lemma — the
  monotone-arithmetic moduli proposed as idea (ii) in A010 — and
  tests at the smallest case whether it escapes both C-001
  (rigidity) and G019 (Boolean-vs-arithmetic gap). Output template
  restricted to §1 (statement), §2 (small-case test), §5 (verdict
  + new gaps).)`
- Input variables:
  - `${ATTEMPT_PATH}`:
    `attempts/03-p-vs-np/A010-2026-05-25-claude-opus-4-7/` (the
    (R2) finding and idea (ii)).
  - `${PROBLEM_ID}`: `03-p-vs-np`
  - `${PROOF_TEXT}`: A010 §4 idea (ii) — restrict the arithmetic
    moduli to monotone circuits, which are more closely tied to
    Boolean complexity (Jerrum–Snir 1982; Valiant).

## Prerequisite-reading files

- `attempts/03-p-vs-np/A010-2026-05-25-claude-opus-4-7/result.md`
  (GCT-L02; G019; idea (ii)).
- `conjectures/C-001-boolean-rigidity-sheaf-obstruction/statement.md`
  (the rigidity obstruction).
- `attempts/03-p-vs-np/A006-2026-05-20-claude-opus-4-7/result.md`
  (Boolean rigidity; XOR not in AC⁰_{(3,2)}).
- `docs/primer/field-primers/03-p-vs-np.md` (monotone circuits /
  VP-VNP vocabulary).

## Final prompt copy

```text
A010 identified the monotone-arithmetic moduli (idea (ii)) as the
only candidate route that might escape BOTH C-001 (Boolean rigidity)
and G019 (Boolean-vs-arithmetic gap). Test it.

  §1 — State the monotone-arithmetic moduli (gates +, x with
       NON-NEGATIVE scalar weights only; no subtraction / no
       cancellation).

  §2 — Test at (n, s, d) = (2, 3, 2) whether monotone-arithmetic
       realizability tracks AC^0-membership / monotone Boolean
       complexity. Use XOR, OR, AND as witnesses. Check the
       representation question (multilinear-over-Q vs Boolean
       semiring vs continuous semiring).

  §5 — Verdict: does the monotone route escape the C-001/G019 dual
       obstruction, or reproduce it? New gaps.

Be honest. If the dilemma reproduces at the monotone level, say so
and assess whether the dilemma is route-independent.

Hold to the verification bar: L1 + L2 at best.
```
