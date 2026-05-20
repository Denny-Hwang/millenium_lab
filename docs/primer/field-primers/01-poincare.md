# 01 — Poincaré Conjecture (reference only; solved 2003)

> Solved by Grigori Perelman (2002–2003). Retained as a primer file
> because the conjecture and its resolution are routinely cited in
> this repository's discussions of *what a Millennium-class solution
> looks like* and *what L5–L7 verification entails in practice*.

---

## 1. Problem statement

The original conjecture, stated by Poincaré in 1904 (after he had
to retract an earlier version):

> Every simply connected, closed 3-manifold is homeomorphic to the
> 3-sphere $S^3$.

A *manifold* here is a topological space locally homeomorphic to
$\mathbb{R}^3$; *closed* means compact and without boundary;
*simply connected* means every loop can be continuously contracted
to a point.

Dimension-by-dimension status before Perelman:

- $n = 1, 2$: trivial / classical.
- $n \geq 5$: settled by Smale (1961) using *handlebody decomposition
  and the Whitney trick*.
- $n = 4$ topological: settled by Freedman (1982).
- $n = 4$ smooth: still open (the smooth 4-dimensional Poincaré
  conjecture is the only Poincaré-type statement still open today).
- $n = 3$: the Millennium statement; Perelman.

The CMI prize was offered for the $n = 3$ case.

## 2. Why it was hard

Dimension 3 sat in an awkward middle ground.

- High-dimensional surgery tools (general position, the Whitney
  trick) require enough room to *isotope* disks past each other.
  In dimension 3 there is not enough room.
- Low-dimensional tools (uniformization, the Riemann mapping
  theorem) work in dimension 2 but do not directly generalize.
- The fundamental group is the only obvious invariant. If it
  vanishes, the obvious algebraic obstructions are gone — but
  geometric obstructions could still exist.

The resolution required a genuinely new analytic technique: **Ricci
flow with surgery**, introduced by Hamilton (1982) and completed by
Perelman.

## 3. Minimum vocabulary

- **Manifold** — locally Euclidean topological space.
- **Closed manifold** — compact without boundary.
- **Simply connected** — fundamental group $\pi_1(X) = 0$.
- **Fundamental group $\pi_1(X)$** — homotopy classes of loops at a
  basepoint.
- **Homeomorphism vs diffeomorphism** — in dimension 3 these
  notions coincide (Moise 1952); in higher dimensions they
  diverge.
- **3-sphere $S^3$** — the unit sphere in $\mathbb{R}^4$; the
  simplest simply-connected closed 3-manifold.
- **Ricci flow** — a parabolic evolution equation $\partial_t g_{ij}
  = -2 R_{ij}$ on the metric of a Riemannian manifold.
- **Geometrization** — Thurston's conjecture (1982) that every
  closed 3-manifold decomposes into pieces, each carrying one of
  eight model geometries. Implies Poincaré as the simply-connected
  special case.
- **Singularity formation** — the Ricci flow can develop
  singularities in finite time; the surgery procedure removes them.
- **$\kappa$-noncollapsing** — a Perelman-introduced geometric
  control that rules out degenerate singularity formation.

## 4. Prior results to know about

- **Hamilton (1982)**: Ricci flow program; proved the $\pi_1 = 0$
  case under the strong assumption of positive Ricci curvature.
- **Thurston (1982)**: Geometrization Conjecture — Poincaré is the
  simply-connected special case.
- **Perelman (2002–2003)**: three preprints on arXiv
  (math.DG/0211159, math.DG/0303109, math.DG/0307245) proving
  Geometrization (and hence Poincaré) via Ricci flow with surgery.

## 5. The verification record

The Poincaré case is the canonical example of how a Millennium-
class result is verified.

- **arXiv preprints** posted 2002–2003 without journal submission.
- **Three independent verification efforts**:
  - Kleiner–Lott, *Notes on Perelman's papers*
    (https://arxiv.org/abs/math/0605667; published *Geom. Topol.*
    2008).
  - Cao–Zhu, "A complete proof of the Poincaré and geometrization
    conjectures" (*Asian J. Math.* 2006); controversial for
    presentation.
  - Morgan–Tian, *Ricci Flow and the Poincaré Conjecture* (Clay
    Mathematics Institute / AMS, 2007).
- **CMI prize awarded** to Perelman in 2010; declined.

This sequence — preprints → multiple independent verification
documents → years of community settling — is the model that this
repository's L5–L7 protocol mimics.

## 6. Recommended starting reading

- Milnor, *Towards the Poincaré conjecture and the classification
  of 3-manifolds* (Notices AMS, 2003) — accessible survey before
  the full proof was disseminated.
- Morgan & Tian, *Ricci Flow and the Poincaré Conjecture* (AMS / CMI
  Monograph 3, 2007) — textbook treatment of Perelman's proof.
- Kleiner & Lott, *Notes on Perelman's papers*, *Geom. Topol.* 12
  (2008) 2587–2855. The line-by-line verification document; also
  a model of what a Millennium-class verification artifact looks
  like.
- Thurston, *Three-dimensional geometry and topology* (Princeton,
  1997) — geometric topology background for the
  Geometrization Conjecture.

## 7. Glossary deltas

To be added if Perelman-style techniques appear in another problem's
attempt (e.g., a Ricci-flow analog for Hodge or Navier–Stokes).
Candidate terms when that happens:

- Ricci flow with surgery
- $\kappa$-noncollapsing
- canonical neighborhood theorem
- $\mathcal{W}$-entropy (Perelman's entropy functional)
- reduced volume
