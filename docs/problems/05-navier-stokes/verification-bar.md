# 05-navier-stokes — Verification Bar

Verification criteria specific to 05-navier-stokes, added on top of
the general L1–L7 protocol
([`../../methodology/verification-protocol.md`](../../methodology/verification-protocol.md)).

> Spirit. Two failure modes dominate the history of NSE attempts:
> (1) **silent use of an extra hypothesis** that ducks the
> supercriticality (e.g., axisymmetric-without-swirl, or small data),
> and (2) **falling foul of Tao's averaged-NSE barrier** by using a
> technique that succeeds on a surrogate but not on the real
> equation. The per-problem bar tightens L1, L2, and L4 to make
> these failure modes detectable.

---

## 1. Target sub-question must be declared

Every candidate must state which of (A)/(B)/(C)/(D) (see
[`statement.md`](statement.md)) it targets, in
`meta.yaml.strategy`. Mixing sub-questions in a single candidate
without an explicit reduction is treated as `flawed-attempt`.

## 2. L1 — Self-consistency audit (NSE-specific)

In addition to the standard L1 graph-closure check, an attempt
must:

- **List the regularity class** of the initial data assumed (e.g.,
  Schwartz, $H^s$ for specific $s$, Fefferman 2000 §A decay).
- **List the solution class** in which existence / non-existence is
  claimed (smooth, mild, strong, Leray–Hopf weak).
- **State the scaling discipline**: which critical norm controls
  the argument, if any. If the proof closes a sub-critical estimate
  only, the attempt is `partial-insight` at best.
- **Audit against the Tao 2016 barrier**: if the technique would
  also work on the averaged-NSE variant, the attempt is *not*
  resolving (A); it must identify the specific cancellation it
  exploits.

## 3. L2 — Computational consistency (NSE-specific)

Numerical evidence is *necessary but not sufficient* — Fefferman
2000 §3 is explicit. The L2 bar specializes as follows.

### 3.1 For attempts targeting (A) or (C) (global regularity)

- Show numerical agreement with the proof's predictions on at
  least one tested initial-data family with $\mathrm{Re}$ above
  $10^4$ (so the test is non-trivial).
- If the proof uses a specific critical norm $\Phi$, verify
  numerically that $\Phi$ stays bounded (within DNS resolution) on
  the tested initial data. Discrepancy at high $\mathrm{Re}$ is
  treated as a possible counterexample candidate.

### 3.2 For attempts targeting (B) or (D) (finite-time blowup)

- Construct an explicit initial-datum family parameterized by a
  scalar $\lambda$ where the proof predicts blowup at
  $T_*(\lambda) < \infty$.
- Verify the predicted $T_*(\lambda)$ numerically up to the
  Kolmogorov-resolution limit $\eta / \Delta x \approx 1$, with
  the predicted **Type-I or Type-II** profile near the singularity.
- A Type-I blowup claim is automatically `flawed-attempt` for
  smooth initial data (Seregin 2009 rules it out).

## 4. L4 — Adversarial bar (NSE-specific)

In addition to the standard L4 (assumption weakening, counterexample
search, domino failure), an attempt targeting NSE must survive at
least the following:

- **Tao-barrier test**: state where in the proof the *specific
  cancellation* of full NSE (vs averaged NSE) is used. If no such
  step exists, the proof is suspect of being barrier-blocked.
- **Buckmaster–Vicol consistency**: state how the proof handles the
  known non-uniqueness of Leray–Hopf weak solutions. If the proof
  implicitly identifies "the" solution without addressing the
  non-uniqueness, the attempt is `flawed-attempt`.
- **Dimension reduction test**: state what fails when the proof is
  attempted in 2D — the 2D case is settled (Ladyzhenskaya 1959), so
  any proof technique that *also* would work in 2D must explain why
  it does not over-prove a known theorem.
- **Sub-critical / critical / super-critical accounting**: for each
  estimate, classify it as sub-, critical, or super-critical. A
  proof using only sub-critical estimates cannot close (A); the bar
  forces the author to flag where critical estimates enter.

## 5. L5 — External review (NSE-specific)

The standard L5 bar (≥3 recognized experts, no lethal flaw)
specializes as follows for NSE:

- Experts should span at least two of {nonlinear PDE; harmonic
  analysis; CFD; probability} (matching the consilient fields).
- A pure-CFD reviewer is insufficient by itself (per Fefferman 2000
  §3, numerical evidence is not a proof).

## 6. L6 — Journal expectations

Realistic submission targets for NSE candidates: *Annals of
Mathematics*, *Journal of the AMS*, *Inventiones Mathematicae*,
*Communications on Pure and Applied Mathematics*, *Archive for
Rational Mechanics and Analysis*. The community's tolerance for
NSE-claim length is high (50+ pages routine).

## 7. Three-barrier audit (analogue of 03-p-vs-np's
three-barriers)

NSE has its own set of method-level barriers, analogous to
relativization / natural proofs / algebrization for P vs NP. Every
candidate must include an audit showing the proof:

| Barrier | Origin | Audit |
|---------|--------|-------|
| Supercriticality | scaling of energy in 3D | identify where critical estimates close |
| Tao's averaged-NSE barrier | [Tao 2016] | identify cancellation specific to full NSE |
| Non-uniqueness of weak solutions | [Buckmaster–Vicol 2019] | identify the specific solution class targeted |
| Numerical-vs-continuum gap | DNS unable to reach $\eta / \Delta x \to 0$ | identify the analytical bridge replacing numerical extrapolation |

A candidate omitting any of these four audit items is treated as
`partial-insight` at best until the audit is completed.
