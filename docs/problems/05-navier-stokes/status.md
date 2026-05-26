---
id: 05-navier-stokes
status: active
last_updated: 2026-05-26
---

# Status — 05-navier-stokes

## Change Log

| Date | Status | Reason |
|------|--------|--------|
| 2026-04-27 | not-started | Registered during initial repository scaffolding. |
| 2026-05-26 | active | First attempts merged (A001 P01 panel; A002 critical-norm ladder; A003 P02 bridge B-003; A004 P02 bridge B-004). Status formally lifted from `not-started` to `active`. |
| 2026-05-26 | active (direction-committed) | A005 program-level direction commitment: pursuing **(α) global regularity** for CMI (A)/(C), targeting an $L^\infty_t L^3$ bound via **bridge B-003 / transformation T1** (BMO$^{-1} \to L^3$ along-flow). Falsifiable 3-attempt pivot trigger set for A006–A008. |

## Active program details (as of 2026-05-26)

### Direction

**(α) global regularity.** Target CMI sub-question (A) (on
$\mathbb{R}^3$); sub-question (C) (on $\mathbb{T}^3$) parallel.

### Target invariant

$L^3(\mathbb{R}^3)$ — the Escauriaza–Seregin–Šverák 2003 endpoint
of the critical-norm ladder. A large-data $L^\infty_t L^3_x$ bound
along smooth flows from all decaying initial data ⇒ regularity ⇒
CMI (A).

### Route

[**B-003 / T1**](../../../bridges/B-003-critical-norm-equivalence-along-flow.md):
prove that $L^\infty_t \mathrm{BMO}^{-1}$-bound along smooth NSE
flow ⇒ $L^\infty_t L^3$. Combined with ESS, strengthens the
sufficient regularity condition from $L^3$ to $\mathrm{BMO}^{-1}$
(Koch–Tataru endpoint).

### Stage plan (set by A005)

- **A006** (P03): attack T1a (small-data version).
- **A007** (P03): attack T1b (large-data version).
- **A008** (P07): adversarial audit per `verification-bar.md` §7.

### Falsifiable pivot trigger

If A006–A008 produces none of (a) T1a proof, (b) precise T1b lemma
graph, (c) T1 falsification, then:

- **Pivot 1**: switch route within (α) — try T2 or B-004 / T2.
- **Pivot 2** (after two more failed attempts): switch to **(β)
  blowup** via B-004 / T3 (Hou–Luo Type-II).
- **Pivot 3** (after two more failed attempts): consider
  **dormancy** following 03-p-vs-np precedent.

Max budget before dormancy is on the table: **7 attempts**
(A006–A012). Beyond that, charter §2 spirit forces a halt.

### Re-evaluation triggers

- After each of A006–A008, re-check the pivot trigger.
- If a sub-goal yields `partial-insight` or stronger, automatically
  continue down the committed route.
- If a sub-goal yields `flawed-attempt` or `no-progress`, advance
  the pivot countdown.
