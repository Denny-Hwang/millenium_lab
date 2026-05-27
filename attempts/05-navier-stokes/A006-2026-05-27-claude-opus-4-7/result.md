# Result — Summary

Written when the attempt terminates. Assign exactly one outcome label
and state the key insights and follow-up suggestions.

---

## Conclusion (one line)

P03 lemma extraction on T1a decomposes it into five sub-lemmas
(L_T1a_1–L_T1a_5); inside the CMI initial-data class, T1a splits
into a **trivial sub-case** (small in both $\mathrm{BMO}^{-1}$ and
$L^3$ — Kato 1964 + Koch–Tataru agreement) and a **substantive
sub-case L_T1a_5** (small in $\mathrm{BMO}^{-1}$ but possibly large
in $L^3$) that is **open** and would require an unpublished
bilinear estimate (G_T1a_1); a new concern **G_T1a_3** surfaces —
T1a's program-level leverage may be more limited than A005
indicated, because T1a + ESS yields only "small $\mathrm{BMO}^{-1}$
⇒ regularity," already a Koch-Tataru-style statement.

## Outcome Label

- Label: `partial-insight`
- Reason: Decomposes T1a cleanly, isolates the substantive open
  content in L_T1a_5, identifies three gap labels (G_T1a_1 through
  G_T1a_3) with explicit severities, and — most importantly —
  surfaces G_T1a_3 as a *new* program-level concern A005 did not
  flag (T1a's leverage). Does not produce a proof (so not
  `novel-approach`), but is more than a survey (the
  decomposition + new concern is structural). Not
  `flawed-attempt` (no false claim; L_T1a_5 is explicitly marked
  open). Per A005's pivot-trigger criteria, A006 has advanced
  toward (a) at the trivial level only; the trigger window
  remains open through A007–A008.

> The labels `claimed-solution` and `peer-reviewable` are forbidden at
> this stage. See
> [`../../docs/methodology/outcome-taxonomy.md`](../../docs/methodology/outcome-taxonomy.md).

---

## 1. T1a decomposition

T1a (A005 §2): for $u_0$ sufficiently small in $\mathrm{BMO}^{-1}$,
the Koch–Tataru 2001 global mild solution lies in $L^\infty_t L^3$.

Five sub-lemmas:

| ID | Statement | Difficulty | Status |
|----|-----------|------------|--------|
| L_T1a_1 | Koch–Tataru 2001 existence + uniqueness in class $X_{KT}$ for $\|u_0\|_{\mathrm{BMO}^{-1}} < \varepsilon_{KT}$ | low | published |
| L_T1a_2 | CMI restriction: smooth-decaying $u_0$ ⇒ $u_0 \in L^3 \cap \mathrm{BMO}^{-1}$ | low | embedding |
| L_T1a_3 | Mild-solution agreement: for small $u_0$ in $L^3 \cap \mathrm{BMO}^{-1}$, Kato and Koch–Tataru solutions coincide | low | Lemarié-Rieusset 2018 Ch. 9 |
| L_T1a_4 | Kato endpoint: $\|u_0\|_{L^3}$ small ⇒ global mild in $L^\infty_t L^3$ | low | Kato 1964 / 1984 |
| **L_T1a_5** | **Substantive case**: $\|u_0\|_{\mathrm{BMO}^{-1}}$ small *but* $\|u_0\|_{L^3}$ possibly large ⇒ Koch–Tataru in $L^\infty_t L^3$ | **high** | **open** |

## 2. Trivial-vs-substantive split inside CMI

Within the CMI initial-data class (smooth, divergence-free,
decaying per Fefferman 2000 §A), $u_0$ automatically lies in
$L^p$ for every $p$, so $u_0 \in L^3 \cap \mathrm{BMO}^{-1}$ with
$\|u_0\|_{\mathrm{BMO}^{-1}} \leq C \|u_0\|_{L^3}$.

- **T1a-trivial**: $u_0$ small in *both* $\mathrm{BMO}^{-1}$ and
  $L^3$. By L_T1a_3 + L_T1a_4, the Koch–Tataru solution equals
  the Kato solution and is in $L^\infty_t L^3$. *Adds nothing to
  Kato.*
- **T1a-substantive (L_T1a_5)**: $u_0$ small in
  $\mathrm{BMO}^{-1}$ but *possibly large in $L^3$*. The
  Koch–Tataru regime is strictly larger than the Kato regime in
  this direction. The conclusion — that the solution is in
  $L^\infty_t L^3$ — does not follow from any published theorem
  I have located.

**Example of T1a-substantive scope.** $u_0 := \varepsilon_{KT}/2$
times the sum of $N$ widely-separated copies of a fixed
smooth-bump profile, scaled so each contributes
$\sim \varepsilon_{KT}/(2N)$ to the $\mathrm{BMO}^{-1}$ norm (well-
separated supports decouple BMO seminorm) but contributes a
fixed amount to the $L^3$ norm. Total $\mathrm{BMO}^{-1}$ norm
$\approx \varepsilon_{KT}/2$; total $L^3$ norm $\sim N^{1/3}$,
arbitrarily large.

So T1a-substantive has non-trivial CMI examples; the question is
not vacuous.

## 3. Gaps

| ID | Severity | Statement |
|----|----------|-----------|
| **G_T1a_1** | major | The bilinear estimate $\|B(u, v)\|_{L^\infty_t L^3} \lesssim \|u\|_{X_{KT}} \|v\|_{X_{KT}}$ (or similar) is not in the literature in the form needed. Need to: (a) state it precisely; (b) check Bony-paraproduct route; (c) audit against the Tao-barrier (deferred to A008). |
| **G_T1a_2** | major | The "small in $\mathrm{BMO}^{-1}$ but large in $L^3$" class — needs clean structure (e.g., a closed subset on which both norms behave comparably) for L_T1a_5 to have downstream use. |
| **G_T1a_3** | **major-but-not-lethal — NEW PROGRAM-LEVEL CONCERN** | Even if L_T1a_5 holds, T1a + ESS gives only "small $\mathrm{BMO}^{-1}$ ⇒ regularity," already a Koch-Tataru-style theorem. T1a's program-level leverage is *limited*. The genuine payoff target remains T1b (large-data). T1a is a structural waypoint, not a payoff lemma. |

G_T1a_3 was NOT flagged in A005's commitment; A006 surfaces it.

## 4. Delta against A005's T1a

A005 §2 stated T1a as "*plausibly provable via instantaneous
smoothing in Koch-Tataru regime.*" A006 sharpens:

- "Instantaneous smoothing" applies to $L^\infty$-type norms
  (Koch–Tataru's natural class). Extension to $L^3$ requires
  bilinear estimates linking $X_{KT}$ and $L^3$ that are **open**.
- Inside CMI, T1a splits into trivial and substantive cases. The
  trivial case adds nothing.
- L_T1a_5 is the real open question; A007 (T1b) is the program's
  real payoff target.

## 5. Verification-bar pre-audit (partial)

`statement.md` "What does NOT count":

- Numerical-only: n/a (this is analytical).
- Surrogate-model reductions: T1a uses true NSE; pass.
- Conditional theorems: T1a *is* conditional; A006 explicitly
  flags G_T1a_3 (limited leverage).

`verification-bar.md` §7 four barriers:

- Supercriticality: $L^3$ and $\mathrm{BMO}^{-1}$ are both
  critical; T1a operates within the critical regime. **Pass**.
- Tao 2016 averaged-NSE: deferred to A008 (P07 adversarial).
- Buckmaster–Vicol: T1a targets mild solutions = smooth in this
  regime; non-uniqueness of weak solutions is irrelevant.
  **Pass**.
- CFD–continuum gap: n/a (analytical). **Pass**.

## 6. Trigger evaluation per A005 §4

A005's three trigger criteria for the (α) commitment:

- (a) T1a proof: partial — **trivial sub-case** proved (Kato);
  substantive L_T1a_5 **open**.
- (b) T1b lemma-graph: not yet attacked (A007's role).
- (c) T1 falsification: not produced.

**A006 does NOT fire the pivot trigger.** The 3-attempt window
remains open through A007–A008. However, G_T1a_3 motivates
A007 to be prioritized over additional T1a work — the genuine
payoff is large-data.

## Key Insights

- **T1a splits cleanly inside CMI.** Trivial sub-case is Kato
  rephrased; substantive sub-case L_T1a_5 is open and would
  require an unpublished bilinear estimate.
- **L_T1a_5 has non-trivial CMI examples** (widely-separated
  bump construction); the question is genuine, not vacuous.
- **G_T1a_3 (new program-level concern)**: T1a + ESS yields a
  Koch-Tataru-style theorem already known in form. T1a's
  leverage to the (α) program is *limited*; the real payoff
  target is T1b.
- **The substantive open content reduces to a bilinear estimate**
  in $X_{KT} \times X_{KT} \to L^\infty_t L^3$ (G_T1a_1). This is
  the technical question A007/A008 will inherit.

## Follow-ups

1. **A007 (the prioritized payoff target)**: P03 lemma extraction
   on T1b (large-data $\mathrm{BMO}^{-1} \to L^3$ along-flow).
   Given G_T1a_3, A007 carries the program's real load.
2. **A008**: P07 adversarial review against `verification-bar.md`
   §7 (Tao-barrier audit on whatever A006/A007 produced).
3. **Re-evaluate the pivot trigger at A008**: G_T1a_3 means a
   strong A007 result is needed to justify continuing on T1; if
   A007 also surfaces a leverage concern, Pivot 1 may be
   warranted ahead of schedule.
4. **(Optional, low-priority)** small literature audit on the
   bilinear estimate from G_T1a_1: are Auscher–Frey–Monniaux or
   Albritton borderline-regularity criteria papers stating
   L_T1a_5 in some form? Deferred — not the bottleneck.
5. **Primer update** to add the trivial-vs-substantive split as a
   methodological note in `docs/primer/field-primers/05-navier-stokes.md`
   §7.

## References

- attempt: `attempts/05-navier-stokes/A005-...` (T1a statement and
  pivot trigger).
- bridge:
  [`bridges/B-003-critical-norm-equivalence-along-flow.md`](../../../bridges/B-003-critical-norm-equivalence-along-flow.md)
  §2 (Koch–Tataru structure).
- problem docs:
  [`docs/problems/05-navier-stokes/statement.md`](../../../docs/problems/05-navier-stokes/statement.md)
  (CMI conventions),
  [`docs/problems/05-navier-stokes/known-results.md`](../../../docs/problems/05-navier-stokes/known-results.md)
  §4 (Kato, Koch–Tataru),
  [`docs/problems/05-navier-stokes/verification-bar.md`](../../../docs/problems/05-navier-stokes/verification-bar.md)
  §7.
- prompt: `prompts/P03-lemma-extraction.md`.
- external:
  - Kato, *Strong $L^p$-solutions of the Navier–Stokes equation
    in $\mathbb{R}^m$, with applications to weak solutions*, Math.
    Z. 187 (1984) 471–480.
  - Koch & Tataru, *Well-posedness for the Navier–Stokes
    equations*, Adv. Math. 157 (2001) 22–35.
  - Lemarié-Rieusset, *The Navier–Stokes Problem in the 21st
    Century*, CRC 2nd ed. 2018, Chapter 9 (Koch–Tataru
    exposition; mild-solution agreement results).
  - Fefferman 2000, official CMI problem statement (Appendix A
    initial-data class).
