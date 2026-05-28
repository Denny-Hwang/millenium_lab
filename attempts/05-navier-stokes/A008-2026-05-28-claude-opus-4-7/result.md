# Result — Summary

Written when the attempt terminates. Assign exactly one outcome label
and state the key insights and follow-up suggestions.

---

## Conclusion (one line)

P07 adversarial review on A006 + A007 runs seven attacks
(weaken-assumption, chain-failure, domain-swap, circularity,
quantifier-alternation, plus an NSE-specific
**tao-barrier-resolution-audit**); five survive cleanly, two flag
**needs-patch** (A2 — explicit literature search for an L_T1a_5
counterexample; **A6 — resolution-level Tao-barrier audit on
G_T1b_1's eventual proof approach**); **round verdict: partial**;
**A005 pivot trigger does NOT fire** (criterion (b) was achieved
in A007 and is confirmed here at lemma-statement level); the (α)
program continues with A009+ inheriting the two patches.

## Outcome Label

- Label: `partial-insight`
- Reason: Structured adversarial audit producing two forward-
  looking patches (not lethal verdicts); confirms A005 trigger
  criterion (b) at lemma-statement level; flags
  resolution-level audit as a follow-up requirement that
  meaningfully constrains A009+'s design choices. Not
  `novel-approach` (no new technique); above `survey` (the audit
  produces actionable structural conclusions). Not `flawed-
  attempt` (no false claim; the *audit* identifies things
  others might miss).

> The labels `claimed-solution` and `peer-reviewable` are forbidden at
> this stage. See
> [`../../docs/methodology/outcome-taxonomy.md`](../../docs/methodology/outcome-taxonomy.md).

---

## 1. Adversarial attacks

Per P07 template; six attack kinds (five from the P07 standard
list + one NSE-specific). Caveat: ideal P07 uses a different
model/session than the authors. Here the same session is enforcing
adversarial discipline explicitly; this is recorded as a known
limitation.

```yaml
attacks:
  - kind: weaken_assumption (A1, on L_T1a_1 Koch-Tataru threshold)
    scenario: weaken the smallness threshold ε_KT by arbitrarily small ε
    breakage: none (threshold is universal; small-data regime non-empty)
    survival_argument: L_T1a_1 robust to threshold perturbation
    verdict: survives

  - kind: chain_lethal_lemma_failure (A2, on L_T1a_5)
    scenario: hypothetical counterexample CMI u_0 with small BMO^{-1}, large L^3, whose Koch-Tataru solution leaves L^∞_t L^3
    breakage: if such CE exists, T1a-substantive fails and G_T1a_3 amplifies
    survival_argument: NOT located in the literature reviewed (Lemarié-Rieusset 2018; Albritton; Auscher-Frey-Monniaux); question is OPEN
    verdict: needs-patch:explicit-literature-search-for-counterexample

  - kind: domain_swap (A3, R^3 → T^3)
    scenario: replace R^3 with T^3 (CMI sub-case (C))
    breakage: on T^3, BMO^{-1} ⊂ L^∞ ⊂ L^3 by compact-manifold embeddings; L_T1b_3b trivializes
    survival_argument: confirms T1b's substantive content is specific to R^3 (sub-case (A)); program's focus is correctly placed; recommend distinguishing sub-cases in future revision
    verdict: survives

  - kind: circular_reasoning_check (A4, on T1b)
    scenario: does L_T1b_3b implicitly use L^3 conclusion?
    breakage: L^q (q > 3) is harder than L^3 in embedding direction; no L^3 stepping stone available
    survival_argument: structure hypothesis → L^q → L^3 is non-circular
    verdict: survives

  - kind: quantifier_alternation_check (A5, on T1b)
    scenario: hidden quantifier flip (cf. A003-A6 on dormant H_AC^0)
    breakage: T-dependence of the bound (G_T1b_2 already flagged) is the only quantifier subtlety
    survival_argument: dependence is explicit; no hidden flip; ESS iteration handles T-finite case
    verdict: survives

  - kind: tao_barrier_resolution_audit (A6, NEW NSE-specific, on G_T1b_1's proof)
    scenario: G_T1b_1's eventual proof might use only estimates that work on averaged NSE, failing the audit at resolution level even though A007 passes it at statement level
    breakage: a paraproduct-only proof of L_T1b_3b would NOT use ∇·u = 0 and would apply to averaged NSE → barrier-blocked
    survival_argument: vorticity-based or direct-energy-method proofs would use ∇·u = 0 essentially and survive; A007 left the approach choice open (legitimate)
    verdict: needs-patch:explicit-approach-and-resolution-level-audit (A009+ must specify approach and re-audit)

  - kind: weaken_assumption (A7, on energy hypothesis)
    scenario: degrade "smooth + energy" to weak / suitable-weak
    breakage: weak solutions don't satisfy BMO^{-1} hypothesis with the same control; Buckmaster-Vicol non-uniqueness in weak class
    survival_argument: T1b targets smooth solutions explicitly; weak class is out of scope
    verdict: survives

round_verdict: partial

suggested_patches:
  - location: T1a / L_T1a_5
    proposal: A009 or follow-up — explicit literature audit (Albritton 2018+; Auscher-Frey-Monniaux; Bourgain-Pavlovic) for a possible L_T1a_5 counterexample within CMI. If found, T1a-substantive fails; T1a's content shrinks to the Kato rephrasing.
  - location: T1b / G_T1b_1
    proposal: A009+ — specify the approach (paraproduct / vorticity / direct energy method) and run a fresh statement-level audit on the specific choice. Reject paraproduct-only as barrier-blocked.
```

## 2. A005 pivot trigger re-evaluation

| Criterion | Status (after A006-A008) |
|-----------|---------------------------|
| (a) T1a proof or near-complete | **partial** (trivial sub-case only; A006) |
| **(b)** T1b lemma-graph + Tao-barrier consistent | **ACHIEVED** (A007; confirmed at lemma-statement level by A008) |
| (c) T1 falsification | not produced |

**Trigger does NOT fire** (any one of (a)/(b)/(c) suffices to avoid pivot; (b) is achieved). The (α) program continues per A005's commitment.

## 3. Window assessment (A006-A008)

A005's 3-attempt window closes here. Comparison with the dormant 03-p-vs-np A005-A007 equivalent window:

| | dormant 03-p-vs-np A005-A007 | active 05-navier-stokes A006-A008 |
|---|---|---|
| Construction | trivializes (Construction A); needed refinement (A', A'') | clean Duhamel decomposition with single named bottleneck |
| Obstruction | dual (rigidity + hardness-blindness); route-independent | single (G_T1b_1, auxiliary L^q control) |
| Pivot trigger | fires at A009 | does NOT fire |
| Next move | (R2) pivot or dormancy | direct attack on G_T1b_1 with audit-compliant approach |

The 05-navier-stokes program is **better positioned** at the
equivalent point than 03-p-vs-np was. The early commitment (A005)
+ early audit (A008) discipline is paying off.

## Key Insights

- **Five attacks survive cleanly** (A1, A3, A4, A5, A7). A006 and
  A007 are structurally sound.
- **Two attacks flag needs-patch** (A2 literature counterexample
  search; **A6 resolution-level Tao-barrier audit**). Neither
  rises to lethal; both are forward-looking constraints on A009+.
- **A6 is the substantive finding**. A007's Tao-barrier audit
  passed at the lemma-statement level (Duhamel uses P + ∇·u = 0).
  But the *proof* of G_T1b_1 — yet to be attempted — might use
  paraproduct-only estimates that also work on averaged NSE; if
  so, the resolution would be barrier-blocked. A009+ must specify
  the approach (vorticity / energy method / not paraproduct-only)
  and re-audit.
- **A3 confirms R^3 is the right focus.** On T^3, T1b
  trivializes; the substantive content is sub-case (A)-specific.
  A007's decomposition should explicitly distinguish sub-cases in
  a future revision.
- **The A005 commitment + 3-attempt audit discipline worked.**
  Comparing to the dormant 03-p-vs-np window: the (α) program
  exits A008 with a clean lemma graph and a single named gap,
  rather than a dual obstruction and route-independent wall.

## Follow-ups

1. **A009 (Patch 2)**: specify the approach to G_T1b_1
   (paraproduct / vorticity / direct energy method). REJECT
   paraproduct-only. Run a fresh statement-level audit on the
   specific choice. Then attempt a proof sketch of L_T1b_3b.
2. **A010 or parallel (Patch 1)**: literature audit for a
   possible L_T1a_5 counterexample. Could be a survey-style
   attempt or absorbed into A009 if the same literature applies.
3. **R^3 vs T^3 explicit distinction**: revise A007 / B-003 in a
   future minor PR to state T1b's R^3-specific content.
4. **Budget tracking**: A005 set max 7 attempts before dormancy
   (A006-A012); 3 used (A006/A007/A008); 4 remain.
5. **Primer update**: promote the seven-attack P07 template and
   the A6 resolution-vs-statement-level distinction into
   `docs/primer/field-primers/05-navier-stokes.md` §7 (and
   possibly into `docs/primer/proof-techniques.md` as a meta-note
   on adversarial audits).
6. **R6 cross-attempt synthesis (optional, mid-arc)**: 8 attempts
   on 05-navier-stokes now exist (A001-A008); a methodological
   R6 contrasting with the dormant 03-p-vs-np would be a useful
   asset.

## References

- attempt: `attempts/05-navier-stokes/A006-...` (T1a; G_T1a_3).
- attempt: `attempts/05-navier-stokes/A007-...` (T1b; G_T1b_1;
  Tao-barrier audit at lemma-statement level).
- attempt: `attempts/05-navier-stokes/A005-...` (commitment;
  pivot trigger).
- analysis:
  [`analysis/cross-synthesis/03-p-vs-np-2026-05-21.md`](../../../analysis/cross-synthesis/03-p-vs-np-2026-05-21.md)
  (methodological contrast).
- doc:
  [`docs/problems/05-navier-stokes/verification-bar.md`](../../../docs/problems/05-navier-stokes/verification-bar.md)
  §7 (four-barrier table).
- prompt: `prompts/P07-adversarial-review.md`.
- external (canonical):
  - Tao 2016 (averaged NSE blowup; the barrier source).
  - Koch–Tataru 2001 (BMO⁻¹ small-data theorem).
  - Escauriaza–Seregin–Šverák 2003 (L³ keystone).
  - Buckmaster–Vicol 2019 (non-uniqueness of weak solutions; out
    of T1b's scope).
  - Lemarié-Rieusset 2018, Chapters 9–10 (HA-NSE reference).
