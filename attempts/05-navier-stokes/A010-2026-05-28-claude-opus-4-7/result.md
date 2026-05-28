# Result — Summary

Written when the attempt terminates. Assign exactly one outcome label
and state the key insights and follow-up suggestions.

---

## Conclusion (one line)

Literature audit (Albritton 2018+, Auscher–Frey–Monniaux,
Lemarié-Rieusset 2018, Cheskidov–Shvydkoy 2014) finds **no
published BMO⁻¹ → $L^q$ improvement for large data**;
paraproduct-with-cancellation hybrid sketch shows **the
$\nabla \cdot u = 0$ cancellation is *non-local in frequency*** —
it lives at the aggregate $L^2$ energy identity, not at any
per-frequency-block paraproduct estimate — so a hybrid that
satisfies both A008-A6 (passes the audit) **and** escapes A009
degeneration **does not exist** within the surveyed family;
the obstruction is identified as a **global-vs-local incompatibility
between the available cancellation and the required estimate**,
analogous in spirit to the discrete-vs-continuous wall C-002 of
the dormant 03-p-vs-np program.

## Outcome Label

- Label: `partial-insight`
- Reason: Discharges A009 follow-up §1 (third-approach
  exploration) and absorbs A006 Patch 1 (literature audit) into
  one attempt. Produces a structural finding: the obvious family
  of approaches (energy, vorticity, paraproduct-hybrid, literature)
  all fail to close G_T1b_1, and the failure mode (non-local
  cancellation vs local estimate) is identified. This narrows
  the program's remaining options to (i) a genuinely novel
  technique outside surveyed families, or (ii) registering the
  finding as conjecture C-003 + pivoting. Not `novel-approach`
  (no new technique); above `survey`. Not `flawed-attempt` —
  honest about the negative finding.

> The labels `claimed-solution` and `peer-reviewable` are forbidden at
> this stage. See
> [`../../docs/methodology/outcome-taxonomy.md`](../../docs/methodology/outcome-taxonomy.md).

---

## 1. Literature audit (absorbs A006 Patch 1)

Question: does any published result address G_T1b_3 (uniform
$L^\infty_t L^\infty_x$ from $L^\infty_t \mathrm{BMO}^{-1}$ +
smoothness + energy) or its small-data analog L_T1a_5?

| Source | Direction | Addresses G_T1b_3? |
|--------|-----------|---------------------|
| Albritton 2018+ | $L^3$ → regularity sharpenings (ESS-endpoint refinements) | no — opposite direction |
| Auscher–Frey–Monniaux | small-data global existence in critical-Banach extensions | no — small-data only |
| Albritton–Brue–Colombo 2022 | non-uniqueness of *weak* solutions via convex integration | different problem class |
| Lemarié-Rieusset 2018 Ch. 9–11 | comprehensive HA-NSE monograph | reviews critical-norm theory; G_T1b_3-form is NOT covered for large data |
| Cheskidov–Shvydkoy 2014 | ESS-endpoint sharpenings | same direction as Albritton |

**Conclusion**: no published BMO⁻¹ → $L^q$-style result for large
data in the literature surveyed. G_T1b_3 is genuinely open.
A006 Patch 1 discharged: no L_T1a_5 counterexample located
either.

## 2. Paraproduct-with-cancellation hybrid sketch

Bony decomposition of the nonlinearity:
$$u \cdot \nabla u = T_u(\nabla u) + T_{\nabla u}(u) + R(u, \nabla u).$$

Question: where does $\nabla \cdot u = 0$ enter each component?

- $T_u(\nabla u) = \sum_j S_{j-1}(u) \cdot \Delta_j(\nabla u)$:
  low-frequency $S_{j-1}u$ multiplies high-frequency $\Delta_j(\nabla u)$.
  $\Delta_j$ commutes with $\nabla$ (Fourier-localized), so
  $\Delta_j(\nabla \cdot u) = 0$ — but the product
  $S_{j-1}(u) \cdot \Delta_j(\nabla u)$ does NOT inherit
  divergence-freeness automatically.
- $T_{\nabla u}(u)$: symmetric situation.
- $R(u, \nabla u)$: resonance, more structural freedom but no
  obvious per-block divergence-free cancellation.

**Applying the Leray projector $\mathbb{P}$ to the full nonlinearity**:
$$\mathbb{P}(u \cdot \nabla u) = \mathbb{P}[T_u(\nabla u) + T_{\nabla u}(u) + R(u, \nabla u)].$$
$\mathbb{P}$ is a Calderón–Zygmund operator (Fourier multiplier);
applying it to each component does not introduce per-component
cancellation.

**The cancellation appears only at the aggregate $L^2$ identity**:
$\int u \cdot \mathbb{P}(u \cdot \nabla u) \, dx = 0$ for
divergence-free $u$. This is **global** in frequency.

## 3. Why the degeneration is intrinsic

Combining A009 + §2 above:

- Direct approaches (energy on $u$; vorticity on $\omega$)
  **degenerate** because pressure / vortex-stretching forces
  $L^\infty$ control beyond BMO⁻¹.
- Paraproduct hybrids **cannot resurrect** $\nabla \cdot u = 0$
  per-frequency block; the cancellation is non-local in frequency.
- Therefore **any approach decomposing $u \cdot \nabla u$ into
  frequency blocks loses the cancellation at the per-block
  level**.
- The only way to recover the cancellation per-block is to use a
  global identity (the $L^2$ energy), which is **sub-critical**
  for the BMO⁻¹ → $L^q$ target.

**Structural finding**: the $\nabla \cdot u = 0$ cancellation is
*global in frequency*; the BMO⁻¹ → $L^q$ implication requires a
*local per-frequency-block* estimate; the mismatch makes T1b
structurally hard.

This is the (α)-program analog of the route-independent wall
A011 identified for 03-p-vs-np (C-002): a global-vs-local
incompatibility between available cancellation and required
estimate.

## 4. Statement-level audit on the hybrid

Per §2/§3:

- **Paraproduct-only**: fails the Tao-barrier audit
  (no $\nabla \cdot u = 0$ entry per-block). **Confirmed A008-A6.**
- **Paraproduct with $\nabla \cdot u = 0$ at the aggregate step**:
  effectively reduces to the energy / vorticity approaches A009
  analyzed, and **degenerates the same way**.

**No hybrid in the surveyed family** simultaneously passes the
Tao-barrier audit AND escapes A009 degeneration.

## 5. Verdict

The (α) program's path forward via standard techniques is **not
available**. Realistic options:

- **(i) Novel technique outside surveyed families** — improbable
  within budget.
- **(ii) Register the structural finding as conjecture C-003**
  (analog of C-001 for the dormant program) and pivot.

A005 trigger criterion (b) was achieved by A007 and is not
undone by A010 (the lemma graph remains correct; what A010 shows
is that the graph cannot be CLOSED by standard techniques). So
the trigger does **not literally fire**. But the program's
viability is significantly weakened.

**Recommendation**: A011 registers C-003; A012 selects Pivot.

## Key Insights

- **No published BMO⁻¹ → $L^q$ result for large data** in the
  surveyed literature (Albritton, Auscher–Frey–Monniaux,
  Lemarié-Rieusset 2018, Cheskidov–Shvydkoy).
- **The $\nabla \cdot u = 0$ cancellation is non-local in
  frequency.** It lives at the aggregate $L^2$ energy identity,
  not at per-frequency-block paraproduct estimates.
- **A paraproduct-with-cancellation hybrid that satisfies both
  A008-A6 and escapes A009 degeneration does not exist** in the
  surveyed family.
- **Global-vs-local incompatibility**: T1b's hypothesis-to-conclusion
  bridge needs a local estimate; the only available cancellation
  is global. The (α)-program analog of the C-002 wall.
- **A005 trigger does not literally fire**, but the program's
  realistic outlook is now dormancy-leaning. C-003 registration
  preserves the asset; Pivot evaluation in A012.

## Follow-ups

1. **A011**: register **conjecture C-003** (regularity-equivalence
   / non-local-cancellation wall) as the formal asset. Analog of
   C-001 for the dormant program.
2. **A012**: Pivot evaluation. Options:
   - Pivot 1: route change within (α) — most plausible candidate
     is B-004 + T2 (CFD-PDE rigorous turbulence closure;
     numerical-to-continuum bridge). This is structurally
     orthogonal to direct PDE techniques.
   - Pivot 2: (β) blowup direction — B-004 / T3 Hou–Luo
     scenario.
   - Pivot 3: dormancy following 03-p-vs-np precedent (would
     require this user-approval; A012 only recommends).
3. **Mid-arc R6 (strongly motivated)**: 10 attempts on
   05-navier-stokes (A001–A010); methodological-contrast R6
   with 03-p-vs-np becomes the natural consolidation.
4. **Update verification-bar §7**: add the "global-vs-local
   cancellation mismatch" as a fifth barrier in the NSE-specific
   audit table.
5. **B-003 §3 update**: add A009/A010 findings to "Stuck points",
   specifically that the paraproduct-with-cancellation hybrid
   approach fails by the non-locality argument.

## References

- attempts A005–A009 (the route's developmental arc).
- bridge:
  [`bridges/B-003-critical-norm-equivalence-along-flow.md`](../../../bridges/B-003-critical-norm-equivalence-along-flow.md).
- conjecture (precedent):
  [`conjectures/C-002-discrete-continuous-wall/`](../../../conjectures/C-002-discrete-continuous-wall/).
- analysis:
  [`analysis/cross-synthesis/03-p-vs-np-2026-05-21.md`](../../../analysis/cross-synthesis/03-p-vs-np-2026-05-21.md).
- problem doc:
  [`docs/problems/05-navier-stokes/verification-bar.md`](../../../docs/problems/05-navier-stokes/verification-bar.md).
- external (canonical, surveyed):
  - Bony, *Calcul symbolique et propagation des singularités*,
    Ann. ENS 14 (1981) 209–246 (paraproduct origin).
  - Bahouri, Chemin, Danchin, *Fourier Analysis and Nonlinear
    Partial Differential Equations*, Springer 2011 (HA toolkit).
  - Albritton, *Blow-up criteria for the Navier–Stokes
    equations in non-endpoint critical Besov spaces*, Anal. PDE
    11 (2018) 1415–1456.
  - Auscher, Frey, Monniaux, recent work on critical-Banach
    Navier–Stokes (2010s).
  - Lemarié-Rieusset, *The Navier–Stokes Problem in the 21st
    Century*, CRC 2nd ed. 2018, Chapters 9–11.
  - Cheskidov, Shvydkoy, *A unified approach to regularity
    problems for the 3D Navier–Stokes equations*, JMFM 16 (2014)
    263–273.
  - Koch–Tataru 2001, ESS 2003, Tao 2016 — same canonical set
    from earlier attempts.
