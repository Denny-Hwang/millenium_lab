# Prompt — record of the standard prompt used

This file preserves the ID and input variables of the standard prompt
used in this attempt, plus a copy of the exact prompt sent to the
model. The prompt library lives at
[`../../prompts/_INDEX.md`](../../prompts/_INDEX.md).

---

## Standard prompt used

- Prompt ID: `P08-conjecture-validation`
- Variant: `minor (reason: as in A006, P08 is repurposed to a
  structural validation rather than a numerical equality. Output
  template restricted to §1 (parameter scope and refinements
  tested), §2 (concrete computation per refinement per ambient),
  §3 (verdict and consequence for the abandonment trigger). Two
  refinements tested simultaneously (A007's A008 and A009 combined),
  on two ambient choices (T1 fan-in-1 and T3 both fan-in-1).)`
- Input variables:
  - `${PROBLEM_ID}`: `03-p-vs-np`
  - `${CONJECTURE_TEXT}`: A007's two refinements (A' twisted line
    bundle, A'' relative Ext) are tested for whether they
    discriminate XOR from $x_1 \wedge x_2$ at $(n,s,d)=(2,3,2)$.
  - `${PARAMETER_SCOPE}`: $(n, s, d) = (2, 3, 2)$; ambients T1
    fan-in-1 ($\mathbb{P}^1$) and T3 both fan-in-1
    ($\mathbb{P}^1 \times \mathbb{P}^1$).

## Prerequisite-reading files

- `attempts/03-p-vs-np/A006-2026-05-20-claude-opus-4-7/result.md`
  (explicit Plücker equations; DAG topology enumeration).
- `attempts/03-p-vs-np/A007-2026-05-20-claude-opus-4-7/result.md`
  ((R1) commitment; Construction A trivialization; refinements A',
  A''; abandonment trigger).
- `docs/primer/notation.md` §9 (GCT / Grassmannian notation).
- `docs/primer/proof-techniques.md` (general; reasoning about
  Picard groups, Chern classes, Ext functors).

## Final prompt copy

```text
A007 committed the H_AC^0 program to (R1) sheaf-on-ambient and
identified two refinements (A', A'') as the next-attempt targets,
with an abandonment trigger if A008 + A009 + A011 fail to produce
a working F_{AC^0} within 3 follow-up attempts.

This attempt consolidates A008 and A009 into a single test: both
refinements at (n, s, d) = (2, 3, 2), on two ambient choices (the
1-dim T1 fan-in-1 = P^1 and the 2-dim T3 both-fan-in-1 = P^1 x
P^1). The XOR / x_1 AND x_2 discrimination test from A007 is the
witness.

For each (refinement, ambient) combination:
  - Specify the construction concretely (which divisor, which
    Ext functor).
  - Compute the cohomological invariant.
  - Check whether it discriminates XOR from x_1 AND x_2.

Report combined verdicts and the implication for the abandonment
trigger. Be honest if both refinements fail — that is itself a
substantial result that informs the strategic decision.

Hold to the verification bar: L1 + L2 at best; no candidate-
promotion language.
```
