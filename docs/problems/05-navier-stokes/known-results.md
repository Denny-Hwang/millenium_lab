# 05-navier-stokes — Known Results

Partial results, regularity criteria, and obstructions established
in the literature. Organized chronologically within thematic groups.

---

## 1. Foundational existence theory (1934–1969)

- **[Leray 1934]** *Sur le mouvement d'un liquide visqueux
  emplissant l'espace*, Acta Math. 63 (1934) 193–248. Global
  existence of *weak* solutions in $\mathbb{R}^3$; the energy
  inequality. Uniqueness and regularity left open.
- **[Hopf 1951]** *Über die Anfangswertaufgabe für die
  hydrodynamischen Grundgleichungen*, Math. Nachr. 4 (1951)
  213–231. Weak solutions on bounded domains.
- **[Ladyzhenskaya 1959]** *Solution "in the large" of the
  nonstationary boundary value problem for the Navier–Stokes
  system with two space variables*, Comm. Pure Appl. Math. 12
  (1959) 427–433. **Global regularity in 2D**; the 2D case is
  *settled*, only the 3D case is the CMI question.
- **[Fujita–Kato 1964]** *On the Navier–Stokes initial value
  problem I*, Arch. Rat. Mech. Anal. 16 (1964) 269–315.
  Local-in-time strong solutions in $H^{1/2}$ for 3D; the
  prototype critical-norm theorem.

## 2. Partial regularity (1976–1985)

- **[Scheffer 1976, 1977, 1980]** A sequence of partial-
  regularity papers culminating in a partial Hausdorff-dimension
  estimate for the singular set of weak solutions.
- **[Caffarelli–Kohn–Nirenberg 1982]** (CKN) *Partial regularity
  of suitable weak solutions of the Navier–Stokes equations*,
  Comm. Pure Appl. Math. 35 (1982) 771–831. The singular set of
  a *suitable* weak solution has **parabolic 1-Hausdorff
  measure zero**. The strongest unconditional regularity result
  to date.

## 3. Vorticity / blowup criteria (1984–1993)

- **[Beale–Kato–Majda 1984]** *Remarks on the breakdown of
  smooth solutions for the 3-D Euler equations*, Comm. Math.
  Phys. 94 (1984) 61–66. The BKM blowup criterion:
  $\int_0^T \|\omega(t)\|_{L^\infty} \, dt = \infty$ if a
  singularity forms at $T$. Strictly a *necessary* condition for
  blowup.
- **[Constantin–Fefferman 1993]** *Direction of vorticity and the
  problem of global regularity for the Navier–Stokes equations*,
  Indiana Univ. Math. J. 42 (1993) 775–789. If the unit vorticity
  direction is Lipschitz on the high-$|\omega|$ region, regularity
  follows.

## 4. Critical norms (2001–2009)

- **[Koch–Tataru 2001]** *Well-posedness for the Navier–Stokes
  equations*, Adv. Math. 157 (2001) 22–35. Global mild solutions
  for small initial data in $\mathrm{BMO}^{-1}$ (the largest
  critical Banach space at which any well-posedness is currently
  known).
- **[Escauriaza–Seregin–Šverák 2003]** (ESS) *$L^{3,\infty}$-
  solutions of the Navier–Stokes equations and backward
  uniqueness*, Russian Math. Surveys 58 (2003) 211–250. If a
  smooth solution stays in $L^\infty_t L^3_x$ on $[0, T)$, it
  extends past $T$. **The most-quoted unconditional bridging
  theorem.**
- **[Seregin 2009]** *A certain necessary condition of potential
  blow up for Navier–Stokes equations*, Comm. Math. Phys. 312
  (2012) 833–845. Rules out Type-I singularities under reasonable
  hypotheses.

## 5. Ill-posedness and non-uniqueness (2008–2019)

- **[Bourgain–Pavlovic 2008]** *Ill-posedness of the Navier–
  Stokes equations in a critical space in 3D*, J. Funct. Anal.
  255 (2008) 2233–2247. Norm inflation in $\dot B^{-1}_{\infty,\infty}$;
  marks the upper end of the critical-norm ladder where
  well-posedness *fails*.
- **[Buckmaster–Vicol 2019]** *Nonuniqueness of weak solutions to
  the Navier–Stokes equation*, Ann. of Math. 189 (2019) 101–144.
  **Non-uniqueness** of weak solutions via convex integration —
  a major reframing for what "the" solution means.

## 6. Surrogate-model blowup (2014–2016)

- **[Hou–Luo 2014]** *Toward the finite-time blowup of the 3D
  axisymmetric Euler equations*, Multiscale Model. Simul. 12
  (2014) 1722–1776. Numerical evidence for axisymmetric Euler
  blowup at a boundary; not NSE but an inspirational scenario.
- **[Tao 2016]** *Finite time blowup for an averaged
  three-dimensional Navier–Stokes equation*, J. AMS 29 (2016)
  601–674. Finite-time blowup for a *modified* (averaged) NSE
  variant; serves as a **barrier**: any proof of (A) must use a
  feature of NSE that the averaged version lacks.

## 7. Stochastic / probabilistic (2008–)

- **[Flandoli–Romito 2008]** *Markov selections for the 3D
  stochastic Navier–Stokes equations*, Probab. Theory Related
  Fields 140 (2008) 407–458. Existence of Markov selections;
  invariant-measure framework.
- **[Glatt-Holtz–Romito and others, 2010s]**: long-time
  statistics, energy-dissipation balance under noise. *Heuristic
  evidence* about deterministic regularity, not a proof.

## 8. Recent borderline / conditional advances (2010s–2020s)

- **[Jia–Šverák 2014]** Conditional self-similar singularities;
  active line of work.
- **[Escauriaza–Seregin–Šverák follow-ups]** Sharpened
  conditional-regularity criteria below the $L^3$ critical scale.
- **[Buckmaster–Vicol–others]** Convex-integration-based
  irregularity constructions for related models (NSE with
  Lipschitz forcing; Euler; etc.).

## 9. Numerical evidence (2000s–2020s)

- High-resolution DNS at $\mathrm{Re} \sim 10^5\!-\!10^6$
  consistently fails to observe finite-time blowup from
  well-prepared initial data, even in scenarios designed to test
  axisymmetric blowup candidates. Strong **heuristic** evidence
  toward (A) on $\mathbb{R}^3$ / $\mathbb{T}^3$; not a proof of
  any sub-case.

---

## Open conditional implications

| Hypothesis | Implies |
|------------|---------|
| $u \in L^\infty_t L^3_x$ | regularity (ESS 2003) |
| BKM: $\int \|\omega\|_{L^\infty} < \infty$ | regularity |
| no Type-II singularity from smooth data | (A) |
| small data in $\mathrm{BMO}^{-1}$ | global regularity (Koch–Tataru) |
| Lipschitz vorticity direction on $\{|\omega| > M\}$ | regularity (Constantin–Fefferman) |

None of the *hypotheses* is known unconditionally for all smooth,
decaying data.
