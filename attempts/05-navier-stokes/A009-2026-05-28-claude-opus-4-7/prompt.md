# Prompt — record of the standard prompt used

This file preserves the ID and input variables of the standard prompt
used in this attempt, plus a copy of the exact prompt sent to the
model. The prompt library lives at
[`../../prompts/_INDEX.md`](../../prompts/_INDEX.md).

---

## Standard prompt used

- Prompt ID: `P03-lemma-extraction`
- Variant: `minor (reason: not standard lemma extraction from an
  existing proof. Repurposed to (i) commit to a specific approach
  for G_T1b_1 per A008 Patch 2; (ii) sketch the proof attempt;
  (iii) identify sub-bottlenecks as new gaps. Output template
  restricted to §1 (approach choice + statement-level re-audit),
  §2 (proof sketch), §5 (new gap labels).)`
- Input variables:
  - `${ATTEMPT_PATH}`: A005-A008 (commitment, T1a, T1b
    decomposition, adversarial audit).
  - `${PROBLEM_ID}`: `05-navier-stokes`
  - `${PROOF_TEXT}`: G_T1b_1 (A007 §3): establish L_T1b_3b — derive
    $u \in L^\infty_t L^q$ for some $q \in (3, 6]$ from
    $L^\infty_t \mathrm{BMO}^{-1}$ + smoothness + energy. A008
    Patch 2: must specify the approach and pass the
    resolution-level Tao-barrier audit.

## Prerequisite-reading files

- `attempts/05-navier-stokes/A007-...result.md` (T1b Duhamel
  decomposition; G_T1b_1; statement-level Tao-barrier audit).
- `attempts/05-navier-stokes/A008-...result.md` (P07 adversarial
  audit; A6 needs-patch:approach-and-resolution-level-audit;
  paraproduct-only REJECTED).
- `bridges/B-003-critical-norm-equivalence-along-flow.md`.
- `docs/problems/05-navier-stokes/verification-bar.md` §7.
- `docs/problems/05-navier-stokes/known-results.md` §3-§4 (BKM,
  vorticity direction, Koch-Tataru, ESS).

## Final prompt copy

```text
Execute A008's Patch 2 on G_T1b_1: specify the approach (NOT
paraproduct-only, which would fail the resolution-level
Tao-barrier audit) and attempt a proof sketch of L_T1b_3b.

Three candidate approaches:
  (i) Direct L^p energy method: differentiate ||u||_{L^p}^p; use
      ∇·u = 0 to cancel convection; manage the pressure term.
  (ii) Vorticity L^p energy method: same on ω = ∇×u; vortex
       stretching is the obstruction (Constantin-Fefferman 1993
       direction-Lipschitz hypothesis is one closing condition).
  (iii) Constantin-Fefferman geometric: use vorticity direction
        Lipschitz on high-vorticity region.

Procedure:

  §1 — Commit to one approach with justification. Run a
       statement-level Tao-barrier audit on the SPECIFIC choice
       (verify NSE-specific cancellations enter, not just appear
       in the equation).

  §2 — Sketch the proof. Identify where ||u||_{BMO^{-1}} enters
       (the hypothesis input) and where ||u||_{L^q} emerges
       (the conclusion).

  §5 — New gap labels for sub-bottlenecks surfaced. Honest
       difficulty assessment: if the approach reduces G_T1b_1
       to new gaps without closure, say so plainly.

Be honest. The G_T1b_1 problem is hard; the realistic outcome is
identifying a reduction (a new sub-gap) rather than a closure.

Hold to the verification bar: L1 (lemma decomposition) at best.
```
