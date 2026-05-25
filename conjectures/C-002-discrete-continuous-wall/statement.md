# Statement — Conjecture C-002 (Discrete-vs-continuous wall)

> **Conjecture.** There is no algebraic-geometric moduli $\mathcal{M}$
> of circuits computing functions on $n$ inputs that is
> *simultaneously*:
>
> - **(a) positive-dimensional** (so that non-trivial cohomological /
>   representation-theoretic invariants are available), and
> - **(b) faithful to Boolean hardness** (so that membership of a
>   function $f$ in a Boolean complexity class such as
>   $\mathrm{AC}^0_{(s,d)}$ corresponds to a Zariski-closed /
>   invariant-detectable condition on $\mathcal{M}$).
>
> Equivalently: every encoding faithful to Boolean (or
> monotone-Boolean) complexity forces $\mathcal{M}$ to be
> 0-dimensional (rigid), and every positive-dimensional encoding is
> hardness-blind.

This generalizes [C-001](../C-001-boolean-rigidity-sheaf-obstruction/)
from "coherent sheaves on Boolean moduli" to *all* algebraic
encodings, and absorbs the dual gap G019.

## Motivation

The conjecture is the route-independent distillate of the H₀ / H_AC⁰
arc (attempts A005–A011 on 03-p-vs-np). The same dilemma appeared in
three encodings, each with explicit small-case witnesses:

| Route | Encoding | Outcome |
|-------|----------|---------|
| (R1) | Boolean circuits | 0-dimensional Boolean locus → rigid (C-001) |
| (R2) | arithmetic / $\mathbb{Q}$ | positive-dim but hardness-blind (G019; XOR arithmetic size 2 yet AC⁰-hard) |
| (R2′) | monotone | Boolean semiring → discrete/rigid; continuous semiring → hardness-blind (A011) |

The structural source: Boolean complexity is intrinsically *discrete*
(truth tables, 0/1-valued gates), while algebraic-geometric tools are
intrinsically *continuous* (positive-dimensional varieties,
deformations). Faithfully bridging the two is exactly the open
problem; the program kept rediscovering this wall whenever it tried
to make one side serve the other.

## Relationship to the Parent Problem

This is a *negative* meta-statement about a whole family of routes to
P vs NP (the algebraic-geometry-for-Boolean-lower-bounds family,
spanning bridges B-001 and B-002). If **true**, it explains why all
three routes tried failed and predicts that any future
algebraic-geometric attack on AC⁰ (or P vs NP) lower bounds must
first solve the bridging problem — a positive-dimensional yet
Boolean-faithful moduli. If **false**, the disproof would *be* such a
moduli, and would likely yield a new lower-bound technique.

It does not directly solve P vs NP; it is a methodological landmark
(charter §4.4, failure as asset).

## Strength / Weakness Relations

- **If this conjecture is true** → the H₀ / H_AC⁰ program (and any
  coherent-sheaf or GCT-style attack that needs a positive-dimensional
  Boolean-faithful moduli) cannot succeed without an independent
  breakthrough on the discrete-vs-continuous bridge; dormancy of the
  program is justified.
- **If this conjecture is false** → there exists a positive-dimensional
  moduli on which AC⁰-membership is invariant-detectable; constructing
  it would revive the program and plausibly produce an AC⁰ lower-bound
  method.

## Status of evidence

- Numerical / small-case: **partial** — three encodings tested at
  $(n,s,d)=(2,3,2)$ (A006, A010, A011) with explicit witnesses (OR,
  XOR).
- Formalization (Lean): none.

## Relation to other artifacts

- Specializes to [C-001](../C-001-boolean-rigidity-sheaf-obstruction/)
  (the Boolean / coherent-sheaf case).
- Absorbs gap **G019** (the arithmetic hardness-blindness, A010) and
  **G020** (route-independence, A011).
- Bears on bridges B-001 (dormant-load-bearing) and B-002 (dormant):
  both are subject to this wall.

## What a proof would require

A proof would need to formalize "algebraic-geometric moduli of
circuits" and "faithful to Boolean hardness" precisely, then show the
two are incompatible with positive-dimensionality — likely via a
dimension / semicontinuity argument (Boolean-faithfulness forces the
realizing locus to be a finite set of 0/1-points) combined with a
demonstration that relaxing to positive dimension necessarily admits
hardness-collapsing deformations (the XOR-type cancellation witness,
generalized). This is itself a substantial problem in the interface of
real algebraic geometry and complexity theory, and is left open.
