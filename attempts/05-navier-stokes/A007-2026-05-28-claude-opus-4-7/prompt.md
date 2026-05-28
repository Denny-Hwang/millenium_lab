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
  - `${ATTEMPT_PATH}`: A005 (commitment + T1b statement) + A006
    (T1a results and G_T1a_3 leverage concern).
  - `${PROBLEM_ID}`: `05-navier-stokes`
  - `${PROOF_TEXT}`: T1b as stated in A005 §2 — for arbitrary
    smooth decaying $u_0$ (possibly large in BMO⁻¹), if a smooth
    solution $u$ satisfies $u \in L^\infty_t \mathrm{BMO}^{-1}$
    on $[0, T)$, then $u \in L^\infty_t L^3$ on $[0, T)$.

## Prerequisite-reading files

- `attempts/05-navier-stokes/A005-...result.md` (commitment; pivot
  trigger criterion (b): precise lemma-graph + gap labels for
  T1b consistent with the Tao-barrier audit).
- `attempts/05-navier-stokes/A006-...result.md` (T1a decomposition;
  G_T1a_3 program-level leverage concern; bilinear estimate gap
  G_T1a_1).
- `bridges/B-003-critical-norm-equivalence-along-flow.md` §1
  (paraproduct / bilinear estimate / heat semigroup as shared
  objects).
- `docs/problems/05-navier-stokes/known-results.md` §4
  (Escauriaza-Seregin-Šverák 2003 — the keystone).
- `docs/problems/05-navier-stokes/verification-bar.md` §7 (the
  four NSE barriers).

## Final prompt copy

```text
Second technical attempt under the (α) direction commitment.
A006 isolated the substantive T1a content in L_T1a_5 and
surfaced G_T1a_3 (T1a's program-level leverage is limited; the
genuine payoff is T1b). This attempt attacks T1b.

T1b (A005 §2). For arbitrary smooth decaying u_0 (possibly large
in BMO^{-1}), assume the smooth solution u satisfies
u ∈ L^∞_t BMO^{-1} on [0, T). Then u ∈ L^∞_t L^3 on [0, T).

Apply P03 lemma extraction:

  §1 — Decompose T1b. Use Duhamel's formula as the structural
       backbone.

  §2 — For each lemma, classify difficulty and dependencies.

  §3 — Identify gaps with G_T1b_# labels.

  §4 — Delta against A005's T1b expectations.

  §5 — Tao-barrier audit (verification-bar §7): does the proof
       structurally use the Leray projector P and the
       divergence-free condition ∇·u = 0? If yes, T1c is
       structurally satisfied.

  §6 — Trigger evaluation per A005 §4. A007's goal is to satisfy
       trigger criterion (b): "a precise lemma-graph + gap labels
       for T1b that is consistent with the Tao-barrier audit."

Be honest about which sub-lemmas are routine and which are
non-trivial. The genuine difficulty likely lies in a bilinear
estimate; identify it precisely.

Hold to the verification bar: L1 at best.
```
