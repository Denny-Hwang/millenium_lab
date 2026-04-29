# 03 — P vs NP — Failed Approaches and Barriers

This file collects classes of approaches to P vs NP that are
*provably* obstructed, plus families of attempts that have repeatedly
broken at the same place. Every attempt in this repository must
demonstrate that it survives the relevant barriers; otherwise it is
labeled `flawed-attempt` immediately.

## 1. Three Formal Barriers

A method that "passes through" a barrier proves a property of *every*
problem inside a syntactic family — including problems for which the
target separation provably fails. Any such method therefore cannot
resolve the original P vs NP question.

### 1.1 Relativization Barrier (Baker–Gill–Solovay 1975)

**The barrier.** There exist oracles $A, B$ with
$\mathbf{P}^A = \mathbf{NP}^A$ and $\mathbf{P}^B \ne \mathbf{NP}^B$.
Any proof technique that *relativizes* — works equally well for all
oracles — therefore cannot decide P vs NP.

**What it rules out.**
- Pure diagonalization arguments lifted from time / space
  hierarchies.
- Many simulation-based arguments.

**What survives.** Techniques that detect the *internal structure* of
the machine, not just its black-box behavior. The first concrete
example is arithmetization (LFKN, Shamir, IP = PSPACE).

### 1.2 Natural Proofs Barrier (Razborov–Rudich 1997)

**The barrier.** A combinatorial property $\mathcal{C}_n$ on
$n$-input Boolean functions is **natural** if it is

- **constructive** ($\mathcal{C}_n$ is decidable in time
  $2^{O(n)}$),
- **large** ($|\mathcal{C}_n| \ge 2^{-O(n)} \cdot 2^{2^n}$), and
- **useful** (every $f \in \mathcal{C}_n$ is hard for the circuit
  class one is trying to lower-bound).

If a natural property witnesses a super-polynomial lower bound
against $\mathbf{P}/\mathrm{poly}$, then pseudorandom function
families in $\mathbf{P}/\mathrm{poly}$ cannot exist — contradicting
standard cryptographic assumptions (e.g., the existence of one-way
functions with sub-exponential security).

**What it rules out.**
- Most random restriction / approximator-method arguments at the
  $\mathbf{P}/\mathrm{poly}$ scale.
- Naive extensions of Razborov–Smolensky-style arguments above
  $\mathbf{AC}^0[p]$.

**What survives.**
- *Non-natural* arguments: GCT (representation-theoretic), uniform
  diagonalizations (Williams' ACC⁰ argument), arithmetic-circuit
  techniques.
- *Non-constructive* arguments: properties not decidable in
  $2^{O(n)}$, e.g., requiring NP itself.
- *Non-large* arguments: properties holding for an exponentially
  small fraction of functions.

### 1.3 Algebrization Barrier (Aaronson–Wigderson 2008)

**The barrier.** A proof technique *algebrizes* if it relativizes with
respect to *low-degree algebraic extensions* of oracles. AW show that
algebrizing techniques cannot prove $\mathbf{NP} \not\subseteq
\mathbf{P}/\mathrm{poly}$ either. This captures the IP=PSPACE
arithmetization technique, so even arithmetization is not enough.

**What it rules out.**
- Proofs that rely solely on low-degree polynomial extensions of
  oracles plus simulation.

**What survives.**
- Techniques that detect *higher-order* algebraic-geometric structure
  (representation theory, sheaf cohomology of varieties), or that
  exploit *uniformity* of the verifier in non-relativizing ways.

### 1.4 Combined Implication

Any new approach must demonstrate, ideally before launching a body
proof, that it satisfies all three of:

- **non-relativizing**,
- **non-natural** (in the RR sense), and
- **non-algebrizing**.

This is the implicit content of A001's hypothesis: combine GCT
(non-natural by design) with sheaf cohomology of the circuit variety
(intended to escape algebrization by passing to higher cohomology).

## 2. Repeatedly Failed Heuristic Routes

These are not formal barriers but families of attempts that have
broken in the same way many times in the literature.

### 2.1 "Reduce to a hard combinatorial gadget"

Counting gadgets, expander gadgets, locally-decodable codes, etc.,
have been proposed as proxies for $\mathbf{NP}$-hardness. None has
broken super-polynomial size against $\mathbf{P}/\mathrm{poly}$ —
they all run into the natural-proofs barrier in disguise.

### 2.2 "Approximate $\mathbf{NP}$-hard problems are easier than
exact, hence $\mathbf{P} = \mathbf{NP}$"

The PCP theorem refutes this: many $\mathbf{NP}$-hard problems have
matching inapproximability bounds.

### 2.3 "Use SAT solvers to argue empirical polynomial behavior"

Modern SAT solvers solve very large instances in practice, but the
existence of provably hard instance families (e.g., random 3-SAT at
the threshold; Tseitin formulas) shows that average-case efficiency
does not imply worst-case polynomial time.

### 2.4 "Restrict to monotone circuits and lift"

Razborov's exponential lower bound for monotone $\textsf{CLIQUE}$ does
**not** lift to non-monotone circuits — the analogous bound for the
non-monotone case is wide open. Many naïve "lift" arguments confuse
monotone with non-monotone.

### 2.5 "Identify $\mathbf{NP}$-hardness with cryptographic hardness"

These are known to be distinct: it is open whether average-case
$\mathbf{NP}$-hardness implies one-way function existence
(see meta-complexity literature, 2020s).

### 2.6 Algorithmic claims for 3-SAT

A long history of incorrect "polynomial-time algorithm for 3-SAT"
papers exists. They typically fail on one of:

- correctness on a specific small adversarial instance,
- a dependency on a heuristic that does not terminate in polynomial
  time on worst-case inputs,
- a reduction that is not actually polynomial.

Any candidate in this repository proposing a polynomial-time
algorithm for an $\mathbf{NP}$-complete problem must include:

- a worst-case running-time analysis with explicit polynomial bound,
- a proof of correctness over the entire input distribution,
- numerical verification on a curated suite of hard instances.

## 3. Lessons for This Repository

1. The triple barrier (relativization, natural proofs, algebrization)
   is now part of the verification bar. See
   [`verification-bar.md`](verification-bar.md) §2.
2. Attempts that target $\mathbf{P} \ne \mathbf{NP}$ via combinatorial
   circuit lower bounds must explicitly state which of the three
   *natural-proofs* properties they break.
3. Attempts that target $\mathbf{P} = \mathbf{NP}$ must include a
   numerical verification harness from the outset; the historical
   failure rate of this direction is extremely high.
4. Once an attempt is labeled `flawed-attempt`, the failure mode is
   summarized here under §2 (or a new sub-section is added).

## References

- [BGS 1975] T. Baker, J. Gill, R. Solovay, "Relativizations of the
  P=NP question," SIAM J. Comput. 4(4).
- [RR 1997] A. Razborov, S. Rudich, "Natural Proofs," J. Comput.
  Syst. Sci. 55(1):24–35.
- [AW 2008] S. Aaronson, A. Wigderson, "Algebrization: A new barrier
  in complexity theory," ACM TOCT 1(1):1–54.
- [Williams 2014] R. Williams, "Non-uniform ACC circuit lower bounds,"
  J. ACM 61(1):1–32.
- [BI 2019] P. Bürgisser, C. Ikenmeyer, "No occurrence obstructions
  in geometric complexity theory," J. AMS 32(1):163–193.
