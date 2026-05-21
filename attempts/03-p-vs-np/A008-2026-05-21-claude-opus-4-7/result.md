# Result — Summary

Written when the attempt terminates. Assign exactly one outcome label
and state the key insights and follow-up suggestions.

---

## Conclusion (one line)

Both A007 refinements — A' (twisted line bundle) and A'' (relative
Ext) — are tested at $(n, s, d) = (2, 3, 2)$ on two ambient choices
(T1 fan-in-1 = $\mathbb{P}^1$; T3 both fan-in-1 = $\mathbb{P}^1
\times \mathbb{P}^1$); all four (refinement × ambient) combinations
**fail** to discriminate XOR from $x_1 \wedge x_2$ at the level of
first cohomology / first Chern class, but discrimination *does* exist
via richer invariants (divisor component structure; $\mathrm{Ext}^2$
in the 2-dim ambient), surfacing G015 (the right cohomological
degree for the H_AC⁰ program may be $> 1$ in higher dimensions, in
tension with A002 L05's $H^1$ framing) — the (R1) abandonment
trigger from A007 is *not* triggered, but is sharpened with explicit
next-step criteria for A009.

## Outcome Label

- Label: `partial-insight`
- Reason: This attempt consolidates A007's planned A008 and A009
  into a single decisive test. Both refinements fail at the
  cohomological level A002 L05 / B-002 framed the program around,
  but the failures are structurally informative: discrimination
  exists via richer invariants, just not as first cohomology of a
  coherent sheaf. This is more than `survey` (concrete computation
  + new structural finding) and not yet `flawed-attempt` (no false
  claim — the refinements are correctly identified as inadequate;
  the program is not claimed to succeed). The result sharpens the
  (R1) abandonment trigger rather than triggering it: A009 should
  test the Ext² / divisor-as-scheme variants before pivoting to
  (R2).

> The labels `claimed-solution` and `peer-reviewable` are forbidden at
> this stage. See
> [`../../docs/methodology/outcome-taxonomy.md`](../../docs/methodology/outcome-taxonomy.md).

---

## 1. Scope tested

| Refinement | T1 fan-in-1 ($\mathbb{P}^1$) | T3 both fan-in-1 ($\mathbb{P}^1 \times \mathbb{P}^1$) |
|------------|------------------------------|---------------------------------------------------------|
| A' (twisted line bundle) | tested | tested |
| A'' (relative Ext) | tested | tested |

Test witness: discriminate XOR (∉ AC⁰_{(3,2)}) from
$x_1 \wedge x_2$ (∈ AC⁰_{(3,2)} via T1 fan-in-2).

## 2. Construction A' results

**A' on T1 fan-in-1** ($\mathbb{P}^1$). With $D_f = \{y \cdot
\chi_f = 0\}$ the perpendicular hyperplane to the truth-table point
$\chi_f \in \mathbb{A}^4$:

- $f = \mathrm{XOR}$: pullback to $\mathbb{P}^1$ is the single
  point $(1 : -1)$.
- $f = x_1 \wedge x_2$: pullback is also $(1 : -1)$.

**Same pullback divisor**; $c_1$ identical; no discrimination.

**A' on T3 both fan-in-1** ($\mathbb{P}^1 \times \mathbb{P}^1$).
With the same $D_f$ choice:

- $f = \mathrm{XOR}$: pullback $\{p_2 q_2 + p_1 q_1 = 0\}$, an
  *irreducible* curve of bidegree (1,1).
- $f = x_1 \wedge x_2$: pullback $\{(p_1 + p_2)(q_1 + q_2) = 0\}$,
  *reducible* into two components.

In $\mathrm{Pic}(\mathbb{P}^1 \times \mathbb{P}^1) = \mathbb{Z}^2$,
both have class $(1, 1)$. **Chern class identical**; the
discrimination is *visible at the divisor-as-scheme level* but
*invisible at the Picard / first-Chern-class level*.

**A' verdict.** Fails on both ambients in its natural form.

## 3. Construction A'' results

**A'' on T1 fan-in-1** ($\mathbb{P}^1$). Compute
$\mathcal{E}xt^1(\mathcal{O}_B, \mathcal{O}_{\mathbb{P}^1})$ via
the SES $0 \to \mathcal{I}_B \to \mathcal{O} \to \mathcal{O}_B \to 0$
with $\mathcal{I}_B = \mathcal{O}(-2)$:

$$
  \mathrm{Hom}(\mathcal{O}, \mathcal{O}) = \mathcal{O}
  \xrightarrow{\subset}
  \mathrm{Hom}(\mathcal{I}_B, \mathcal{O}) = \mathcal{O}(2)
  \twoheadrightarrow
  \mathcal{E}xt^1(\mathcal{O}_B, \mathcal{O}) = \mathcal{O}(2) / \mathcal{O}.
$$

The cokernel is a skyscraper sheaf at $B$ with fiber $\mathbb{Q}$
at each of the two points; total length 2.

$H^1(\mathbb{P}^1, \mathrm{skyscraper}) = 0$ since skyscraper
sheaves have no higher cohomology.

**A'' on T3 both fan-in-1** ($\mathbb{P}^1 \times \mathbb{P}^1$).
For a smooth point of a 2-dim variety, the standard local Ext
computation gives:

$$
  \mathcal{E}xt^1(\mathcal{O}_p, \mathcal{O}_X) = 0, \qquad
  \mathcal{E}xt^2(\mathcal{O}_p, \mathcal{O}_X) = \text{skyscraper at } p.
$$

So $\mathcal{E}xt^1(\mathcal{O}_B, \mathcal{O}) = 0$ identically;
the "right" non-vanishing Ext is in degree 2.

$\mathrm{Ext}^2(\mathcal{O}_B, \mathcal{O}) = H^0(\mathcal{E}xt^2)
= \mathbb{Q}^4$ (one fiber per Boolean point). This vector space
*can* in principle support an $f$-dependent class — but it is
$\mathrm{Ext}^2$, not $H^1$, a shift in cohomological degree away
from A002 L05's framing.

**A'' verdict.** Fails on both ambients at the $H^1$ level.

## 4. Discrimination *does* exist — at richer invariants

The XOR / AND distinction at T3 is visible via:

- **Divisor component structure** of the A' pullback: irreducible
  vs reducible. This is not a class in $\mathrm{Pic}$ but a
  property of the specific divisor.
- **$\mathrm{Ext}^2$ class** under A'' at T3: the $\mathbb{Q}^4$
  vector space carries an $S_4$-action permuting the four Boolean
  points; $f$-specific classes can be defined as elements of this
  space modulo symmetry.

Both are *richer* invariants than $H^1$ of a coherent sheaf. The
discrimination is real, just not in the $H^1$ form A002 L05
demanded.

## 5. New gaps

| ID | Severity | Statement |
|----|----------|-----------|
| **G015** | **lethal-if-unresolved** | The right cohomological degree for the H_AC⁰ program may be $> 1$ in ambient of dimension $> 1$ (specifically $\mathrm{Ext}^2$ in dim 2). This contradicts A002 L05's $H^1$ framing. Either A002 L05 needs restating in higher degree, or the program admits a richer-invariant reformulation. |
| **G016** | **major** | If discrimination uses divisor-as-scheme invariants (component structure, geometric genus) rather than Picard classes, the natural-proofs framework (which targets cohomology of coherent sheaves) may not engage. A separate analysis of whether Razborov–Rudich rules out richer-invariant escapes is required. |

## 6. Abandonment trigger evaluation

A007's trigger required three failed follow-up attempts before
revisiting (R2). This attempt consolidates A008 + A009 (two of the
three), with A011 still pending (and concerned with eval-coordinate
clarification, not testing). Both refinements failed at the $H^1$
level.

**Decision**: do **not** trigger (R2) abandonment. Reasons:

1. The failures are at the *first cohomology / Chern class* level
   only; discrimination exists at richer levels.
2. The right framework may be $\mathrm{Ext}^2$ (or higher in
   higher dimensions), not $H^1$ — a structural rather than
   strategic adjustment.
3. The trigger language "fail to produce a working $F_{\mathrm{AC}^0}$"
   should be sharpened: "fail to produce a coherent-sheaf
   cohomology class (in any reasonable cohomological degree)
   discriminating $f$ at the test scope" is the operational
   criterion.

**Sharpened trigger for A009**: test the $\mathrm{Ext}^2$ variant
(or, equivalently, work out the divisor-as-scheme invariant
framework). If A009 also fails at the level of "coherent-sheaf
class in any degree discriminating $f$", then (R2) abandonment is
triggered with the negative evidence formalized as a B-002 verdict
and the bridge maturity rolled back.

## Key Insights

- **The first-cohomology framework is too coarse.** Both
  refinements give the same $H^1$ / Chern class for XOR and
  $x_1 \wedge x_2$, even at the 2-dim ambient where the divisors
  themselves differ. The H_AC⁰ program — as framed in A002 L05
  — may have been targeting the wrong cohomological invariant.
- **Cohomological degree is dimension-dependent.** In $\dim = 1$
  ambient, $\mathcal{E}xt^1$ of a skyscraper $\mathcal{O}_B$ is
  itself a skyscraper, with $H^1 = 0$. In $\dim = 2$ ambient,
  $\mathcal{E}xt^1 = 0$ and the right degree is $\mathcal{E}xt^2$.
  The H_AC⁰ program needs to commit to a cohomological degree
  that matches the ambient dimension; A002 L05's choice of $H^1$
  is dimension-1-specific.
- **Richer invariants discriminate.** The XOR pullback under A'
  at T3 is *irreducible*; the AND pullback is *reducible*. This is
  a real invariant — but it is not a class in $H^*$ of a coherent
  sheaf. The natural-proofs framework targets coherent-sheaf
  cohomology; engaging Razborov–Rudich with richer invariants
  requires a separate argument.
- **(R1) is still viable but its target invariant has shifted.**
  Construction A'''-type variants (using $\mathrm{Ext}^2$ in 2-dim
  ambient, or divisor-component invariants) are the next test.
  The original A002 L05 statement (using $H^1$) is now seen as
  too restrictive.

## Follow-ups

1. **A009** (sharpened): test the $\mathrm{Ext}^2$ variant of
   Construction A'' at T3, with explicit $f$-dependence introduced
   via restriction to the $f$-specific Boolean component. Also
   test whether divisor-component invariants under A' can be
   formalized as a coherent-sheaf class (perhaps via the
   *intermediate Jacobian* or *Chow groups in codimension 2*).
   This is the critical attempt for the abandonment trigger.
2. **A010**: L08 base case (originally A007). Deferred again; can
   wait until the construction question is settled.
3. **A011**: explicit eval coordinates (G014). Deferred; minor.
4. **L05 restatement** in light of G015. If $\mathrm{Ext}^2$ becomes
   the operational invariant, L05 must be restated as "$[F]_f \in
   \mathrm{Ext}^2 \neq 0 \iff f \notin \mathrm{AC}^0$" rather than
   $H^1 \neq 0$. The dependency graph of A002 propagates this
   change to L06, L10, and B-002.
5. **L11' attack** still deferred until the (R1) construction is
   settled.
6. **R6 cross-attempt synthesis**: with 8 H_AC⁰ attempts now in
   record (A001–A008), the pattern of "construction proposed →
   tested → failed at small case → refined" is becoming
   pronounced. A cross-attempt synthesis now would be productive
   in identifying common failure modes.
7. **B-002 status revision** to reflect: (i) the (R1) commitment;
   (ii) the cohomological-degree shift from $H^1$ to higher; (iii)
   the abandonment trigger criteria. Maturity stays at
   ai-discovered.
8. **Cross-model adversarial pass** on A008's negative findings.
   The natural attack: argue the failures are not at the *right
   abstraction level* and that A002 L05's $H^1$ choice was correct.
   This would force a deeper analysis of why $H^1$ should be
   privileged.

## References

- attempt: `attempts/03-p-vs-np/A005-2026-05-20-claude-opus-4-7/`
  (L02 v2; G009).
- attempt: `attempts/03-p-vs-np/A006-2026-05-20-claude-opus-4-7/`
  (Plücker equations).
- attempt: `attempts/03-p-vs-np/A007-2026-05-20-claude-opus-4-7/`
  ((R1) commitment; Construction A trivialization; refinements
  A', A''; abandonment trigger).
- bridge: `bridges/B-002-natural-proofs-sheaf-cohomology.md`
  (cohomological-degree shift is to be flagged in next revision).
- primer: `docs/primer/notation.md` §9 (Plücker / Picard
  vocabulary).
- prompt: `prompts/P08-conjecture-validation.md` (minor variant
  per `prompt.md`).
- external:
  - Hartshorne, *Algebraic Geometry*, Springer GTM 52, 1977,
    Ch. III §§ 5–6 (cohomology of projective space; Ext functor).
  - Eisenbud, *The Geometry of Syzygies*, Springer GTM 229, 2005
    (background on Koszul resolutions used in the Ext computation
    of §3 above).
