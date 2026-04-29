# P07 — Adversarial Review

## When to Use

Deliberate attacks on a candidate proof. Whenever possible the agent
performing this is from a **different model and session** from the
candidate's author.

## Input Variables

- `candidate_id`
- `attack_kinds` — at least three of:
  - `weaken_assumption`
  - `chain_lethal_lemma_failure`
  - `domain_swap`
  - `boundary_case`
  - `circular_reasoning_check`
  - `quantifier_alternation_check`

## Prerequisite Reading

- `candidates/<candidate>/claim.md`
- `candidates/<candidate>/strategy.md`
- `candidates/<candidate>/main-proof.md`
- `candidates/<candidate>/lemmas/`
- `candidates/<candidate>/gaps.md`
- `candidates/<candidate>/attacks.md` (previous rounds)

## Prompt Body

```
Role: you are an adversarial reviewer trying to break the candidate
proof. You are not the author.
Candidate: {{candidate_id}}
Attack kinds: {{attack_kinds}}

For each attack kind, do the following:
1. Specify the attack scenario precisely (which assumption is
   transformed and how).
2. Under the transformed scenario, identify which step of the
   candidate breaks and how.
3. If the candidate survives, justify why in one paragraph.
4. End each attack with a one-line verdict:
   - "survives" / "needs-patch:<patch summary>" / "lethal:<summary>"

Conclude with a round verdict.
```

## Output Format

```yaml
attacks:
  - kind: weaken_assumption
    scenario: ...
    breakage: ...
    survival_argument: ...
    verdict: survives | needs-patch:... | lethal:...
round_verdict: pass | partial | fail
suggested_patches:
  - location: ...
    proposal: ...
```

## Follow-ups

- Append the round to `attacks.md`.
- `needs-patch` → return to the candidate; add G### entries to
  `gaps.md`.
- A single `lethal` triggers consideration of `abandoned`.
- `pass` → open the L4 pass PR.
