# 02 — Riemann Hypothesis

> Status in this repository: `not-started`. Filled in lazily as
> attempts on this problem land. Content below is from canonical
> external sources.

---

## 1. Problem statement

> All non-trivial zeros of the Riemann zeta function $\zeta(s) =
> \sum_{n=1}^\infty n^{-s}$ lie on the critical line $\Re(s) = 1/2$.

Background:

- $\zeta(s)$ is initially defined by the Dirichlet series for
  $\Re(s) > 1$.
- It extends to a meromorphic function on $\mathbb{C}$ with a single
  simple pole at $s = 1$.
- It satisfies the functional equation $\zeta(s) = 2^s \pi^{s-1}
  \sin(\pi s / 2) \Gamma(1-s) \zeta(1-s)$, relating values at $s$
  and $1 - s$.
- The *trivial zeros* are at the negative even integers $s = -2,
  -4, -6, \ldots$, forced by the functional equation.
- The *non-trivial zeros* lie in the *critical strip* $0 \leq \Re(s)
  \leq 1$. The hypothesis pins them to the line $\Re(s) = 1/2$.

Equivalent forms (sharpened Prime Number Theorem error term,
Mertens function bound $|M(x)| \leq x^{1/2 + \epsilon}$, ...) and a
host of conditional consequences exist; see
`docs/problems/02-riemann/equivalent-forms.md` once it is filled in.

## 2. Why it is hard

- The zeta function ties together *analysis* (complex
  differentiability, growth estimates), *number theory* (the
  distribution of primes), and potentially *operator theory* (the
  Hilbert–Pólya conjecture) and *random matrix theory*
  (Montgomery–Odlyzko).
- No single field's tools have sufficed; partial results have come
  from each, but the four perspectives have not yet been combined
  in a way that produces a proof.
- The hypothesis is known to be equivalent to sharp forms of the
  Prime Number Theorem, but the equivalence by itself does not
  suggest a proof technique.
- Numerical evidence is overwhelming (trillions of zeros computed,
  all on the critical line — see Gourdon–Demichel 2004, Platt 2017)
  but a single counterexample would settle it negatively. Numerical
  evidence cannot settle it positively.

## 3. Minimum vocabulary

- **Meromorphic function** — a complex function holomorphic except
  at isolated poles.
- **Analytic continuation** — extending a function from a region
  where it is defined (e.g., by a series) to a larger region.
- **Functional equation** — a relation $\zeta(s) \leftrightarrow
  \zeta(1-s)$ that constrains the zeros by symmetry.
- **Critical strip** — $\{s : 0 \leq \Re(s) \leq 1\}$.
- **Critical line** — $\{s : \Re(s) = 1/2\}$.
- **Explicit formula** — relates the prime counting function to a
  sum over the non-trivial zeros (Riemann 1859, von Mangoldt 1895).
- **Dirichlet series** — series of the form $\sum a_n n^{-s}$.
- **$L$-function** — broad family generalizing $\zeta$; Generalized
  Riemann Hypothesis (GRH) extends RH to Dirichlet $L$-functions
  and beyond.
- **Prime counting function $\pi(x)$** — number of primes $\leq x$.
- **Mertens function $M(x) = \sum_{n \leq x} \mu(n)$** — partial
  sums of the Möbius function; RH equivalent to $M(x) =
  O(x^{1/2+\epsilon})$.
- **GUE statistics** — pair-correlation of zeros conjecturally
  matches eigenvalue statistics of large random Hermitian matrices
  (Montgomery 1973; Odlyzko numerical).

## 4. Prior results to know about

- **Riemann (1859)**: original memoir; stated the hypothesis,
  established the functional equation and the explicit formula
  framework.
- **Hadamard / de la Vallée Poussin (1896)**: $\zeta$ has no zeros
  on the line $\Re(s) = 1$, giving the *Prime Number Theorem*.
- **Hardy (1914)**: infinitely many zeros lie on the critical line.
- **Hardy–Littlewood (1921)**: there are at least $T (\log T)^A$
  zeros of $\zeta$ on the critical line up to height $T$, for some
  $A > 0$.
- **Selberg (1942)**: a positive proportion of the zeros lie on the
  critical line.
- **Levinson (1974)**: at least 1/3 of zeros on the critical line.
- **Conrey (1989)**: at least 40% of zeros on the critical line.
- **Bui–Conrey–Young (2011)** and successors: pushed the proportion
  above 41%.
- **Numerical**: the first $10^{13}$ zeros (Gourdon 2004) and large
  sample heights up to $T \sim 10^{24}$ (Platt et al.) all on the
  critical line.
- **Montgomery (1973)**: pair-correlation conjecture; first concrete
  link to random matrix theory.

## 5. Failed approaches and barriers

- **Direct Hilbert–Pólya construction**: find a self-adjoint
  operator whose eigenvalues are the imaginary parts of the
  zeros. Various candidates have been proposed (Connes; Berry–
  Keating); none has been completed.
- **Function-field analogs work, but do not lift.** The analog of
  RH for zeta functions of curves over finite fields was proved by
  Weil (1948) and for general varieties by Deligne (Weil
  Conjectures, 1974). These proofs use étale cohomology and the
  Frobenius, machinery that has no direct counterpart over
  $\mathbb{Q}$.
- **Random matrix heuristics** (Montgomery–Odlyzko) give striking
  numerical agreement but provide no proof. They strongly support
  RH but do not establish it.
- **Elementary approaches via the Mertens conjecture** were ruled
  out by Odlyzko–te Riele (1985), who showed the original Mertens
  conjecture $|M(x)| \leq x^{1/2}$ is false. The weaker form
  required by RH ($M(x) = O(x^{1/2 + \epsilon})$) remains open.

## 6. Recommended starting reading

- Edwards, *Riemann's Zeta Function* (Academic Press, 1974; Dover
  reprint 2001). Classic; readable; covers Riemann's original memoir
  and historical development.
- Titchmarsh & Heath-Brown, *The Theory of the Riemann Zeta-Function*
  (Oxford, 2nd ed. 1986). Standard technical reference.
- Iwaniec & Kowalski, *Analytic Number Theory* (AMS Colloquium 53,
  2004). Broader; contains the modern technical machinery used in
  zero-density results.
- Mazur & Stein, *Prime Numbers and the Riemann Hypothesis*
  (Cambridge, 2016). Conceptual, accessible.
- Bombieri, *Problems of the Millennium: The Riemann Hypothesis*
  (CMI problem description, 2000). The official CMI statement;
  https://www.claymath.org/wp-content/uploads/2022/05/riemann.pdf

## 7. Glossary deltas

To be added when attempts on this problem begin.

Candidate terms (anticipated from the standard literature):

- Explicit formula
- Density estimates / zero density
- Eigenvalues of the GUE / GOE ensembles
- Selberg's $\Lambda^2$-sieve
- Functoriality (in $L$-function context)
- Selberg class
