# 07 — Birch and Swinnerton-Dyer Conjecture

> Status in this repository: `not-started`. Filled in lazily as
> attempts on this problem land. Content below is from canonical
> external sources.

---

## 1. Problem statement

Let $E$ be an elliptic curve defined over $\mathbb{Q}$. The
**Mordell–Weil theorem** (Mordell 1922) states that the group of
rational points $E(\mathbb{Q})$ is finitely generated; we can write

$$
  E(\mathbb{Q}) \cong \mathbb{Z}^r \oplus E(\mathbb{Q})_{\mathrm{tors}}
$$

where $r$ is the **rank** and $E(\mathbb{Q})_{\mathrm{tors}}$ is a
finite torsion subgroup. Attached to $E$ is also an $L$-function
$L(E, s)$ (initially defined as an Euler product over primes; now
known to extend to an entire function on $\mathbb{C}$ by
modularity).

The conjecture (Birch & Swinnerton-Dyer 1965; refined 1965, 1971):

> **(Weak BSD).** $\mathrm{ord}_{s=1} L(E, s) = r$ — the order of
> vanishing of $L(E, s)$ at $s = 1$ equals the rank.
>
> **(Strong BSD).** Moreover, the leading coefficient of the Taylor
> expansion of $L(E, s)$ at $s = 1$ equals an explicit product of
> arithmetic invariants of $E$:
> $$
>   \lim_{s \to 1} \frac{L(E, s)}{(s-1)^r}
>   = \frac{\Omega_E \cdot R_E \cdot \prod_p c_p \cdot |\Sha(E)|}
>          {|E(\mathbb{Q})_{\mathrm{tors}}|^2}.
> $$

The official CMI statement is the **strong** form (Wiles, *The
Birch and Swinnerton-Dyer Conjecture*, CMI problem description,
2000). Each ingredient of the leading-coefficient formula is itself
non-trivially defined.

## 2. Why it is hard

- The conjecture links *arithmetic* data (the rank, defined by
  solving Diophantine equations) to *analytic* data (the order of
  vanishing of an $L$-function). Each side is independently
  difficult: the rank is not algorithmically computable in
  general, and analytic continuation of $L(E, s)$ is itself a deep
  result (modularity).
- The **Tate–Shafarevich group** $\Sha(E)$ — appearing in the
  strong form — is not known to be finite for general $E$. Its
  finiteness is itself a notoriously hard open problem (and is
  required for the strong form to make sense).
- The conjecture is *uniform*: it should hold for all elliptic
  curves $E$ over $\mathbb{Q}$, not just a special family.
- No general method connects "high rank" to "high-order vanishing
  of $L$" — only conditional results in low-rank cases (Gross–
  Zagier, Kolyvagin).

## 3. Minimum vocabulary

- **Elliptic curve** — a smooth projective curve of genus 1 with a
  marked rational point; over a field $k$, given (in characteristic
  $\neq 2, 3$) by a Weierstrass equation $y^2 = x^3 + ax + b$ with
  $4a^3 + 27b^2 \neq 0$.
- **Group law on $E$** — geometric chord-tangent construction making
  $E(k)$ an abelian group with the marked point as identity.
- **Rank** — the integer $r$ such that $E(\mathbb{Q}) \cong
  \mathbb{Z}^r \oplus (\text{finite torsion})$.
- **Torsion subgroup** — $E(\mathbb{Q})_{\mathrm{tors}}$; classified
  (Mazur 1977) as one of 15 possible finite groups.
- **$L$-function of $E$** — $L(E, s) = \prod_p L_p(E, s)$ where each
  local factor encodes the reduction of $E$ modulo $p$.
- **Modularity theorem** — $L(E, s)$ equals the $L$-function of a
  weight-2 modular form (Wiles, Taylor–Wiles, Breuil–Conrad–
  Diamond–Taylor; complete by 2001). Gives meromorphic continuation
  and functional equation.
- **Conductor $N$** — integer that encodes the bad-reduction primes
  of $E$.
- **Selmer group $\mathrm{Sel}_p(E)$** — Galois-cohomological
  approximation to the rank; computable in principle.
- **Tate–Shafarevich group $\Sha(E)$** — measures the failure of
  the local-to-global principle; conjecturally finite.
- **Regulator $R_E$** — determinant of the height pairing on
  $E(\mathbb{Q})$; non-zero iff $r$ is correctly identified.
- **Real period $\Omega_E$** — integral of an invariant differential
  over the real locus of $E$.
- **Tamagawa numbers $c_p$** — local correction factors at primes
  of bad reduction.
- **Heegner point** — a special point on $E$ constructed from
  imaginary quadratic fields; produces non-torsion points when
  $L(E, 1) = 0, L'(E, 1) \neq 0$.

## 4. Prior results to know about

- **Mordell (1922)**: $E(\mathbb{Q})$ is finitely generated.
- **Birch & Swinnerton-Dyer (1965)**: numerical experiments on EDSAC
  led to the conjecture.
- **Coates–Wiles (1977)**: BSD partial result for CM (complex
  multiplication) elliptic curves of analytic rank 0.
- **Gross–Zagier (1986)**: explicit formula relating $L'(E, 1)$ to
  heights of Heegner points; gives a non-torsion point when
  $L'(E, 1) \neq 0$.
- **Kolyvagin (1989, 1990)**: Euler systems via Heegner points;
  proves BSD when the analytic rank is 0 or 1 (modulo finiteness
  of $\Sha$).
- **Modularity theorem (Wiles 1995; Taylor–Wiles 1995; Breuil–
  Conrad–Diamond–Taylor 2001)**: every elliptic curve over
  $\mathbb{Q}$ is modular; gives meromorphic continuation and
  functional equation of $L(E, s)$.
- **Bhargava–Shankar (2010s)**: average rank of elliptic curves
  over $\mathbb{Q}$ ordered by height is bounded; a positive
  proportion of curves have rank 0 and a positive proportion have
  rank 1; consistent with average-BSD predictions.
- **Skinner–Urban (2014)**: progress on the Iwasawa Main
  Conjecture for $\mathrm{GL}_2$; strengthens the $p$-adic side of
  BSD.
- **Numerical evidence**: extensive; BSD verified for thousands of
  curves in tabulations (Cremona database).

## 5. Failed approaches and barriers

- **Direct $p$-adic methods (Iwasawa theory)**: have yielded the
  most progress (Mazur, Greenberg, Kato, Skinner–Urban, ...), but
  the *full* strong BSD remains elusive even conditionally.
- **Brute computational verification**: works for small curves but
  cannot establish a uniform statement.
- **Selmer-group approaches**: bound the rank from above; do not
  produce points, so do not directly attack BSD.
- **Conditional results**: many results assume finiteness of
  $\Sha$ or modularity (the latter is now a theorem). Removing
  these conditions has been the central technical project for
  decades.
- **Higher rank ($r \geq 2$)**: essentially nothing unconditional
  is known. Kolyvagin's method requires rank $\leq 1$.

## 6. Recommended starting reading

- Wiles, *The Birch and Swinnerton-Dyer Conjecture* (CMI problem
  description, 2000).
  https://www.claymath.org/wp-content/uploads/2022/06/birchswin.pdf
- Silverman, *The Arithmetic of Elliptic Curves* (Springer GTM 106,
  2nd ed. 2009). Standard textbook.
- Silverman, *Advanced Topics in the Arithmetic of Elliptic Curves*
  (Springer GTM 151, 1994). Covers CM theory and more.
- Diamond & Shurman, *A First Course in Modular Forms* (Springer
  GTM 228, 2005). Modularity-side background.
- Skinner & Urban, *The Iwasawa main conjectures for
  $\mathrm{GL}_2$*, *Invent. Math.* 195 (2014) 1–277. Modern
  technical apex.
- Coates–Wiles, *On the conjecture of Birch and Swinnerton-Dyer*,
  *Invent. Math.* 39 (1977) 223–251. Historical entry point.

## 7. Glossary deltas

To be added when attempts on this problem begin.

Candidate terms (anticipated):

- Galois representation (attached to $E$)
- Modular form
- Hecke operator / Hecke eigenform
- Iwasawa theory
- Euler system
- $p$-adic $L$-function
- Bloch–Kato conjecture (a vast generalization)
- Selmer rank
- Heights and the Néron–Tate height pairing
