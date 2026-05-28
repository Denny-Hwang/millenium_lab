# Result — Summary

Written when the attempt terminates. Assign exactly one outcome label
and state the key insights and follow-up suggestions.

---

## Conclusion (one line)

Registers conjecture **C-003** (*Regularity-equivalence /
non-local-cancellation wall*) generalizing G_T1b_1 + G_T1b_3 +
G_T1b_4 + A010's structural finding into a unified
route-family-independent meta-statement: no proof of the
$\mathrm{BMO}^{-1} \to L^q$ implication (large-data, smooth,
$q \in (3, 6]$) on 3D NSE simultaneously **(a)** passes the
Tao-barrier audit AND **(b)** reduces to LP/Bony-local
frequency estimates; the (α)-arc analog of C-001/C-002 for the
dormant 03-p-vs-np program.

## Outcome Label

- Label: `partial-insight`
- Reason: Registers a substantial repository asset (C-003) that
  consolidates the A005–A010 negative findings into a single
  formal statement, charter §4.4 (failure as asset). Below
  `novel-approach` (no new technique); above `survey` (the
  conjecture is a non-trivial synthesis with operational
  consequences — it controls A012's Pivot evaluation). Not
  `flawed-attempt` (registers an explicit conjecture, not a
  false claim).

> The labels `claimed-solution` and `peer-reviewable` are forbidden at
> this stage. See
> [`../../docs/methodology/outcome-taxonomy.md`](../../docs/methodology/outcome-taxonomy.md).

---

## 1. C-003 registered

[**C-003**](../../../conjectures/C-003-regularity-equivalence-nonlocal-cancellation/):
*Regularity-equivalence / non-local-cancellation wall for
BMO⁻¹ → $L^q$ on 3D NSE.*

- Parent attempt: A011 (this attempt).
- Parent problem: 05-navier-stokes.
- Numerical evidence: `partial` (six attempts A005–A010 surveyed
  three approach families and the borderline-regularity
  literature without producing a proof).
- Lean: `none`.

## 2. Statement (verbatim from the conjecture file)

For smooth 3D incompressible Navier–Stokes solutions on
$\mathbb{R}^3 \times [0, T)$ from CMI initial data, no proof of
the implication
$$
  u \in L^\infty_t \mathrm{BMO}^{-1} \;\Longrightarrow\;
  u \in L^\infty_t L^q \text{ for some } q \in (3, 6]
$$
exists that simultaneously
- **(a)** passes the Tao-barrier audit (uses $\nabla \cdot u = 0$
  essentially), AND
- **(b)** reduces to estimates that are local in
  Littlewood–Paley / Bony frequency decomposition.

Equivalently: the global-in-frequency $\nabla \cdot u = 0$
cancellation and the local-per-frequency-block estimates required
for $\mathrm{BMO}^{-1} \to L^q$ control are structurally
incompatible.

## 3. Delta against A005–A010 individual gap labels

C-003 absorbs the per-route findings:

| Gap | Surfaced in | Particularization |
|-----|-------------|-------------------|
| G_T1b_1 | A007 | unique bottleneck of T1b Duhamel route |
| G_T1b_3 | A009 | direct $L^p$ energy on $u$ degeneration |
| G_T1b_4 | A009 | vorticity $L^p$ degeneration |
| structural finding | A010 | paraproduct-hybrid non-existence |

C-003 is the route-family-independent meta-statement — the same
relationship as C-002 to (G009 + G019 + monotone reproduction)
for the dormant 03-p-vs-np program.

## 4. Strength / weakness relations

- **If C-003 is true** → the (α)-route via B-003 / T1 cannot
  succeed without a fundamentally new technique outside the
  surveyed energy / vorticity / paraproduct family. The pivot
  recommendation from A010 is justified.
- **If C-003 is false** → the disproof would itself be a proof of
  the implication, which combined with [ESS 2003] would **close
  CMI (A)** on $\mathbb{R}^3$ — earning the CMI prize. C-003 is
  exact-equivalent in strength to "(A) is provable via the (α)
  family."

## 5. Registration consequences

- A005's pivot trigger criterion (b) (T1b lemma-graph + Tao-barrier
  audit) was achieved at A007 / A008. C-003 registration does NOT
  undo this; it makes the closure status of the lemma graph
  explicit (open under surveyed techniques).
- B-003 status remains `active` but tagged "load-bearing-but-walled"
  by C-003 — recommend a future B-003 status revision after A012's
  Pivot evaluation.
- bridges/_INDEX.md: no immediate change required; B-003 remains
  `active`.

## Key Insights

- **C-003 is the (α)-arc's distilled negative-knowledge asset.**
  Mirroring C-001 for the dormant 03-p-vs-np program, it
  preserves the result of the technical work without overclaiming.
- **The conjecture is meta-mathematical** (quantifies over proof
  techniques satisfying audit constraints) and inherits the soft
  informal character of barrier-style results in the literature
  (natural proofs, algebrization). This is consistent with C-001
  and C-002.
- **Operationally, C-003 controls A012's Pivot evaluation.** If
  C-003 is taken seriously (the surveyed family is exhausted),
  Pivot 1 (B-004 + T2) or Pivot 3 (dormancy recommendation) are
  the realistic options.
- **The 7-attempt budget logic worked.** A005 set explicit
  triggers; the program produced a clean lemma graph by A007,
  exhausted direct techniques by A010, and registered the
  asset at A011. A012 closes the budget with Pivot selection.

## Follow-ups

1. **A012**: Pivot evaluation per A010 §5. Three options:
   - Pivot 1: switch route within (α) to B-004 + T2
     (sub-Kolmogorov / CFD-PDE bridge). Structurally orthogonal
     to direct PDE; might escape C-003.
   - Pivot 2: switch direction to (β) blowup via B-004 / T3
     (Hou–Luo Type-II construction).
   - Pivot 3: recommend dormancy following the 03-p-vs-np
     precedent. User-approval required for enactment.
2. **Mid-arc R6 (now strongly motivated)**: 11 attempts on
   05-navier-stokes (A001–A011); the methodological-contrast R6
   with the dormant 03-p-vs-np is the natural consolidation.
   Could be combined with A012's Pivot evaluation in a single
   PR.
3. **B-003 status review** after A012: if Pivot 1/2/3 is
   selected, B-003 may transition to `dormant` (parallel to
   B-002 in PR #18).
4. **Cross-link C-001 ↔ C-002 ↔ C-003** in the conjecture
   `_INDEX.md` if one exists.
5. **`verification-bar.md` §7 update**: per A010 follow-up #4,
   add "global-vs-local cancellation mismatch" as a fifth NSE
   barrier.

## References

- attempt: A005 (commitment); A006 (T1a); A007 (T1b); A008
  (P07 audit); A009 (direct degeneration); A010 (paraproduct
  hybrid non-existence + literature).
- conjecture (precedent, dormant program): C-001, C-002.
- bridge:
  [`bridges/B-003-critical-norm-equivalence-along-flow.md`](../../../bridges/B-003-critical-norm-equivalence-along-flow.md)
  (the (α) route's home).
- analysis:
  [`analysis/cross-synthesis/03-p-vs-np-2026-05-21.md`](../../../analysis/cross-synthesis/03-p-vs-np-2026-05-21.md)
  (methodological precedent).
- prompt: `prompts/P03-lemma-extraction.md` (minor variant for
  conjecture-from-attempts synthesis).
- external (canonical):
  - Tao (2016), ESS (2003), Bony (1981), Koch–Tataru (2001),
    Lemarié-Rieusset (2018) — same set used through A005–A010.
