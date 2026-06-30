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
  - `${ATTEMPT_PATH}`: A012 (Pivot 1 selection); B-004 (the new
    load-bearing bridge).
  - `${PROBLEM_ID}`: `05-navier-stokes`
  - `${PROOF_TEXT}`: T2 as stated in B-004 §4 — "if a CFD sequence
    is bounded in a critical norm at every resolution Δx_k > 0,
    then the continuum solution is bounded in that critical norm."

## Prerequisite-reading files

- `attempts/05-navier-stokes/A012-...result.md` (Pivot 1
  selection + mini-trigger window + C-003-orthogonality
  criterion).
- `attempts/05-navier-stokes/A007-...result.md` (template for a
  P03 first-technical attempt on a bridge transformation).
- `bridges/B-004-cfd-pde-rigorous-turbulence-closure.md` §3-§4
  (stuck points; open directions including T2).
- `conjectures/C-003-...statement.md` (the wall to stay
  orthogonal to).
- `docs/problems/05-navier-stokes/verification-bar.md` §7.
- `docs/problems/05-navier-stokes/known-results.md` §9
  (numerical evidence baseline).

## Final prompt copy

```text
First technical attempt under the A012 Pivot 1 commitment.
Target: T2 (B-004 §4) — "if a CFD sequence is bounded in a
critical norm at every resolution Δx_k > 0, then the continuum
solution is bounded in that critical norm."

Apply P03 lemma extraction:

  §1 — Decompose T2 into sub-lemmas. Use the natural backbone:
       discrete setup → convergence → norm semi-continuity →
       limit identification.

  §2 — For each lemma, classify difficulty and dependencies.

  §3 — Identify gaps with G_T2_# labels.

  §4 — Delta against B-004 §4's T2 informal statement.

  §5 — TWO audits:
        (i) Tao-barrier audit (verification-bar §7): does the
            discrete NSE setup preserve ∇·u = 0? (Standard
            discretizations do.)
        (ii) C-003-orthogonality audit per A012's mini-trigger
             criterion (b'): does T2's proof reduce to
             LP/Bony-local direct-PDE estimates? If no, T2 is
             C-003-orthogonal as Pivot 1 requires.

  §6 — Trigger evaluation per A012's mini-window. A013's goal is
       to satisfy (b'): "precise lemma-graph + gap labels for T2
       consistent with BOTH Tao-barrier AND C-003-orthogonality."

Be honest. The genuine difficulty likely lies in the convergence
step (compactness at critical regularity); identify it
precisely.

Hold to the verification bar: L1 at best.
```
