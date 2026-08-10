# Transcript — A013 (condensed working record)

Session: claude-fable-5, 2026-08-10, Claude Code remote environment.
Web access via the session's egress proxy; two sources
(claymath.org, lance.fortnow.com) were egress-blocked and are cited
from search-result snippets only, marked below.

## Method

Web searches along the five axes named in `prompt.md`, each query keyed
to one of A012's residual cracks or to the problem's barrier landscape.
Queries (paraphrased) and what each returned:

1. **psd rank / SDP extension complexity of the perfect matching
   polytope** — returned the standing literature only: Rothvoss (J. ACM
   2017) for the LP side; Fawzi–Gouveia–Parrilo–Robinson–Thomas-adjacent
   fixed-block-size SDP lower bounds for the cut polytope
   (arXiv:1311.2571); Braun–Pokutta-line approximation lower bounds for
   matching (arXiv:1711.10145). Multiple sources state the psd rank of
   the matching polytope is unknown. **No 2025–2026 result found that
   resolves or moves crack (i).**

2. **Broad 2025–2026 complexity progress** — Clay Mathematics Institute
   ran a "P vs NP and Complexity Lower Bounds" workshop (Sept 2025, 25th
   anniversary of the Millennium Problems) [abstracts page egress-blocked;
   search snippet only]. Explicit general circuit lower bounds remain at
   ~3.1n − o(n). Fortnow's 2025 year-in-review [egress-blocked; snippet]
   names Williams' time–space simulation as the year's highlight.

3. **Williams, "Simulating Time With Square-Root Space" (STOC 2025, best
   paper; ECCC TR25-017)** — TIME[t] ⊆ SPACE[√(t log t)] on multitape
   TMs, via the Cook–Mertz tree-evaluation procedure. Consequences:
   size-s circuits evaluable in √s·polylog(s) space; explicit O(n)-space
   problems requiring n²/polylog(n) time; extension to t^ε space for all
   ε would give P ≠ PSPACE.

4. **Follow-up: Henzinger–Pyne–Ragavan, ECCC TR26-022 (Feb 2026)** —
   catalytic TreeEval with O(log n) free space, polynomial time,
   2^(log^ε n) catalytic space; inspired by matching-vector families /
   PIR. Opens an attack on TreeEval ∈ L; improves the time-vs-catalytic-
   space simulation via Williams' reduction.

5. **Lifting theorems 2025–2026** — de Rezende–Vinyals, "Lifting with
   Colourful Sunflowers" (CCC 2025): DAG-like query-to-communication
   lifting over non-binary alphabets gives (a) n^Ω(k) monotone lower
   bound for k-clique up to k ≤ n^(1/2−ε), and (b) an exp(Ω(n^(1/3−ε)))
   monotone circuit lower bound **for a function in P**, beating the
   approximation method. Also: deterministic one-way NOF lifting (ECCC
   TR25-073). Both compose between restricted models; neither lifts to
   uniform models.

6. **GCT / representation theory 2025–2026** — van den Berg–Dutta–
   Gesmundo–Ikenmeyer–Lysikov, "Algebraic metacomplexity and
   representation theory" (CCC 2025; arXiv:2411.03444): isotypic
   decomposition of metapolynomials at quasipolynomial circuit-size
   cost; hence algebraic natural proofs are WLOG isotypic (resolving an
   open question); proof via PBW theorem + Gelfand–Tsetlin theory. GCT
   for product-plus-power (J. Symbolic Computation 2026). No
   occurrence-obstruction reversal; nothing crossing the wall.

7. **Meta-complexity 2025** — Huang–Ilango–Ren (SICOMP 2025):
   near-optimal NP-hardness of approximating conditional K^t under
   subexponentially-secure witness encryption. MCSP NP-completeness
   still open.

8. **Claimed P vs NP proofs 2025–2026** — continued flow, none
   surviving review; one 2026 claim contradicted Williams' simulation
   and assumed a fixed form for any SAT algorithm.

## Assessment against the repository's anchors

- Crack (i) — psd rank of matching: **open, unmoved**. Either-answer
  implications from A012 unchanged.
- Crack (ii) — Cook–Levin tableau spectrahedral encodings: no external
  work found; still unexplored (absence of evidence, recorded as such).
- Crack (iii) — bounded-cancellation arithmetic models: no direct
  movement; adjacent monotone technology advanced (item 5); Hrubeš's
  monotone-to-general program remains the entry point.
- Crack (iv) / model-lift wall: item 5(b) is a **new, stronger witness
  inside the monotone family** — a P-function with exponential monotone
  complexity obtained by lifting rather than the approximation method.
  Model-faithful-but-not-uniform-faithful, exactly the wall's pattern.
  Nothing found composes lifting upward to uniform models; A012 K2
  stands unrefuted.
- Barrier landscape: item 6 tightens the algebraic-natural-proofs side
  relevant to B-002 (WLOG isotypic ⇒ the GCT symmetry restriction on
  candidate "natural properties" costs at most quasipoly).
- New axis outside C-002's quantification: items 3–4 (time–space /
  catalytic). Targets P vs PSPACE, not P vs NP, but it is the largest
  real movement in the neighborhood and is orthogonal to every encoding
  family the wall quantifies over. Candidate bridge; P02 not run in this
  attempt.

Full source list in `result.md`.
