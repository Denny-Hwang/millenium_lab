# 03 — P vs NP

> Status in this repository: `not-started` (no merged candidate);
> attempts active. Currently the only Millennium problem with
> ongoing attempts (A001–A004 on the H_AC⁰ pilot program). This
> primer is the highest-priority field-primer file.

---

## 1. Problem statement

The official question: **does $\mathrm{P} = \mathrm{NP}$?** Equivalently,
can every decision problem whose "yes" instances are *verifiable* in
polynomial time also be *solved* in polynomial time?

Formally (from `docs/problems/03-p-vs-np/statement.md`):

- A language $L$ is in $\mathrm{P}$ iff there exists a deterministic
  Turing machine $M$ and a polynomial $p$ such that $M$ halts within
  $p(|x|)$ steps and $M(x) = 1$ iff $x \in L$.
- A language $L$ is in $\mathrm{NP}$ iff there exist a verifier $V$
  and a polynomial $p$ such that $x \in L$ iff there exists a witness
  $w$ with $|w| \leq p(|x|)$ and $V(x, w) = 1$ in time $p(|x|)$.

A CMI-eligible resolution must do one of:

- exhibit a polynomial-time algorithm for an $\mathrm{NP}$-complete
  problem (3-SAT, vertex-cover, subset-sum); or
- prove a super-polynomial lower bound on deterministic time for an
  $\mathrm{NP}$-complete problem.

Out of scope (does not settle CMI): relativized separations (already
known to exist), heuristic average-case results, weaker statements like
$\mathrm{NEXP} \not\subseteq \mathrm{P}/\mathrm{poly}$ alone. See
`statement.md` §3.

## 2. Why it is hard

Three formal *barriers* together rule out the techniques that worked
for smaller separation results in the 20th century. A new proof must
evade *all three*.

1. **Relativization barrier** — Baker–Gill–Solovay (1975) exhibit
   oracles $A, B$ with $\mathrm{P}^A = \mathrm{NP}^A$ and
   $\mathrm{P}^B \neq \mathrm{NP}^B$. Any proof that goes through
   regardless of the oracle ("relativizes") cannot resolve P vs NP.
   This blocks pure diagonalization and naive simulation.
2. **Natural proofs barrier** — Razborov–Rudich (1997). A
   combinatorial property of Boolean functions that is *constructive*
   (decidable in time $2^{O(n)}$), *large* (holds for at least
   $2^{-O(n)} \cdot 2^{2^n}$ functions), and *useful* (every function
   with the property is hard for the target class) cannot witness a
   $\mathrm{P}/\mathrm{poly}$ lower bound unless standard
   cryptographic assumptions fail.
3. **Algebrization barrier** — Aaronson–Wigderson (2008). A proof
   that survives access to low-degree algebraic extensions of an
   oracle ("algebrizes") cannot separate $\mathrm{P}$ from
   $\mathrm{NP}$. Even arithmetization (the technique behind
   $\mathrm{IP} = \mathrm{PSPACE}$) algebrizes.

A new proof must therefore be non-relativizing, non-natural in the
Razborov–Rudich sense, and non-algebrizing. See
`docs/problems/03-p-vs-np/failed-approaches.md` for detail.

## 3. Minimum vocabulary

A non-specialist should recognize the following before reading any
attempt on this problem. Definitions accumulate in
[`../glossary.md`](../glossary.md) and
[`../notation.md`](../notation.md); the list below is just a
reading-list.

- **Turing-machine concepts**: deterministic vs non-deterministic TM,
  polynomial-time, polynomial-time reduction (Karp reduction),
  $\mathrm{NP}$-completeness.
- **Complexity classes**: $\mathrm{P}, \mathrm{NP}, \mathrm{coNP},
  \mathrm{BPP}, \mathrm{PSPACE}, \mathrm{EXP}, \mathrm{NEXP},
  \mathrm{P}/\mathrm{poly}, \mathrm{PH}$.
- **Circuit classes**: $\mathrm{AC}^0, \mathrm{AC}^0[p], \mathrm{ACC}^0,
  \mathrm{NC}^k, \mathrm{TC}^0$. The H_AC⁰ program operates in
  $\mathrm{AC}^0$ as a pilot domain.
- **Algebraic-complexity classes**: $\mathrm{VP}, \mathrm{VNP},
  \mathrm{VBP}$ (Valiant's model).
- **Proof-technique vocabulary**: oracle, relativization,
  diagonalization, natural proof (and its three arms — constructive,
  large, useful), algebrization, arithmetization, meta-complexity.
- **GCT-specific** (Geometric Complexity Theory): algebraic variety,
  orbit closure, Zariski closure, representation-theoretic
  obstruction, plethysm, Kronecker coefficient.
- **Homological circuit complexity** (this repository's H_0 program):
  scheme, moduli space, quasi-projective, irreducible, coherent
  sheaf, equivariant sheaf, sheaf cohomology, Čech cohomology, Borel
  construction.

## 4. Prior results to know about

In rough chronological order:

- **Cook (1971), Levin (1973)**: SAT is the first
  $\mathrm{NP}$-complete problem; collapses P vs NP to a single
  question.
- **Karp (1972)**: 21 natural problems shown $\mathrm{NP}$-complete;
  establishes the ubiquity of NP-completeness.
- **Hartmanis–Stearns (1965)**: time / space hierarchy theorems —
  the *only* proved class separations $\mathrm{P} \subsetneq
  \mathrm{EXP}$ etc., via diagonalization.
- **Baker–Gill–Solovay (1975)**: relativization barrier (above).
- **Furst–Saxe–Sipser (1984), Yao (1985), Håstad (1986)**:
  $\mathrm{PARITY} \notin \mathrm{AC}^0$ — the foundational
  super-polynomial lower bound the H_AC⁰ pilot builds on.
- **Razborov (1985)**: exponential monotone-circuit lower bound for
  CLIQUE; the non-monotone analogue remains open.
- **Razborov–Smolensky (1987)**: parity over $\mathbb{F}_q$ is not in
  $\mathrm{AC}^0[p]$ for $p \neq q$.
- **Toda (1991)**: $\mathrm{PH} \subseteq \mathrm{P}^{\#\mathrm{P}}$.
- **Lund–Fortnow–Karloff–Nisan / Shamir (1990–1992)**: $\mathrm{IP} =
  \mathrm{PSPACE}$. Key example of a *non-relativizing* technique
  (arithmetization).
- **Arora et al. / Arora–Safra (1992)**: PCP theorem — tight
  inapproximability for many NP-hard problems.
- **Razborov–Rudich (1997)**: natural proofs barrier (above).
- **Mulmuley–Sohoni (2001, 2008)**: Geometric Complexity Theory —
  attempted route to separate $\mathrm{VP}$ from $\mathrm{VNP}$ via
  representation-theoretic obstructions on orbit closures.
- **Aaronson–Wigderson (2008)**: algebrization barrier (above).
- **Williams (2011)**: $\mathrm{NEXP} \not\subseteq \mathrm{ACC}^0$ —
  a non-relativizing, non-natural lower bound; demonstrates the
  barriers are not absolute.
- **Bürgisser–Ikenmeyer (2019)**: no-occurrence-obstructions theorem
  — GCT is not a cure-all; certain representation-theoretic
  obstructions provably do not exist for determinant vs permanent.

References: `docs/problems/03-p-vs-np/known-results.md`.

## 5. Failed approaches and barriers

Beyond the three meta-barriers, the following specific routes have
been tried repeatedly and have failed (or are known to be insufficient).
See `docs/problems/03-p-vs-np/failed-approaches.md` §2.

- **Gadget reductions** (counting, expanders, locally-decodable codes)
  — run into natural proofs in disguise.
- **"Approximation is easier"** — refuted by the PCP theorem.
- **SAT-solver empirical efficiency** — hard instance families
  (random 3-SAT at the threshold, Tseitin formulas) remain
  intractable; empirical efficiency does not imply worst-case
  polynomial time.
- **Monotone-to-non-monotone lifting** — Razborov's exponential
  monotone CLIQUE lower bound does not lift; the gap is wide open.
- **Conflating NP-hardness with cryptographic hardness** — these are
  distinct; the connection between MCSP-style meta-complexity and
  one-way functions is currently being clarified but is not a
  separation tool.
- **Claimed P = NP algorithms** — historically high failure rate;
  this repository's verification bar requires worst-case analysis,
  correctness proof, *and* benchmark verification on hard instances
  (`verification-bar.md`).

The repository's own verification rule for any candidate on this
problem: it must include a **three-barrier self-audit** showing the
proof is non-relativizing, non-natural, and non-algebrizing
(`verification-bar.md` §1–2).

## 6. Recommended starting reading

In order of approachability:

- **Arora & Barak**, *Computational Complexity: A Modern Approach*
  (Cambridge, 2009) — the modern textbook; covers everything in §1–5
  above.
- **Wigderson**, *Mathematics and Computation* (Princeton, 2019;
  freely available online) — broader context, less technical.
- **Aaronson**, *P =? NP* (survey, 2017, arXiv) — an opinionated map
  of the territory.
- **Razborov & Rudich**, *Natural Proofs*, JCSS 1997 — original
  natural-proofs paper; short and worth reading directly.
- **Aaronson & Wigderson**, *Algebrization*, ACM TOCT 2008 — original
  algebrization paper.
- **Mulmuley & Sohoni**, *Geometric Complexity Theory I*, SIAM J.
  Comput. 2001 — foundational GCT paper; technically demanding.
- **Hartshorne**, *Algebraic Geometry* (Springer GTM 52, 1977) —
  scheme-theoretic background needed to read this repository's H_AC⁰
  lemmas L02–L08.

## 7. Glossary deltas — terms originating in this repository

These are terms or labels introduced inside Millennium Lab itself.
They are not standard external vocabulary; cite the attempt of
origin when using them.

- **H_0 program** — the master hypothesis combining bridges B-001
  (GCT ↔ homological circuit complexity) and B-002 (natural proofs ↔
  sheaf cohomology), proposing a route that aims to evade *all three*
  barriers simultaneously. First framed in A001
  (`attempts/03-p-vs-np/A001-.../result.md`).
- **H_AC⁰** — the $\mathrm{AC}^0$ *pilot* version of H_0, stated
  formally in A002 with a 14-lemma dependency graph. Original form:
  $f \notin \mathrm{AC}^0 \iff [F_{\mathrm{AC}^0}]_f \neq 0$ in
  $H^1(\mathcal{C}^{\mathrm{AC}^0}_{n,s,d}, F_{\mathrm{AC}^0})$.
- **H_AC⁰ v2** — the post-patch version applied in A004 after A003's
  adversarial review: explicit quantifier order $\exists s, d
  \;\forall n, f$ with $s = n^{O(1)}, d = O(1)$; L11 replaced by L11'.
- **L11'** — proposed in A003, instantiated in A004. *Succinct-input
  non-evaluation* of $F_{\mathrm{AC}^0}$: no $2^{O(n)}$-time
  algorithm decides whether
  $[F_{\mathrm{AC}^0}]_{f_\pi}^{(n,s(n),d(n))} \neq 0$ when $f_\pi$ is
  given by a $\mathrm{poly}(n)$-length program description rather
  than a $2^n$-length truth table. This is the new rate-limiting
  open lemma for the program.
- **succinct program description** — input-representation convention
  used in L11': the function is presented as a $\mathrm{poly}(n)$-bit
  program (e.g., a Turing-machine code or circuit description), not
  as its truth table. This is the device that lets L11' escape the
  natural-proofs *constructiveness* arm.
- **lethal-if-unresolved** — gap-severity label: a gap that, if not
  closed, defeats the entire downstream strategy. Defined operationally
  in `attempts/.../result.md` gap tables; see G001–G008 in the H_AC⁰
  attempts.
- **rate-limiting open lemma** — the lemma on the critical path of
  the dependency graph whose proof determines the timeline for
  promotion. L11' currently holds this role.
- **bridge maturity `ai-discovered`** — a B-### bridge that has been
  *proposed* by an attempt but not yet matured by formalization or
  independent verification; bridges B-001 and B-002 are at this
  level.

## 8. Reading order within the repository

Suggested order for a non-specialist starting from zero.

1. `docs/problems/03-p-vs-np/README.md`
2. `docs/problems/03-p-vs-np/statement.md`
3. `docs/problems/03-p-vs-np/equivalent-forms.md`
4. `docs/problems/03-p-vs-np/known-results.md`
5. `docs/problems/03-p-vs-np/failed-approaches.md`
6. `docs/problems/03-p-vs-np/verification-bar.md`
7. `bridges/B-001-gct-homological-circuit.md`
8. `bridges/B-002-natural-proofs-sheaf-cohomology.md`
9. `attempts/03-p-vs-np/A001-.../result.md` (panel; B-001/B-002 born)
10. `attempts/03-p-vs-np/A002-.../result.md` (14-lemma scaffold)
11. `attempts/03-p-vs-np/A003-.../result.md` (adversarial review;
    L11 lethal; L11' proposed)
12. `attempts/03-p-vs-np/A004-.../result.md` (quantifier + L11→L11'
    patches applied)

## H_AC⁰ program evolution at a glance

| Attempt | Role | New terms introduced |
|---------|------|----------------------|
| A001 | survey / five-domain panel | H_0; bridge candidates B-001, B-002 |
| A002 | lemma extraction (P03) | H_AC⁰; lemmas L01–L14; $\mathcal{C}^{\mathrm{AC}^0}_{n,s,d}$; $F_{\mathrm{AC}^0}$; $[F]_f$; gap labels G001–G006; `lethal-if-unresolved` |
| A003 | adversarial review (P07) | L11 lethal-risk verdict; **L11' proposed**; "rate-limiting"; H_AC⁰ v2 patch list |
| A004 | patch application | H_AC⁰ v2 (quantifier-explicit); L11 replaced by L11' formally; gaps G007 (uniform witnesses), G008 (open-problem on L11') |

A005–A007 are sketched in A004's follow-ups: A005 begins the proof of
L11'; A006 patches L02 (quasi-projective + irreducible); A007 closes
L08's base case. A separate numerical-computation attempt (proposing
to compute $H^1$ for small $n$ with Macaulay2 / SageMath) is sketched
in A002 §6 as a future deferred task; it has *not yet* been run.
