# Prompt — record of the standard prompt used

This file preserves the ID and input variables of the standard prompt
used in this attempt, plus a copy of the exact prompt sent to the
model. The prompt library lives at
[`../../prompts/_INDEX.md`](../../prompts/_INDEX.md).

---

## Standard prompt used

- Prompt ID: `P03-lemma-extraction`
- Variant: `minor (reason: hybrid attempt — paraproduct-with-
  cancellation third-approach exploration AND a literature audit
  on Albritton-style borderline-regularity criteria. Output
  template: §1 (literature audit), §2 (paraproduct-hybrid
  sketch), §5 (verdict on whether a third approach saves T1b).)`
- Input variables:
  - `${ATTEMPT_PATH}`: A009 (degeneration finding); A006 (Patch 1
    literature audit, deferred).
  - `${PROBLEM_ID}`: `05-navier-stokes`
  - `${PROOF_TEXT}`: G_T1b_3 + G_T1b_4 from A009 — both
    regularity-equivalent gaps from direct approaches.

## Prerequisite-reading files

- `attempts/05-navier-stokes/A006-...result.md` (Patch 1
  literature-audit follow-up; G_T1a_1 bilinear estimate).
- `attempts/05-navier-stokes/A008-...result.md` (A6 verdict;
  paraproduct-only REJECTED).
- `attempts/05-navier-stokes/A009-...result.md` (direct
  approaches degenerate; G_T1b_3 / G_T1b_4; A010 follow-ups
  proposed).
- `bridges/B-003-critical-norm-equivalence-along-flow.md` §1
  (paraproduct as a shared HA-PDE object).
- `analysis/cross-synthesis/03-p-vs-np-2026-05-21.md` (precedent
  on the route-independent wall).

## Final prompt copy

```text
Per A009 follow-up §1, explore a candidate third approach to
G_T1b_1 that escapes both (a) A008-A6 (paraproduct-only barrier
blocking) and (b) A009's degeneration finding (direct approaches
relocate to regularity-equivalent gaps).

Two components:

  §1 — Literature audit on Albritton 2018+ borderline regularity
       criteria and Auscher-Frey-Monniaux mild-solution
       improvements. Question: does any published result address
       G_T1b_3 (uniform L^∞ from BMO^{-1} + smoothness + energy)
       or its analogs? Also discharges A006 Patch 1 (deferred
       L_T1a_5 counterexample search).

  §2 — Paraproduct-with-cancellation hybrid sketch. Use Bony
       decomposition u·∇u = T_u(∇u) + T_{∇u}(u) + R(u, ∇u). At
       each component, insert ∇·u = 0 cancellation where it
       enters (e.g., the resonance term R may admit divergence-
       free-specific structure). Statement-level Tao-barrier
       audit on the hybrid.

  §5 — Verdict: does the hybrid escape the A009 degeneration?
       If not, what is the residual obstruction, and is it
       intrinsic (analog of the route-independent C-002 wall)?

Be honest. The most likely outcome is that the paraproduct-with-
cancellation hybrid sharpens our understanding of WHY direct
approaches degenerate, without itself escaping. If so, this
sharpening is informative and prepares A011 (C-003 conjecture
registration).

Hold to the verification bar: L1 at best.
```
