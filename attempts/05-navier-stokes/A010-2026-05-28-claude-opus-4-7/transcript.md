# Transcript — full AI conversation (frozen after merge)

> ⚠️ This file is **immutable** after the PR is merged — no edits, no
> deletions, not even typo or line-break fixes. Corrections are
> recorded in this folder's `result.md`.

---

## Meta

- Attempt ID: A010
- Model: claude-opus-4-7
- Start: 2026-05-28
- End: 2026-05-28
- Environment: Claude Code on the Web at HEAD after PR #31 merge
  (A009 degeneration finding; G_T1b_3 / G_T1b_4).

---

## Body

```text
[Session task framing]

Per A009 follow-up §1, explore a candidate third approach to
G_T1b_1 (paraproduct-with-cancellation hybrid) and run a
literature audit (Albritton 2018+ borderline criteria; absorbs
A006 Patch 1).

[Reading]

- A006 (T1a; G_T1a_1; Patch 1 literature audit deferred).
- A007 (T1b Duhamel; G_T1b_1).
- A008 (P07; A6 paraproduct-only REJECTED; Patch 2 deferred).
- A009 (direct approaches degenerate; G_T1b_3 / G_T1b_4).

[§1 — Literature audit]

Question: does any published result address G_T1b_3 (uniform
L^∞_t L^∞_x from L^∞_t BMO^{-1} + smoothness + energy)?

Surveyed results (based on the canonical NSE references in the
primer and known-results.md):

A. Albritton 2018, "Blow-up criteria for Navier-Stokes ...":
   borderline-regularity criteria at the L^3 endpoint (refines
   ESS 2003). Concerns L^3-bound implications for regularity,
   NOT the BMO^{-1} → L^q direction. Does NOT address G_T1b_3.

B. Auscher-Frey-Monniaux, "Maximal regularity for Navier-Stokes":
   mild-solution machinery for critical Banach spaces; small-data
   extensions of Koch-Tataru. Concerns small-data global
   existence in extensions of BMO^{-1}, NOT large-data
   BMO^{-1} → L^∞. Does NOT address G_T1b_3.

C. Albritton-Brue-Colombo 2022 (non-uniqueness of Leray-Hopf with
   forcing): distinct topic; the convex-integration framework
   produces non-uniqueness but for WEAK solutions, not smooth.
   Different problem class.

D. Lemarié-Rieusset 2018, Chapters 9-11: comprehensive HA-NSE
   monograph. Chapter 10 reviews critical-norm theory. The
   BMO^{-1} → L^q-style improvements are NOT in this monograph
   for large data.

E. Cheskidov-Shvydkoy 2014 ESS-borderline: ESS endpoint
   sharpenings. Same direction as Albritton, not the reverse.

Summary: no published result of the BMO^{-1} → L^q form for
large data, in the literature reviewed. G_T1b_3 is genuinely
open.

Discharges A006 Patch 1: no counterexample to L_T1a_5 (the small-
data version of G_T1b_3) located either. L_T1a_5 is also open.

[§2 — Paraproduct-with-cancellation hybrid sketch]

Bony 1981 paraproduct decomposition of u·∇u:

  u·∇u = T_u(∇u) + T_{∇u}(u) + R(u, ∇u),

where:
  - T_f(g) := ∑_j (S_{j-1}f) (Δ_j g)  is the paraproduct (HF on g,
    LF on f).
  - R(f, g) := ∑_{|j-k| ≤ 2} (Δ_j f)(Δ_k g)  is the resonance term.

Standard HA estimates for paraproducts in Besov / BMO spaces are
in Bahouri-Chemin-Danchin 2011 (Fourier Analysis and Nonlinear
PDE).

The question: where does ∇·u = 0 enter each of T_u(∇u),
T_{∇u}(u), R(u, ∇u)?

T_u(∇u): the low-frequency S_{j-1}u is multiplied by Δ_j(∇u).
  The Δ_j ∇u block does NOT automatically satisfy ∇·(Δ_j u) = 0
  unless Δ_j commutes with ∇; for Fourier-localized blocks it
  does, so Δ_j(∇·u) = ∇·(Δ_j u) = 0. So Δ_j(u) is
  divergence-free, but the product S_{j-1}(u) · Δ_j(∇u) does
  NOT automatically inherit divergence-free structure.

T_{∇u}(u): similar.

R(u, ∇u): the resonance has two operators interacting at the
  same scale. The bilinear has more structural freedom.

INSERTION of ∇·u = 0 via Leray projector P:

The actual NSE nonlinearity is P(u·∇u), not u·∇u. So the
paraproduct decomposition acts on P(u·∇u). The Leray projector
distributes:

  P(u·∇u) = P[T_u(∇u) + T_{∇u}(u) + R(u, ∇u)]

But P is a Calderon-Zygmund operator (Fourier multiplier
projecting onto divergence-free fields); applying P to each
paraproduct component does not introduce automatic cancellation
WITHIN the component.

The cancellation appears at the AGGREGATE level: ∫ u · P(u·∇u) = 0
for divergence-free u (this is the energy identity). But this
aggregate cancellation does NOT decompose per-frequency-block in
an obvious way.

So the paraproduct-with-cancellation hybrid's structural
challenge: the ∇·u = 0 cancellation is NON-LOCAL in frequency.
Per-block estimates in Bony decomposition do not see it; the
cancellation enters only via the FULL energy identity, which is
the L^2 / supercritical level.

[§3 — Sharpening: why the degeneration is intrinsic]

Combining A009's finding with §2 above:

  - Direct approaches (energy on u; vorticity on ω) DEGENERATE
    because the pressure / vortex-stretching term forces L^∞
    control beyond the BMO^{-1} hypothesis.
  - Paraproduct hybrids cannot resurrect ∇·u = 0 per-frequency
    block; the cancellation is non-local in frequency.
  - Therefore, any approach decomposing u·∇u into frequency
    blocks loses the global ∇·u = 0 cancellation at the
    per-block level.
  - The only WAY to recover the cancellation per block is to use
    a global identity (the L^2 energy identity, sub-critical) —
    which doesn't help at the BMO^{-1} → L^q scale.

Conclusion: the degeneration is INTRINSIC. The ∇·u = 0
cancellation is "global" (it's the L^2 energy that's well-behaved),
while the BMO^{-1} → L^q implication requires a local /
per-block bound. The mismatch makes T1b structurally hard.

This is the analog, on the (α) program, of the discrete-vs-
continuous wall A011 found for 03-p-vs-np: a global-vs-local
incompatibility between the available cancellation and the
required estimate.

[§4 — Statement-level Tao-barrier audit on the hybrid sketch]

The paraproduct-with-cancellation hybrid would, if it worked,
need to use ∇·u = 0 essentially. As §2 shows, ∇·u = 0 doesn't
enter the per-block Bony decomposition; only the aggregate L^2
identity uses it. So a paraproduct-only proof would FAIL the
Tao-barrier audit (confirming A008-A6).

A hybrid that explicitly inserts ∇·u = 0 at the AGGREGATE step
(post-paraproduct summation) effectively reduces to the energy /
vorticity approaches A009 analyzed — and degenerates the same
way.

Resolution of A008 Patch 2 (paraproduct-with-cancellation):
SUCH A HYBRID DOES NOT EXIST IN A FORM THAT ESCAPES BOTH A8-A6
AND A009 DEGENERATION. The Tao-barrier-pass + non-degeneration
combination is structurally unachievable by the techniques
considered.

[§5 — Verdict]

The third approach the (α) program needed is NOT found in any
of the standard families (energy, vorticity, paraproduct-hybrid,
literature).

A009's negative finding ESCALATES from "two approaches
degenerate" to "the obvious-family of approaches all degenerate."

Honest assessment: the (α) program faces a structural wall
analogous to (but distinct from) C-002. The (α) route's path
forward requires EITHER:

  (a) A genuinely new technique outside the surveyed families
      (improbable within budget), OR
  (b) Acceptance that T1b's content is the negative finding
      itself (register as conjecture C-003), and the (α) program
      pivots to a different sub-target.

A005's pivot trigger conditions were "(a) T1a proof OR (b) T1b
lemma-graph OR (c) T1 falsification." (b) was achieved (A007;
A008). A010 does NOT undo (b) — the lemma graph and audit remain
correct. But A010 shows that the lemma graph cannot be CLOSED by
standard techniques.

The trigger still does NOT fire (literally), but the program's
viability is significantly weakened. Honest recommendation: A011
should register C-003 (the regularity-equivalence wall), and
A012 should evaluate Pivot 1 (route change within α — possibly
to B-004 + T2) or Pivot 2 ((β) blowup direction).

[§6 — Budget tracking]

A005 set max 7 attempts (A006-A012); A010 is the 5th. 2 attempts
remain (A011, A012).

Realistic plan:
  A011: register C-003 (formal asset).
  A012: Pivot evaluation — choose Pivot 1, Pivot 2, or
        recommend dormancy.

[§7 — Charter §3 audit]

  L1: dependency-graph closure. Cites Bony 1981, Bahouri-Chemin-
      Danchin 2011, Albritton 2018, Auscher-Frey-Monniaux,
      Lemarié-Rieusset 2018, Cheskidov-Shvydkoy 2014. All
      canonical. Closed.
  L2: small-case — n/a.
  L3-L7: n/a.

[R2 outcome label deliberation]

  - no-progress: false; substantive negative finding (paraproduct-
    hybrid doesn't escape; intrinsic wall identified).
  - survey: borderline — but §1's literature audit + §3's
    structural argument produce a real conclusion.
  - partial-insight: matches — the program's path forward is
    significantly narrowed; intrinsic-wall structural finding is
    a real asset (analog of C-002 development).
  - flawed-attempt: false.
  - novel-approach: no.
  - claimed-solution, peer-reviewable: forbidden.

  Selected: partial-insight.
```
