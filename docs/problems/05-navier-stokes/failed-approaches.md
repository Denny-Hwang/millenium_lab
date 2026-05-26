# 05-navier-stokes — Failed Approaches

Approaches and routes that have been tried in the published
literature and have not produced a CMI resolution, with reasons.
Local attempts in `attempts/05-navier-stokes/` labeled
`flawed-attempt` are also absorbed here.

> Definition. "Failed" here means *did not resolve the CMI
> sub-question*. Many of these approaches produced genuine partial
> results that appear in [`known-results.md`](known-results.md);
> the failure is at the level of *resolving (A)/(B)/(C)/(D)*, not
> at the level of being uninformative.

---

## 1. Direct energy estimates at the critical scaling

**Approach.** Use the natural energy estimate
$\frac{d}{dt} \int |u|^2 = -2\nu \int |\nabla u|^2$ as the
controlling identity. Try to close higher-derivative estimates in
$H^s$ for $s$ at or above the critical regularity ($s = 1/2$ in
3D).

**Obstruction.** The energy $\int |u|^2$ scales as $\lambda^{-1}$
under the NSE scaling — **supercritical**. The non-linearity
$u \cdot \nabla u$ is *critical at the energy level*, so the
"obvious" estimate just barely fails to close. Every refinement
that has been tried (interpolation, logarithmic corrections,
weighted estimates) either gives a sub-critical bound (insufficient)
or borrows a hypothesis that is itself open.

**Status.** Has produced critical-norm bridging theorems (ESS 2003,
Seregin 2009) but has not closed (A).

## 2. Axisymmetric reductions (without swirl)

**Approach.** Specialize to axisymmetric initial data — the
equation reduces by one spatial dimension, and the non-linearity
simplifies.

**Result.** Ladyzhenskaya–Ukhovskii 1968: axisymmetric NSE *without
swirl* is globally regular. The simplification removes the
vortex-stretching term entirely.

**Why it does not resolve CMI.** Axisymmetric *with swirl* is still
open and is the active research target (Hou–Luo 2014). The
"without swirl" reduction is too special.

## 3. Surrogate / reduced models

**Approach.** Prove blowup (or regularity) for a model believed to
share the essential difficulty of NSE — Burgers, Constantin–
Lax–Majda, dyadic shell models, averaged NSE.

**Major case.**

- **[Tao 2016]** Finite-time blowup for an *averaged* NSE variant
  in $\mathbb{R}^3$ (with a different averaging of the non-linearity).
  The averaging makes vortex stretching essentially uncancelled.

**Why it does not resolve CMI.** Tao's result is a **barrier**:
any proof of (A) for true NSE must exploit a feature that
disappears under averaging — i.e., the specific cancellation
structure of the full non-linearity. Many surrogate-model
techniques (e.g., dyadic shell blowup, Cheskidov 2008) are similarly
not equivalent to true NSE.

This is the analogue of the natural-proofs barrier in P-vs-NP: a
ceiling on a *class* of techniques, not a settlement of the
question.

## 4. Stochastic Navier–Stokes (zero-noise limit)

**Approach.** Add noise: $du + (u \cdot \nabla u - \nu \Delta u +
\nabla p) \, dt = dW$. Use Markov-selection / invariant-measure
machinery (Flandoli–Romito 2008) to study long-time statistics.

**Why it does not resolve the CMI question.** The CMI problem is
*deterministic* — the limit $W \to 0$. Stochastic methods give
strong heuristic evidence (energy-dissipation balance is
consistent with global regularity), but the zero-noise limit is
exactly where the regularization disappears.

The boundary between *useful* (informs heuristics) and *insufficient*
(doesn't prove (A)/(B)) is sharp here.

## 5. Numerical brute force

**Approach.** Direct numerical simulation (DNS) at the highest
available Reynolds number, with adaptive mesh refinement at
suspected blowup events.

**Status.** DNS up to $\mathrm{Re} \sim 10^5\!-\!10^6$ consistently
fails to observe finite-time blowup from physically natural initial
data. Hou–Luo 2014 designed axisymmetric initial data specifically
to probe a boundary blowup scenario; the numerical results are
suggestive but inconclusive, and several follow-ups argue both
ways.

**Why it does not resolve the CMI question.** The Fefferman 2000
statement is explicit that numerical evidence alone does not
suffice. Extrapolation to $\eta / \Delta x \to 0$ (sub-Kolmogorov
scale) cannot be done rigorously without an analytical bridge —
which is precisely the open question.

## 6. Claimed proofs of (A) or (B) — historical pattern

There is a long history of incorrect proofs claiming to resolve
3D NSE in either direction. Common failure modes:

- Energy / Sobolev estimates that **silently use sub-critical
  regularity** of the initial data.
- "Cancellation" claims that hold for a related model (Burgers,
  averaged NSE) but not for true NSE — falling foul of Tao 2016's
  barrier.
- Construction of singular solutions in a **different solution
  class** (e.g., weak solutions à la Buckmaster–Vicol) rather than
  the CMI smooth class.
- Implicit use of an **additional hypothesis** (e.g.,
  axisymmetric-without-swirl, or small data).

This repository's `verification-bar.md` makes the per-attempt
audit explicit.

## 7. This repository — failed attempts log

This section absorbs attempts labeled `flawed-attempt` in
`attempts/05-navier-stokes/`.

| Attempt ID | Outcome | Cause of failure |
|------------|---------|------------------|
| (none yet) | — | — |

---

## Cross-cutting lesson (from 03-p-vs-np dormancy)

The 03-p-vs-np H₀ / H_AC⁰ program accumulated 8 `partial-insight`
attempts converging on a route-independent obstruction
(conjecture C-002, discrete-vs-continuous wall) before being moved
to `dormant`. The key methodological lesson is: **set explicit
direction-commitment and pivot triggers early** — by approximately
the fifth attempt — to avoid the productive-but-walled failure
mode. Applied here in `attempts/05-navier-stokes/A001-.../meta.yaml`
follow-up #6.
