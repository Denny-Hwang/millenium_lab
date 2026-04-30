# Prompt — record of the standard prompt used

This file preserves the ID and input variables of the standard prompt
used in this attempt, plus a copy of the exact prompt sent to the
model. The prompt library lives at
[`../../../prompts/_INDEX.md`](../../../prompts/_INDEX.md).

---

## Standard prompt used

- Prompt ID: `P03-lemma-extraction`
- Variant: `minor (reason: scoped to a single hypothesis-statement
  repair rather than a full proof decomposition; output is restricted
  to §1, §4 of P03's output template plus a delta against A002)`
- Input variables:
  - `${ATTEMPT_PATH}`:
    `attempts/03-p-vs-np/A002-2026-04-29-claude-opus-4-7/`
  - `${PROBLEM_ID}`: `03-p-vs-np`
  - `${PROOF_TEXT}`: the H_AC⁰ statement and lemmas L05, L06, L10,
    L11 of A002, plus the lethal-risk and quantifier patches A5, A6
    of A003.

## Prerequisite-reading files

- `attempts/03-p-vs-np/A002-2026-04-29-claude-opus-4-7/result.md`
  (source 14-lemma scaffold).
- `attempts/03-p-vs-np/A003-2026-04-29-claude-opus-4-7/result.md`
  (adversarial round; identifies five required patches).
- `bridges/B-002-natural-proofs-sheaf-cohomology.md` (downstream
  consumer of H_AC⁰).
- `prompts/P03-lemma-extraction.md` (template).
- `docs/problems/03-p-vs-np/verification-bar.md` (three-barrier
  audit constraints H_AC⁰ must respect).

## Final prompt copy

```text
You are restating a previously informal hypothesis with explicit
quantifier discipline, after an adversarial review (A003) flagged
two structural ambiguities in A002's H_AC⁰:

  - A6 (quantifier_alternation_check): the quantifier on (s, d) was
    implicit. The intended-but-unstated reading is
    "∃ uniform s = n^{O(1)}, d = O(1), ∀ f", not "∀ f ∃ (s, d)";
    the latter makes H_AC⁰ a tautology.
  - A5 (circular_reasoning_check on L11): truth-table evaluation of
    F_{AC⁰} is trivially poly in the input length 2^n, so L11 as
    written is FALSE and must be replaced by L11' (quantitative
    non-evaluation of F_{AC⁰} on succinct program-description
    inputs).

Restate H_AC⁰ with explicit quantifier structure. Update L05, L06,
L10, and replace L11 by L11'. Preserve all unaffected lemmas
(L01-L04, L07-L09, L12-L14) by reference. Surface any *new* gaps
introduced by the restatement.

Output format:
  1. Restated H_AC⁰ statement (single equation with all quantifiers
     and types explicit).
  2. Restated L05, L06, L10, L11' (new) with dependencies, difficulty,
     and gaps per P03.
  3. Delta against A002: what is the same, what changed, what was
     deleted.
  4. List of assumptions used (P03 §4).
  5. New gaps and their severity, in particular any that the A002
     scaffold did not have.
  6. Quantifier-discipline self-check: re-run A003's A6 against the
     restated statement and confirm the existential-uniform reading.

Do not declare candidate-promotion readiness. This attempt is
patch-only.
```
