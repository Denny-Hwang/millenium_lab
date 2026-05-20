# 06 — Hodge Conjecture

> Status in this repository: `not-started`. Filled in lazily as
> attempts on this problem land. Content below is from canonical
> external sources.

---

## 1. Problem statement

Let $X$ be a smooth projective complex algebraic variety. The
cohomology $H^{2k}(X, \mathbb{C})$ decomposes via Hodge theory:

$$
  H^{2k}(X, \mathbb{C}) = \bigoplus_{p+q = 2k} H^{p,q}(X).
$$

A **Hodge class** is an element of $H^{2k}(X, \mathbb{Q}) \cap
H^{k,k}(X)$ — a rational cohomology class of *pure type* $(k, k)$
under the Hodge decomposition.

> **Hodge Conjecture.** Every Hodge class on $X$ is a
> $\mathbb{Q}$-linear combination of cohomology classes of complex
> algebraic subvarieties of $X$.

Paraphrase carefully:

- The conjecture is stated over $\mathbb{Q}$, not $\mathbb{Z}$. The
  integral version is **false** (Atiyah–Hirzebruch 1962; Kollár 1990;
  refined counterexamples by Totaro and others).
- The conjecture refers to *smooth projective* varieties; the
  analog for compact Kähler manifolds is also false (Voisin 2002).
- "Algebraic" cycle means a finite formal sum of subvarieties with
  rational coefficients; the *cycle class map* $\mathrm{cl} :
  \mathrm{CH}^k(X) \otimes \mathbb{Q} \to H^{2k}(X, \mathbb{Q})$
  sends a cycle to its cohomology class.

The conjecture asserts $\mathrm{cl}$ surjects onto Hodge classes.

## 2. Why it is hard

- The Hodge decomposition is *transcendental* — it depends on the
  complex structure and is detected by harmonic forms, not by
  algebraic data.
- Algebraic cycles are *algebraic* — defined by polynomial
  equations.
- The conjecture identifies these two worlds. Bridging them requires
  either constructing subvarieties from cohomology classes (no
  general technique) or characterizing exactly which Hodge classes
  can be algebraic (also no general technique).
- The *standard conjectures* of Grothendieck would imply Hodge, but
  they are themselves wide open.
- Even for very special varieties (general 4-folds with specific
  Hodge structure) the conjecture is unknown.

## 3. Minimum vocabulary

- **Smooth projective variety** — a smooth submanifold of complex
  projective space $\mathbb{P}^N(\mathbb{C})$ cut out by polynomial
  equations.
- **Complex manifold** — manifold with complex coordinate charts and
  holomorphic transitions.
- **Sheaf cohomology $H^k(X, \mathcal{F})$** — cohomology with
  values in a sheaf $\mathcal{F}$.
- **de Rham cohomology** — cohomology of differential forms;
  isomorphic to singular cohomology with $\mathbb{C}$ coefficients
  on a smooth manifold.
- **Hodge decomposition** — $H^k(X, \mathbb{C}) = \bigoplus_{p+q=k}
  H^{p,q}$ where $H^{p,q}$ is the space of harmonic $(p,q)$-forms
  (forms with $p$ holomorphic and $q$ antiholomorphic differentials).
- **Hodge class** — element of $H^{2k}(X, \mathbb{Q}) \cap H^{k,k}$.
- **Algebraic cycle** — formal $\mathbb{Z}$- (or $\mathbb{Q}$-)
  linear combination of irreducible subvarieties of $X$.
- **Chow group $\mathrm{CH}^k(X)$** — group of algebraic cycles of
  codimension $k$ modulo rational equivalence.
- **Cycle class map** — $\mathrm{cl} : \mathrm{CH}^k(X) \to H^{2k}(X)$.
- **$(p,p)$-class** — short form for "class of Hodge type $(p,p)$".
- **Lefschetz $(1,1)$-theorem** — the conjecture is known for
  $k = 1$.
- **Standard conjectures** — Grothendieck's package of conjectures
  on algebraic cycles; would imply Hodge.

## 4. Prior results to know about

- **Lefschetz (1924)**: the $(1,1)$ case. Every Hodge class in
  $H^2(X, \mathbb{Q}) \cap H^{1,1}$ is the class of a divisor. This
  is the foundational known case.
- **Hodge (1941, 1950s)**: the Hodge decomposition; harmonic theory
  on Kähler manifolds.
- **Grothendieck (1969)**: standard conjectures, in particular the
  Hodge standard conjecture, would imply Hodge.
- **Cattani–Deligne–Kaplan (1995)**: the locus of Hodge classes is
  *algebraic* — a deep conditional result that does not prove the
  conjecture but is exactly the kind of bridge expected.
- **Voisin (2002)**: counterexample to the Hodge conjecture for
  general compact Kähler manifolds — shows the projectivity
  hypothesis is essential.
- **Atiyah–Hirzebruch (1962); Totaro (1997)**: counterexamples to
  the *integral* Hodge conjecture.
- **Known cases**:
  - Abelian varieties of small dimension (e.g., dim $\leq 3$).
  - Hypersurfaces of low degree in projective space.
  - Complete intersections.
  - Various explicit constructions.

## 5. Failed approaches and barriers

- **Direct construction of subvarieties** from Hodge classes: no
  general method exists.
- **Reduction to the standard conjectures**: cleaner formulation
  but moves the problem to a different set of equally hard open
  questions.
- **Motivic approaches**: a theory of motives in which the Hodge
  conjecture becomes natural; Grothendieck's program, still
  incomplete.
- **$\ell$-adic comparison**: relate Hodge classes to $\ell$-adic
  cohomology and use the Tate conjecture; both Tate and Hodge are
  open, and the comparison is itself non-trivial.
- **Searching for "natural" Hodge classes that are not algebraic**:
  no convincing candidate has been found, but absence of a
  counterexample is not a proof.

## 6. Recommended starting reading

- Deligne, *The Hodge Conjecture* (CMI problem description, 2000).
  https://www.claymath.org/wp-content/uploads/2022/06/hodge.pdf
- Voisin, *Hodge Theory and Complex Algebraic Geometry*, vols. I &
  II (Cambridge Studies in Advanced Mathematics, 2002, 2003).
  Standard modern treatment.
- Lewis, *A Survey of the Hodge Conjecture* (CRM Monograph Series
  10, AMS, 2nd ed. 1999). Survey-level.
- Griffiths & Harris, *Principles of Algebraic Geometry* (Wiley,
  1978; Wiley Classics reprint 1994). Broader algebraic-geometry
  textbook; chapters 0 and 1 give the Hodge background.
- Hartshorne, *Algebraic Geometry* (Springer GTM 52, 1977). The
  scheme-theoretic / sheaf-cohomology foundation.

## 7. Glossary deltas

To be added when attempts on this problem begin.

Candidate terms (anticipated):

- Kähler manifold
- Harmonic form / Hodge star
- Period / period map
- Variation of Hodge structure
- Mumford–Tate group
- Motive / motivic Galois group
- Tate conjecture (parallel question in $\ell$-adic cohomology)
- Mixed Hodge structure
