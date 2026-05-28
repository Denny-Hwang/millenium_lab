# Statement — Conjecture C-003 (Regularity-equivalence / non-local-cancellation wall)

> **Conjecture.** Let $u$ be a smooth solution of the 3D incompressible
> Navier–Stokes equations on $\mathbb{R}^3 \times [0, T)$ from smooth,
> divergence-free, decaying initial data (the CMI initial-data class
> of [Fefferman 2000] §A). Consider the conditional implication
> $$
>   u \in L^\infty([0, T); \mathrm{BMO}^{-1}(\mathbb{R}^3))
>     \;\;\Longrightarrow\;\;
>   u \in L^\infty([0, T); L^q(\mathbb{R}^3))
>   \text{ for some } q \in (3, 6].
> $$
> *No proof of this implication exists that simultaneously*
>
> - **(a) passes the Tao-barrier audit**: uses the divergence-free
>   condition $\nabla \cdot u = 0$ essentially, in a way the
>   averaged-NSE variant of [Tao 2016] cannot replicate; AND
> - **(b) reduces to estimates that are local in Littlewood–Paley /
>   Bony frequency decomposition**: every step can be carried out at
>   the level of individual frequency blocks $\Delta_j u$ or paraproduct
>   components $T_u v$, $T_v u$, $R(u, v)$, without invoking a
>   global-in-frequency identity (such as the $L^2$ energy identity).

Equivalently: the only NSE-specific cancellation available — the
divergence-free condition acting via $\int u \cdot \mathbb{P}(u \cdot
\nabla u)\, dx = 0$ — is *global in frequency*, while the
$\mathrm{BMO}^{-1} \to L^q$ implication intrinsically requires
*local per-frequency-block* estimates. The two requirements are
structurally incompatible.

## Motivation

This conjecture is the distilled lesson of the (α) global-regularity
arc on 05-navier-stokes (attempts A005–A010). Evidence accumulated as
follows:

- **A005** committed the program to the (α) direction via bridge B-003
  / transformation T1 ($\mathrm{BMO}^{-1} \to L^3$ along-flow,
  combined with [ESS 2003] to target CMI (A)).
- **A007** decomposed T1 via Duhamel and isolated G_T1b_1
  (the auxiliary $L^q$ control from the BMO⁻¹ hypothesis) as the
  unique technical bottleneck.
- **A008** ran a P07 adversarial audit; the *resolution-level*
  Tao-barrier check forbade paraproduct-only proofs.
- **A009** committed to the direct $L^p$ energy method on $u$ and
  showed it **degenerates** — the pressure term forces
  $L^\infty_t L^\infty_x$ control which BMO⁻¹ does not give (new
  gap G_T1b_3). Cross-check on approach (ii) vorticity gave a
  symmetric degeneration (G_T1b_4 via Constantin–Fefferman 1993
  hypothesis).
- **A010** surveyed the Albritton 2018+ / Auscher–Frey–Monniaux /
  Lemarié-Rieusset 2018 / Cheskidov–Shvydkoy 2014 literature (no
  published BMO⁻¹ → $L^q$ result for large data) and sketched the
  paraproduct-with-cancellation hybrid (via Bony decomposition).
  Finding: $\Delta_j(\nabla \cdot u) = 0$ holds per-block but
  products $S_{j-1}(u) \cdot \Delta_j(\nabla u)$ do not inherit
  divergence-freeness; the cancellation lives only at the aggregate
  $L^2$ identity, *global in frequency*.

Across the surveyed family of approaches, **no proof satisfying
both (a) and (b) was found**. The conjecture states this is not an
accident of the specific techniques tried but a structural feature
of NSE.

## Relationship to the Parent Problem

The conjecture is a *negative* meta-statement about one route to
CMI sub-case (A): the [ESS 2003] keystone strategy of bridging
BMO⁻¹ to $L^3$ at large data. If **true**, the (α) program's
sheaf-cohomology-style attack on CMI (A) cannot succeed within
the surveyed proof family, justifying the post-A010 pivot to
**B-004 + T2** (numerical-to-continuum) or to **(β) blowup
direction**. If **false**, the disproof would *itself* be a proof
of the BMO⁻¹ → $L^q$ implication, which combined with ESS would
**close CMI (A)** — making the conjecture an exact-equivalent
encoding of the (α)-route hardness.

It does not directly solve CMI (A); it is a methodological
landmark. Charter §4.4 (failure as asset).

## Strength / Weakness Relations

- **If C-003 is true** → no proof of BMO⁻¹ → $L^q$ (large data,
  smooth, $q > 3$) at the surveyed-techniques level. The
  (α)-route via B-003 / T1 cannot succeed without a fundamentally
  new technique outside the energy / vorticity / paraproduct
  family.
- **If C-003 is false** → there exists a proof of the BMO⁻¹ → $L^q$
  implication passing both (a) and (b). Combined with [ESS 2003],
  this would close CMI (A) on $\mathbb{R}^3$. The conjecture is
  therefore *exact-equivalent in strength* to "(A) is provable
  via the (α) family" — which makes its truth or falsity a
  decisive question for the program.

## Status of evidence

- Numerical / small-case: **partial** — the six attempts A005–A010
  surveyed three approach families (direct energy on $u$;
  vorticity on $\omega$; paraproduct-hybrid via Bony) and the
  borderline-regularity literature (Albritton, AFM, LR, CS).
  None yielded a proof satisfying both (a) and (b).
- Formalization (Lean): none.

## Specializes-from / Relates-to

- This conjecture is the (α)-program analog of
  [C-002 (discrete-vs-continuous wall, 03-p-vs-np)](../C-002-discrete-continuous-wall/):
  both encode a structural mismatch between the cancellation
  available to a proof family and the estimate required for the
  target invariant.
- Bears on bridge [B-003](../../bridges/B-003-critical-norm-equivalence-along-flow.md)
  (the (α) route's home): if C-003 is true, B-003's T1 transformation
  cannot be closed by surveyed techniques, suggesting a B-003
  status revision toward "explored-with-negative-findings" if the
  pivot in A012 confirms.

## What a proof or disproof would require

A proof would need to formalize "Tao-barrier consistent" and
"local in LP/Bony frequency decomposition" precisely, then show
the two are simultaneously unsatisfiable for a BMO⁻¹ → $L^q$
implication. This is itself a substantial meta-mathematical
problem and is left open.

A disproof would be an explicit proof of the implication — which
would close CMI (A) on $\mathbb{R}^3$ and earn the CMI prize.
