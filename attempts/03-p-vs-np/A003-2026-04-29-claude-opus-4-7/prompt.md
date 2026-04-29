# Prompt — record of the standard prompt used

This file preserves the ID and input variables of the standard prompt
used in this attempt, plus a copy of the exact prompt sent to the
model. The prompt library lives at
[`../../../prompts/_INDEX.md`](../../../prompts/_INDEX.md).

---

## Standard prompt used

- Prompt ID: `P07-adversarial-review`
- Variant: `minor (reason: P07 is specified for a candidate_id, but
  no PC-### exists yet. The variant retargets P07 onto A002's
  pre-candidate lemma scaffold for H_AC⁰. Output and structure are
  identical; the input field "candidate_id" is replaced by
  "target_attempt = A002".)`
- Input variables:
  - `target_attempt`: `A002-2026-04-29-claude-opus-4-7`
  - `attack_kinds`: 6 kinds —
    `weaken_assumption`, `chain_lethal_lemma_failure`,
    `domain_swap`, `boundary_case`,
    `circular_reasoning_check`, `quantifier_alternation_check`
  - `target_artifact`:
    `attempts/03-p-vs-np/A002-2026-04-29-claude-opus-4-7/result.md`
    §"P03 Lemma Extraction" (lemmas L01–L14)

## Prerequisite-reading files

- `attempts/03-p-vs-np/A001-2026-04-29-claude-opus-4-7/result.md`
- `attempts/03-p-vs-np/A002-2026-04-29-claude-opus-4-7/result.md`
  (the target of this review)
- `bridges/B-001-gct-homological-circuit.md`
- `bridges/B-002-natural-proofs-sheaf-cohomology.md`
- `docs/problems/03-p-vs-np/verification-bar.md` (three-barrier
  audit definitions)
- `docs/problems/03-p-vs-np/failed-approaches.md`
- `prompts/P07-adversarial-review.md`

## Deviation from Standard P07 (transparency)

P07 normally targets `candidates/<candidate>/` and writes to
`adversarial/proof-attacks/<candidate>/round-NNN/`. A002's
recommendation is HOLD on candidate promotion, so no PC-### exists.
Per charter §4.3 ("every candidate must have at least one attack
record"), the formal adversarial track is gated on candidate
existence. This attempt instead performs an *attempt-level
adversarial scoping review* with two consequences:

1. **The output lives in this attempt's `result.md`**, not under
   `adversarial/`. Once a PC-### appears, the scoping review's
   findings should be migrated to its `attacks.md` round-001.
2. **The adversary is simulated, not independent.** Charter §4.3 also
   asks that adversarial rounds be performed by a different model or
   session. This is the same model in the same session — the closest
   honest approximation is to adopt the persona of an explicitly
   adversarial reviewer who has *not seen* the panel author's
   internal beliefs. A future P07 round by a genuinely different
   actor is still required before any L4 pass.

## Final prompt copy

```text
Role: you are an adversarial reviewer trying to break the lemma
scaffold of attempt A002 (target hypothesis H_AC⁰). You are not the
author. You receive lemmas L01–L14 from A002's result.md and the
seven-step proof sketch from A002's prompt.md.

Target: A002 H_AC⁰ scaffold (pre-candidate).
Attack kinds: weaken_assumption, chain_lethal_lemma_failure,
              domain_swap, boundary_case,
              circular_reasoning_check, quantifier_alternation_check

For each attack kind, do the following:
1. Specify the attack scenario precisely (which assumption is
   transformed and how).
2. Under the transformed scenario, identify which lemma(s) of A002
   break and how.
3. If the scaffold survives, justify why in one paragraph.
4. End each attack with a one-line verdict:
   - "survives" / "needs-patch:<patch summary>" / "lethal:<summary>"

Conclude with a round verdict and a list of suggested patches with
locations (lemma IDs).
```
