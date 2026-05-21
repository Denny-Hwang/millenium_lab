# Result — Summary

Written when the attempt terminates. Assign exactly one outcome label
and state the key insights and follow-up suggestions.

---

## Conclusion (one line)

The $\mathrm{Ext}^2$-based construction at T3 ambient produces a
discriminating cohomology class $[F]_f \in \mathbb{Q}^4$ via the
characteristic function of the Boolean points realizing $f$, but
with the biconditional direction **completely inverted** relative
to A002 L05 ($[F]_f \neq 0 \iff f \in \mathrm{AC}^0$, not $\notin$);
A008's sharpened (R1) abandonment trigger is therefore **activated**
and the H_AC⁰ program pivots to (R2) GCT-style arithmetic moduli for
the next attempt, retaining the H_AC⁰ name as a pilot vehicle while
preserving A005–A009 as a failed-attempt record.

## Outcome Label

- Label: `partial-insight`
- Reason: The attempt produces a concrete construction with a
  computed cohomology class at $(n,s,d)=(2,3,2)$ for four
  representative Boolean functions; reveals an inverted-direction
  biconditional as a structural feature of the natural assignment;
  activates A008's trigger with explicit reasoning; recommends a
  (R2) pivot. This is substantial *strategic* progress (the
  program's direction is now settled) without being a novel
  technical contribution. Above `survey`; below `novel-approach`.
  The A007 (R1) commitment was *provisional* and is now being
  honored exactly per the protocol; this is not a `flawed-attempt`
  but a working strategic mechanism.

> The labels `claimed-solution` and `peer-reviewable` are forbidden at
> this stage. See
> [`../../docs/methodology/outcome-taxonomy.md`](../../docs/methodology/outcome-taxonomy.md).

---

## 1. Test setup

- **Ambient**: T3 both fan-in-1 $\cong \mathbb{P}^1 \times \mathbb{P}^1$.
- **Boolean locus** $B$: 4 isolated points $\{(i, j) \in \{1, 2\}^2\}$,
  where $(i, j)$ encodes $g_1 = x_i$, $g_2 = x_j$.
- **Output gate** $g_3 = \mathrm{AND}$ (multiplicative).
- **Construction**:
  $F_{\mathrm{AC}^0}^{\mathrm{A}'''} := \mathrm{Ext}^2(\mathcal{O}_B,
  \mathcal{O}_{\mathbb{P}^1 \times \mathbb{P}^1}) \cong \mathbb{Q}^4$
  (one summand per Boolean point; A008 §3 computation).
- **Assignment** $f \mapsto [F]_f$: the characteristic function in
  $\mathbb{Q}^4$ of "Boolean points whose realized function equals
  $f$". This is the most natural $f$-dependence available at the
  $\mathrm{Ext}^2$ level.

Test functions: $x_1, x_1 \wedge x_2, x_2$ (all in
$\mathrm{AC}^0_{(3,2)}$); $\mathrm{XOR}$ (not in
$\mathrm{AC}^0_{(3,2)}$, per A007).

## 2. Computation

Boolean functions realized at each point:

| Boolean point | $g_1$ | $g_2$ | $g_3 = g_1 \wedge g_2$ |
|---------------|-------|-------|-------------------------|
| $(1, 1)$ | $x_1$ | $x_1$ | $x_1$ |
| $(1, 2)$ | $x_1$ | $x_2$ | $x_1 \wedge x_2$ |
| $(2, 1)$ | $x_2$ | $x_1$ | $x_1 \wedge x_2$ |
| $(2, 2)$ | $x_2$ | $x_2$ | $x_2$ |

Realized set: $S_{\text{T3-AND}} = \{x_1,\; x_1 \wedge x_2,\; x_2\}$.

Cohomology classes:

| $f$ | $[F]_f \in \mathbb{Q}^4$ |
|-----|--------------------------|
| $x_1$ | $(1, 0, 0, 0)$ |
| $x_1 \wedge x_2$ | $(0, 1, 1, 0)$ |
| $x_2$ | $(0, 0, 0, 1)$ |
| $\mathrm{XOR}$ | $(0, 0, 0, 0)$ |

## 3. Verdict on the biconditional direction

A002 L05 demands $[F]_f \neq 0 \iff f \notin \mathrm{AC}^0$.

Result:

- $x_1 \in \mathrm{AC}^0$ but $[F]_{x_1} = (1,0,0,0) \neq 0$. **L05 fails.**
- $x_1 \wedge x_2 \in \mathrm{AC}^0$ but $[F]_{x_1 \wedge x_2} \neq 0$. **L05 fails.**
- $x_2 \in \mathrm{AC}^0$ but $[F]_{x_2} \neq 0$. **L05 fails.**
- $\mathrm{XOR} \notin \mathrm{AC}^0$ but $[F]_{\mathrm{XOR}} = 0$. **L05 fails.**

The biconditional direction is **completely inverted**:

$$
  [F]_f \neq 0 \;\;\Longleftrightarrow\;\; f \in \mathrm{AC}^0
  \;\;(\text{opposite of A002 L05}).
$$

This is **structural**, not a calculation error. The Boolean locus
$B$ parameterizes *realized* wirings; any class naturally supported
on $B$ detects realized-ness, not non-realized-ness.

## 4. Trigger evaluation and pivot

A008's sharpened criterion: *"if A009 fails to produce a
coherent-sheaf cohomology class (in any reasonable degree)
discriminating $f$ with A002 L05's biconditional direction, then
(R2) abandonment is triggered."*

The natural $\mathrm{Ext}^2$ construction discriminates $f$ (good)
but with the wrong direction (the criterion fails on its literal
reading). Three responses considered:

### 4.1 Response (a) — flip the biconditional

Restate L05 as $[F]_f \neq 0 \iff f \in \mathrm{AC}^0$. The
construction works *technically*, but the natural-proofs evasion
argument needs rethinking: Razborov–Rudich is about properties
detecting *hard* functions; an easy-detection property does not
engage the barrier in the same way. The conceptual motivation for
B-002 evaporates.

**Verdict on (a)**: technically possible but conceptually
unmotivated. Not a viable rescue without a new natural-proofs
analysis.

### 4.2 Response (b) — complementary construction

Use a sheaf cohomology of $\mathrm{AMB} \setminus B$ (the open
complement) rather than of $B$. Concretely:
$F_{\mathrm{non}\text{-}\mathrm{AC}^0} := i_* \mathcal{O}_{\mathrm{AMB}
\setminus B}$ where $i$ is the open inclusion. Local-cohomology
sequences could produce classes detecting "obstructions to lying
in the realized locus" — possibly with the right direction.

**Verdict on (b)**: incompletely explored in this attempt; the
$f$-dependent cocycle assignment is not concrete. Could in
principle save (R1) with the correct direction, but it would
require another 2–3 attempts to make rigorous.

### 4.3 Response (c) — trigger (R2) pivot

Per A008's literal criterion, the trigger fires. The (R1) program
has had A005, A006, A007 + A008 + A009 — five attempts on the
sheaf-cohomology framework — and each has surfaced either a
trivialization, a wrong cohomological degree, or a wrong
biconditional direction. The accumulated evidence is sufficient to
formalize the (R1) negative finding as a B-002 status revision
and pivot to (R2).

**Decision**: trigger fires. The H_AC⁰ program pivots to (R2)
GCT-style arithmetic-circuit moduli. Response (b) remains a
possible (R1) refinement that future work *outside* the main H_AC⁰
program might explore, but is not the H_AC⁰ program's central
path going forward.

## 5. Recommended scope of (R2) pivot

The pivot is significant and deserves an explicit scope
specification before the next attempt begins.

- **Replace L02 v2** with an arithmetic-circuit moduli: the moduli
  of arithmetic circuits over $\mathbb{Q}$ with bounded size and
  depth, *without* the Boolean restriction. This is a
  positive-dimensional moduli.
- **Replace the Boolean-evaluation equations** of A005 with no
  Boolean restriction. The moduli is honestly $\sum_g \dim
  \mathrm{Gr}(k_g, m_g)$-dimensional.
- **Reformulate AC⁰-membership** as a representation-theoretic
  obstruction in the spirit of Mulmuley–Sohoni. The new central
  question becomes: which orbit closures in the arithmetic moduli
  contain a Boolean point realizing $f$?
- **L05 / L06 / L10** are completely restated in the GCT setting.
  Likely names: GCT-L05, GCT-L06, GCT-L10 for clarity.
- **L11'** (succinct-input non-evaluation, A004 / A005) is
  reinterpreted in arithmetic-circuit-evaluator terms.
- **B-001** (GCT ↔ homological) becomes the load-bearing bridge.
- **B-002** (natural proofs ↔ sheaf cohomology) is downgraded:
  status changed to "explored, negative findings A005–A009 attached".

## 6. New / updated gaps

| ID | Severity | Status after A009 |
|----|----------|--------------------|
| G009 (discrete-reading collapse) | superseded | escape attempted via (R1); (R1) fails; pivots to (R2) |
| G015 (cohomological-degree shift) | observed | the right Ext degree is dimension-dependent (Ext² in dim 2); confirmed in this attempt |
| **G017** (new, major) | major | **The natural cohomology class supported on the Boolean locus has *inverted* biconditional direction**: $[F]_f \neq 0 \iff f \in \mathrm{AC}^0$. This is structural, not a calculation error. |
| **G018** (new, lethal-if-unresolved) | lethal | The (R2) pivot requires a fresh statement of AC⁰-membership as a representation-theoretic obstruction; this is the *Mulmuley–Sohoni-style problem* for AC⁰ specifically. No published formulation exists for AC⁰; constructing one is the GCT-L02 challenge. |

## Key Insights

- **The (R1) sheaf-cohomology program for H_AC⁰ has a structural
  sign problem.** Cohomology classes naturally supported on the
  Boolean locus detect *realized* Boolean functions, not
  *unrealized* ones. This is intrinsic to the construction — not
  a bug to be fixed by choosing a different sheaf.
- **A008's sharpened trigger fires.** Five (R1) attempts (A005,
  A006, A007, A008, A009) have not produced a coherent-sheaf
  cohomology class with A002 L05's biconditional direction in any
  reasonable degree.
- **The H_AC⁰ program pivots to (R2)** but does so with full
  documentation of why (R1) was tried, what it produced, and why
  it stops here. The pivot is *informed*, not *abandoned*.
- **The A005–A009 record is preserved as a failed-attempt
  trajectory.** Per charter §4.4 (failure as asset), this is
  valuable evidence on the limits of cohomological reformulations
  of the natural-proofs barrier.

## Follow-ups

1. **A010 — first (R2) attempt**: state GCT-L02, the arithmetic-
   circuit moduli for $(n, s, d) = (2, 3, 2)$, with explicit
   representation-theoretic identification of the AC⁰
   sub-moduli. The natural starting point is the Mulmuley–Sohoni
   framework specialized to AC⁰.
2. **B-002 status revision**: status changes from `ai-discovered`
   to `explored-with-negative-findings`; attach A005–A009 as
   evidence. Bridge maturity is *not* abandoned but is downgraded.
3. **B-001 status revision**: promoted to *load-bearing* for the
   H_AC⁰ program. Maturity stays at `ai-discovered` pending GCT
   reformulation in A010.
4. **L05 / L06 / L10 deprecation**: A002's L05, L06, L10 are
   marked deprecated; their GCT replacements are pending in
   A010+.
5. **L11' re-interpretation**: succinct-input non-evaluation
   carries over to the arithmetic-circuit setting; reformulate in
   A011 or later.
6. **R6 cross-attempt synthesis** is now strongly motivated: with
   the (R1) trajectory closed, looking back at A001–A009 to
   identify lessons is the natural next step. This can run in
   parallel with A010.
7. **Possible (R1) refinement attempt** (low priority): if a
   future team revisits Response (b) (complementary construction
   on $\mathrm{AMB} \setminus B$), the work would be
   self-contained and could potentially restore (R1) with the
   right direction. This is recorded but not scheduled.
8. **Cross-model adversarial pass on A009's trigger decision**:
   natural attack — was the trigger too strict? Should Response
   (a) (biconditional flip) have been accepted? The honest answer
   is that (a) loses the natural-proofs motivation; the trigger
   is correctly tuned.
9. **docs/primer/field-primers/03-p-vs-np.md revision**:
   promote (R1) → (R2) pivot history; update §7 glossary
   deltas with `sign-flipped biconditional`, `(R2) pivot`,
   `GCT-L02`.

## References

- attempt: `attempts/03-p-vs-np/A002-...`: L05 statement and
  biconditional direction (frozen).
- attempt: `attempts/03-p-vs-np/A005-...`: L02 v2 Grassmannian
  construction.
- attempt: `attempts/03-p-vs-np/A007-...`: (R1) commitment +
  abandonment trigger.
- attempt: `attempts/03-p-vs-np/A008-...`: sharpened trigger
  criterion; Ext² as the trigger-decisive test.
- bridge: `bridges/B-001-gct-homological-circuit.md` (promoted
  to load-bearing for the post-pivot program).
- bridge: `bridges/B-002-natural-proofs-sheaf-cohomology.md`
  (downgraded to *explored-with-negative-findings*).
- primer: `docs/primer/field-primers/03-p-vs-np.md` §7.
- prompt: `prompts/P08-conjecture-validation.md` (minor variant).
- external:
  - Mulmuley & Sohoni, *Geometric Complexity Theory I*, SIAM J.
    Comput. 31 (2001) 496–526 (basis for the (R2) pivot).
  - Bürgisser & Ikenmeyer, *No occurrence obstructions in geometric
    complexity theory*, J. AMS 32 (2019) 163–193 (negative result
    in GCT to keep in mind for the pivot).
  - Razborov & Rudich, *Natural Proofs*, J. Comput. Syst. Sci. 55
    (1997) 24–35 (the barrier B-002 was attempting to reformulate;
    pre-pivot motivation, retained for the record).
