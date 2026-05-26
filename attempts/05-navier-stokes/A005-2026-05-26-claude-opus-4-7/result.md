# Result — Summary

Written when the attempt terminates. Assign exactly one outcome label
and state the key insights and follow-up suggestions.

---

## Conclusion (one line)

Direction-commitment: program commits to **(α) global regularity**
targeting an $L^3$ bound via **B-003 / T1** ($\mathrm{BMO}^{-1}
\to L^3$ along-flow); decomposes T1 into three sub-goals (T1a
small-data, T1b large-data, T1c Tao-barrier audit); stages A006
(T1a, P03), A007 (T1b, P03), A008 (P07 adversarial barrier audit);
sets a **falsifiable 3-attempt pivot trigger** (pivot to T2/B-004,
then to (β) blowup, then to dormancy) — applying the 03-p-vs-np
late-commitment lesson EARLY.

## Outcome Label

- Label: `partial-insight`
- Reason: A program-level structural contribution — sub-goal
  decomposition of T1 + falsifiable pivot triggers + verification-
  bar pre-audit. Not a new theorem (no `novel-approach`); more
  than a survey (commits the program with falsifiable triggers,
  applying the 03-p-vs-np dormancy lesson). Not `flawed-attempt`
  (the commitment is explicit and revisable).

> The labels `claimed-solution` and `peer-reviewable` are forbidden at
> this stage. See
> [`../../docs/methodology/outcome-taxonomy.md`](../../docs/methodology/outcome-taxonomy.md).

---

## 1. Commitment

| Item | Value |
|------|-------|
| **Direction** | (α) global regularity for CMI (A) (R³ case; (C) parallel) |
| **Target invariant** | $L^3(\mathbb{R}^3)$ — ESS 2003 endpoint |
| **Route** | B-003 / **T1** ($\mathrm{BMO}^{-1} \to L^3$ along-flow) |
| **Combined route** (if Pivot 1 needed) | B-004 / T2 (sub-Kolmogorov rigor) feeding B-003 / T1 |

**Why T1 over T2 or T3 from B-003**:

- **T1** proves a *conditional* theorem (BMO⁻¹ ⇒ L³ along smooth
  flow) that strengthens ESS by enlarging the sufficient-condition
  side from $L^3$ to $\mathrm{BMO}^{-1}$. **Falsifiable** within a
  small attempt window.
- T2 (small-large interpolation) — vague target; hard to set a
  3-attempt falsifiability window.
- T3 (Tao-barrier quantification) — meta-level audit, not a
  forward step. Used inside T1c, not as the route itself.

## 2. Sub-goal decomposition of T1

**T1 (statement).** For every smooth NSE solution $u$ on $[0, T)$
with smooth decaying $u(0)$, if $u \in L^\infty([0, T);
\mathrm{BMO}^{-1}(\mathbb{R}^3))$, then $u \in L^\infty([0, T);
L^3(\mathbb{R}^3))$.

- **T1a (small-data)**: for $u(0)$ small in $\mathrm{BMO}^{-1}$,
  the Koch–Tataru solution is global; assert $L^\infty_t L^3$
  along it. *Heuristic*: small-data Koch–Tataru solutions enjoy
  instantaneous smoothing; **plausibly provable**.
- **T1b (large-data)**: arbitrary smooth decaying $u(0)$ (possibly
  large in $\mathrm{BMO}^{-1}$); given $u \in L^\infty_t
  \mathrm{BMO}^{-1}$ on $[0, T)$, conclude $u \in L^\infty_t L^3$.
  *Heuristic*: structurally hard — Albritton-style borderline
  regularity criteria, Lemarié-Rieusset 2018 Ch. 9–10 hint at the
  methods but not the conclusion.
- **T1c (Tao-barrier audit)**: identify the specific NSE
  cancellation in $B(u, v) = \mathbb{P}(u \cdot \nabla v)$ that
  distinguishes T1 from the (false) averaged-NSE analog. *Required*
  by `verification-bar.md` §7.

## 3. Stage plan A006–A008

| Attempt | Prompt | Target | Expected outcome |
|---------|--------|--------|------------------|
| **A006** | P03 lemma extraction | T1a small-data | proof sketch or precise gap; expected `partial-insight` |
| **A007** | P03 lemma extraction | T1b large-data | lemma-graph + gap labels; expected `partial-insight` |
| **A008** | P07 adversarial review | T1c barrier audit on A006/A007 output | lethal/needs-patch/survives verdict per A003-style |

The stage is the explicit analog of the 03-p-vs-np A002 → A003
sequence, applied EARLY rather than after multiple rounds of
construction.

## 4. Pivot triggers (falsifiable in 3 attempts)

If, after A006–A008, the program has **not** produced **at least
one** of:

- **(a)** a proof or near-complete proof of T1a, OR
- **(b)** a precise lemma-graph + gap labels for T1b consistent
  with the Tao-barrier audit, OR
- **(c)** a falsification of T1 (counterexample or structural
  obstruction analogous to C-002).

→ **Pivot 1**: switch route within (α). Try T2 (small-large
interpolation) or move to B-004 + T2 (sub-Kolmogorov rigor) feeding
B-003.

→ **Pivot 2** (if Pivot 1 fails for two more attempts): switch
direction to **(β) blowup** via B-004 / T3 (Hou–Luo-scenario rigor;
Type-II construction).

→ **Pivot 3** (if (β) fails for two more attempts): consider
**dormancy** following 03-p-vs-np precedent. Re-activation under
the conditions stated in `docs/problems/05-navier-stokes/status.md`
(to be added at dormancy if it occurs).

Maximum attempt budget before dormancy is on the table: **3 + 2 +
2 = 7 attempts** (A006–A012). Beyond that, charter §2 spirit
("attempts for their own sake is a non-goal") forces a halt.

## 5. Verification-bar pre-audit

`verification-bar.md` §7 lists four NSE-specific barriers; T1 must
address each:

| Barrier | T1 plan |
|---------|---------|
| Supercriticality | use **critical** estimates throughout; identify the precise bilinear estimate $B(u,v)$ at the BMO⁻¹ → L³ scale; no sub-critical detour |
| Tao 2016 averaged-NSE | T1c sub-goal explicitly identifies a NSE-specific cancellation (∇·u = 0 + pressure structure) absent in averaged NSE |
| Buckmaster–Vicol 2019 non-uniqueness | T1 targets smooth solutions; non-uniqueness of weak solutions is irrelevant; explicitly stated |
| CFD-vs-continuum gap | T1 is purely analytical; CFD evidence is heuristic-only. B-004 + T2 (deferred) addresses this |

**Pre-audit verdict**: T1 is consistent with all four barriers.
A006–A008 must close the audit in detail.

## Key Insights

- **Direction (α) with route T1 is the path with the cleanest
  falsifiability window.** The conditional structure of T1 makes
  3-attempt falsification meaningful.
- **The 03-p-vs-np lesson is applied early.** The H₀ / H_AC⁰
  program reached A007 before route-committing and A009 before
  trigger-firing; here the commitment is at A005 and the trigger
  is set for A008.
- **ESS 2003 remains the keystone bridging theorem.** Bounding $L^3$
  closes (A); T1 strengthens the sufficient condition from $L^3$
  to $\mathrm{BMO}^{-1}$, which has Koch–Tataru as a small-data
  partial result.
- **B-003 carries the route; B-004 carries the pivot.** The two
  bridges A003/A004 registered are now wired explicitly to the
  program's strategy.

## Follow-ups

1. **A006**: P03 lemma extraction on T1a (small-data BMO⁻¹ → L³
   along-flow). Concrete first technical step.
2. **A007**: P03 lemma extraction on T1b (large-data).
3. **A008**: P07 adversarial review of A006/A007 output against
   verification-bar §7 (Tao-barrier audit + supercriticality
   audit).
4. **At each of A006–A008**: re-evaluate the pivot trigger.
5. **Primer update**: promote T1's sub-goal structure (T1a/T1b/T1c)
   into `docs/primer/field-primers/05-navier-stokes.md` §7.
6. **Status.md note**: a Change Log entry in
   `docs/problems/05-navier-stokes/status.md` recording the (α)
   commitment (the file currently has only the initial registration).

## References

- attempt: `attempts/05-navier-stokes/A001-...` (P01 panel; weakened
  hypothesis).
- attempt: `attempts/05-navier-stokes/A002-...` (critical-norm
  ladder).
- attempt: `attempts/05-navier-stokes/A003-...` (B-003 discovery).
- attempt: `attempts/05-navier-stokes/A004-...` (B-004 discovery).
- bridge:
  [`bridges/B-003-critical-norm-equivalence-along-flow.md`](../../../bridges/B-003-critical-norm-equivalence-along-flow.md)
  (the route's home).
- bridge:
  [`bridges/B-004-cfd-pde-rigorous-turbulence-closure.md`](../../../bridges/B-004-cfd-pde-rigorous-turbulence-closure.md)
  (the pivot's home).
- analysis:
  [`analysis/cross-synthesis/03-p-vs-np-2026-05-21.md`](../../../analysis/cross-synthesis/03-p-vs-np-2026-05-21.md)
  (dormancy lesson).
- doc:
  [`docs/problems/05-navier-stokes/verification-bar.md`](../../../docs/problems/05-navier-stokes/verification-bar.md)
  §7 (three-barrier audit).
- external (canonical):
  - Koch & Tataru, *Well-posedness for the Navier–Stokes
    equations*, Adv. Math. 157 (2001) 22–35.
  - Escauriaza, Seregin, Šverák, Russian Math. Surveys 58 (2003)
    211–250.
  - Tao, *Finite time blowup for an averaged 3D Navier–Stokes
    equation*, J. AMS 29 (2016) 601–674.
  - Lemarié-Rieusset, *The Navier–Stokes Problem in the 21st
    Century*, CRC 2nd ed. 2018, Chapters 9–10.
