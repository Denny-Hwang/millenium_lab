# 03 — P vs NP — Known Results

This file collects partial results and major theorems that constrain
the P vs NP landscape. Citations follow `[Author Year]` style; full
references are at the bottom.

## 1. Foundations (1971–1979)

- **Cook–Levin theorem** [Cook 1971, Levin 1973]:
  $\textsf{SAT}$ is $\mathbf{NP}$-complete. The first
  $\mathbf{NP}$-complete problem; reduces P vs NP to a single problem.
- **Karp's 21 problems** [Karp 1972]: 21 natural decision problems
  shown $\mathbf{NP}$-complete via polynomial reductions. The list
  established that $\mathbf{NP}$-completeness is ubiquitous.
- **Garey & Johnson (1979)**: book-length compilation of hundreds of
  $\mathbf{NP}$-complete problems; standard reference.
- **Time / space hierarchy theorems** [Hartmanis–Stearns 1965;
  Stearns–Hartmanis–Lewis 1965]: provable separations like
  $\mathbf{P} \subsetneq \mathbf{EXP}$ via diagonalization.

## 2. Relativization Barrier (1975)

- **Baker–Gill–Solovay** [BGS 1975]: there exist oracles $A, B$ with
  $\mathbf{P}^A = \mathbf{NP}^A$ and $\mathbf{P}^B \ne \mathbf{NP}^B$.
  Therefore any proof technique that *relativizes* — works equally
  well for all oracles — cannot resolve P vs NP. This rules out
  diagonalization in its naive form.

## 3. Interactive / Probabilistic Results (1985–1992)

- **IP = PSPACE** [Lund–Fortnow–Karloff–Nisan 1990; Shamir 1992]:
  interactive proof systems with polynomially many rounds capture
  $\mathbf{PSPACE}$. Importantly this proof does *not* relativize
  (it uses arithmetization), proving that the relativization barrier
  is not insurmountable.
- **PCP theorem** [Arora–Lund–Motwani–Sudan–Szegedy 1992; Arora–Safra
  1992]: $\mathbf{NP}$ has probabilistically checkable proofs with
  $O(\log n)$ randomness and $O(1)$ queries. Implies tight
  inapproximability bounds for many $\mathbf{NP}$-hard problems but
  does not separate $\mathbf{P}$ from $\mathbf{NP}$.
- **Toda's theorem** [Toda 1991]:
  $\mathbf{PH} \subseteq \mathbf{P}^{\#\mathbf{P}}$.

## 4. Natural Proofs Barrier (1997)

- **Razborov–Rudich** [RR 1997]: any "natural" combinatorial property
  (constructive, large, useful) that proves a circuit lower bound
  against $\mathbf{P}/\mathrm{poly}$ would refute the existence of
  pseudorandom functions in $\mathbf{P}/\mathrm{poly}$. Hence such
  proofs cannot exist if standard cryptographic assumptions
  (one-way functions in $\mathbf{P}/\mathrm{poly}$) hold. This rules
  out essentially all known *combinatorial* lower-bound techniques
  for super-polynomial bounds against $\mathbf{P}/\mathrm{poly}$.

## 5. Algebrization Barrier (2008)

- **Aaronson–Wigderson** [AW 2008]: any proof technique that
  *algebrizes* — relativizes with respect to algebraic extensions of
  oracles — also cannot resolve $\mathbf{P}$ vs $\mathbf{NP}$.
  Algebrization captures the IP=PSPACE technique, so even
  arithmetization is not enough.

## 6. Circuit Lower Bounds — Restricted Classes

- **AC⁰ lower bounds** [Furst–Saxe–Sipser 1981; Ajtai 1983;
  Yao 1985; Håstad 1986]: parity is not in $\mathbf{AC}^0$;
  switching-lemma technology gives tight bounds.
- **AC⁰[p]** [Razborov 1987; Smolensky 1987]: when $p$ is prime,
  parity over a different prime $q \ne p$ is not in $\mathbf{AC}^0[p]$.
- **Monotone circuits** [Razborov 1985]:
  $\textsf{CLIQUE}_n$ requires monotone circuits of size
  $n^{\Omega(\log n)}$. The non-monotone analogue is open.
- **ACC⁰ lower bounds** [Williams 2011]: $\mathbf{NEXP} \not\subseteq
  \mathbf{ACC}^0$. The first super-polynomial separation against a
  uniform circuit class above $\mathbf{AC}^0[p]$, obtained via a
  clever "algorithmic improvement → lower bound" connection.

## 7. Geometric Complexity Theory (2001–)

- **Mulmuley–Sohoni** [MS 2001, 2008]: launched GCT, proposing to
  separate $\mathbf{VP}$ from $\mathbf{VNP}$ via
  representation-theoretic obstructions on closures of orbits in
  matrix-polynomial spaces.
- **No occurrence obstructions** [Bürgisser–Ikenmeyer 2017,
  Bürgisser–Ikenmeyer 2019, *J. AMS* 32(1):163–193]: certain natural
  families of representation-theoretic obstructions provably do
  *not* exist for the determinant–permanent separation. GCT is
  therefore not free.

## 8. Algorithmic Boundaries

- **Best deterministic SAT** [PPSZ; Schöning; etc.]: 3-SAT solvable in
  $O(1.307^n)$ time deterministically, and faster under randomization.
  Far from polynomial.
- **Approximation hardness**: tight inapproximability for many problems
  (Vertex-Cover, Max-3SAT, Set-Cover) under standard assumptions, via
  PCP machinery.

## 9. Recent Lines

- **Random oracles & meta-complexity** [Hirahara, Pich, etc., 2020s]:
  understanding the complexity of computing the minimum circuit size
  function (MCSP). Connections between MCSP $\mathbf{NP}$-hardness
  and standard one-way function existence are being clarified.
- **Algebraic circuit lower bounds**:
  $\mathbf{VBP} \ne \mathbf{VP}$ remains open; partial progress on
  depth-3 lower bounds.

## References (Canonical Set)

- [Cook 1971] S. A. Cook, "The complexity of theorem proving
  procedures," STOC.
- [Levin 1973] L. Levin, "Universal sequential search problems."
- [Karp 1972] R. Karp, "Reducibility among combinatorial problems."
- [BGS 1975] T. Baker, J. Gill, R. Solovay, "Relativizations of the
  P=NP question," SIAM J. Comput. 4(4).
- [LFKN 1990] C. Lund, L. Fortnow, H. Karloff, N. Nisan, "Algebraic
  methods for interactive proof systems," FOCS.
- [Shamir 1992] A. Shamir, "IP = PSPACE," J. ACM 39(4).
- [ALMSS 1992] S. Arora, C. Lund, R. Motwani, M. Sudan, M. Szegedy,
  "Proof verification and the hardness of approximation problems,"
  J. ACM 45(3).
- [Toda 1991] S. Toda, "PP is as hard as the polynomial-time
  hierarchy," SIAM J. Comput. 20(5).
- [RR 1997] A. Razborov, S. Rudich, "Natural Proofs," J. Comput.
  Syst. Sci. 55(1):24–35.
- [AW 2008] S. Aaronson, A. Wigderson, "Algebrization: A new barrier
  in complexity theory," ACM TOCT 1(1):1–54.
- [Razborov 1985] A. Razborov, "Lower bounds on monotone complexity
  of the logical permanent," Mat. Zametki.
- [Razborov 1987] A. Razborov, "Lower bounds for the size of circuits
  of bounded depth with basis $\{\&, \oplus\}$," Mat. Zametki.
- [Smolensky 1987] R. Smolensky, "Algebraic methods in the theory of
  lower bounds for Boolean circuit complexity," STOC.
- [Williams 2014] R. Williams, "Non-uniform ACC circuit lower bounds,"
  J. ACM 61(1):1–32.
- [MS 2001] K. Mulmuley, M. Sohoni, "Geometric Complexity Theory I:
  An approach to the P vs. NP and related problems," SIAM J. Comput.
  31(2):496–526.
- [BI 2019] P. Bürgisser, C. Ikenmeyer, "No occurrence obstructions
  in geometric complexity theory," J. AMS 32(1):163–193.
- Arora & Barak, *Computational Complexity: A Modern Approach*,
  Cambridge 2009 — textbook-level treatment of all of the above.
