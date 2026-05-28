# Prompt — record of the standard prompt used

This file preserves the ID and input variables of the standard prompt
used in this attempt, plus a copy of the exact prompt sent to the
model. The prompt library lives at
[`../../prompts/_INDEX.md`](../../prompts/_INDEX.md).

---

## Standard prompt used

- Prompt ID: `P07-adversarial-review`
- Variant: `minor (reason: P07 is normally invoked on a candidate
  proof (candidates/<id>/). Here the targets are two attempts
  (A006, A007) running under the A005 direction commitment.
  Output template adapted: 'candidate' is replaced by 'A006 +
  A007 / T1 program', and the standard P07 attack-kind list is
  used.)`
- Input variables:
  - `${candidate_id}` (adapted): the A006 + A007 / T1 program on
    the (α) route.
  - `${attack_kinds}`: weaken_assumption, chain_lethal_lemma_failure,
    domain_swap, circular_reasoning_check, quantifier_alternation_check
    (5 attacks, exceeding P07's "at least three" requirement). One
    additional NSE-specific attack — `tao_barrier_resolution_audit`
    — is added per `verification-bar.md` §7.

## Prerequisite-reading files

- `attempts/05-navier-stokes/A005-...result.md` (commitment; pivot
  trigger).
- `attempts/05-navier-stokes/A006-...result.md` (T1a decomposition;
  G_T1a_3 leverage concern).
- `attempts/05-navier-stokes/A007-...result.md` (T1b Duhamel
  decomposition; G_T1b_1 unique bottleneck; Tao-barrier audit at
  lemma-statement level).
- `bridges/B-003-critical-norm-equivalence-along-flow.md` §3
  (stuck points).
- `docs/problems/05-navier-stokes/verification-bar.md` §7
  (four-barrier table; the resolution-level audit obligation).

## Final prompt copy

```text
Role: you are an adversarial reviewer trying to break the A006 +
A007 / T1 program on the (α) route. You are not the author.

Target: A006's T1a decomposition (L_T1a_1-L_T1a_5; gaps G_T1a_1,
G_T1a_2, G_T1a_3) and A007's T1b decomposition (L_T1b_1-L_T1b_3,
splitting L_T1b_3 = L_T1b_3a + L_T1b_3b; gaps G_T1b_1, G_T1b_2;
lemma-statement-level Tao-barrier audit).

Attack kinds:
  - weaken_assumption
  - chain_lethal_lemma_failure
  - domain_swap
  - circular_reasoning_check
  - quantifier_alternation_check
  - tao_barrier_resolution_audit (NSE-specific, per
    verification-bar §7)

For each attack: (1) precise scenario; (2) what breaks; (3) if
survival, justify; (4) verdict: survives / needs-patch:<summary>
/ lethal:<summary>.

Conclude with a round verdict (pass / partial / fail) and
recommended patches. Re-evaluate A005's pivot trigger criteria
in light of the audit.

Hold to the verification bar: L1 / L4 (adversarial).
```
