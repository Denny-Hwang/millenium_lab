# 03 — P vs NP — Equivalent Forms

This file catalogues statements equivalent (or strictly stronger /
weaker) than $\mathbf{P} = \mathbf{NP}$. Every attempt or candidate in
this repository must state precisely which of these forms it targets
(see the `claim.md` template under `candidates/_TEMPLATE/`).

Throughout, $\Sigma = \{0,1\}$ and "polynomial" means polynomial in
the input length.

## 1. Equivalent Statements

The following are **equivalent** to $\mathbf{P} = \mathbf{NP}$.

### 1.1 NP-complete in P

Some (equivalently, every) $\mathbf{NP}$-complete language lies in
$\mathbf{P}$. Concretely:

- $\textsf{3SAT} \in \mathbf{P}$.
- $\textsf{CLIQUE} \in \mathbf{P}$.
- Any of Karp's 21 problems is in $\mathbf{P}$.

This equivalence is the substance of Cook–Levin (1971) plus Karp
(1972).

### 1.2 Search vs Decision

For every $\mathbf{NP}$-complete language $L$ with verifier $V$, the
*search* version

$$ x \mapsto \text{a witness } w \text{ with } V(x,w) = 1
\text{ if one exists} $$

is solvable in deterministic polynomial time. Equivalent to
$\mathbf{P} = \mathbf{NP}$ via standard self-reduction (Levin).

### 1.3 Polynomial Hierarchy Collapses to P

If $\mathbf{P} = \mathbf{NP}$ then $\mathbf{PH} = \mathbf{P}$. The
converse is also a tautology since $\mathbf{NP} \subseteq \mathbf{PH}$.

### 1.4 Universal Search

A *single* universal-search algorithm (Levin 1973) decides every
$\mathbf{NP}$ language in polynomial time iff $\mathbf{P} =
\mathbf{NP}$.

## 2. Statements Strictly Stronger Than $\mathbf{P} \ne \mathbf{NP}$

These are *implied by* $\mathbf{P} = \mathbf{NP}$ being false, but
their negation does not imply $\mathbf{P} = \mathbf{NP}$. Proving any
of them is therefore a *partial result*.

- $\mathbf{NEXP} \not\subseteq \mathbf{P}/\mathrm{poly}$.
- $\mathbf{NP} \not\subseteq \mathbf{BPP}$.
- $\mathbf{NP}$ has superpolynomial *non-uniform* circuit complexity:
  $\mathbf{NP} \not\subseteq \mathbf{P}/\mathrm{poly}$.

## 3. Statements Strictly Weaker Than $\mathbf{P} \ne \mathbf{NP}$

These would *follow* from $\mathbf{P} \ne \mathbf{NP}$ but proving
them does not solve the problem.

- Existence of one-way functions (cryptographic).
- $\mathbf{P} \ne \mathbf{PSPACE}$ — a long-standing open problem;
  $\mathbf{P} \ne \mathbf{NP}$ does not imply it (and vice versa is
  also open).

## 4. Direction-of-Implication Diagram

```
             P = NP
                |  iff
                v
   ∃ NP-complete L: L ∈ P
                |  iff
                v
            PH = P
                |  iff
                v
   Levin's universal search runs in polytime
```

```
        P ≠ NP
           |
           v  (implies, but not iff)
   NP ⊄ P/poly
           |
           v  (implies, but not iff)
     NEXP ⊄ P/poly
```

## 5. Targeted Forms in This Repository

Attempts and candidates state which of the above they target. Some
recommended pairings:

| Target form | Typical strategy |
|-------------|------------------|
| $\mathbf{P} = \mathbf{NP}$ | exhibit a polytime algorithm for a single NP-complete problem |
| $\mathbf{P} \ne \mathbf{NP}$ via circuit lower bound | prove $\mathbf{NP} \not\subseteq \mathbf{P}/\mathrm{poly}$ |
| $\mathbf{P} \ne \mathbf{NP}$ via GCT | exhibit representation-theoretic obstruction |
| $\mathbf{P} \ne \mathbf{NP}$ via algebraic / homological | sheaf cohomology of circuit variety |

A candidate that proves only a strictly-weaker statement is registered
with `claim_summary` indicating "partial: <form>".

## References

- Cook, "The complexity of theorem proving procedures," STOC 1971.
- Karp, "Reducibility among combinatorial problems," 1972.
- Levin, "Universal sequential search problems," 1973.
- Sipser, *Introduction to the Theory of Computation*, ch. 7.
- Arora & Barak, *Computational Complexity: A Modern Approach*,
  Cambridge, 2009 — comprehensive treatment of equivalences.
