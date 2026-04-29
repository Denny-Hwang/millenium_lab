# 03 — P vs NP — Verification Bar

The general L1–L7 protocol is in
[`../../methodology/verification-protocol.md`](../../methodology/verification-protocol.md).
This file lists the **additional, problem-specific** criteria that
candidates targeting P vs NP must meet.

## 1. Statement Discipline (L1)

Beyond the generic L1 criteria:

- The claim in `claim.md` must explicitly identify which target form
  in [`equivalent-forms.md`](equivalent-forms.md) is being addressed.
- If the candidate proves only a strictly weaker statement, the
  candidate's `claim_summary` must begin with `partial:`.
- If the candidate uses a non-standard model (e.g., quantum,
  non-uniform, average-case only), the deviation from the CMI
  worst-case deterministic-Turing-machine question must be stated in
  `strategy.md`.

## 2. Three-Barrier Self-Audit (L1 → L4)

Every candidate must show, in `strategy.md`, that the proof technique
does **not** belong to any of the three barrier-blocked classes
described in [`failed-approaches.md`](failed-approaches.md):

- **Non-relativizing**: identify the step that fails to lift to
  arbitrary oracles.
- **Non-natural** (Razborov–Rudich): identify which of *constructive*,
  *large*, *useful* fails for the lower-bound predicate.
- **Non-algebrizing**: identify the step that fails to lift to
  algebraic oracle extensions.

A candidate that cannot articulate the failure mode for at least one
barrier per class is sent back to the attempt stage.

## 3. Computational Verification (L2)

P vs NP is not directly amenable to numerical verification of the
*main statement*, so L2 is interpreted as:

- For candidates claiming $\mathbf{P} = \mathbf{NP}$: a working
  reference implementation of the proposed polynomial-time algorithm
  must be benchmarked on:
  - the SATLIB curated benchmarks (industrial, random, crafted),
  - the DIMACS challenge instances,
  - a generated suite of random 3-SAT at the satisfiability
    threshold ($m \approx 4.267 n$),
  - hand-crafted Tseitin instances on expanding graphs (worst-case
    family for resolution).

  Any deviation from the predicted polynomial running time on any of
  the above is a `flawed-attempt`.

- For candidates claiming $\mathbf{P} \ne \mathbf{NP}$ (e.g., via a
  circuit lower bound): for small $n$ (say $n \le 10$), the proposed
  lower-bound predicate must be **computed exactly** on every
  Boolean function and shown to behave as the proof predicts.

## 4. Formalization Targets (L3)

Recommended split into Lean 4 modules:

- `MillenniumLab.PvsNP.Definitions` — formal models of $\mathbf{P}$,
  $\mathbf{NP}$, $\mathbf{P}/\mathrm{poly}$.
- `MillenniumLab.PvsNP.Reductions` — Cook–Levin and key Karp
  reductions.
- `MillenniumLab.PvsNP.Barriers.Relativization` — BGS oracles.
- `MillenniumLab.PvsNP.Barriers.NaturalProofs` — RR theorem
  conditions.
- `MillenniumLab.PvsNP.Barriers.Algebrization` — AW theorem
  conditions.
- `MillenniumLab.PvsNP.<candidate>.MainProof` — candidate-specific
  body.

L3 does not require formalization of every cited barrier — but the
*barrier-failure step* identified in §2 must be formalized.

## 5. Adversarial Verification (L4)

A candidate must survive all of:

- An assumption-weakening round attacking the candidate's specific
  hypothesis (charter §4.3).
- A barrier-classification attack: an adversarial agent attempts to
  show that the candidate, despite §2, *does* belong to one of the
  three barrier-blocked classes.
- A reduction-direction attack: for $\mathbf{P} \ne \mathbf{NP}$
  candidates, an attempt to find a polynomial-time algorithm that
  contradicts the proposed lower bound on small inputs.

The final round of L4 must be carried out by a different model or
session from the candidate's author.

## 6. External Review (L5)

For P vs NP, the recommended reviewer pool includes domain experts
in:

- circuit complexity / algorithmic algebraic methods,
- proof complexity,
- geometric complexity theory (if the candidate uses GCT),
- meta-complexity (if the candidate touches MCSP or
  pseudorandomness).

L5 cannot be passed without at least three reviewers from at least
two distinct sub-fields above.

## 7. Publication Track (L6) and Settlement (L7)

Standard charter §3 / §6 procedures apply. For P vs NP specifically,
no candidate may carry the label `claimed-solution` without an
acceptance decision from a journal CMI recognizes as authoritative.

The two-year settlement period for P vs NP includes monitoring of:

- subsequent attempts at the same direction (consistency checks),
- the citing literature for any "essential gap" reports,
- any errata to the published proof.
