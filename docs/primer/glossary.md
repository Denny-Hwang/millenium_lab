# Glossary

> Mathematical terms and rhetorical phrases. Living document — extend
> as new terms surface in attempts, candidates, reviews, or external
> reading. Each entry carries (a) a short definition, (b) usage
> context, and where relevant (c) a pointer to where the term first
> appeared in this repository or in cited external work.

---

## 1. Statement types

How much *proof obligation*, *centrality*, and *author confidence* a
label implies. Subtle differences; usage is not perfectly consistent
across the literature but the conventions below are the standard ones.

- **Theorem** — a major proved result. Carries the strongest claim;
  reserved for the load-bearing statements of the paper.
- **Proposition** — a proved result of moderate importance; typically
  a useful structural fact that is not the main result.
- **Lemma** — a proved result used as a stepping stone for something
  else; rarely interesting in isolation. Lemmas in this repository's
  attempts are labeled `L01`, `L02`, ...
- **Corollary** — a proved result that follows quickly from a
  preceding theorem or lemma.
- **Claim** — a proved (usually small) statement used inside a proof,
  often verified inline. Lighter weight than a lemma.
- **Fact** — used either for a folklore result the author does not
  reprove, or for a small statement asserted without proof. Read
  carefully: an unqualified "fact" can hide a deferred step.
- **Observation** — a small, often elementary point worth flagging;
  usually proved in one sentence.
- **Remark** — narrative aside; not part of the formal proof
  obligation.
- **Conjecture** — an unproved statement the author believes to be
  true; carries no proof obligation but may carry significant
  technical commitments. In this repository, conjectures live in
  `conjectures/` and are labeled `C-###`.
- **Hypothesis** — in this repository, often a *proposed* theorem
  statement (e.g., `H_AC⁰`) that an entire attempt program is
  organized around. In general mathematical usage, also: an antecedent
  of an implication.

## 2. Proof-internal vocabulary

- **Hypothesis / premise / assumption** — synonyms for the antecedent
  of an implication. *Axiom* is stronger: an assumption considered
  foundational.
- **Necessary** vs **sufficient** — $A$ is necessary for $B$ means
  $B \Rightarrow A$; $A$ is sufficient for $B$ means $A \Rightarrow B$.
  Mathematicians use these precisely; engineers sometimes do not.
- **iff** — "if and only if"; the biconditional $\Leftrightarrow$.
- **Vacuously true** — true because the hypothesis is never
  satisfied; e.g., "every element of the empty set has property $P$"
  is vacuously true.
- **Trivially** — true by a one-line argument the author judges
  beneath formal exposition. Often legitimate; sometimes a hidden
  gap. Verify before accepting.
- **WLOG (without loss of generality)** — used to omit cases that
  reduce to the assumed case by symmetry or relabeling. Valid when
  the symmetry is real; a frequent source of error when it is not.
- **By symmetry** — variant of WLOG.
- **By abuse of notation** — author overloads a symbol but expects
  context to disambiguate. E.g., A002's L02 uses
  $\mathcal{C}^{\mathrm{AC}^0}_{n,s,d}$ for the scheme, its set of
  closed points, and its underlying topological space.
- **Modulo $X$** — "up to $X$"; the statement holds after
  identifying things that differ only by $X$.
- **Up to $X$** — synonym for "modulo $X$". Common: "up to
  isomorphism", "up to constants", "up to a polynomial factor".
- **Generic** — the statement holds on a dense open / measure-1 / "all
  but a small exceptional set" subset. The technical meaning varies
  by context (Zariski-generic, measure-generic, Baire-generic, ...).
- **Sufficiently large** / **sufficiently small** — "for all $n \geq
  n_0$ for some $n_0$"; the bound is unstated but in principle
  computable.
- **In general position** — a hypothesis ruling out coincidences
  (collinear points, equal coordinates, etc.).

## 3. Latin and stock phrases

Still in active use in modern papers unless flagged.

- ***mutatis mutandis*** — "with the necessary changes"; signals
  that an argument repeats with obvious modifications. Common.
- ***a fortiori*** — "even more strongly"; introduces a consequence
  that is stronger than the immediate one. Common.
- ***a priori* / *a posteriori*** — "before / after" the argument;
  "a priori the set could be empty; a posteriori it is non-empty by
  ...".
- ***ad absurdum*** — used in "*reductio ad absurdum*", proof by
  contradiction.
- ***ceteris paribus*** — "other things equal"; somewhat archaic in
  pure math, common in applied work.
- ***cf.*** — "compare"; for a different but related reference.
- ***q.v.*** — "which see"; archaic; rare.
- ***viz.*** — "namely"; common in older literature.
- ***ibid.*** — "in the same place"; for a repeated citation.
- ***pace*** — "with all due respect to (a disagreement)"; rare.
- ***passim*** — "throughout"; used in citations to mean "see this
  reference in many places".

## 4. Hedging and emphasis

The mathematician's *register* — neither vague nor empty, but
precisely calibrated.

- **It suffices to show ...** — a reduction: it is enough to prove
  this smaller statement. Always followed by an argument that the
  reduction is valid.
- **It is enough to ...** — synonym for "it suffices to".
- **We may assume ...** — invokes WLOG or an earlier-justified
  simplification.
- **Note that ... / Observe that ...** — flags a small remark the
  reader could miss.
- **Indeed, ...** — backs up a claim just made; "let me justify
  what I just said".
- **In fact, ...** — strengthens a claim just made; "more is true".
- **Recall that ...** — refers to something stated earlier or
  considered common ground.
- **One checks that ...** — author is asserting a routine
  verification without writing it. Acceptable for genuinely routine
  cases; verify if it appears at a load-bearing step.
- **It is easy to see that ...** — *treacherous*. Sometimes
  legitimate, sometimes hides a gap. The reader's job is to
  *actually check* before accepting.
- **Heuristically / Morally ...** — author is giving intuition, not
  a proof. Allowed; the conclusion of a heuristic argument is *not*
  established.
- **It is plausible that** — author's opinion, no proof.
- **It is known that** — must be followed by a citation.

## 5. Existence, uniqueness, and modality

- **There exists $x$** / **there is an $x$** — existential
  quantifier. Mathematicians do not casually use "there's an $x$";
  the formal claim is precise.
- **There exists a unique $x$** — $\exists ! x$. Stronger than mere
  existence.
- **For some** vs **for any** vs **for all** — in informal
  mathematical English: "for any" is ambiguous and often means "for
  all"; in formal writing, prefer "for every" or "for all" for
  $\forall$ and "for some" for $\exists$.
- **Essentially unique** — unique up to a specified equivalence
  (isomorphism, canonical isomorphism, ...).
- **Canonically isomorphic** — isomorphic by a *natural* / preferred
  map, not just by any isomorphism. The category-theoretic notion
  of *natural* is the relevant one.
- **Natural** — in category theory: a transformation compatible with
  morphisms in a precise sense. In *Razborov–Rudich's* sense: a
  combinatorial property that is constructive, large, and useful (a
  technical term, *not* the colloquial meaning).

## 6. Sizes and growth

- $O(f)$ — "big-O"; upper bound up to a constant.
- $\Omega(f)$ — "big-Omega"; lower bound up to a constant.
- $\Theta(f)$ — both upper and lower bound up to constants.
- $o(f)$ — strictly slower than $f$.
- $\omega(f)$ — strictly faster than $f$.
- **Polynomial / sub-exponential / quasi-polynomial / exponential**
  — common growth classes; quasi-polynomial is $2^{(\log n)^{O(1)}}$.
- **At most / at least / of order** — modifiers on growth claims.
- **Asymptotically** — "for $n$ sufficiently large".

## 7. Repository-specific terms

Terms introduced inside this repository that are not yet standard
externally. Cite the attempt or bridge of origin.

- **H_0 program** — the master hypothesis pursued in
  `attempts/03-p-vs-np/A001-.../`, combining bridges B-001 (GCT ↔
  homological) and B-002 (natural proofs ↔ sheaf cohomology) and
  aiming to evade all three barriers (relativization, natural proofs,
  algebrization) simultaneously.
- **H_AC⁰** — the $\mathrm{AC}^0$ pilot version of H_0;
  introduced in `attempts/03-p-vs-np/A002-.../`, refined to H_AC⁰ v2
  in A004.
- **H_AC⁰ v2** — post-A003 form of H_AC⁰ with explicit quantifier
  order and the L11 → L11' replacement; instantiated in A004.
- **L11'** — proposed in A003, formally stated in A004:
  *succinct-input non-evaluation* of $F_{\mathrm{AC}^0}$. The current
  rate-limiting open lemma of the H_AC⁰ program.
- **Succinct program description** — input convention used in L11':
  a Boolean function is presented as a $\mathrm{poly}(n)$-bit program
  (Turing machine code or circuit description), not as a $2^n$-bit
  truth table. Distinguishes the natural-proofs *constructiveness*
  arm from its truth-table-evaluation degenerate case.
- **lethal-if-unresolved** — gap-severity label in result.md gap
  tables: a gap whose non-closure defeats the downstream strategy.
- **Rate-limiting open lemma** — the lemma on the critical path of
  the dependency graph whose proof timeline determines promotion.
  Currently L11'.
- **Bridge maturity `ai-discovered`** — a B-### bridge proposed by an
  attempt but not yet matured by formalization or independent
  verification. B-001 and B-002 are at this level.
- **Gate-set-specific** — descriptor for the H_AC⁰ scaffold: changing
  the gate set (e.g., $\mathrm{AC}^0 \to \mathrm{AC}^0[p]$) forces
  rebuilding L02, not relabeling. From A003.
- **Closed dependency graph** — a lemma graph in which every cited
  dependency is explicitly stated, even when not yet proved.
  Required for candidate promotion (charter §4.5).
- **Outcome label** — the seven attempt verdicts (`no-progress`,
  `survey`, `flawed-attempt`, `partial-insight`, `novel-approach`,
  `claimed-solution`, `peer-reviewable`); defined in
  `docs/methodology/outcome-taxonomy.md`.

---

## Open questions / TODO

- The "Latin and stock phrases" list above is conservative; some
  phrases (e.g., *pace*) appear in older but not modern papers.
  Add a "modernity" column once we have ~30 entries.
- The "Repository-specific terms" section currently leans heavily on
  03-p-vs-np artifacts; as other problems become active, balance the
  entries.
- Cross-reference each entry's first appearance with a specific
  file:line pair when an attempt that uses the term is finalized.
