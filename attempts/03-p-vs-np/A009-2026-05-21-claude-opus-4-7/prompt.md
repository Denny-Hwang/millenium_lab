# Prompt — record of the standard prompt used

This file preserves the ID and input variables of the standard prompt
used in this attempt, plus a copy of the exact prompt sent to the
model. The prompt library lives at
[`../../prompts/_INDEX.md`](../../prompts/_INDEX.md).

---

## Standard prompt used

- Prompt ID: `P08-conjecture-validation`
- Variant: `minor (reason: third consecutive use of P08 as a
  structural test in the L02 v2 / F_{AC^0} construction series.
  Output template: §1 (test scope), §2 (computation), §3
  (verdict relative to the A007 / A008 trigger criterion).)`
- Input variables:
  - `${PROBLEM_ID}`: `03-p-vs-np`
  - `${CONJECTURE_TEXT}`: A008's sharpened criterion — does an
    $\mathrm{Ext}^2$-based construction at T3 produce a coherent-
    sheaf cohomology class discriminating $f$ with the *correct
    biconditional direction* (A002 L05: $[F]_f \neq 0 \iff f \notin
    \mathrm{AC}^0$)?
  - `${PARAMETER_SCOPE}`: $(n, s, d) = (2, 3, 2)$, T3 both fan-in-1
    ambient $\mathbb{P}^1 \times \mathbb{P}^1$.

## Prerequisite-reading files

- `attempts/03-p-vs-np/A002-2026-04-29-claude-opus-4-7/result.md`
  (L02, L05 statements; biconditional direction).
- `attempts/03-p-vs-np/A007-2026-05-20-claude-opus-4-7/result.md`
  ((R1) commitment + abandonment trigger).
- `attempts/03-p-vs-np/A008-2026-05-21-claude-opus-4-7/result.md`
  (sharpened trigger criterion: $\mathrm{Ext}^2$ test is the
  trigger-decisive test).

## Final prompt copy

```text
A008 sharpened A007's (R1) abandonment trigger to: "if A009 fails
to produce a coherent-sheaf cohomology class (in any reasonable
degree) discriminating f with A002 L05's biconditional direction
([F]_f != 0 iff f not in AC^0), then (R2) abandonment is
triggered."

This attempt tests the most natural Ext^2 candidate: at T3 both
fan-in-1 ambient, with F_{AC^0} = Ext^2(O_B, O_AMB), define
[F]_f as the characteristic function of "Boolean points realizing
f" in the 4-dimensional vector space Q^4 = Ext^2.

Compute [F]_f for representative f's (x_1, x_1 AND x_2, x_2, XOR)
and check the biconditional direction.

Report:

  §1 — Test setup.
  §2 — Computation of [F]_f for each test function.
  §3 — Verdict on the biconditional direction; trigger evaluation.
  §4 — If the trigger fires, propose the (R2) pivot scope; if the
       construction can be saved by *flipping* the biconditional
       direction, weigh the cost of doing so against pivoting.

Hold to the verification bar: L1 + L2 at best.
```
