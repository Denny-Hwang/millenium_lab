# Transcript — full AI conversation (frozen after merge)

> ⚠️ This file is **immutable** after the PR is merged — no edits, no
> deletions, not even typo or line-break fixes. Corrections are
> recorded in this folder's `result.md`.

---

## Meta

- Attempt ID: A008
- Model: claude-opus-4-7
- Start: 2026-05-21 (continuation of Claude Code on the Web session
  that produced A005–A007 on 2026-05-20)
- End: 2026-05-21
- Environment: Claude Code on the Web, ephemeral container, fresh
  clone at HEAD of `main` after PR #14 merge (A007). Macaulay2 /
  SageMath unavailable.

---

## Body

```text
[Session task framing]

User asked to continue. A007's follow-up scheduled A008 (Construction
A' twisted line bundle) and A009 (Construction A'' relative Ext) as
separate attempts at (2, 3, 2). Both share the same test setup (XOR
vs x_1 AND x_2 at (2, 3, 2)) and likely the same outcome direction,
so consolidating them into a single attempt is efficient. A007's
abandonment trigger requires three failed attempts; this one tests
two refinements at two ambients (T1 fan-in-1 = P^1; T3 both fan-in-1
= P^1 x P^1) for a more conclusive verdict.

[Reading order]

- A005, A006, A007 results.
- docs/primer/notation.md §9 (Grassmannian / Plücker).

[Construction A' setup]

Recall: L_f = eval^* O(D_f), where D_f is an f-specific divisor on
the eval target P(A^{2^n}). The natural choice (no canonical
alternative): D_f = "perpendicular hyperplane through chi_f" with
respect to the standard inner product on A^{2^n} = A^4 for n=2.

For each Boolean f on 2 bits, D_f is a hyperplane in P^3 of the form
{y · chi_f = 0}.

[Construction A' at T1 fan-in-1 (ambient = P^1)]

eval: P^1 -> P^3 by (p_1:p_2) -> (0 : p_2 : p_1 : p_1+p_2). Image
in P^3 is the line L_T1 = {y_{00} = 0, y_{11} = y_{01} + y_{10}}.

For f = XOR: chi_XOR = (0, 1, 1, 0). D_{XOR} = {y_{01} + y_{10} = 0}.
  Pull back via eval: p_2 + p_1 = 0, i.e., (p_1, p_2) on the line
  p_1 + p_2 = 0. On P^1 this is the single point (1 : -1).

For f = x_1 AND x_2: chi = (0, 0, 0, 1). D = {y_{11} = 0}.
  Pull back: (p_1 + p_2) = 0, also the single point (1 : -1) on
  P^1.

Same pullback divisor for both f. Construction A' at T1 fan-in-1
does not discriminate XOR from x_1 AND x_2.

[Construction A' at T3 both fan-in-1 (ambient = P^1 x P^1)]

For g_3 = AND (multiplicative interpretation in arithmetic
extension), eval: P^1 x P^1 -> P^3 by
  (p, q) -> (0 : p_2 q_2 : p_1 q_1 : (p_1+p_2)(q_1+q_2)).

This sends to bidegree-(1,1) sections; image factors through Segre
P^1 x P^1 -> P^3.

For f = XOR: D_{XOR} = {y_{01} + y_{10} = 0}.
  Pull back: p_2 q_2 + p_1 q_1 = 0, a bidegree-(1,1) divisor.
  As a curve on P^1 x P^1, this is the smooth diagonal-like curve
  cut out by an irreducible polynomial.

For f = x_1 AND x_2: D = {y_{11} = 0}.
  Pull back: (p_1 + p_2)(q_1 + q_2) = 0, also bidegree (1,1).
  This is REDUCIBLE: union of {p_1 + p_2 = 0} (a horizontal P^1)
  and {q_1 + q_2 = 0} (a vertical P^1).

In Pic(P^1 x P^1) = Z^2, both have CLASS (1, 1). So:
  c_1(L_{XOR}) = c_1(L_{x_1 AND x_2}) = (1, 1) ∈ Z^2.

Chern class does not discriminate. However:
  - D_{XOR} pullback is IRREDUCIBLE.
  - D_{x_1 AND x_2} pullback is REDUCIBLE (two components).

The divisors-as-schemes are distinguishable, but not via their
classes in Picard. Discrimination is via a *richer invariant*
(component structure, geometric genus, or equivalent) that is not
captured by the first Chern class.

[Construction A'' setup]

F_{AC^0} = Ext^1(O_B, O_AMB), the local Ext sheaf. Compute its H^1
in the two ambient cases.

[Construction A'' at T1 fan-in-1 (ambient = P^1)]

Boolean locus B = {(1:0), (0:1)} ⊂ P^1 (two points).

O_B as a coherent sheaf: O_{P^1} / I_B where I_B is the ideal sheaf
of two points, ≅ O(-2).

Apply Hom(-, O_{P^1}) to the SES 0 -> I_B -> O -> O_B -> 0:

  0 -> Hom(O_B, O) = 0 -> Hom(O, O) = O -> Hom(I_B, O) = O(2)
    -> Ext^1(O_B, O) -> Ext^1(O, O) = 0 -> ...

The map O -> O(2) is the natural inclusion (a regular function is
a section of O(2) vanishing at infinity in the appropriate sense).
Cokernel = O(2)/O = skyscraper at B with fiber Q at each of the
two points.

So Ext^1(O_B, O) = O_B(2) (skyscraper at B of length 2 in P^1
coordinates), an actual sheaf — call it S_B.

H^0(S_B) = Q^2 (global sections = sections at each point).
H^1(S_B) = 0 (skyscraper sheaves have no higher cohomology).

So H^1(P^1, F^{A''}_{AC^0}) = 0 at T1 fan-in-1.

Construction A'' at T1 fan-in-1 cannot produce non-zero H^1
classes; it cannot discriminate.

[Construction A'' at T3 both fan-in-1 (ambient = P^1 x P^1)]

P^1 x P^1 is a smooth 2-dim projective variety. For a smooth point
p of a 2-dim variety X, the Koszul-like resolution of O_p is

  0 -> O(-1,-1) -> O(-1, 0) ⊕ O(0, -1) -> O -> O_p -> 0.

Apply Hom(-, O) and take cohomology:

  Hom(O, O) = O
  Hom(O(-1, 0) ⊕ O(0, -1), O) = O(1, 0) ⊕ O(0, 1)
  Hom(O(-1, -1), O) = O(1, 1)

The cohomology of the complex O -> O(1,0) ⊕ O(0,1) -> O(1,1)
gives:
  Ext^0(O_p, O) = 0 (no nonzero hom from torsion to free)
  Ext^1(O_p, O) = 0 (by direct computation — the codim-2 case
    has vanishing Ext^1; this is a standard fact for smooth points
    of surfaces)
  Ext^2(O_p, O) = skyscraper at p with fiber Q.

For B = 4 points on P^1 x P^1: Ext^1(O_B, O) = 0 identically.

So Construction A'' at T3 gives F^{A''}_{AC^0} = 0 as a sheaf,
hence H^1 = 0 trivially.

The "right" Ext degree for 2-dim ambient is Ext^2, which is
non-trivial (skyscraper at B with total length 4). H^? of this
skyscraper:
  H^0(skyscraper) = Q^4 (one per point).
  H^1, H^2 of skyscraper = 0.

So Ext^2(O_B, O) as a global vector space is Q^4. This is a
candidate for an f-dependent invariant: the assignment f ->
[class in Ext^2] could in principle discriminate f's.

BUT: this is Ext^2, not Ext^1 / H^1. The shift in cohomological
degree is a structural change from A002's L05 framework, which
specifically uses H^1.

[Combined verdict]

  Refinement | T1 fan-in-1 (P^1) | T3 both fan-in-1 (P^1 x P^1)
  -----------|-------------------|------------------------------
  A'         | FAIL (same div)   | FAIL (same c_1 class)
  A''        | FAIL (skyscraper) | FAIL (Ext^1 = 0; right Ext is Ext^2)

Both refinements fail at the H^1 / first-Chern-class level, in both
ambient choices.

Discrimination DOES exist via richer invariants:
  - Divisor-as-scheme component structure (A' at T3).
  - Ext^2 instead of Ext^1 (A'' at T3, with H^0(Ext^2) = Q^4).
  - Geometric genus / arithmetic invariants of divisors.

But these invariants are NOT first cohomology of a coherent sheaf,
which is what A002's L05 (and B-002 informally) framed the program
around.

[Abandonment trigger evaluation]

A007's trigger: "if A008 + A009 + A011 fail to produce a working
F_{AC^0} within 3 follow-up attempts, the program revisits (R2)."

This attempt consolidates A008 + A009. Both fail at the H^1 level.
A011 (explicit eval coordinates) is clarification, not a test.

DECISION: NOT triggering (R2) abandonment yet. Reasons:

1. The failures are at the H^1 / Chern class level only; richer
   invariants do discriminate.
2. The "right" cohomological framework may be Ext^2 (in 2-dim
   ambient) or higher (in higher-dim ambient) — not Ext^1.
3. A007's trigger language "fail to produce a working F_{AC^0}" is
   ambiguous; "working" should include "right cohomological
   degree", which has not been settled.

But the trigger should be SHARPENED with explicit criteria:
  - A009 (next attempt): test a candidate based on Ext^2 or
    divisor-as-scheme invariants. If A009 ALSO fails at the level
    of "providing a coherent-sheaf cohomology class that discriminates",
    then (R2) abandonment is triggered.

[New gaps surfaced]

G015 (lethal-if-unresolved): the H_AC^0 program may require
  cohomological degree > 1 (Ext^2 or higher) in dimensions > 1, in
  tension with A002 L05's H^1 framing.

G016 (major): if the right discriminating invariant is the
  "divisor as scheme" rather than its Chern class, the natural-
  proofs framework (which targets H^1 of coherent sheaves
  specifically) may not engage. Razborov-Rudich does not
  obviously rule out richer-invariant frameworks, but they require
  a separate analysis.

[Charter §3 audit]

  L1: dependency graph closure — A002, A005, A006, A007, Hartshorne
      III all invoked; closed.
  L2: small-case — XOR / x_1 AND x_2 discrimination tested at (2,3,2)
      for both ambient choices, both refinements. Negative findings
      verified by direct computation.
  L3-L7: pending / n/a.

[R2 outcome label deliberation]

  - no-progress: false; new structural findings.
  - survey: false; concrete computations.
  - flawed-attempt: false; no false claim asserted.
  - partial-insight: matches — the refinements fail but the failure
    mode is structurally informative (cohomological degree shift,
    richer-invariant discrimination).
  - novel-approach: not in this attempt; we test existing proposals,
    we don't introduce a new technique.
  - claimed-solution, peer-reviewable: forbidden.

  Selected: partial-insight.
```
