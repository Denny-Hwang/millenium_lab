# 05-navier-stokes — Statement

The official CMI problem (Fefferman, *Existence and Smoothness of
the Navier–Stokes Equation*, 2000;
https://www.claymath.org/wp-content/uploads/2022/05/navierstokes.pdf).

---

## The equations

The incompressible Navier–Stokes (NSE) equations for a velocity
field $u : \mathbb{R}^3 \times [0, T) \to \mathbb{R}^3$ and pressure
$p : \mathbb{R}^3 \times [0, T) \to \mathbb{R}$ are

$$
\begin{aligned}
  \partial_t u_i + \sum_{j=1}^3 u_j \partial_j u_i
    &= -\partial_i p + \nu \Delta u_i,
    \qquad i = 1, 2, 3, \\
  \nabla \cdot u &= 0,
\end{aligned}
$$

with viscosity $\nu > 0$. Initial data $u_0$ is required to be
smooth, divergence-free, and "physically reasonable" (decaying
sufficiently rapidly at infinity, in the CMI sense; see
[Fefferman 2000] §2 for the precise decay class).

## The four CMI sub-questions

A solution to the CMI problem resolves *one* of the following:

- **(A)** Existence and smoothness on $\mathbb{R}^3$. For every smooth
  divergence-free $u_0$ with the decay condition, a smooth solution
  $(u, p)$ exists for all $t \geq 0$ with finite global energy.
- **(B)** Breakdown on $\mathbb{R}^3$. There exists a smooth
  divergence-free $u_0$ with the decay condition for which no
  smooth global solution exists.
- **(C)** Existence and smoothness on the periodic torus
  $\mathbb{T}^3$ (with the appropriate periodic initial-data class).
- **(D)** Breakdown on $\mathbb{T}^3$.

The CMI prize is awarded for resolving *any one* of (A)–(D).

Standard scaling symmetry: if $u(x, t)$ is a solution then so is
$u_\lambda(x, t) := \lambda \, u(\lambda x, \lambda^2 t)$. The energy
$\int |u|^2 \, dx$ scales as $\lambda^{-1}$ and is *supercritical*
in $\mathbb{R}^3$.

## Conventions adopted in this repository

- Default target is sub-question (A) (existence and smoothness on
  $\mathbb{R}^3$); attempts targeting (B), (C), or (D) state the
  target explicitly in their `meta.yaml` `strategy` field.
- "Solution" means a Leray–Hopf weak solution unless otherwise
  specified.
- "Smooth" means $C^\infty$ in space-time with all derivatives
  decaying at the same rate as $u$.
- The decay condition on initial data follows Fefferman 2000 §A:
  for every multi-index $\alpha$ there is a constant $C_\alpha$ with
  $|\partial^\alpha u_0(x)| \leq C_\alpha (1 + |x|)^{-K}$ for some
  $K$ depending on the attempt's specified problem class.

## What does **not** count

Per Fefferman 2000 §3:

- **Numerical evidence** alone, however extensive (overwhelmingly
  anti-blowup in current literature) does not constitute a proof of
  either direction.
- **Reduction to a closely-related equation** (Burgers, dyadic
  shell models, averaged NSE — see Tao 2016) does not resolve the
  CMI question unless the reduction is a proven equivalence or
  embedding.
- **Conditional theorems** (under regularity assumptions like
  $L^{3,\infty}$-boundedness, Beale–Kato–Majda, etc.) do not by
  themselves resolve (A)/(B); they reduce one open question to
  another.

## Out of scope (in the CMI sense)

- Stochastic Navier–Stokes (different *object*; see
  [`failed-approaches.md`](failed-approaches.md) §4 for the role
  in heuristic evidence).
- Hyperviscous regularizations
  $\partial_t u + \cdots = -\nu(-\Delta)^\alpha u$ for $\alpha > 1$
  (Tao 2016 deals with $\alpha = 5/4$ averaged variant; not the
  CMI equation).
- Lower-dimensional analogs ($\mathbb{R}^2$ or $\mathbb{T}^2$:
  global regularity is *known* — Ladyzhenskaya 1959; not the CMI
  question).
