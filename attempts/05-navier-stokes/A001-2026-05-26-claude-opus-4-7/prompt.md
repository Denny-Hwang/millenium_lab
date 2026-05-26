# Prompt — record of the standard prompt used

This file preserves the ID and input variables of the standard prompt
used in this attempt, plus a copy of the exact prompt sent to the
model. The prompt library lives at
[`../../prompts/_INDEX.md`](../../prompts/_INDEX.md).

---

## Standard prompt used

- Prompt ID: `P01-multi-perspective`
- Variant: `none`
- Input variables:
  - `${PROBLEM_ID}`: `05-navier-stokes`
  - `${HYPOTHESIS}`: "Global regularity of 3D incompressible
    Navier–Stokes on $\mathbb{R}^3$ is decided by a single
    critical, scale-invariant scalar functional $\Phi(u, t)$:
    smooth solutions with bounded-energy, smooth, divergence-free,
    sufficiently decaying initial data are globally regular iff
    $\Phi$ remains bounded along them; a finite-time-blowup
    scenario must drive $\Phi$ to infinity along some sequence
    $t_k \uparrow T_*$. Each candidate consilient field (PDE,
    harmonic analysis, probability, CFD, information theory)
    offers a candidate $\Phi$; the hypothesis claims they are
    *the same* invariant up to equivalence."
  - `${PANEL_DOMAINS}`: `["nonlinear-pde", "harmonic-analysis",
    "probability", "computational-fluid-dynamics",
    "information-theory"]` (matches the README's *Candidate
    Consilient Fields* list).
  - `${KNOWN_BRIDGES}`: `[]` (no Navier-Stokes-tagged bridges in
    `bridges/_INDEX.md` yet).

## Prerequisite-reading files

- `charter.md`
- `docs/methodology/proof-pipeline.md`
- `docs/problems/05-navier-stokes/README.md`
- `docs/problems/05-navier-stokes/statement.md` (placeholder)
- `docs/problems/05-navier-stokes/equivalent-forms.md` (placeholder)
- `docs/problems/05-navier-stokes/known-results.md` (placeholder)
- `bridges/_INDEX.md`
- `docs/primer/field-primers/05-navier-stokes.md` (filled-in primer
  with the canonical references and vocabulary used by the panel)

## Final prompt copy

```text
You are moderating a panel of five experts. The target problem is
05-navier-stokes and the hypothesis is:

  "Global regularity of 3D incompressible Navier–Stokes on R^3 is
  decided by a single critical, scale-invariant scalar functional
  Φ(u, t): smooth solutions with bounded-energy, smooth,
  divergence-free, sufficiently decaying initial data are globally
  regular iff Φ remains bounded along them; a finite-time-blowup
  scenario must drive Φ to infinity along some sequence
  t_k ↑ T*. Each candidate consilient field (PDE, harmonic
  analysis, probability, CFD, information theory) offers a
  candidate Φ; the hypothesis claims they are *the same*
  invariant up to equivalence."

Panel composition: nonlinear-pde, harmonic-analysis, probability,
computational-fluid-dynamics, information-theory

Rules: per prompts/P01-multi-perspective.md (panel speaks
first-paragraph opinions; three conflicts extracted; classify
false / real; one-line resolution per real conflict; 1-5
robustness score; bridge-implications discussion).
```
