# Prompt — record of the standard prompt used

This file preserves the ID and input variables of the standard prompt
used in this attempt, plus a copy of the exact prompt sent to the
model. The prompt library lives at
[`../../prompts/_INDEX.md`](../../prompts/_INDEX.md).

---

## Standard prompt used

- Prompt ID: `P03-lemma-extraction`
- Variant: `minor (reason: used to state a single new lemma —
  GCT-L02, the arithmetic-circuit moduli of the (R2) route — and to
  immediately test whether it captures AC⁰-membership at the
  smallest case, rather than to decompose an existing natural-language
  proof. Output template restricted to §1 (lemma statement), §2
  (small-case test), §5 (new gaps).)`
- Input variables:
  - `${ATTEMPT_PATH}`:
    `attempts/03-p-vs-np/A009-2026-05-21-claude-opus-4-7/` (the
    pivot decision and (R2) scope).
  - `${PROBLEM_ID}`: `03-p-vs-np`
  - `${PROOF_TEXT}`: A009 §5 (R2 pivot scope) — replace L02 v2 with
    an arithmetic-circuit moduli; reformulate AC⁰-membership as a
    closed-subscheme / representation-theoretic obstruction.

## Prerequisite-reading files

- `attempts/03-p-vs-np/A009-2026-05-21-claude-opus-4-7/result.md`
  ((R2) pivot scope; G018).
- `attempts/03-p-vs-np/A006-2026-05-20-claude-opus-4-7/result.md`
  (DAG topologies; Plücker equations; the Boolean-rigidity finding
  the (R2) route is meant to escape).
- `conjectures/C-001-boolean-rigidity-sheaf-obstruction/statement.md`
  (the obstruction (R2) is meant to sidestep).
- `bridges/B-001-gct-homological-circuit.md` (the load-bearing
  bridge for (R2)).
- `docs/primer/field-primers/03-p-vs-np.md` (VP / VNP / GCT
  vocabulary).

## Final prompt copy

```text
Begin the (R2) GCT route per A009's pivot. State GCT-L02 — the
arithmetic-circuit moduli replacing the Boolean L02 v2 — at the
smallest case (n, s, d) = (2, 3, 2).

  §1 — State GCT-L02: the moduli of arithmetic circuits (gates +, x,
       with Q-scalars) of size <= s, depth <= d on n inputs; the
       eval morphism to the space of polynomials; the AC^0-Boolean
       functions as the Boolean points of the eval image.

  §2 — Test at (2, 3, 2): does arithmetic-circuit realizability of
       the multilinear polynomial representing f track Boolean
       AC^0-membership of f? Use XOR as the witness (Boolean-AC^0-hard
       at (3,2) per A007).

  §5 — New gaps. In particular, check whether the (R2) route escapes
       Boolean rigidity (C-001) only to face a different obstacle.

Be honest. If the arithmetic complexity of f does not track its
Boolean AC^0 complexity, say so plainly and record it as a new
lethal-grade gap.

Hold to the verification bar: L1 + L2 at best.
```
