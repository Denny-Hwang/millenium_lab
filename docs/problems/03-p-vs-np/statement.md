# 03 — P vs NP — Statement

## CMI Official Statement

The CMI problem description (Stephen Cook, 2000) phrases the problem
in terms of polynomial-time verifiability vs polynomial-time
solvability of decision problems.

**Statement (informal).** Suppose that someone, given a yes/no
question, can verify the correctness of a "yes" answer in time
polynomial in the size of the question whenever a short certificate
is supplied. Does there exist an algorithm that *finds* such an answer
in time polynomial in the size of the question? In symbols:

$$ \mathbf{P} \stackrel{?}{=} \mathbf{NP}. $$

The CMI prize is offered for either a proof that **P = NP** or a proof
that **P ≠ NP** (with the resolution accepted by the Scientific
Advisory Board after publication and the two-year settlement period;
see [`charter.md`](../../../charter.md) §6).

Authoritative source: <https://www.claymath.org/millennium/p-vs-np/>.

## Formal Definitions Used in This Repository

We work over the binary alphabet $\Sigma = \{0,1\}$ throughout. A
*language* is any subset $L \subseteq \Sigma^*$. For a Turing machine
$M$ and an input $x$, let $T_M(x)$ denote the number of steps until
$M$ halts on $x$.

**P (deterministic polynomial time).** A language $L$ is in $\mathbf{P}$
iff there exists a deterministic Turing machine $M$ and a polynomial
$p$ such that for every $x \in \Sigma^*$,

$$ M(x) \text{ halts within } p(|x|) \text{ steps, and } M(x) = 1
\iff x \in L. $$

**NP (non-deterministic polynomial time).** A language $L$ is in
$\mathbf{NP}$ iff there exists a deterministic Turing machine $V$
("verifier") and a polynomial $p$ such that for every $x \in \Sigma^*$,

$$ x \in L \iff
\exists\, w \in \Sigma^{\le p(|x|)}\colon\; V(x, w) = 1, $$

and $V$ runs in time $\le p(|x|)$ on every input $(x, w)$ with
$|w| \le p(|x|)$.

**The question.** $\mathbf{P} = \mathbf{NP}$ means every $L \in
\mathbf{NP}$ is in $\mathbf{P}$.

## Equivalent CMI-acceptable Targets

Either of the following resolutions, once published and settled,
qualifies for the CMI prize:

1. **Direction $\mathbf{P} = \mathbf{NP}$** — exhibit a polynomial-time
   algorithm for any one $\mathbf{NP}$-complete problem
   (e.g., 3-SAT, vertex-cover, subset-sum), or for any other
   $\mathbf{NP}$-complete problem in the Karp-21 list.
2. **Direction $\mathbf{P} \ne \mathbf{NP}$** — prove a
   superpolynomial lower bound on the deterministic Turing-machine
   time of any one $\mathbf{NP}$-complete problem.

See [`equivalent-forms.md`](equivalent-forms.md) for further
re-statements (uniform vs non-uniform circuits, search vs decision,
optimization, polynomial hierarchy collapse, etc.).

## Out-of-scope Statements

The following are **not** equivalent to P vs NP and do not satisfy the
official CMI question:

- $\mathbf{NEXP} \not\subseteq \mathbf{P}/\mathrm{poly}$ alone (this
  is implied by $\mathbf{P} \ne \mathbf{NP}$ but does not imply it).
- A separation under a relativizing oracle (e.g., $\mathbf{P}^A \ne
  \mathbf{NP}^A$ for some $A$) — already proved (Baker–Gill–Solovay
  1975) and not the problem.
- Heuristic average-case results unless they are accompanied by a
  worst-case implication.
- Cryptographic hardness assumptions that are weaker than worst-case
  $\mathbf{NP}$-hardness.

A candidate submitted to this repository must explicitly state its
relationship to the official statement in `claim.md` (per the
candidate template).
