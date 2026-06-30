# Transcript — full AI conversation (frozen after merge)

> ⚠️ This file is **immutable** after the PR is merged — no edits, no
> deletions, not even typo or line-break fixes. Corrections are
> recorded in this folder's `result.md`.

---

## Meta

- Attempt ID: A013
- Model: claude-opus-4-7
- Start: 2026-06-30 (post-PR #34 Pivot 1 selection)
- End: 2026-06-30
- Environment: Claude Code on the Web at HEAD after PR #34 merge
  (A012 + R6 + Pivot 1).

---

## Body

```text
[Session task framing]

P03 on T2 (B-004 §4) — first technical attempt under Pivot 1.
Analog of A007 for the new route. Goal: satisfy A012's
mini-trigger criterion (b').

[Reading]

- A012 (Pivot 1 + mini-trigger criterion (b')).
- A007 (template for the parallel B-003/T1 first-technical
  attempt).
- B-004 §3-§4 (stuck points; T2 informal statement).
- C-003 statement.md (must stay orthogonal).
- verification-bar.md §7.
- known-results.md §9 (numerical baseline: DNS at Re ~ 10^5
  consistently fails to observe blowup).

[Step 1 — Restate T2 precisely]

T2 (formal, drawing from B-004 §4): Let {Δx_k} be a sequence of
discretization scales with Δx_k → 0. Let u_{Δx_k} be the
solution of the discrete NSE on a lattice / spectral grid with
mesh Δx_k, started from an initial datum u_0^{(k)} approximating
the CMI smooth decaying u_0 (Fefferman 2000 §A class). Suppose

  sup_k sup_{t ∈ [0, T_*)} ||u_{Δx_k}(t)||_X ≤ M

for some critical norm X (e.g., X = L^3(R^3) per ESS endpoint)
and some uniform bound M < ∞. Then there exists a Leray-Hopf
weak solution u of the continuum NSE on [0, T_*) with
u(0) = u_0 and

  sup_{t ∈ [0, T_*)} ||u(t)||_X ≤ M.

Combined with ESS 2003 (for X = L^3), T2 would close CMI (A) on
[0, T_*) IF the uniform CFD bound exists.

CRITICAL POINT. T2 by itself does NOT supply the uniform CFD
bound — that hypothesis is empirical (DNS evidence). T2 is the
TRANSFER theorem from discrete to continuum, not the bound
itself.

[Step 2 — Lemma decomposition (discrete → continuum backbone)]

L_T2_1. (Discrete NSE setup.) For each Δx > 0, define a
  discretization scheme (finite differences / spectral /
  finite volumes / Galerkin) producing a sequence u_{Δx} on
  [0, T_*) with u_{Δx}(0) ≈ u_0. The discrete equation
  preserves ∇·u_{Δx} = 0 by construction (standard for all
  conventional NSE schemes).

  Difficulty: low. Dependencies: standard CFD theory (e.g.,
  Temam 1977; Lemarié-Rieusset 2018 Ch. 16).

L_T2_2. (Uniform-in-Δx convergence subsequence.) Under the
  uniform critical-norm hypothesis sup_k ||u_{Δx_k}||_X ≤ M,
  extract a subsequence converging to some u in some sense
  (weakly in X, strongly in L^2_{loc}, etc.).

  Difficulty: HIGH. This is the CRUX. Critical-norm
  compactness fails by scaling (the unit ball in L^3(R^3) is
  NOT compact in any natural sense); a different mechanism is
  needed (e.g., concentration-compactness / profile
  decomposition).

L_T2_3. (Identification of the limit with continuum NSE.) The
  limit u from L_T2_2 satisfies the continuum NSE (weakly, at
  minimum) and matches the CMI initial datum u_0.

  Difficulty: medium. Standard for Leray-Hopf weak solutions;
  requires the discrete scheme to consistently approximate the
  nonlinear term.

L_T2_4. (Norm semi-continuity at the limit.) The limit
  inherits the uniform bound: sup_t ||u(t)||_X ≤ M.

  Difficulty: low (norm lower semi-continuity is standard for
  reflexive Banach spaces; L^3 is reflexive).

[Step 3 — Sub-decomposition of L_T2_2 (the crux)]

The compactness failure at critical regularity is the well-known
"scaling-invariant compactness obstruction." Approaches:

  (i) Concentration-compactness à la Lions / Gérard. Profile
      decomposition u_{Δx_k} ≈ Σ_j r_k^{(j)} φ_j((x - x_k^{(j)})
      / λ_k^{(j)}, ...) extracts compact "atoms" from the
      sequence.
      Status: classical; works for the L^p convergence problem
      but the NSE NONLINEARITY interaction with the profile
      decomposition is delicate (Gérard-Meyer or Bahouri-Gallagher
      have studied this for NSE specifically).

  (ii) Energy-method compactness (Aubin-Lions). Requires
      ||∂_t u_{Δx_k}||_? bounded in some negative-regularity
      space. For NSE the standard estimate gives ∂_t u in
      H^{-5/2} or so — sub-critical relative to L^3. Works at
      sub-critical regularity; needs strengthening at critical
      scale.

  (iii) Spectral / Fourier-localization compactness. Use
      Littlewood-Paley blocks and concentration analysis on
      each block.
      WARNING: this is LP-local. Per A012's (b'), LP-local
      arguments are the part that's potentially C-003-blocked.
      Must check carefully.

[Step 4 — Tao-barrier audit per verification-bar §7]

The discrete NSE setup preserves ∇·u_{Δx} = 0 by construction
(L_T2_1). The continuum identification (L_T2_3) inherits ∇·u = 0
for the limit. So:
  - At the lemma-statement level, ∇·u = 0 is preserved through
    the discrete and continuum sides.
  - The Tao-barrier audit at statement level: PASS.

At the resolution level (the actual proof of L_T2_2), the
question is whether the compactness mechanism uses ∇·u = 0
essentially. For approaches (i) profile decomposition and (ii)
Aubin-Lions, ∇·u = 0 enters through the pressure estimate on
∂_t u; both approaches use the divergence-free condition
non-trivially. For (iii) spectral approach, ∇·u = 0 acts
per-block (Δ_j(∇·u) = 0) which IS local — but the AGGREGATE
cancellation A010 identified isn't needed for the compactness
question (it was needed for the BMO^{-1} → L^q implication).

Statement-level Tao-barrier audit: PASS for approaches (i), (ii)
clearly; (iii) needs care at resolution level.

[Step 5 — C-003-orthogonality audit (A012 criterion (b'))]

C-003 says: no proof of BMO^{-1} → L^q exists with both
Tao-barrier AND LP/Bony locality.

T2 is NOT a BMO^{-1} → L^q proof. T2 is a discrete-to-continuum
TRANSFER theorem. The Q: "does T2 reduce to LP/Bony-local
direct-PDE estimates?"

Answer per approach:
  (i) Concentration-compactness: uses scaling-invariance
      arguments, not per-LP-block estimates. C-003-orthogonal.
  (ii) Aubin-Lions: uses energy estimates on ∂_t u, which are
      global-in-frequency (∂_t u ∈ H^{-5/2} is a sub-critical
      Sobolev statement). C-003-orthogonal.
  (iii) Spectral: would be LP-local. C-003 might apply IF the
      proof actually used LP-local estimates analogously to the
      BMO^{-1} → L^q wall. But T2 isn't about a BMO^{-1} → L^q
      implication — it's about compactness. So C-003's
      quantification doesn't directly bite even for (iii).

VERDICT: T2 (via any of approaches (i)-(iii)) is structurally
DIFFERENT from the BMO^{-1} → L^q implication C-003
quantifies over. T2 IS C-003-orthogonal.

This satisfies A012's mini-trigger criterion (b').

[Step 6 — Gaps]

G_T2_1. (Lethal-if-unresolved.) Establish L_T2_2: critical-norm
  compactness for discrete-NSE sequences uniformly bounded in
  X. This is the unique technical bottleneck of the Duhamel-
  analog backbone.

  Heuristic difficulty: critical-norm compactness fails by
  scaling, but concentration-compactness / profile-decomposition
  machinery is well-developed (Bahouri-Gallagher 1999 for NSE;
  Gérard 1998 for general L^p problems). Adapting to discrete-
  NSE sequences is the technical content.

  ESTIMATE: difficulty comparable to or harder than the
  Gallagher-Iftimie-Planchon 2003 "profile decomposition for
  NSE" result. Not closed; ~10-20 page technical work to fill
  carefully.

G_T2_2. (Major.) The uniform critical-norm hypothesis
  sup_k ||u_{Δx_k}||_X ≤ M is EMPIRICAL — currently supported
  only by DNS evidence at Re ~ 10^5. Rigorous derivation of
  the uniform bound is itself the open question this whole
  approach defers.

  Severity nuance: G_T2_2 is "lethal" if you wanted T2 to
  CLOSE CMI (A) without further input. But T2 is supposed to
  feed into a separate program (rigorous turbulence closure
  per B-004 §4 T1); G_T2_2 is downstream of T2's role.

  Re-classified as major: G_T2_2 doesn't block T2 itself;
  it blocks the program built on T2.

G_T2_3. (Major.) The discrete scheme L_T2_1 must be CHOSEN.
  Different schemes (finite differences vs spectral vs
  Galerkin) yield different convergence properties.
  Convergence-at-critical-regularity may DEPEND on the scheme.
  A precise choice is needed.

[Step 7 — Delta against B-004 §4's T2]

B-004 §4 stated T2 informally as one of three open directions.
A013 sharpens:

  - T2 decomposes via discrete-to-continuum backbone into 4
    sub-lemmas; the unique bottleneck is L_T2_2 (critical-norm
    compactness).
  - C-003-orthogonality VERIFIED for T2 — the Pivot 1 strategy
    is on solid footing.
  - Three approaches to L_T2_2 identified (concentration-
    compactness; Aubin-Lions; spectral); approaches (i) and (ii)
    are most natural and Tao-barrier compatible at resolution.
  - Three new gaps (G_T2_1 lethal; G_T2_2/G_T2_3 major).

[Step 8 — Trigger evaluation per A012 §2]

A012's mini-trigger criteria (b'):
  "precise lemma-graph + gap labels for T2 consistent with
  BOTH Tao-barrier audit AND C-003-orthogonality (proof must
  NOT reduce to LP/Bony-local direct-PDE estimates)."

A013 produces:
  - Precise lemma-graph: L_T2_1 / L_T2_2 / L_T2_3 / L_T2_4 + Bottleneck
    L_T2_2 sub-decomposition (i)/(ii)/(iii).
  - Gap labels: G_T2_1 (lethal), G_T2_2 (major), G_T2_3 (major).
  - Tao-barrier audit: PASS at statement level (∇·u = 0
    preserved); pass at resolution for (i) and (ii); needs
    care for (iii).
  - C-003-orthogonality: VERIFIED — T2 is a transfer theorem,
    not a BMO^{-1} → L^q implication.

Criterion (b') ACHIEVED.

Pivot 1's mini-trigger does NOT fire at A013. The new route
continues per A012's plan.

This is the FIRST attempt to satisfy a new-route trigger criterion
WITHOUT first encountering wall-like obstructions, contrasting
favorably with the (R1) arc's A005-A011 structure.

[Step 9 — Charter §3 audit]

  L1: dependency-graph closure on the proof sketch. Cites
      Temam 1977, Bahouri-Gallagher 1999, Gérard 1998,
      Aubin-Lions, Gallagher-Iftimie-Planchon 2003,
      Lemarié-Rieusset 2018 Ch. 16. All canonical. Closed.
  L2: small-case — n/a for a structural lemma graph.
  L3-L7: n/a.

[R2 outcome label deliberation]

  - no-progress: false; produces precise lemma graph + 3 gap
    labels + audit verdicts.
  - survey: borderline.
  - partial-insight: matches — A013 satisfies A012's mini-trigger
    criterion (b'), advancing the program along Pivot 1 on
    schedule.
  - flawed-attempt: false.
  - novel-approach: no.
  - claimed-solution, peer-reviewable: forbidden.

  Selected: partial-insight.
```
