# Proof Techniques

> Inventory of standard techniques used in mathematical proofs.
> Living document — when an attempt uses a technique not yet listed,
> add an entry with the citation. Each entry: (a) one-line schema,
> (b) typical setup, (c) common pitfalls, (d) an example from this
> repository or from standard literature.

---

## 1. Direct proof

TODO: Schema: assume hypothesis $H$, derive conclusion $C$ by a
chain of implications. Common pitfall: skipping steps that feel
"obvious" but smuggle in extra assumptions.

## 2. Proof by contrapositive

TODO: To show $H \Rightarrow C$, prove $\neg C \Rightarrow \neg H$.
Different from contradiction; sometimes cleaner.

## 3. Proof by contradiction (*reductio ad absurdum*)

TODO: Assume $H \wedge \neg C$, derive $\bot$. Pitfalls:
constructive vs classical readings; conclusion may be weaker than
intended in intuitionistic settings.

## 4. Mathematical induction

TODO:

- Ordinary (weak) induction on $\mathbb{N}$.
- Strong (course-of-values) induction.
- Structural induction (on the shape of an inductively defined
  object — terms, trees, derivations).
- Transfinite induction (on a well-ordered set).
- Common pitfall: implicit base-case mishandling at $n = 0$ vs
  $n = 1$; using the induction hypothesis where it doesn't apply.

## 5. Construction (existence by exhibition)

TODO: Build the object explicitly. Often the strongest form of an
existence proof; sometimes the only one acceptable in constructive
or computational settings.

## 6. Proof by exhaustion (cases)

TODO: Partition the hypothesis space into finitely many cases,
prove each. Pitfalls: missing cases; overlapping cases with
inconsistent conclusions.

## 7. Pigeonhole principle

TODO: If $n+1$ objects are placed in $n$ boxes, some box contains
at least two. Variants: generalized pigeonhole, probabilistic
pigeonhole.

## 8. Probabilistic method

TODO: Show an object with desired property exists by proving a
random object has it with positive probability. Often
non-constructive; sometimes derandomizable.

## 9. Diagonalization

TODO: Cantor's diagonal, halting-problem-style diagonal,
Razborov–Rudich-style natural-proofs barrier. Key idea: enumerate
candidates and construct an object differing from each. Pitfall:
the enumeration must be effective in the intended sense.

## 10. Compactness arguments

TODO: From topology (every cover has a finite subcover) and from
logic (every finitely-satisfiable set of formulas is satisfiable).
Often the bridge that lets local information yield global
conclusions.

## 11. Reduction

TODO: Reduce problem $A$ to problem $B$ such that solving $B$
solves $A$. Common in complexity (polynomial-time reductions) and
in classical analysis (reduce to a known case).

## 12. Symmetry / WLOG

TODO: "Without loss of generality, assume X." Valid when the
omitted cases reduce to the assumed one by a symmetry or
relabeling. Pitfall: WLOG used to hide a real case distinction.

## 13. Variational / extremal arguments

TODO: Consider the object minimizing or maximizing some quantity;
show it must have the desired property. Common in analysis,
combinatorics, and PDE.

## 14. Encoding / decoding (information-theoretic lower bounds)

TODO: Bound a problem's hardness by showing a hypothetical solver
would compress information past a Shannon limit.

---

## Open questions / TODO

- Add per-problem cross-reference: which technique tends to appear
  in which Millennium problem's literature.
- For each technique, record at least one *failure mode* observed
  in this repository's attempts (failure as asset, charter §4.4).
