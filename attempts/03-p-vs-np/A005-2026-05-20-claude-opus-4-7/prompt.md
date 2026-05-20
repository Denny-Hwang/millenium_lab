# Prompt — record of the standard prompt used

This file preserves the ID and input variables of the standard prompt
used in this attempt, plus a copy of the exact prompt sent to the
model. The prompt library lives at
[`../../prompts/_INDEX.md`](../../prompts/_INDEX.md).

---

## Standard prompt used

- Prompt ID: `P03-lemma-extraction`
- Variant: `minor (reason: scoped to a single lemma patch — L02
  quasi-projectivity (A003-A1) and irreducibility / component
  uniformity (A003-A2) — rather than a full proof decomposition.
  Output is restricted to §1 (lemma restatement), §4 (delta against
  A002 / A004), and §5 (new gaps) of P03's output template, plus
  a meta-level discussion of the structural tension that the
  patches surface.)`
- Input variables:
  - `${ATTEMPT_PATH}`:
    `attempts/03-p-vs-np/A002-2026-04-29-claude-opus-4-7/`
  - `${PROBLEM_ID}`: `03-p-vs-np`
  - `${PROOF_TEXT}`: the L02 statement and its gap G001 from A002,
    plus the A1 (weaken_assumption to constructible) and A2
    (chain_lethal_lemma_failure on reducibility) patch verdicts
    from A003.

## Prerequisite-reading files

- `attempts/03-p-vs-np/A002-2026-04-29-claude-opus-4-7/result.md`
  (source 14-lemma scaffold; L02 statement + gap G001).
- `attempts/03-p-vs-np/A003-2026-04-29-claude-opus-4-7/result.md`
  (adversarial round; A1 needs-patch:state-and-prove-quasi-projectivity
  and A2 needs-patch:specify-irreducibility-or-component-uniformity).
- `attempts/03-p-vs-np/A004-2026-04-30-claude-opus-4-7/result.md`
  (the quantifier and L11 → L11' patches already discharged;
  follow-up §1 tentatively labeled this work "A006" but the
  attempt ID is assigned sequentially by `scripts/new-attempt.sh`).
- `bridges/B-001-gct-homological-circuit.md` (downstream consumer
  of the moduli structure).
- `bridges/B-002-natural-proofs-sheaf-cohomology.md` (downstream
  consumer of the sheaf cohomology).
- `docs/primer/field-primers/03-p-vs-np.md` (scheme-theoretic
  vocabulary background).

## Final prompt copy

```text
You are extracting a single-lemma patch for the H_AC⁰ program.
Target: L02 of A002. Patches: A003-A1 (quasi-projectivity) and
A003-A2 (irreducibility / component-uniformity).

For each patch, produce:

  - A restated lemma L02 v2 closing the patch (or explaining why
    the patch cannot be closed at this attempt's scope).
  - A delta against A002's L02 v1.
  - Any new gaps surfaced.

Hold to the verification bar (charter §3 / §4); the labels
`claimed-solution` and `peer-reviewable` are forbidden here.

If the patch attempt surfaces a meta-level structural tension
(e.g., the choice of scheme structure forces a trade-off between
quasi-projectivity and non-trivial cohomology), surface it
explicitly as a new gap, do not paper over it.
```
