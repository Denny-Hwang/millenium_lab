# 03 — P vs NP

> Status in this repository: `not-started` (no merged candidate);
> attempts active. Currently the only Millennium problem with
> ongoing attempts (A001–A004 on the H_AC⁰ pilot program). This
> primer is the highest-priority file to fill in.

---

## 1. Problem statement

TODO: Is $\mathrm{P} = \mathrm{NP}$? That is, can every problem
whose solutions are *verifiable* in polynomial time also be
*solved* in polynomial time? Paraphrase carefully — the official
statement uses Turing machines as the computational model and
worst-case running time as the cost measure.

## 2. Why it is hard

TODO: Three classical *barriers* are known to rule out broad
classes of proof technique.

- **Relativization barrier** (Baker–Gill–Solovay 1975): any
  proof must not relativize.
- **Natural proofs barrier** (Razborov–Rudich 1997): under
  cryptographic assumptions, no "natural" combinatorial property
  can separate $\mathrm{P}$ from $\mathrm{NP}$.
- **Algebrization barrier** (Aaronson–Wigderson 2008): any proof
  must not algebrize.

Together these barriers say that the proof cannot work by any of
the techniques that worked in the 20th century for *smaller*
separation results.

## 3. Minimum vocabulary

TODO: deterministic / non-deterministic Turing machine,
polynomial-time, polynomial-time reduction (Karp reduction),
$\mathrm{NP}$-completeness, circuit (Boolean, arithmetic), circuit
complexity, $\mathrm{AC}^0$, $\mathrm{TC}^0$, $\mathrm{NC}^k$,
$\mathrm{P}/\mathrm{poly}$, oracle, relativization, natural proof,
algebrization, meta-complexity.

## 4. Prior results to know about

TODO:

- Cook (1971), Levin (1973): $\mathrm{NP}$-completeness; SAT.
- Karp (1972): 21 problems are $\mathrm{NP}$-complete.
- Furst–Saxe–Sipser (1984), Yao (1985), Håstad (1986):
  $\mathrm{PARITY} \notin \mathrm{AC}^0$ — the foundational
  $\mathrm{AC}^0$ lower bound that this repository's H_AC⁰
  program builds on.
- Razborov (1985): monotone-circuit lower bound for CLIQUE.
- The three barriers above.
- Williams (2011): $\mathrm{NEXP} \not\subseteq
  \mathrm{ACC}^0$ — a recent breakthrough using non-relativizing
  techniques.

## 5. Failed approaches and barriers

TODO: See §2 for the meta-barriers. Specific past programs:
combinatorial circuit lower bounds (blocked by natural proofs);
algebraic approaches (subject to algebrization); proof complexity
(no full lower bounds known).

## 6. Recommended starting reading

TODO:

- Arora & Barak, *Computational Complexity* — the modern
  textbook.
- Aaronson, *P =? NP* (survey, 2017, arXiv).
- Wigderson, *Mathematics and Computation* — broader context,
  free online.
- Razborov–Rudich, *Natural Proofs*, JCSS 1997 — original
  natural-proofs barrier paper.

## 7. Glossary deltas

TODO: To be promoted from the repository's H_AC⁰ program:

- `H_AC⁰` (and `H_AC⁰ v2`) — the local cohomology-based
  conjecture used as a pilot vehicle for the H_0 program.
- `lethal-if-unresolved` gap-severity label.
- `succinct program description` — input convention from L11'.
- Bridges `B-001` (GCT ↔ homological circuit complexity) and
  `B-002` (natural proofs ↔ sheaf cohomology).

## 8. Reading order within the repository

TODO: Suggested order for a non-specialist starting from zero.

1. `docs/problems/03-p-vs-np/README.md`
2. `docs/problems/03-p-vs-np/statement.md`
3. `docs/problems/03-p-vs-np/known-results.md`
4. `docs/problems/03-p-vs-np/failed-approaches.md`
5. `bridges/B-001-gct-homological-circuit.md` and
   `bridges/B-002-natural-proofs-sheaf-cohomology.md`
6. `attempts/03-p-vs-np/A001/.../result.md` → A002 → A003 → A004.
