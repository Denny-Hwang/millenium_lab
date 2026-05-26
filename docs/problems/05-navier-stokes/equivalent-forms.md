# 05-navier-stokes — Equivalent Forms

Equivalent formulations of the Navier–Stokes regularity question
that arise frequently in attempts and that this repository accepts
as targets.

> Caveat. "Equivalent" here means *logically equivalent to the CMI
> problem on the indicated domain* — i.e., a proof of the form
> resolves the corresponding CMI sub-question (A)–(D), and a refutation
> rules it out. *Reductions* and *sufficient conditions* are listed
> in [`known-results.md`](known-results.md) and
> [`failed-approaches.md`](failed-approaches.md), not here.

---

## 1. Velocity–pressure vs vorticity form

The Navier–Stokes system can be rewritten by taking the curl of
the velocity equation:

$$
  \partial_t \omega + (u \cdot \nabla) \omega
    - (\omega \cdot \nabla) u = \nu \Delta \omega,
  \qquad \omega := \nabla \times u.
$$

The pressure drops out. The two forms are equivalent for smooth,
decaying solutions (the velocity can be recovered from the vorticity
via the Biot–Savart law). The vorticity-stretching term
$(\omega \cdot \nabla) u$ — absent in 2D — is the mechanism most
often suspected of driving 3D blowup.

## 2. Strong vs mild vs weak solution

- **Strong solution**: $u \in C([0, T); H^s) \cap L^2([0, T); H^{s+1})$
  for some $s \geq 3/2$; the equation holds in the classical sense.
- **Mild solution**: solution of the integral form via Duhamel,
  $u(t) = e^{t\nu\Delta} u_0 - \int_0^t e^{(t-s)\nu\Delta}
  \mathbb{P}(u \cdot \nabla u)(s) \, ds$, where $\mathbb{P}$ is the
  Leray projector. The basis of fixed-point arguments
  (Fujita–Kato, Kato, Koch–Tataru).
- **Leray–Hopf weak solution**: $u \in L^\infty([0, \infty); L^2)
  \cap L^2([0, \infty); H^1)$ satisfying the energy inequality.
  Exists globally; uniqueness and regularity open.

A strong solution from smooth data is unique on its interval of
existence; equivalence with the mild and Leray–Hopf solutions holds
on intervals where the strong solution exists. Buckmaster–Vicol
2019 showed *non-uniqueness* of Leray–Hopf weak solutions — a
caveat for what "the" solution means in case (B)/(D).

## 3. Critical norm criteria

The 3D NSE problem can be reformulated as the question of which
*scaling-invariant* (critical) norm is bounded along smooth solutions.

If $u(x, t)$ is a solution, then $u_\lambda(x, t) = \lambda u(\lambda x,
\lambda^2 t)$ is also a solution. A norm $\|\cdot\|_X$ is **critical**
if $\|u_\lambda\|_X = \|u\|_X$ for all $\lambda > 0$.

The critical-norm ladder (strict inclusions, from smallest to
largest):

$$
  L^3(\mathbb{R}^3)
    \;\hookrightarrow\; \dot H^{1/2}(\mathbb{R}^3)
    \;\hookrightarrow\; \dot B^{-1+3/p}_{p,q}(\mathbb{R}^3) \text{ (various } p, q)
    \;\hookrightarrow\; \mathrm{BMO}^{-1}
    \;\hookrightarrow\; \dot B^{-1}_{\infty,\infty}.
$$

(The widest known critical Banach space at which any well-posedness
holds is $\mathrm{BMO}^{-1}$, by Koch–Tataru 2001; $\dot B^{-1}_{\infty,\infty}$
is *ill-posed*, Bourgain–Pavlovic 2008.)

Equivalence-of-the-CMI-question:

- $u \in L^\infty_t L^3_x$ implies regularity (Escauriaza–Seregin–
  Šverák 2003). The converse for smooth solutions is automatic.
- Therefore (A) ⇔ "every smooth, decaying initial datum yields a
  solution staying bounded in $L^\infty_t L^3_x$."

This is the most-quoted equivalent form in modern PDE attempts.

## 4. Beale–Kato–Majda criterion

A smooth solution on $[0, T)$ extends past $T$ iff
$\int_0^T \|\omega(t)\|_{L^\infty} \, dt < \infty$.

So (A) ⇔ "for every smooth, decaying initial datum, the
$L^1_t L^\infty_x$ norm of the vorticity is finite on every finite
interval."

## 5. Caffarelli–Kohn–Nirenberg partial regularity

The singular set of a *suitable* Leray–Hopf weak solution has
parabolic 1-Hausdorff measure zero. So (A) on $\mathbb{R}^3$ is
equivalent to "the singular set is empty (not just measure-zero)".

This reformulation is useful for blowup attempts (target a
non-empty singular set with specific structure).

## 6. Type-I vs Type-II singularity classification

If a blowup occurs at $(x_*, T_*)$, it is **Type I** if
$\|u(t)\|_{L^\infty} \leq C(T_* - t)^{-1/2}$ near $T_*$; **Type II**
otherwise.

Seregin 2009 (improved by Koch–Nadirashvili–Seregin–Šverák 2009):
Type-I singularities cannot occur in 3D NSE for sufficiently
smooth flows. So:

- (A) holds ⇔ no Type-II singularity occurs from smooth data.
- Type-II ruling out → resolution of (A); a Type-II construction →
  resolution of (B).

Most concrete blowup *attempts* (Hou–Luo 2014 and successors) aim
for Type II.

## 7. Stretching-rate vs vorticity-direction criteria

Constantin–Fefferman 1993: if the unit vorticity direction
$\xi := \omega / |\omega|$ is sufficiently Lipschitz where $|\omega|$
is large, regularity follows. So (A) ⇔ "the vorticity direction
field stays sufficiently Lipschitz on the high-vorticity region for
all smooth, decaying data."

---

## Which form do attempts in this repository target?

| Form | Targeted by attempt(s) |
|------|------------------------|
| Critical-norm bound (§3) | A001 (P01 panel debated this); future A002 (norm ladder) |
| Beale–Kato–Majda (§4) | reserved for any vorticity-focused attempt |
| Type-II constructions (§6) | reserved for any (B)/(D)-direction attempt |
| Vorticity-direction (§7) | reserved for geometric-PDE-focused attempt |
