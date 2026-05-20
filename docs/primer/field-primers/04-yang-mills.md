# 04 — Yang–Mills Existence and Mass Gap

> Status in this repository: `not-started`. Filled in lazily as
> attempts on this problem land. Content below is from canonical
> external sources.

---

## 1. Problem statement

The official CMI statement (Jaffe & Witten, *Quantum Yang–Mills
Theory*, 2000) has two parts. For any compact, simple gauge group
$G$:

1. **Existence.** Prove that there exists a quantum Yang–Mills theory
   on $\mathbb{R}^4$ with gauge group $G$ that satisfies (a version
   of) the Wightman axioms — or equivalently, the Osterwalder–
   Schrader axioms — so that the theory makes mathematical sense.
2. **Mass gap.** Prove that there is a constant $\Delta > 0$ such
   that every excitation of the vacuum has energy at least
   $\Delta$.

The mass gap is the energy gap between the vacuum and the lowest-
energy single-particle state. Experiment (hadron spectroscopy) and
lattice gauge theory (numerical) both indicate $\Delta > 0$ for
QCD-like theories. The mathematical proof is missing.

## 2. Why it is hard

- Quantization of a *non-abelian* gauge theory on continuous four-
  dimensional spacetime has no established mathematical foundation.
  The perturbative theory is well-developed as a heuristic but is
  not, by itself, a construction.
- The constructive QFT program has succeeded in lower dimensions
  — $\phi^4_2, \phi^4_3, Y_2, Y_3$ (Glimm, Jaffe, Spencer, ...) —
  but the four-dimensional case has resisted all techniques
  developed for the lower-dimensional cases.
- The mass gap, even granted existence of the theory, is the gap
  between two operators (vacuum and excited state) on a Hilbert
  space whose construction is precisely the missing ingredient.
- The phenomenon of *confinement* (color charges cannot be
  separated to infinity) is closely tied to the mass gap but is
  itself ill-understood mathematically.
- The theory exhibits *asymptotic freedom* (Gross–Wilczek–Politzer
  1973): the coupling weakens at high energies, strengthens at low
  energies. This means perturbation theory is reliable at high
  energies but fails exactly where the mass gap lives.

## 3. Minimum vocabulary

- **Gauge group** — a compact Lie group (typically $\mathrm{SU}(N)$,
  $\mathrm{SO}(N)$, ...) acting locally on the fields.
- **Principal bundle** — geometric object encoding the gauge
  symmetry over spacetime.
- **Connection** — gauge field; geometrically a connection on the
  principal bundle.
- **Curvature** — the field strength $F = dA + A \wedge A$ for
  connection $A$.
- **Yang–Mills functional / action** — $S[A] = \int |F|^2$;
  classically extremized by *self-dual* and *instanton* solutions.
- **Quantization** — passage from a classical field theory to a
  quantum one via path integrals or canonical / algebraic methods.
- **Wightman axioms** — a list of axioms for relativistic quantum
  field theory (Wightman 1956) that a candidate theory must satisfy.
- **Osterwalder–Schrader axioms** — Euclidean reformulation
  equivalent to Wightman; usually the technically more accessible
  side.
- **Reflection positivity** — the key positivity property that
  permits the Wick rotation from Euclidean to Minkowski space.
- **Lattice gauge theory** — Wilson's discretization (1974) on a
  finite spacetime lattice; rigorous, but the *continuum limit* is
  the hard step.
- **Mass gap** — $\Delta > 0$ such that the spectrum of the
  Hamiltonian above the vacuum starts at $\Delta$.
- **Asymptotic freedom** — coupling constant decreases at high
  energies.
- **Confinement** — color-charged particles do not appear as
  isolated asymptotic states.

## 4. Prior results to know about

- **Wilson (1974)**: lattice formulation; mass gap and confinement
  derivable on a lattice with strong coupling. The continuum limit
  is the hard part.
- **Glimm–Jaffe (1968–1980s)**: rigorous construction of
  $\phi^4_2, \phi^4_3$ as constructive QFTs.
- **Magnen–Sénéor (1987)** and **Bałaban (1980s)**: progress on
  Yang–Mills in finite volume with cutoffs.
- **Gross–Wilczek (1973), Politzer (1973)**: asymptotic freedom for
  non-abelian gauge theories; Nobel Prize 2004.
- **Lattice numerical**: glueball mass spectrum for pure SU(3)
  computed to high precision (Morningstar–Peardon 1999 and
  many successors); strong numerical evidence for a mass gap.
- **Algebraic QFT framework** (Haag, Kastler, Doplicher, ...): an
  alternative axiomatic foundation; not the standard CMI target
  but a viable formalization route.

## 5. Failed approaches and barriers

- **Direct rigorous construction** at the continuum has resisted
  every constructive QFT technique that succeeded in lower
  dimensions.
- **Cluster expansions** that work in $\phi^4_3$ do not extend; the
  ultraviolet behavior of Yang–Mills in 4 dimensions has no
  analog in 3 dimensions.
- **Lattice limits**: the rigorous control of the continuum limit
  $a \to 0$ remains the central obstruction; renormalization-group
  arguments are heuristic at the rigor level required.
- **Perturbative approaches**: yield asymptotic-but-divergent
  series; not summable, hence not a proof of existence.
- **Reformulation in twistor / amplitude language** has produced
  computational advances but has not addressed the existence /
  mass-gap question.

## 6. Recommended starting reading

- Jaffe & Witten, *Quantum Yang–Mills Theory* (CMI problem
  description, 2000).
  https://www.claymath.org/wp-content/uploads/2022/06/yangmills.pdf
- Glimm & Jaffe, *Quantum Physics: A Functional Integral Point of
  View* (Springer, 2nd ed. 1987). Foundational textbook for
  constructive QFT.
- Seiler, *Gauge Theories as a Problem of Constructive Quantum
  Field Theory and Statistical Mechanics* (Lecture Notes in
  Physics 159, Springer, 1982).
- Faddeev & Slavnov, *Gauge Fields: Introduction to Quantum Theory*
  (Benjamin / Cummings, 1980; 2nd ed. 1990). Standard
  physics-side reference.
- Streater & Wightman, *PCT, Spin and Statistics, and All That*
  (Princeton Landmarks in Physics, 2000 reprint). Wightman axioms
  reference.

## 7. Glossary deltas

To be added when attempts on this problem begin.

Candidate terms (anticipated):

- Wick rotation
- Reflection positivity
- Cluster expansion
- Renormalization group (rigorous version)
- Continuum limit
- Lattice spacing $a$
- Instanton / monopole solutions (background field configurations)
- Bosonization (in lower dimensions)
