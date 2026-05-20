# 05 — Navier–Stokes Existence and Smoothness

> Status in this repository: `not-started`. Filled in lazily as
> attempts on this problem land. Content below is from canonical
> external sources.

---

## 1. Problem statement

The incompressible Navier–Stokes equations on $\mathbb{R}^3$ are

$$
  \partial_t u + (u \cdot \nabla) u = -\nabla p + \nu \Delta u,
  \qquad \nabla \cdot u = 0,
$$

with $u : \mathbb{R}^3 \times [0, T) \to \mathbb{R}^3$ the velocity
field, $p$ the pressure, and $\nu > 0$ the viscosity. The CMI
problem (Fefferman, *Existence and Smoothness of the Navier–Stokes
Equation*, 2000) asks for *one* of the following four resolutions:

1. **(A) Existence and smoothness on $\mathbb{R}^3$.** Given smooth,
   divergence-free, sufficiently decaying initial data $u_0$, show
   that a smooth solution exists for all time $t \geq 0$.
2. **(B) Breakdown on $\mathbb{R}^3$.** Exhibit smooth, divergence-
   free, sufficiently decaying initial data for which no smooth
   global solution exists.
3. **(C)** The analog of (A) on the periodic torus $\mathbb{T}^3$.
4. **(D)** The analog of (B) on $\mathbb{T}^3$.

The CMI prize is awarded for resolving any one of (A)–(D).

## 2. Why it is hard

The central technical obstacle is *scaling*.

- The equations have a *natural scaling symmetry*: if $u(x, t)$ is a
  solution, so is $u_\lambda(x, t) = \lambda u(\lambda x, \lambda^2
  t)$.
- The *energy* $\int |u|^2 \, dx$ is **supercritical** with respect
  to this scaling in $\mathbb{R}^3$: it scales as $\lambda^{-1}$, so
  high-frequency fluctuations dominate.
- Known *a priori* estimates (energy inequality, enstrophy bounds
  under additional hypotheses) do not control the *critical* norms
  ($L^3$, $\dot H^{1/2}$) that govern regularity.
- The borderline between *blowup* (loss of regularity in finite
  time) and *global regularity* is genuinely delicate; numerical
  evidence is inconclusive about whether blowup actually occurs.
- Recent work has revealed *non-uniqueness* of weak solutions
  (Buckmaster–Vicol 2019), which complicates the question of "the"
  solution.

## 3. Minimum vocabulary

- **Incompressible fluid** — the velocity field is divergence-free,
  $\nabla \cdot u = 0$.
- **Viscosity $\nu$** — diffusive damping of fluid motion;
  $\nu > 0$ for Navier–Stokes, $\nu = 0$ for Euler.
- **Vorticity** — $\omega = \nabla \times u$; the local rotation of
  the fluid.
- **Energy** — $\frac{1}{2} \int |u|^2 \, dx$.
- **Enstrophy** — $\int |\omega|^2 \, dx$; controls higher
  regularity.
- **Leray–Hopf weak solution** — a solution in the sense of
  distributions satisfying the energy inequality (Leray 1934);
  exists globally but uniqueness and regularity are unknown.
- **Mild solution** — solution of the integral form obtained by
  applying Duhamel's principle; basis of fixed-point arguments.
- **Strong solution** — solution with sufficient regularity that
  the equation holds in the classical sense.
- **Scaling-invariance** — $u_\lambda(x, t) = \lambda u(\lambda x,
  \lambda^2 t)$ is also a solution.
- **Critical / subcritical / supercritical norm** — relative to the
  scaling symmetry; critical norms are scaling-invariant.
- **Beale–Kato–Majda criterion** — singularity at time $T$ implies
  $\int_0^T \|\omega(t)\|_{L^\infty} dt = +\infty$.
- **Sobolev space $H^s$** — function space of functions whose
  derivatives up to order $s$ (interpreted via Fourier transform)
  are square-integrable.
- **Energy inequality** — $\frac{1}{2}\|u(t)\|_{L^2}^2 + \nu
  \int_0^t \|\nabla u\|_{L^2}^2 \leq \frac{1}{2}\|u_0\|_{L^2}^2$.

## 4. Prior results to know about

- **Leray (1934)**: existence of global *weak* solutions in
  $\mathbb{R}^3$; uniqueness and regularity left open.
- **Hopf (1951)**: weak solutions on bounded domains.
- **Ladyzhenskaya (1959, 1969)**: foundational work on 2D existence
  and uniqueness; 2D Navier–Stokes is well-posed globally.
- **Beale–Kato–Majda (1984)**: vorticity-based regularity criterion
  for Euler; analog for Navier–Stokes.
- **Caffarelli–Kohn–Nirenberg (1982)**: partial regularity — the
  singular set of a suitable weak solution has zero 1-dimensional
  parabolic Hausdorff measure.
- **Escauriaza–Seregin–Šverák (2003)**: $L^{3,\infty}$ smallness
  criterion for regularity.
- **Tao (2016)**: finite-time blowup for a *modified* (averaged)
  3D Navier–Stokes-like equation, in *JAMS*. Does not solve CMI
  but identifies a barrier: any proof of (A) must use a feature of
  Navier–Stokes that fails for the averaged version.
- **Buckmaster–Vicol (2019)**: **non-uniqueness** of weak
  Navier–Stokes solutions, in *Annals*. Striking: forces a
  rethinking of "the" solution.
- **Jia–Šverák**, others (2014–): conditional non-uniqueness of
  Leray–Hopf solutions; ongoing.

## 5. Failed approaches and barriers

- **Direct energy estimates** at the critical scaling level have
  not closed; the relevant *a priori* bounds remain non-critical.
- **Numerical exploration**: high-resolution direct numerical
  simulation has produced no clear-cut evidence of blowup, but
  no clear-cut evidence against it either; the resolutions needed
  to settle a near-singularity computationally are out of reach.
- **Vorticity approaches**: the BKM criterion turns the question
  into "is $\int \|\omega\|_{L^\infty}$ controlled?" but answering
  is the original question.
- **Symmetric / axisymmetric reductions**: axisymmetric Navier–
  Stokes with swirl is *open*; without swirl, regularity is known
  (Ladyzhenskaya–Ukhovskii 1968).
- **Tao's barrier (2016)** is a major caution: any proof of global
  regularity for full 3D Navier–Stokes must exploit a feature that
  the averaged equation does not have. This rules out broad
  classes of "average-and-iterate" arguments.

## 6. Recommended starting reading

- Fefferman, *Existence and Smoothness of the Navier–Stokes
  Equation* (CMI problem description, 2000).
  https://www.claymath.org/wp-content/uploads/2022/05/navierstokes.pdf
- Constantin & Foias, *Navier–Stokes Equations* (Chicago Lectures
  in Mathematics, 1988). Classic, readable.
- Robinson, Rodrigo, Sadowski, *The Three-Dimensional Navier–Stokes
  Equations: Classical Theory* (Cambridge, 2016). Modern textbook.
- Lemarié-Rieusset, *The Navier–Stokes Problem in the 21st Century*
  (CRC, 2nd ed. 2018). Comprehensive contemporary reference.
- Tao, *Finite time blowup for an averaged three-dimensional
  Navier–Stokes equation*, *J. AMS* 29 (2016) 601–674. Required
  reading on the obstruction this introduces.

## 7. Glossary deltas

To be added when attempts on this problem begin.

Candidate terms (anticipated):

- Self-similar / type-I and type-II singularities
- Vorticity stretching
- Onsager's conjecture (related Euler regularity question)
- Convex integration (Buckmaster–Vicol)
- Mild / very weak solutions
- Suitable weak solution (CKN sense)
