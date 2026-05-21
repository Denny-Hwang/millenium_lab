# Transcript — full AI conversation (frozen after merge)

> ⚠️ This file is **immutable** after the PR is merged — no edits, no
> deletions, not even typo or line-break fixes. Corrections are
> recorded in this folder's `result.md`.

---

## Meta

- Attempt ID: A009
- Model: claude-opus-4-7
- Start: 2026-05-21 (continuation of the same Claude Code on the
  Web session that produced A005–A008)
- End: 2026-05-21
- Environment: Claude Code on the Web, ephemeral container at HEAD
  of `main` after PR #15 merge. Macaulay2 / SageMath unavailable.

---

## Body

```text
[Session task framing]

A008's sharpened trigger: this attempt tests whether an Ext^2-based
construction discriminates f with the *correct biconditional
direction* ([F]_f != 0 iff f not in AC^0). The outcome determines
whether (R1) continues or (R2) abandonment is triggered.

[Reading order — minimal, just to refresh details]

- A002 L05 (the biconditional direction A002 framed).
- A008 §3 (Ext^2 = Q^4 at T3 both fan-in-1).

[Step 1 — Test setup]

  - Ambient: T3 both fan-in-1 = P^1 x P^1.
  - Boolean locus B = 4 points: each combination of g_1 in
    {x_1, x_2}, g_2 in {x_1, x_2}.
  - g_3 = AND (multiplicative interpretation).
  - F_{AC^0}^{A'''} := Ext^2(O_B, O_{P^1 x P^1}). As an
    Ext^2-class space: dimension 4 = |B|.
  - Natural basis: e_{(i, j)} for (i, j) in {1, 2}^2, where (i, j)
    means g_1 = x_i, g_2 = x_j.

  Boolean functions realized at the 4 points:
    (1, 1): g_1 = g_2 = x_1; g_3 = AND(x_1, x_1) = x_1.
    (1, 2): g_1 = x_1, g_2 = x_2; g_3 = x_1 AND x_2.
    (2, 1): g_1 = x_2, g_2 = x_1; g_3 = x_2 AND x_1 = x_1 AND x_2.
    (2, 2): g_1 = g_2 = x_2; g_3 = AND(x_2, x_2) = x_2.

  So realized set S_{T3-AND} = {x_1, x_1 AND x_2, x_2} (three
  Boolean functions, with x_1 AND x_2 realized at two points).

  Test functions: x_1, x_1 AND x_2, x_2 (all in AC^0), and XOR
  (not in AC^0_{(3,2)} per A007).

[Step 2 — Natural assignment f |-> [F]_f in Q^4]

The most natural assignment: [F]_f is the characteristic function
of "Boolean points realizing f" in Q^4 = Ext^2.

  [F]_{x_1} = e_{(1, 1)} = (1, 0, 0, 0).
  [F]_{x_1 AND x_2} = e_{(1, 2)} + e_{(2, 1)} = (0, 1, 1, 0).
  [F]_{x_2} = e_{(2, 2)} = (0, 0, 0, 1).
  [F]_{XOR} = 0 (no Boolean point realizes XOR).

[Step 3 — Biconditional direction]

A002 L05 demands: [F]_f != 0 iff f not in AC^0.

Our construction:
  [F]_{x_1} != 0; x_1 IS in AC^0.       ← biconditional FAILS direction.
  [F]_{x_1 AND x_2} != 0; in AC^0.       ← biconditional FAILS direction.
  [F]_{x_2} != 0; in AC^0.              ← biconditional FAILS direction.
  [F]_{XOR} = 0; XOR is NOT in AC^0.    ← biconditional FAILS direction.

The biconditional is COMPLETELY INVERTED. We have:

  [F]_f != 0 iff f IS in AC^0 (the opposite of A002 L05).

[Step 4 — Diagnosis]

This is structurally forced by the construction. The Boolean locus
B parameterizes *realized* Boolean wirings; cohomology classes
naturally supported on B detect realized-ness, not non-realized-ness.

Three responses are possible:

  (a) Flip the biconditional in the L05 restatement. Accept
      "[F]_f != 0 iff f in AC^0" as the new L05; revise the
      natural-proofs-evading argument accordingly.

  (b) Use a complementary construction: F_{AC^0}^{A'''-comp} :=
      cokernel or quotient that picks out non-realized f's.
      Concretely: take the "ambient minus Boolean locus" sheaf
      cohomology, which encodes f's not realized in the ambient.

  (c) Pivot to (R2) — accept that the natural construction has
      the wrong direction and that fixing it requires moving to
      a different framework.

Examine (a) more carefully: with the flip, Razborov-Rudich would
be asking us to construct a "natural" property that detects
*easy* (AC^0) functions. But Razborov-Rudich's barrier is about
properties that detect HARD functions; an easy-detection property
would not engage the barrier in the same way. The natural-proofs
*motivation* for B-002 evaporates.

Examine (b): the complementary construction "non-realized
cohomology" can be defined as
  F_{non-AC^0} := i_* O_{AMB \ B}
where i: AMB \ B -> AMB is the open inclusion. Then
  H^k(AMB, F_{non-AC^0}) has a non-zero class for each
"hole" in the realized locus.

For T3 ambient: B has 4 isolated points; AMB \ B has the same
homotopy type as the ambient (4 points removed from a 2-dim
projective variety doesn't change cohomology much). Specifically:
  H^0(P^1 x P^1 \ B, O) = Q^4 (functions defined away from B
    can have prescribed residues at each point of B — but only
    finite Laurent terms suffice).
  Wait — actually for AMB \ B with B = 4 points on P^1 x P^1,
  the cohomology H^* is computed via the Mayer-Vietoris / local
  cohomology long exact sequence.

  The local cohomology H^0_B(O_{AMB}) = 0 (B is codim 2;
  H^0_B vanishes for codim > 0).
  H^1_B(O_{AMB}) = ? Computed from the SES
    0 -> O_{AMB} -> i_* O_{AMB \ B} -> H^1_B(O_{AMB}) -> 0
  along with H^*(AMB, O_{AMB}) and H^*(AMB \ B, O).

  This is getting complex; the upshot is that the "complementary"
  construction has its own cohomology structure, potentially with
  the right biconditional direction.

But the f-dependence still needs introducing. The same problem as
before: the *sheaf* is fixed (independent of f), so f-dependence
must come from the cocycle assignment.

For (b) to work: pick a Cech cocycle on AMB \ B with values in
i_* O_{AMB \ B} that depends on f through some natural pairing.
Natural candidate: integration / period pairing against the truth
table chi_f. But this requires algebro-geometric machinery beyond
the scope of this attempt.

[Step 5 — Trigger evaluation]

A008's sharpened criterion was: "if A009 fails to produce a
coherent-sheaf cohomology class (in any reasonable degree)
discriminating f with A002 L05's biconditional direction, then
(R2) abandonment is triggered."

The natural Ext^2 construction discriminates f, but with the
INVERTED biconditional direction. So the literal A008 criterion
is met for failure.

Two complications:

  - Response (a) (flip the biconditional) would save (R1)
    technically but at the cost of losing the natural-proofs
    motivation. This counts as a "soft failure" of (R1) — the
    technical construction works, the conceptual program does
    not.
  - Response (b) (complementary construction) is incompletely
    explored in this attempt; could in principle save (R1) with
    correct direction, but the f-dependent cocycle assignment
    is open.

DECISION: trigger (R1) abandonment, with the caveat that
response (b) remains a possible (R1) refinement that future work
might explore. The trigger fires because three attempts have
failed and the path forward via (b) is not concrete enough to
overcome the criterion.

[Step 6 — Strategic recommendation]

After the trigger fires, the recommended next step is (R2):
pivot to arithmetic-circuit moduli. This is the standard GCT
setting; the H_AC^0 program would essentially become an
AC^0-specific instance of Mulmuley-Sohoni's framework.

This is a significant program-level change. The H_AC^0 name
should be retained as a pilot vehicle, but the technical content
shifts: instead of sheaf cohomology on Boolean circuit moduli, the
program studies orbit closures in arithmetic-circuit moduli.

The (R1) work (A005-A009) is preserved as a *failed-attempt
record* — valuable for the community to know which routes were
tried.

[Step 7 — Charter §3 audit]

  L1: dependency graph closure. A002 L05, A007 trigger, A008
      criterion all invoked. Closed.
  L2: small-case. At (n, s, d) = (2, 3, 2), T3 both fan-in-1,
      the Ext^2 class assignment was explicitly computed for 4
      Boolean functions. Pass.
  L3-L7: pending / n/a.

[R2 outcome label deliberation]

  - no-progress: false; structural finding (biconditional
    direction inversion) + trigger decision.
  - survey: false; concrete computation.
  - flawed-attempt: borderline. The original (R1) commitment from
    A007 was provisional; we are now triggering its abandonment
    based on accumulated evidence. The commitment itself was not
    *flawed* — it was sober and motivated — but the route turns
    out not to work as expected. Per the outcome taxonomy,
    `flawed-attempt` is for false claims; A007's commitment was
    explicit about its provisionality, so it doesn't fit.
  - partial-insight: matches — substantial structural finding
    (the natural cohomological invariant has the inverted
    direction); strategic decision (trigger fires).
  - novel-approach: not in this attempt; we test an existing
    proposal, find it has wrong direction.
  - claimed-solution, peer-reviewable: forbidden.

  Selected: partial-insight.
```
