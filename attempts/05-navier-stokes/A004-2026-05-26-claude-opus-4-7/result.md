# Result — Summary

Written when the attempt terminates. Assign exactly one outcome label
and state the key insights and follow-up suggestions.

---

## Conclusion (one line)

Registers **B-004** (*CFD ↔ Nonlinear PDE — Rigorous Turbulence
Closure*) as a `speculative`, `active` bridge on 05-navier-stokes;
the bridge formalizes A001's C3 (continuum-vs-discretized epistemic
gap) with five shared objects (energy spectrum, structure functions,
dissipation rate, vortex stretching, Hou–Luo targeted scenarios),
three transformations (continuum-limit theorem; sub-Kolmogorov-scale
rigor; Hou–Luo-scenario rigor), and one explicit false-bridge
possibility (the continuum limit could be *genuinely discontinuous*
beyond any CFD resolution — structurally analogous to a natural-
proofs-style barrier).

## Outcome Label

- Label: `partial-insight`
- Reason: A new bridge is registered as a repository asset. The
  "continuum-limit-from-finite-resolution" framing as a single
  B-### object is ai-discovered in this session even though the
  epistemic gap is widely recognized in informal discussions.
  Maturity is `speculative` (softer than B-003's `ai-discovered`)
  because the composite is not yet developed in the literature
  and the bridge's content may be primarily the gap itself.

> The labels `claimed-solution` and `peer-reviewable` are forbidden at
> this stage. See
> [`../../docs/methodology/outcome-taxonomy.md`](../../docs/methodology/outcome-taxonomy.md).

---

## 1. Bridge registered

[**B-004**](../../../bridges/B-004-cfd-pde-rigorous-turbulence-closure.md):
*Computational Fluid Dynamics ↔ Nonlinear PDE — Rigorous
Turbulence Closure.*

- Frontmatter: `maturity: speculative`, `status: active`,
  `domains: [computational-fluid-dynamics, nonlinear-pde]`,
  `problems: [05-navier-stokes]`.
- Six sections populated.

## 2. P02 §1 — Five candidate shared objects

| # | Shared object | Maturity |
|---|---------------|----------|
| 1 | Energy spectrum $E(k)$ and Kolmogorov $k^{-5/3}$ cascade | established (Kolmogorov 1941; Frisch 1995) |
| 2 | Structure functions $S_p(\ell)$ and $\zeta_p$ | emerging (Onsager 1949 → Isett 2018 for Euler; NSE analog open) |
| 3 | Dissipation rate $\epsilon(t) = \nu \int|\nabla u|^2$ | established |
| 4 | Vortex stretching $\omega \cdot \nabla u$ and tube structures | emerging (Constantin–Fefferman 1993) |
| 5 | Hou–Luo 2014-style targeted blowup scenarios | speculative |

The composite "continuum-limit-from-finite-resolution" framing is
new as a single bridge object.

## 3. P02 §3 — Three transformations from B-004

- **T1 (continuum-limit theorem)**: a sequence of DNS with
  $\Delta x_k \to 0$ converges to a Leray–Hopf weak solution under
  sufficient regularity. Partial results (Constantin–Foias 1988;
  Lemarié-Rieusset 2018); full high-$\mathrm{Re}$ version open.
- **T2 (sub-Kolmogorov rigor)**: if a CFD sequence is bounded in a
  critical norm at every resolution, the continuum solution is
  bounded in that norm. **Directly connects to B-003** (the
  along-flow questions).
- **T3 (Hou–Luo-scenario rigor)**: translate the axisymmetric
  high-$\mathrm{Re}$ boundary near-blowup into either a Type-II
  construction or a smoothness theorem.

## 4. P02 §4 — False-bridge possibility

The continuum limit could be **genuinely discontinuous** beyond any
finite CFD resolution: a sub-$\Delta x_k$ feature changes
qualitatively (smooth → singular) when $\Delta x_k \to 0$, and no
fine enough simulation detects this. In that case CFD evidence is
provably unable to inform the CMI question.

This is structurally analogous to a natural-proofs-style barrier:
finite-resolution evidence may be provably insufficient. The
bridge then degenerates to *delineating* which features at
resolved scales are obstructions and which are not — content as a
gap-delineation rather than a positive theorem.

## Key Insights

- **B-004 covers the second half of the A001 panel.** Together
  with B-003 (HA ↔ PDE for the C1 conflict), the 05-navier-stokes
  program now has a two-bridge structure: B-003 for the
  norm-equivalence-along-flow direction, B-004 for the
  numerical-to-continuum direction.
- **T2 explicitly couples B-003 and B-004**: a CFD-derived
  large-data along-flow bound in a critical norm — even
  heuristic — would constrain which of B-003's T1/T2/T3 are
  plausible. The two bridges are not independent.
- **The false-bridge possibility is the structural analog of a
  natural-proofs barrier** for the CFD-PDE side. Even if it
  obtains, the bridge has content as a gap-delineation.
- **The 05-navier-stokes program now has scaffolding in place**:
  A001 (panel), A002 (ladder), A003 (B-003), A004 (B-004).
  Direction-commitment (A005) is the natural next step.

## Follow-ups

1. **A005 — direction-commitment attempt** (per A001 follow-up #6
   and applied 03-p-vs-np lesson): commit by A005 to either
   global-regularity direction (target: bound some critical norm
   via B-003 + T1/T2; or via B-004 + T2 + B-003) or blowup
   direction (target: B-004 + T3 Hou–Luo Type-II). Set explicit
   pivot trigger (e.g., 3 follow-up attempts before re-commitment).
2. **bridges/_INDEX.md update**: add B-004 entry to the index
   listing.
3. **Primer update**: promote the two-bridge structure (B-003
   spatial-embedding ↦ along-flow; B-004 continuum-limit) into
   `docs/primer/field-primers/05-navier-stokes.md` §7.
4. **R6 cross-attempt snapshot** (optional, early): with four
   attempts on 05-navier-stokes (A001-A004) the program has a
   coherent scaffold; an early R6 would be unusually positive
   (no pattern of stalling, two complementary bridges), useful
   as a methodological contrast with 03-p-vs-np's dormant arc.
5. **B-003 and B-004 cross-link**: explicit citation in each
   bridge of how T2 of B-004 feeds into B-003's questions.

## References

- bridge:
  [`bridges/B-004-cfd-pde-rigorous-turbulence-closure.md`](../../../bridges/B-004-cfd-pde-rigorous-turbulence-closure.md)
  (the deliverable).
- attempt: `attempts/05-navier-stokes/A001-...` (panel C3 seed).
- attempt: `attempts/05-navier-stokes/A003-...` (B-003 companion).
- prompt: `prompts/P02-bridge-discovery.md`.
- external (canonical, full citations in B-004 §6):
  - Kolmogorov 1941, Frisch 1995, CKN 1982,
    Constantin–Fefferman 1993, Hou–Luo 2014, Tao 2016,
    Isett 2018, Buckmaster–Vicol 2019, Constantin–Foias 1988,
    Lemarié-Rieusset 2018.
