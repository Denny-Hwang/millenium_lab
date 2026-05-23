# Statement — Conjecture C-001 (Boolean-rigidity obstruction)

> **Conjecture.** Let $\mathcal{C}$ be any algebraic moduli (scheme
> over a field of characteristic $0$) whose closed points include the
> Boolean $\mathrm{AC}^0$ circuits on $n$ inputs of size $\leq s$ and
> depth $\leq d$, with the eval morphism $\mathrm{eval} : \mathcal{C}
> \to \mathbb{A}^{2^n}$ sending a circuit to its truth table. Then
> there is **no** coherent sheaf $F$ on $\mathcal{C}$ together with a
> natural class assignment $f \mapsto [F]_f \in H^k(\mathcal{C}, F)$
> (for any fixed cohomological degree $k$) such that
> $$
>   [F]_f \neq 0 \;\;\Longleftrightarrow\;\; f \notin \mathrm{AC}^0_{(s,d)}.
> $$

In words: coherent-sheaf cohomology on a moduli of *Boolean* circuits
cannot detect non-AC⁰-membership with the correct biconditional
direction. The Boolean locus is too rigid (0-dimensional) to carry
the required cohomology.

## Motivation

This conjecture is the distilled lesson of the (R1) sheaf-on-ambient
arc (attempts A005–A009 on 03-p-vs-np). Evidence accumulated as
follows:

- **A005 / A006**: the Boolean-evaluation locus is 0-dimensional
  inside any Grassmannian-product ambient (verified explicitly at
  $(n,s,d)=(2,3,2)$), so every $H^1$ of a coherent sheaf restricted
  to it vanishes (Hartshorne III.3.5).
- **A007**: the eval-pullback construction (Construction A)
  trivializes — gives $H^1 = 0$ at $(2,3,2)$.
- **A008**: two refinements (twisted line bundle; relative Ext) both
  fail at the first-cohomology level; the right cohomological degree
  is dimension-dependent, but discrimination still does not arise as
  $H^1$ of a coherent sheaf.
- **A009**: the natural $\mathrm{Ext}^2$ construction discriminates
  $f$ but with the **inverted** biconditional direction
  ($[F]_f \neq 0 \iff f \in \mathrm{AC}^0$).

Across five attempts, no coherent-sheaf class with the correct
direction was found. The conjecture states this is not an accident
of the specific constructions tried, but a structural feature of
Boolean rigidity.

## Relationship to the Parent Problem

The conjecture is a *negative* meta-statement about one route to
P vs NP (the H_AC⁰ sheaf-cohomology program / bridge B-002). If
**true**, it explains why the (R1) route fails and justifies the
pivot to (R2) GCT-style arithmetic moduli (which escapes the
obstruction precisely because arithmetic circuits are *not* rigid —
they form positive-dimensional families). If **false**, it would
mean some cleverer coherent sheaf does detect non-AC⁰-membership,
reviving the (R1) route.

It does not directly contribute to *solving* P vs NP; it is a
methodological landmark — knowledge about which tools cannot work,
which charter §4.4 (failure as asset) preserves.

## Strength / Weakness Relations

- **If this conjecture is true** → the B-002 bridge (natural proofs
  ↔ sheaf cohomology) cannot be realized via coherent-sheaf
  cohomology on Boolean moduli; any natural-proofs-evading
  cohomological approach must use a non-coherent invariant or a
  non-Boolean (arithmetic) moduli.
- **If this conjecture is false** → there exists a coherent sheaf
  on a Boolean-circuit moduli whose cohomology detects
  non-AC⁰-membership; constructing it would directly revive the
  (R1) program and likely yield an AC⁰ lower-bound technique.

## Status of evidence

- Numerical / small-case evidence: **partial** — verified at
  $(n,s,d)=(2,3,2)$ for several constructions; no general proof.
- Formalization (Lean): none.

## What a proof would require

A proof would need to quantify over *all* coherent sheaves $F$ and
*all* natural class assignments — likely via a representability or
moduli-of-sheaves argument showing that the 0-dimensionality of the
Boolean locus forces any correct-direction class to vanish or invert.
This is itself a non-trivial algebraic-geometry problem and is left
open.
