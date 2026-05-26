---
id: B-004
domains: [computational-fluid-dynamics, nonlinear-pde]
problems: [05-navier-stokes]
maturity: speculative
key_figures: []
status: active
---

# Bridge: Computational Fluid Dynamics ↔ Nonlinear PDE — Rigorous Turbulence Closure

> A bridge connecting *numerical* turbulence evidence (DNS, LES,
> Hou–Luo-style targeted searches at high Reynolds number) to the
> *analytical* regularity question of nonlinear PDE for 3D NSE.
> The bridge's promise: rigorously translate sub-Kolmogorov-scale
> dynamics — invisible to any finite-resolution simulation — into a
> continuum bound or a constructive counterexample. First framed
> explicitly as a bridge candidate in attempt A001 (P01 panel C3)
> on 05-navier-stokes.

## 1. Why it connects

CFD and nonlinear PDE share the same equation but operate at
opposite epistemic standards:

- **CFD** computes the equation on a finite lattice / spectral grid
  with mesh $\Delta x$ and timestep $\Delta t$. "Truth" is reached
  in the limit $\Delta x \to 0$ at fixed Reynolds number, and the
  Kolmogorov microscale $\eta \sim (\nu^3 / \epsilon)^{1/4}$
  controls when resolution suffices ($\eta / \Delta x \gtrsim 1$).
- **Nonlinear PDE** treats the equation on continuum $\mathbb{R}^3$
  / $\mathbb{T}^3$, where "truth" is an a-priori bound or singularity
  construction valid for all $\nu > 0$ and all valid initial data.

The bridge connects them at the **continuum limit** $\Delta x \to 0$:
do the structures observed at the finest resolved scales (vortex
tubes, near-singular events, scale-by-scale energy transfer)
*persist* as $\Delta x \to 0$, and if so, what is the analytical
limit?

```
   CFD (finite resolution)              Nonlinear PDE (continuum)
   ── lattice u_{Δx}, t_{Δt} ──┐        ┌── u(x, t) on R^3 ──
                                │        │
                                v        v
        Kolmogorov microscale η(t)        a-priori critical-norm bound
                                ↑        ↑
                       LIFT: scale-by-scale energy budget
                       lattice DNS at η/Δx ≳ 1
                       ↦ continuum bound on the cascade
```

Five candidate shared objects:

1. **Energy spectrum / Kolmogorov cascade** $E(k)$ — CFD measures
   it (with the $k^{-5/3}$ scaling at the inertial range); PDE asks
   whether the spectrum extends without breakdown.
2. **Structure functions** $S_p(\ell) = \langle |u(x+\ell) -
   u(x)|^p \rangle$ — CFD measures their scaling exponents $\zeta_p$;
   PDE relates $\zeta_p$ to Hölder regularity (Onsager 1949,
   Isett 2018 for Euler).
3. **Dissipation rate** $\epsilon(t) = \nu \int |\nabla u|^2$ —
   CFD measures it; PDE controls it via the energy inequality.
4. **Vortex stretching** $\omega \cdot \nabla u$ — CFD visualizes
   vortex tubes; PDE asks whether the stretching is suppressed by
   the direction-Lipschitz mechanism (Constantin–Fefferman 1993).
5. **Targeted blowup scenarios** (Hou–Luo 2014 axisymmetric
   boundary blowup) — CFD designs the initial data and observes
   high-$\mathrm{Re}$ behavior; PDE asks whether the candidate
   singularity is Type-I (impossible by Seregin 2009) or Type-II.

## 2. Known Results

- **DNS at $\mathrm{Re} \sim 10^5\!-\!10^6$** consistently does
  *not* observe finite-time blowup from well-prepared initial
  data; an empirical regularity bound at finite resolution.
- **Onsager 1949 conjecture** (regularity-threshold for Euler at
  Hölder $1/3$) was proven by **Isett 2018**; this is the cleanest
  example of the bridge succeeding *for Euler, not NSE*. NSE
  analog (Buckmaster–Vicol convex-integration constructions) is
  active.
- **Tao 2016** (averaged-NSE finite-time blowup) does not use a
  CFD bridge directly, but its existence reframes CFD evidence:
  any CFD-derived bridge for true NSE must avoid the averaging.
- **Caffarelli–Kohn–Nirenberg 1982** controls the singular set's
  parabolic Hausdorff dimension; CFD evidence is consistent with
  this analytical bound but does not prove it.
- **Hou–Luo 2014 and follow-ups** — targeted axisymmetric
  high-resolution simulations at potential boundary-blowup
  scenarios. Numerical evidence remains inconclusive.

## 3. Stuck Points

- **The continuum limit $\Delta x \to 0$ is not rigorously
  controlled** for high-Reynolds-number simulations. Numerical
  convergence at one resolution doesn't extend to all.
- **No CFD experiment can falsify the existence of sub-Kolmogorov-
  scale singularities** in finite simulation time. A blowup
  invisible at $\Delta x$ but detectable below remains possible
  in principle.
- **The Hou–Luo scenarios are at the boundary**: not the same
  problem as the CMI question on all-$\mathbb{R}^3$ smooth data.
- **Onsager's analog for NSE is not Isett 2018**: Isett works on
  Euler (no viscosity), and the convex-integration constructions
  on NSE (Buckmaster–Vicol) are not the deterministic CMI
  question.
- **The Tao 2016 averaged barrier**: any CFD-to-PDE bridge must
  identify why CFD evidence on true NSE does not transfer to
  averaged NSE (which provably blows up).

## 4. Open Directions

1. **Rigorous continuum-limit theorem for finite-resolution
   simulations.** Concretely: under what conditions on a sequence
   of DNS with $\Delta x_k \to 0$ does the lattice solution
   converge to a Leray–Hopf weak solution of the continuum
   equation? Partial results exist (Constantin–Foias, Lemarié-
   Rieusset 2018) but a full theorem covering high-$\mathrm{Re}$
   scenarios is open.
2. **Sub-Kolmogorov-scale rigor.** Show that if a Leray–Hopf weak
   solution is bounded in a critical norm at every resolution
   $\Delta x_k > 0$ (via CFD), then it is bounded in the same
   critical norm at the continuum.
3. **Hou–Luo-scenario rigor.** Translate the axisymmetric
   high-$\mathrm{Re}$ boundary near-blowup into either a
   constructive Type-II singularity or a proof that the scenario
   is non-singular under sufficient regularity assumptions.
4. **Onsager-NSE analog.** Find the regularity threshold for NSE
   below which dissipation anomaly can occur (analogous to
   Euler's $C^{1/3-}$) and use CFD evidence to constrain it.
5. **Cross-link with B-003**: a CFD-derived large-data along-flow
   bound in $L^3$ (or $\mathrm{BMO}^{-1}$) — even non-rigorous —
   would constrain which of B-003's transformations T1/T2/T3 are
   plausible.

## 5. Connection to This Repository

- Attempts:
  - [A001](../attempts/05-navier-stokes/A001-2026-05-26-claude-opus-4-7/)
    — P01 panel surfaced C3 (continuum vs discretized framing)
    which motivates this bridge.
  - [A004](../attempts/05-navier-stokes/A004-2026-05-26-claude-opus-4-7/)
    — this bridge's discovery attempt (P02).
- Candidates: — (none yet)
- Conjectures: — (a future C-### could state the rigorous
  continuum-limit theorem; or the Onsager-NSE threshold)
- Companion bridge: [B-003](B-003-critical-norm-equivalence-along-flow.md)
  *(the HA-PDE bridge; together they cover the C1+C3 panel
  conflicts from A001)*.

## 6. References

- **[Onsager 1949]** *Statistical hydrodynamics*, Nuovo Cimento
  Suppl. 6 (1949) 279–287.
- **[Frisch 1995]** *Turbulence: The Legacy of A. N. Kolmogorov*,
  Cambridge.
- **[Caffarelli–Kohn–Nirenberg 1982]** *Partial regularity of
  suitable weak solutions of the Navier-Stokes equations*, Comm.
  Pure Appl. Math. 35 (1982) 771–831.
- **[Constantin–Fefferman 1993]** *Direction of vorticity and the
  problem of global regularity for the Navier-Stokes equations*,
  Indiana Univ. Math. J. 42 (1993) 775–789.
- **[Hou–Luo 2014]** *Toward the finite-time blowup of the 3D
  axisymmetric Euler equations*, Multiscale Model. Simul. 12
  (2014) 1722–1776.
- **[Tao 2016]** *Finite time blowup for an averaged 3D
  Navier-Stokes equation*, J. AMS 29 (2016) 601–674.
- **[Isett 2018]** *A proof of Onsager's conjecture*, Ann. of
  Math. 188 (2018) 871–963.
- **[Buckmaster–Vicol 2019]** *Nonuniqueness of weak solutions to
  the Navier-Stokes equation*, Ann. of Math. 189 (2019) 101–144.
- **[Constantin–Foias 1988]** *Navier-Stokes Equations*, Chicago
  Lectures in Mathematics (CFD-PDE foundational reference).
- **[Lemarié-Rieusset 2018]** *The Navier-Stokes Problem in the
  21st Century*, CRC 2nd ed.
- **[Kolmogorov 1941]** *The local structure of turbulence in
  incompressible viscous fluid for very large Reynolds numbers*,
  Dokl. Akad. Nauk SSSR 30 (1941) (the $k^{-5/3}$ cascade).
