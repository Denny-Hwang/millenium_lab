# Proof Techniques

> Inventory of standard techniques used in mathematical proofs.
> Living document — when an attempt uses a technique not yet listed,
> add an entry with the citation. Each entry: (a) one-line schema,
> (b) typical setup, (c) common pitfalls, (d) an example from this
> repository or from standard literature.

---

## 1. Direct proof

**Schema.** Assume the hypothesis $H$; derive the conclusion $C$ via
a chain of implications $H \Rightarrow A_1 \Rightarrow \cdots
\Rightarrow C$.

**Typical setup.** Most theorems whose statement begins "If ...,
then ..." are first attempted directly. The skill is in choosing
which intermediate steps to make explicit and which to absorb into
the reader's expected background.

**Pitfalls.** Skipping steps that "feel obvious" but smuggle in extra
assumptions; quietly using a converse $C \Rightarrow A$ where only
$A \Rightarrow C$ is justified; circular dependencies in the chain.

## 2. Proof by contrapositive

**Schema.** To show $H \Rightarrow C$, prove $\neg C \Rightarrow
\neg H$ instead.

**Typical setup.** Useful when the negated conclusion gives a more
concrete handle than the original conclusion. E.g., proving
"if $f$ is continuous and $X$ compact, then $f(X)$ is bounded" is
clean directly; proving "if $X$ is compact and $f(X)$ is unbounded,
then $f$ is not continuous" is sometimes cleaner.

**Pitfalls.** Confusing the contrapositive ($\neg C \Rightarrow
\neg H$) with the converse ($C \Rightarrow H$). They are different;
the contrapositive is logically equivalent to the original, the
converse is not.

## 3. Proof by contradiction (*reductio ad absurdum*)

**Schema.** Assume $H \wedge \neg C$; derive a contradiction $\bot$;
conclude $H \Rightarrow C$.

**Typical setup.** Useful when the assumption $\neg C$ yields a
concrete structure (e.g., a smallest counterexample) that can be
manipulated.

**Pitfalls.** Constructive readings: in intuitionistic / constructive
mathematics, $\neg \neg C \not\Rightarrow C$, so proof by
contradiction yields a weaker conclusion. Also: many "proofs by
contradiction" in textbooks are actually proofs by contrapositive
in disguise; the genuine $\bot$ comes only when an inconsistency is
derived.

## 4. Mathematical induction

**Schema (weak).** To prove $P(n)$ for all $n \in \mathbb{N}$: show
$P(0)$ (base case); show $P(n) \Rightarrow P(n+1)$ (inductive step).

**Variants.**

- **Strong (course-of-values) induction**: $\forall k < n.\;P(k)
  \Rightarrow P(n)$. Equivalent to weak induction but often more
  convenient.
- **Structural induction**: on the shape of an inductively-defined
  object (terms in a grammar, derivations in a calculus, trees,
  ...). Standard in computer science and logic.
- **Transfinite induction**: on a well-ordered set (countable or
  uncountable); requires the axiom of choice in the form of Zorn's
  lemma or well-ordering.

**Pitfalls.** Implicit base-case mishandling — e.g., the proof works
for $n \geq 1$ but is then asserted for $n \geq 0$ without a separate
check. Using the induction hypothesis on $n+1$ inside the step for
$n$. The "all horses are the same color" fallacy — induction step
that fails for the smallest non-trivial case.

## 5. Construction (existence by exhibition)

**Schema.** Build the object explicitly; verify it has the desired
property.

**Typical setup.** Often the strongest form of existence proof,
because it yields an effective procedure. Required when the target
of the proof is computational ("there exists an algorithm ...").

**Pitfalls.** Constructions that depend on undefined choices ("pick
some basis ...") obscure whether the result is well-defined.
Constructions valid only in a non-constructive metatheory (e.g.,
"choose a maximal element by Zorn") are not constructive in the
foundational sense.

## 6. Proof by exhaustion (cases)

**Schema.** Partition the hypothesis space into finitely many cases
$H_1, \ldots, H_k$; prove $H_i \Rightarrow C$ for each $i$.

**Typical setup.** Useful when the hypothesis space has natural
finite structure (parity, sign, dimension, ...).

**Pitfalls.** Missing cases (the partition is not exhaustive);
overlapping cases with inconsistent sub-conclusions; cases that look
distinct but reduce to one another (WLOG opportunities missed).
Computer-assisted exhaustion (e.g., four-color theorem) raises
verification questions of its own.

## 7. Pigeonhole principle

**Schema.** If $n+1$ objects are placed in $n$ boxes, some box
contains $\geq 2$ objects.

**Variants.** Generalized pigeonhole ($mn+1$ objects, $n$ boxes,
some box has $\geq m+1$); probabilistic pigeonhole (expectation
arguments); infinitary pigeonhole (König's lemma).

**Pitfalls.** Choosing the right partition into "boxes" is the
content of the proof — the principle itself is one line.

## 8. Probabilistic method

**Schema.** To show an object with property $P$ exists, define a
probability distribution on candidates and show $\Pr[P] > 0$.

**Typical setup.** Erdős's signature technique in combinatorics; the
probabilistic method shows existence of objects that are otherwise
hard to construct (Ramsey graph constructions, expanders, error-
correcting codes).

**Pitfalls.** Non-constructive — the proof does not produce the
object. Sometimes derandomizable (yielding a constructive proof);
sometimes not, in which case the method is genuinely the only
known route.

## 9. Diagonalization

**Schema.** Given an enumeration of candidates $f_1, f_2, \ldots$,
construct an object $g$ differing from each $f_n$ at position $n$.

**Typical setup.** Cantor's proof that $\mathbb{R}$ is uncountable;
the undecidability of the halting problem; time hierarchy theorems
in complexity; the Razborov–Rudich barrier (where diagonalization
of a different flavor is the obstruction, not the technique).

**Pitfalls.** The enumeration must be *effective* in the intended
sense; diagonalization "relativizes" (works equally well against any
oracle), which makes it incapable of resolving questions like P vs
NP where relativizing techniques are known to be insufficient
(see [`field-primers/03-p-vs-np.md`](field-primers/03-p-vs-np.md)
§2).

## 10. Compactness arguments

**Schema (topological).** A topological property of a space holds
"globally" if it can be verified on every open cover via a finite
sub-cover.

**Schema (logical).** A set of first-order sentences is satisfiable
if every finite subset is satisfiable.

**Typical setup.** The bridge from local information to global
conclusions. Examples: continuous functions on compact sets attain
their maximum; a graph is $k$-colorable iff every finite subgraph
is; the existence of non-standard models of arithmetic.

**Pitfalls.** Compactness in topology requires the space to be
compact (a real hypothesis, not a formal trick). Logical compactness
requires the language to be first-order (fails for second-order
logic).

## 11. Reduction

**Schema.** Solve $A$ by transforming instances of $A$ into instances
of $B$ in a way that preserves the answer; reduce $A$ to $B$.

**Typical setup.** Polynomial-time reductions in complexity (Karp
reductions, $\leq_p$); classical analytic reductions ("reduce to
the case where the function vanishes at the origin"); reductions
to a normal form.

**Pitfalls.** The reduction must preserve the *cost measure* of
interest. A reduction that solves $A$ via $B$ with overhead beyond
the cost budget is invalid.

## 12. Symmetry / WLOG

**Schema.** "Without loss of generality, assume property $X$."
Valid when the cases excluded by assuming $X$ are reducible to the
$X$-case by a symmetry of the problem.

**Typical setup.** Reordering inputs; reflecting / rotating;
relabeling; quotienting by a group action.

**Pitfalls.** WLOG is used to *hide a real case distinction* — the
symmetry is asserted but not actually present. Spot-check by
explicitly running the omitted case for a small instance.

## 13. Variational / extremal arguments

**Schema.** Among all candidates satisfying $H$, consider the one
extremizing some quantity $\Phi$. Show that this extremal candidate
must satisfy $C$.

**Typical setup.** Functional analysis (minimize an energy);
combinatorics (smallest counterexample); geometric topology (the
shortest geodesic in a free homotopy class).

**Pitfalls.** The extremizer must *exist* — this is itself a real
hypothesis (compactness, lower semicontinuity, or an explicit
existence argument). Many "proofs" assume existence of a minimizer
that turns out not to exist.

## 14. Encoding / decoding (information-theoretic lower bounds)

**Schema.** To lower-bound the complexity of $A$, show that a
hypothetical fast solver could be used as a compression scheme for
some quantity whose Shannon entropy gives the bound.

**Typical setup.** Communication complexity lower bounds; cell-
probe lower bounds; some lower bounds in cryptography.

**Pitfalls.** The encoding must actually preserve the information
claimed; the decoder must be implementable within the cost budget
of the lower-bound argument.

---

## Open questions / TODO

- Add per-problem cross-reference: which technique tends to appear
  in which Millennium problem's literature.
- For each technique, record at least one *failure mode* observed
  in this repository's attempts (failure as asset, charter §4.4).
- Add an entry on *self-reference / fixed-point techniques* (used
  in Gödel's incompleteness, Kleene's recursion theorem) once an
  attempt that touches them lands.
