# Result — Summary

Written when the attempt terminates. Assign exactly one outcome label
and state the key insights and follow-up suggestions.

---

## Conclusion (one line)

Literature trace (plan milestone 0) over 2025–2026: none of A012's four
residual cracks has been resolved externally — the psd rank of the
matching polytope is still open and crack (ii) untouched — but the
model-lift wall gained a stronger monotone witness (de Rezende–Vinyals,
CCC 2025: exponential monotone lower bound for a function in P, by
lifting), algebraic natural proofs were shown WLOG isotypic (CCC 2025),
and the largest genuine movement in the neighborhood is an axis outside
C-002's quantification entirely — Williams' TIME[t] ⊆ SPACE[√(t log t)]
(STOC 2025) and the catalytic TreeEval follow-up (ECCC TR26-022,
Feb 2026) — which targets P vs PSPACE.

## Outcome Label

- Label: `survey`
- Reason: The attempt organizes external knowledge against the
  repository's anchors and discharges plan milestone 0; it corrects no
  prior record and proposes no new technique of ours. Evidence rows are
  strengthened (C-002) but the substantive conclusions of A012 are
  confirmed rather than changed. Above `no-progress` (the trace has
  operational consequences for A014's target selection); below
  `partial-insight` (no new synthesis beyond what the sources state).

> The labels `claimed-solution` and `peer-reviewable` are forbidden at
> this stage. See
> [`../../docs/methodology/outcome-taxonomy.md`](../../docs/methodology/outcome-taxonomy.md).

---

## 1. The four cracks, one by one

### Crack (i) — psd rank / SDP extension complexity of the perfect matching polytope

**Status: open, unmoved.** The literature stands where A012 left it:
exponential *LP* extension complexity (Rothvoss, J. ACM 2017);
exponential lower bounds for *fixed-block-size* SDP formulations of the
cut polytope (Fawzi et al., arXiv:1311.2571); lower bounds for
*approximating* the matching polytope by LPs (arXiv:1711.10145). The
unrestricted psd rank of the matching polytope is explicitly described
as unknown in the surveyed sources. No 2025–2026 result moves it.
A012's either-answer analysis is unchanged: sub-exponential psd rank
would break the LP/SDP analogy at the exact point the model-lift wall
predicts is load-bearing; exponential psd rank would add a second
theorem-level witness on the SDP side.

### Crack (ii) — Cook–Levin tableau spectrahedral encodings

**Status: untouched.** No external work found on spectrahedral
encodings of computation tableaux. This remains the unexplored,
plausibly non-relativizing direction — and, being absent from the
literature, the highest-novelty target this repository can attack
without racing anyone.

### Crack (iii) — bounded-cancellation arithmetic models

**Status: no direct movement; adjacent tooling improved.** Hrubeš's
monotone-to-general program remains the entry point. The adjacent
advance is in monotone technology (next item), which is the model
bounded-cancellation interpolates toward.

### Crack (iv) — the model-lift step itself

**Status: A012's characterization stands; the wall's evidence
strengthened.** de Rezende–Vinyals (CCC 2025, "Lifting with Colourful
Sunflowers") prove, via DAG-like lifting over non-binary alphabets:

- an n^Ω(k) monotone circuit lower bound for k-clique up to
  k ≤ n^(1/2−ε), and
- an **exp(Ω(n^(1/3−ε))) monotone circuit lower bound for a function
  in P**, surpassing what the approximation method gives.

The second bound is a new, stronger witness of the exact pattern the
model-lift wall names: a model-restricted invariant assigning
near-maximal hardness to a uniformly-easy function. It joins
Razborov–Tardos (monotone), G019 (arithmetic), Rothvoss+Edmonds (LP)
and Grigoriev/Schoenebeck+Gaussian-elimination (SOS) — and it was
obtained by *lifting*, the very machinery crack (iv) asks about, which
still composes only sideways (also: deterministic one-way NOF lifting,
ECCC TR25-073). Nothing found lifts to uniform models.

## 2. Developments outside the cracks

### The time–space / catalytic axis (the real movement)

- **Williams (STOC 2025, best paper; ECCC TR25-017)**:
  TIME[t] ⊆ SPACE[√(t log t)] on multitape machines, via Cook–Mertz
  tree evaluation. Consequences: size-s circuits evaluable in
  √s·polylog(s) space; explicit O(n)-space problems needing
  n²/polylog(n) time; improving the simulation to t^ε space for all
  ε > 0 would yield **P ≠ PSPACE**.
- **Henzinger–Pyne–Ragavan (ECCC TR26-022, Feb 2026)**: catalytic
  TreeEval with O(log n) free space, polynomial time, 2^(log^ε n)
  catalytic space, via matching-vector families / PIR; opens an attack
  on TreeEval ∈ L and improves the time-vs-catalytic-space simulation
  through Williams' reduction.

For this repository the point is structural: this axis is **outside the
family C-002 quantifies over** (it is not an algebraic-geometric
encoding of circuits at all), it is currently the fastest-moving front
adjacent to P vs NP, and its target is P vs PSPACE. It is bridge-shaped
(catalytic/space-bounded computation ↔ the barrier landscape) but no
P02 run was done here; registering it is a follow-up decision.

### Algebraic natural proofs constrained (bears on B-002)

van den Berg–Dutta–Gesmundo–Ikenmeyer–Lysikov (CCC 2025,
arXiv:2411.03444): isotypic decomposition of metapolynomials costs only
a quasipolynomial circuit-size blowup, so algebraic natural proofs can
be assumed isotypic WLOG (resolving an open question; proof via
Poincaré–Birkhoff–Witt + Gelfand–Tsetlin). For the dormant bridge B-002
and any future barrier audit of a C-002-style route: the
representation-theoretic symmetry restriction on candidate properties
is essentially free, so "the property must be isotypic" is no longer a
loophole an encoding can hide in.

### Meta-complexity and general lower bounds

Huang–Ilango–Ren (SICOMP 2025): near-optimal NP-hardness of
approximating conditional time-bounded Kolmogorov complexity, under
subexponentially-secure witness encryption. MCSP NP-completeness
remains open. Explicit general circuit lower bounds remain ~3.1n − o(n)
— unchanged. Re-activation trigger (2) (a non-algebraic invariant
escaping C-001's quantification) has **not** been met by anything
found.

### Community state

Clay ran a 25th-anniversary "P vs NP and Complexity Lower Bounds"
workshop (Sept 2025) [abstracts inaccessible from this environment;
noted from search snippets]. The flow of claimed P≠NP/P=NP proofs
continues; none survived review in the window surveyed.

## Key Insights

- No re-activation trigger and no residual crack was resolved
  externally between 2026-07 (A012) and 2026-08: crack (i) open, crack
  (ii) untouched, crack (iii) unmoved, crack (iv) unrefuted.
- The model-lift wall's evidence base grew: an exponential monotone
  lower bound for a P-function via lifting (de Rezende–Vinyals) is a
  sharper model-faithful-but-not-uniform-faithful witness than the
  approximation-method bounds it supersedes.
- Lifting technology advanced (non-binary sunflower DAG lifting; one-way
  NOF lifting) and still composes only between restricted models —
  consistent with A012 K2's "sideways, never upward" characterization.
- Algebraic natural proofs are WLOG isotypic at quasipoly cost — the
  symmetry loophole in barrier audits closes.
- The largest real movement adjacent to the problem (Williams 2025 +
  catalytic TreeEval 2026) lies on an axis C-002 does not quantify
  over, and it targets P vs PSPACE. If this repository ever wants a
  route family orthogonal to the wall by construction, this is the one
  the external community has already opened.

## Claims (ledger)

| Claim | Kind | Status | Formalizability | Lean target |
|-------|------|--------|-----------------|-------------|
| A013-K1 | finding | unformalized | not-mathematical | — |
| A013-K2 | cited-theorem | unformalized | needs-infrastructure | — |
| A013-K3 | finding | unformalized | shape-only | — |
| A013-K4 | cited-theorem | unformalized | needs-infrastructure | — |
| A013-K5 | cited-theorem | unformalized | needs-infrastructure | — |
| A013-K6 | methodological | unformalized | not-mathematical | — |

## Follow-ups

1. **A014 (highest novelty, unchanged from A012):** construct the
   Cook–Levin tableau spectrahedral encoding at the smallest
   non-trivial scale (crack (ii)) — still absent from the external
   literature, so still ours to open.
2. **P02 run on the catalytic/time–space axis:** decide whether
   Williams 2025 + TR26-022 constitutes a bridge (candidate B-005:
   space-bounded/catalytic computation ↔ complexity barrier landscape)
   or is out of scope for a P-vs-NP repository because its target is
   P vs PSPACE. A deliberate decision either way, recorded.
3. **C-002 evidence row** for the de Rezende–Vinyals witness (done in
   this PR, conjectures/ commit).
4. **P10-literature-trace prompt** in its own PR, so surveys stop
   needing the deviation note in `prompt.md`.
5. **Plan milestone 1 rewrite candidate:** milestone 0's trace shows
   crack (i) is not being worked externally either; keep it as a
   monitored assumption rather than spending an attempt re-deriving
   the literature (this attempt already did).

## References

- attempt: `attempts/03-p-vs-np/A012-2026-07-04-claude-fable-5/`
  (the four cracks; the model-lift wall).
- conjecture: `conjectures/C-002-discrete-continuous-wall/`.
- bridge: `bridges/B-002-natural-proofs-sheaf-cohomology.md` (bearing
  of the isotypic result).
- plan: `formalization/ledger/Ledger/Plan.lean` (milestone 0).
- external (surveyed):
  - Williams, *Simulating Time With Square-Root Space*, STOC 2025
    (best paper); ECCC TR25-017.
  - Henzinger, Pyne, Ragavan, *catalytic TreeEval*, ECCC TR26-022
    (Feb 2026).
  - Cook, Mertz, *Tree Evaluation is in space O(log n · log log n)*,
    STOC 2024.
  - de Rezende, Vinyals, *Lifting with Colourful Sunflowers*, CCC 2025
    (LIPIcs 339, 36).
  - *Deterministic Lifting Theorems for One-Way Number-on-Forehead
    Communication*, ECCC TR25-073.
  - van den Berg, Dutta, Gesmundo, Ikenmeyer, Lysikov, *Algebraic
    metacomplexity and representation theory*, CCC 2025;
    arXiv:2411.03444.
  - Dutta, Gesmundo, Ikenmeyer, Jindal, Lysikov, *Geometric complexity
    theory for product-plus-power*, J. Symbolic Computation 2026.
  - Huang, Ilango, Ren, *NP-Hardness of Approximating Meta-Complexity:
    A Cryptographic Approach*, SIAM J. Computing 2025.
  - Rothvoss, *The matching polytope has exponential extension
    complexity*, J. ACM 64 (2017).
  - *Exponential lower bounds on fixed-size psd rank and semidefinite
    extension complexity*, arXiv:1311.2571.
  - *Lower Bounds for Approximating the Matching Polytope*,
    arXiv:1711.10145.
  - Clay Mathematics Institute, *P vs NP and Complexity Lower Bounds*
    workshop, Sept 2025 [egress-blocked; search snippets only].
  - Fortnow, *Computational Complexity 2025 Year in Review*
    [egress-blocked; search snippets only].
