# Result — Summary

Written when the attempt terminates. Assign exactly one outcome label
and state the key insights and follow-up suggestions.

---

## Conclusion (one line)

H_AC⁰ is restated with explicit existential-uniform quantifier
structure ($\exists$ $s = n^{O(1)}$, $d = O(1)$, $\forall f$), and
the lethal L11 is replaced by L11' (non-evaluation on succinct
program-description inputs); the resulting hypothesis is no longer
tautological under reading (i) and no longer trivially false under
the truth-table reading.

## Outcome Label

- Label: `partial-insight`
- Reason: A004 discharges the two lowest-difficulty repairs flagged
  by A003 (A6 quantifier discipline, A5 input-representation fix
  via L11'). The result is a *substantively different* statement
  of H_AC⁰ — not a clarification — because it changes the input
  domain of the constructiveness check from $\{0,1\}^{2^n}$ truth
  tables to succinct program descriptions of length
  $\mathrm{poly}(n)$. This is more than `survey` (the old
  formulation is now provably wrong, not merely ambiguous) but less
  than `novel-approach` (no new theorem proved; the open problem
  has been *sharpened*, not closed).

> The labels `claimed-solution` and `peer-reviewable` are forbidden at
> this stage. See
> [`../../../docs/methodology/outcome-taxonomy.md`](../../../docs/methodology/outcome-taxonomy.md).

---

## 1. Restated H_AC⁰ (existential-uniform reading)

**Statement (H_AC⁰, v2).** There exist functions
$s : \mathbb{N} \to \mathbb{N}$ and $d : \mathbb{N} \to \mathbb{N}$
satisfying

$$
  s(n) = n^{O(1)}, \qquad d(n) = O(1),
$$

such that for every $n \in \mathbb{N}$ and every Boolean function
$f : \{0,1\}^n \to \{0,1\}$,

$$
  f \notin \mathrm{AC}^0
  \;\;\Longleftrightarrow\;\;
  [F_{\mathrm{AC}^0}]_{f}^{(n,s(n),d(n))} \neq 0
  \;\; \text{in}\;\;
  H^1\!\bigl(
    \mathcal{C}^{\mathrm{AC}^0}_{n,\,s(n),\,d(n)},\;
    F_{\mathrm{AC}^0}^{(n,s(n),d(n))}
  \bigr).
$$

The class $[F_{\mathrm{AC}^0}]_{f}^{(n,s,d)}$ is the cohomology
class assigned to $f$ by the construction of L04, evaluated on the
moduli $\mathcal{C}^{\mathrm{AC}^0}_{n,s,d}$ of L02.

Quantifier order: $\exists s, d \;\forall n, f$. The witnesses
$s, d$ are *uniform across $f$* (and across $n$, in the sense that
they are functions of $n$ alone; they do not depend on the
specific Boolean function being tested).

This kills A003's A6 reading (i) tautology: the choice of $s, d$
cannot be after-the-fact, so the trivial witness "let $s$ be the
size of an actual AC⁰ circuit for $f$" is not allowed.

## 2. Updated lemmas

### L05 (v2) — Hard direction (uniform witnesses)

- **Statement.** For the witnesses $(s(n), d(n))$ supplied by
  H_AC⁰ v2, if $f \notin \mathrm{AC}^0$ then
  $[F_{\mathrm{AC}^0}]_f^{(n,s(n),d(n))} \neq 0$.
- **Dependencies.** L01–L04, L07.
- **Difficulty.** **high** (unchanged).
- **Gaps.** G002, G003 carry over from A002. New gap **G007**:
  the proof must produce $s, d$ before quantifying over $f$; any
  $f$-dependent choice silently restores the tautology.

### L06 (v2) — Easy direction (uniform witnesses)

- **Statement.** For the same witnesses, if
  $f \in \mathrm{AC}^0$ then
  $[F_{\mathrm{AC}^0}]_f^{(n,s(n),d(n))} = 0$.
- **Dependencies.** L01–L04.
- **Difficulty.** medium (was low in A002 — the uniformity
  constraint upgrades difficulty by one notch because the proof
  must show the cohomology class vanishes *for the chosen
  uniform $s, d$*, not for a $f$-specific choice).
- **Gaps.** none new; G004 from A002 carries over.

### L10 (v2) — Combination

- **Statement.** L05 (v2) and L06 (v2) together imply H_AC⁰ v2.
- **Dependencies.** L05 (v2), L06 (v2).
- **Difficulty.** low — direct biconditional in the quantifier-fixed
  formulation.
- **Gaps.** none.

### L11' — Quantitative non-evaluation on succinct inputs (NEW)

- **Statement.** Fix the witnesses $(s(n), d(n))$ from H_AC⁰ v2.
  Define an *evaluator* for $F_{\mathrm{AC}^0}$ as an algorithm
  $\mathcal{E}$ that, given an input pair
  $(1^n, \pi)$ where $\pi \in \{0,1\}^{\mathrm{poly}(n)}$ is a
  *succinct program description* of a Boolean function
  $f_\pi : \{0,1\}^n \to \{0,1\}$ (e.g., a Turing machine of
  description length $\mathrm{poly}(n)$, or a circuit description
  of size $\mathrm{poly}(n)$), outputs a Boolean answer to
  "$[F_{\mathrm{AC}^0}]_{f_\pi}^{(n,s(n),d(n))} \neq 0$ ?".
  Claim: no such $\mathcal{E}$ runs in time $2^{O(n)}$ uniformly
  in $n$.
- **Dependencies.** L04, L05 (v2), L06 (v2);
  [Razborov–Rudich 1997, Theorem 1]; standard circuit-description
  succinctness assumptions.
- **Difficulty.** **high** — open problem. This *is* the
  rate-limiting question of the H_AC⁰ program. Equivalent in
  spirit to a coNP-hardness lower bound on AC⁰-membership for
  succinctly-presented functions; the literature
  ([Hirahara 2018, 2020s meta-complexity]) has partial
  conditional results but no unconditional bound.
- **Gaps.** G008 (severity: lethal-if-unresolved): without L11',
  the natural-proofs barrier is not escaped, so even a complete
  proof of L05 (v2) ∧ L06 (v2) does not yield a P-vs-NP-grade
  separation. **G008 is the new bottleneck of the entire H_0
  program.**

The truth-table evaluator that A003's A5 used to refute L11 is
explicitly excluded by the input-domain change: a truth table of
length $2^n$ is not a succinct program description, so the
$2^{O(n)}$-time enumeration of AC⁰ circuits does not constitute
an evaluator in the sense of L11'. This closes the circularity
A003 identified; it does not, however, close G008.

## 3. Delta against A002

### Same (unchanged)

- Lemmas L01, L02, L03, L04, L07, L08, L09, L12, L13, L14: same
  statements, same dependencies, same difficulty, same gaps as in
  A002. (L02's quasi-projectivity / irreducibility patches from
  A003-A1, A003-A2 are deferred to A006; this attempt is
  patch-scoped.)
- The 14-lemma dependency graph topology is unchanged except that
  L11 is replaced by L11'; the edge L04 → L11 becomes L04, L05,
  L06 → L11' (L11' depends on the cohomology class behavior
  established by L05 v2, L06 v2).

### Changed

- **H_AC⁰ statement**: implicit quantifier on $(s, d)$ → explicit
  $\exists s, d \;\forall n, f$ with $s = n^{O(1)}$, $d = O(1)$.
- **L05 difficulty annotation**: high (unchanged level) but with
  added uniformity obligation noted in G007.
- **L06 difficulty annotation**: low → medium (uniformity).
- **L10 statement**: now references the v2 lemmas; logical content
  unchanged.

### Deleted

- **L11** (truth-table evaluator non-existence) — A003-A5 showed
  the statement is false; deletion is forced.

### Added

- **L11'** (succinct-input evaluator non-existence).
- **G007** (uniform witnesses obligation on L05 v2 / L06 v2 proofs).
- **G008** (open-problem severity on L11'); **G008 supersedes G006
  of A002**, which mis-identified the source of circularity.

## 4. Assumptions used

- Axiom of choice: not used; the witnesses $s, d$ are explicit
  computable functions of $n$, so no choice principle is invoked.
- Standard scheme-theoretic background (L02, L03, L04
  prerequisites) carried over from A002.
- Razborov–Rudich [1997, Theorem 1] used as a cited external
  result for L11'.
- *No new* large-cardinal, set-theoretic, or non-constructive
  hypotheses are introduced by the restatement.

## 5. New gaps

| ID | Lemma | Severity | Description |
|----|-------|----------|-------------|
| G007 | L05 (v2), L06 (v2) | major | The uniform-witnesses obligation must be discharged before quantification over $f$; any $f$-dependent choice of $(s, d)$ silently restores the A6 tautology. The proof of L05/L06 must explicitly construct $s, d$ first. |
| G008 | L11' | **lethal-if-unresolved** | Non-evaluation of $F_{\mathrm{AC}^0}$ on succinct program-description inputs is itself an open problem at the meta-complexity level; without it the natural-proofs audit fails and H_AC⁰ does not yield a P/poly separation. **Replaces G006 from A002 as the rate-limiting open lemma.** |

The L02-quasi-projective and L02-irreducibility gaps from A003
(A1, A2) and the L08-base-case gap (A003-A4) are *unchanged*
relative to A003 and remain to be discharged in subsequent
attempts (A006, A007).

## 6. Quantifier-discipline self-check (re-run A003's A6)

Reading test on H_AC⁰ v2:

- **Reading (i) (∀ f ∃ s, d).** Excluded by the explicit
  quantifier order $\exists s, d \;\forall n, f$. The trivial
  witness "let $s$ = AC⁰-circuit-size of $f$" is not allowed
  because $s$ is fixed *before* $f$.
- **Reading (ii) (∃ uniform s, d ∀ f).** This is the stated
  reading. The witnesses depend on $n$ alone, with
  $s(n) = n^{O(1)}$, $d(n) = O(1)$ — both growth bounds are the
  ones natural for the P-vs-NP-grade separation that H_AC⁰ is
  intended to underwrite.

Conclusion: A003's A6 patch is closed by H_AC⁰ v2.

A003's A5 patch is closed by replacing L11 with L11', as
discussed in §2.

A003's A1, A2, A4 patches are *not* addressed in this attempt
(deferred to A006/A007 by design).

---

## Key Insights

- **The natural-proofs audit lives or dies on succinct vs
  truth-table inputs.** A002's informal phrasing of L11
  conflated the two; once the input domain is fixed to succinct
  program descriptions, the trivial circuit-enumeration evaluator
  is excluded *by length*, not by any deep cohomological
  property. This is good news — the lethal-risk is a definitional
  artifact, not a structural one — and bad news: the resulting
  L11' is a meta-complexity open problem in its own right.
- **Quantifier order is load-bearing.** The drift from $\exists
  \forall$ to $\forall \exists$ in informal mathematical English
  is exactly the failure mode A003-A6 identified. Future
  attempts in this program should state quantifier order
  explicitly *every time* H_AC⁰ is invoked; we will spot-check
  this discipline in subsequent adversarial rounds.
- **The H_0 program is now stratified by difficulty.** Three
  remaining patches (A1, A2, A4) are scheme-theoretic and
  bounded-difficulty; one (G008/L11') is open-problem grade.
  Candidate promotion can plausibly proceed conditionally on
  L11', but the conditional must be displayed prominently.

## Follow-ups

1. **A005**: state and begin to prove L11' (quantitative
   non-evaluation of $F_{\mathrm{AC}^0}$ on succinct inputs).
   Likely spawns its own sub-attempts; expected outcome
   `partial-insight` or `survey` first round, given the
   meta-complexity dependence.
2. **A006**: discharge L02 quasi-projectivity (A003-A1) and
   L02 irreducibility / component-uniformity (A003-A2) via
   concrete moduli construction.
3. **A007**: discharge L08 base-case (A003-A4) for $n \in \{0, 1\}$
   and the inductive step.
4. **B-002 update (post-A005)**: re-rate the bridge maturity once
   L11' has progress; until then maturity stays at
   `ai-discovered`.
5. **Cross-model adversarial round on H_AC⁰ v2 + L11'**: charter
   §4.3 requires this for any L4 verdict. Pending a different
   actor.
6. **R6 cross-attempt synthesis** (after A005–A007 land):
   re-evaluate the H_0 program against
   `docs/problems/03-p-vs-np/verification-bar.md` §2 with the
   sharpened obstruction.

## References

- attempt: `attempts/03-p-vs-np/A002-2026-04-29-claude-opus-4-7/`
  (source 14-lemma scaffold; L05, L06, L10, L11 are the targets
  of the restatement).
- attempt: `attempts/03-p-vs-np/A003-2026-04-29-claude-opus-4-7/`
  (adversarial review; A5 and A6 patches are discharged here).
- attempt: `attempts/03-p-vs-np/A001-2026-04-29-claude-opus-4-7/`
  (origin of H_0 program).
- bridge: `bridges/B-002-natural-proofs-sheaf-cohomology.md`
  (downstream consumer; will need re-rating after A005).
- prompt: `prompts/P03-lemma-extraction.md` (template; minor
  variant noted in `prompt.md`).
- doc: `docs/problems/03-p-vs-np/verification-bar.md` §2
  (three-barrier audit).
- External:
  - [Razborov–Rudich 1997] *Natural Proofs*,
    J. Comput. Syst. Sci. 55(1):24–35.
  - [Hirahara 2018] On the non-black-box complexity of
    Minimum Circuit Size Problem, ITCS / TOCT.
  - [Carmosino–Impagliazzo–Kabanets–Kolokolova 2016] meta-
    complexity foundations relevant to L11'.
