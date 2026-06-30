# Result — Summary

Written when the attempt terminates. Assign exactly one outcome label
and state the key insights and follow-up suggestions.

---

## Conclusion (one line)

Final attempt of A005's 7-attempt budget. Selects **Pivot 1**
(route change within (α): B-003/T1 → **B-004/T2 sub-Kolmogorov
CFD-PDE bridge**) over Pivot 2 ((β) blowup) and Pivot 3 (dormancy);
Pivot 1 is **C-003-orthogonal** (the wall A011 registered applies
to direct-PDE family, not to CFD-derived continuum-limit bounds);
sets a new 3-attempt mini-trigger window for A013–A015 with
explicit falsifiability criterion (b'); R6 cross-synthesis on
A001–A011 produced as companion artifact informing the decision.

## Outcome Label

- Label: `partial-insight`
- Reason: Closes A005's 7-attempt budget with an explicit
  program-level decision (Pivot 1) + new falsifiable mini-trigger
  window. Analog of A005's commitment attempt at the new arc's
  start. Above `survey` (real decision); below `novel-approach`
  (no new technique). Not `flawed-attempt` (pivot is explicit and
  revisable).

> The labels `claimed-solution` and `peer-reviewable` are forbidden at
> this stage. See
> [`../../docs/methodology/outcome-taxonomy.md`](../../docs/methodology/outcome-taxonomy.md).

---

## 1. Pivot selection

| Option | Description | C-003-orthogonal? | Selected? |
|--------|-------------|-------------------|-----------|
| **Pivot 1** | B-004 + T2 (sub-Kolmogorov / CFD-PDE) | **yes** — outside direct-PDE family | **✓** |
| Pivot 2 | (β) blowup via B-004 / T3 (Hou–Luo Type-II) | yes (different direction entirely) | held in reserve |
| Pivot 3 | dormancy recommendation | n/a | premature |

### Why Pivot 1

1. **Stays in (α)** — does not abandon the global-regularity target.
2. **C-003-orthogonal**: C-003 quantifies over direct-PDE proofs (Tao-barrier + LP/Bony locality). A CFD-derived bound on a critical norm uses convergence arguments at the discretization level, not LP locality; C-003 does not directly block it.
3. **B-004 is registered (PR #25)** with explicit T2 formulation; ready to use.
4. **Pivot 2 / 3 remain as fallbacks** in their natural order if Pivot 1 also fails.
5. **Charter §2 spirit**: one un-tried route family remains; not yet at "accumulating attempts for their own sake."

### Why not Pivot 3 (dormancy)

The 03-p-vs-np dormancy precedent applied **after both (R1) and (R2)** were tried. Here only one route family has been exhausted. Dormancy at A012 would be premature; it remains the eventual option after Pivot 1 (+ possibly Pivot 2) also fail.

## 2. New mini-trigger window for A013–A015

By analogy with A005's window for A006–A008:

| Attempt | Prompt | Target |
|---------|--------|--------|
| A013 | P03 | T2 lemma-extraction (CFD sub-Kolmogorov rigor) |
| A014 | P03 / technical attempt on the bottleneck | analog of A009 |
| A015 | P07 adversarial audit | analog of A008 |

### Falsifiability criteria (Pivot-1 trigger)

After A013–A015, if **none** of:
- **(a′)** A T2 sub-lemma proof or near-complete proof, OR
- **(b′)** Precise lemma-graph + gap labels for T2 consistent with **both** (i) Tao-barrier audit AND (ii) C-003-orthogonality (the proof must NOT reduce to LP/Bony-local direct-PDE estimates), OR
- **(c′)** Falsification of T2 itself,

→ **Pivot 1 fails** → activate Pivot 2 ((β) via B-004/T3) for another 3-attempt window (A016–A018), and Pivot 3 (dormancy) thereafter.

### Maximum extended budget

- Pivot 1 (A013–A015): 3 attempts.
- Pivot 2 (A016–A018): 3 attempts if Pivot 1 fails.
- Pivot 3 (dormancy): seriously considered after 9 total new attempts (A013–A021).

## 3. Verification-bar pre-audit on Pivot 1

`docs/problems/05-navier-stokes/verification-bar.md` §7 four NSE barriers:

| Barrier | Pivot 1 plan |
|---------|--------------|
| Supercriticality | T2 targets a critical-norm bound via CFD evidence — at the right scale. Conditional pass (depends on T2's eventual formulation). |
| Tao 2016 averaged-NSE | A015 (P07) must verify CFD evidence specifically distinguishes true NSE from averaged. Pending. |
| Buckmaster–Vicol non-uniqueness | T2 targets smooth solutions; non-uniqueness of weak solutions out of scope. Pass. |
| CFD–continuum gap | **Central obligation** of Pivot 1 — rigorize the gap, not just use it heuristically. |

## 4. Companion: R6 cross-synthesis on A001–A011

Per A011 follow-up §3 and the 03-p-vs-np precedent (R6 in PR #17), a mid-arc cross-synthesis is produced as a separate artifact at `analysis/cross-synthesis/05-navier-stokes-2026-06-30.md` (this PR). The synthesis:

- Aggregates outcomes (12 attempts, 12 partial-insight); identifies dominant patterns (early-commitment discipline; route-family wall via C-003); compares methodologically with the dormant 03-p-vs-np arc.
- Recommendations align with this Pivot 1 selection: switch route within (α) rather than direction.

The R6 grounds the A012 decision rather than substituting for it.

## 5. Budget close — A005 7-attempt window retrospective

| Attempt | Outcome | One-line |
|---------|---------|----------|
| A006 | partial-insight | T1a decomposition + G_T1a_3 leverage concern |
| A007 | partial-insight | T1b Duhamel + G_T1b_1 + trigger (b) ✓ |
| A008 | partial-insight | P07 audit; 2 patches; trigger holds |
| A009 | partial-insight | direct degeneration; G_T1b_3 / G_T1b_4 |
| A010 | partial-insight | paraproduct wall + literature audit |
| A011 | partial-insight | C-003 registered |
| **A012** | **partial-insight** | **Pivot 1 selected; new mini-window** |

7 partial-insight, 0 candidate, 1 new conjecture (C-003), 2 bridges activated (B-003 walled, B-004 about to be load-bearing).

Compare 03-p-vs-np A005–A011: 7 partial-insight, 0 candidate, 2 conjectures (C-001 + C-002), dormancy enacted. Pattern is similar; 05-NS reaches the same structural point with 3 fewer attempts due to the early-commitment discipline.

## Key Insights

- **Pivot 1 is the rational next move** given C-003. It is C-003-orthogonal (different route family), keeps the (α) direction, uses an already-registered bridge (B-004), and preserves Pivot 2 / 3 as fallbacks.
- **The new mini-trigger window (A013–A015)** mirrors A005's discipline — 3-attempt falsifiable evaluation with explicit pass/fail criteria.
- **Total extended budget is bounded**: 9 more attempts (A013–A021) before dormancy is seriously on the table.
- **The CFD–continuum gap is the central obligation** of Pivot 1; the verification-bar §7 fourth barrier becomes the program's focus.
- **A005's 7-attempt budget closes** with all 7 outcomes `partial-insight` — clean structural arc producing C-003 + Pivot 1 decision; methodologically tighter than the dormant 03-p-vs-np equivalent span.

## Follow-ups

1. **A013** (next): P03 lemma-extraction on T2 (CFD sub-Kolmogorov rigor) per B-004 §4. First technical attempt on the new route.
2. **A014–A015** per the new mini-trigger window plan.
3. **B-003 status revision** (deferred from A011 follow-up): mark `dormant` after Pivot 1 begins (parallel to B-002 in PR #18). Defer to a separate companion PR for clarity.
4. **B-004 status revision**: promote from `speculative` → `ai-discovered` or higher as it becomes load-bearing.
5. **`verification-bar.md` §7 update** (from A010 follow-up #4): add "global-vs-local cancellation mismatch" as a fifth NSE barrier. Defer.
6. **C-003 status note**: parent-attempt A011, but operationally now also influenced by A012's decision; consider adding A012 to C-003's references in a future minor PR.

## References

- attempt: A005 (commitment + trigger), A007 (T1b), A009 (direct degeneration), A010 (paraproduct wall), A011 (C-003).
- bridge: [`bridges/B-003-...md`](../../../bridges/B-003-critical-norm-equivalence-along-flow.md) (walled), [`bridges/B-004-...md`](../../../bridges/B-004-cfd-pde-rigorous-turbulence-closure.md) (new load-bearing).
- conjecture: [`conjectures/C-003-...`](../../../conjectures/C-003-regularity-equivalence-nonlocal-cancellation/).
- analysis (companion): [`analysis/cross-synthesis/05-navier-stokes-2026-06-30.md`](../../../analysis/cross-synthesis/05-navier-stokes-2026-06-30.md).
- doc: [`docs/problems/05-navier-stokes/verification-bar.md`](../../../docs/problems/05-navier-stokes/verification-bar.md) §7.
- precedent: [`analysis/cross-synthesis/03-p-vs-np-2026-05-21.md`](../../../analysis/cross-synthesis/03-p-vs-np-2026-05-21.md).
- prompt: `prompts/P03-lemma-extraction.md` (minor variant for strategic decision).
