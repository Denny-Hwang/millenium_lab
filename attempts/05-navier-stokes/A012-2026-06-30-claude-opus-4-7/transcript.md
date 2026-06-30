# Transcript — full AI conversation (frozen after merge)

> ⚠️ This file is **immutable** after the PR is merged — no edits, no
> deletions, not even typo or line-break fixes. Corrections are
> recorded in this folder's `result.md`.

---

## Meta

- Attempt ID: A012
- Model: claude-opus-4-7
- Start: 2026-06-30
- End: 2026-06-30
- Environment: Claude Code on the Web at HEAD after PR #33 merge
  (A011 + C-003).

---

## Body

```text
[Session task framing]

Final attempt of A005's 7-attempt budget (A006-A012). Pivot
evaluation given C-003 (A011's intrinsic-wall conjecture).

[Reading]

- A005 §4 (pivot ladder, falsifiable triggers).
- A010 §5 (Pivot 1 most plausible reasoning).
- A011 (C-003 statement; strength/weakness).
- C-003 statement.md (the wall to escape).
- B-003 (current load-bearing, walled).
- B-004 (candidate next route, status speculative).

[§1 — Pivot selection]

Three options (A005 §4):

  Pivot 1: B-004 + T2 (sub-Kolmogorov / CFD-PDE bridge).
    Continues (α) global-regularity direction; switches the
    *route family* away from direct PDE (energy / vorticity /
    paraproduct, all blocked by C-003) toward
    numerical-to-continuum methods.

    C-003-orthogonality check: C-003 quantifies over proofs in
    the direct-PDE family (Tao-barrier + LP/Bony local). A
    CFD-derived bound on a critical norm is OUTSIDE this family
    — the audit constraint "uses ∇·u = 0" enters differently
    (DNS preserves ∇·u = 0 numerically; the bound's transfer to
    continuum uses convergence arguments, not LP locality). C-003
    DOES NOT BLOCK Pivot 1 directly.

    But B-004 itself has stuck points (B-004 §3): the continuum
    limit Δx_k → 0 is not rigorously controlled at high Re;
    sub-Kolmogorov singularities undetectable in finite
    simulation; Tao 2016 averaged-NSE barrier on the CFD side
    too (any CFD-to-PDE bridge must distinguish true NSE from
    averaged).

  Pivot 2: (β) blowup direction via B-004 / T3 (Hou-Luo Type-II).
    Larger change — direction flip. Hou-Luo 2014 numerical
    evidence suggests boundary blowup at high Re; T3 is the
    Type-II rigorization. Bürgisser-Ikenmeyer 2019 / Tao 2016
    don't directly block this but the program would need to
    REFRAME entirely.

    C-003-orthogonality: C-003 is about α (regularity) approach;
    irrelevant to β. Pivot 2 is C-003-untouched.

    But: Pivot 2 abandons all the A001-A011 work in (α). The
    asset preservation is only via C-003 itself.

  Pivot 3: dormancy recommendation.
    Premature given Pivot 1 is C-003-orthogonal and untried.
    The 03-p-vs-np dormancy precedent applied AFTER both (R1)
    and (R2) were tried; here we've tried only one route family.
    Not the right move at A012.

DECISION: Pivot 1 (B-004 + T2).

Reasoning:
  (i) Stays in (α) direction — does not abandon the program's
      original target.
  (ii) Switches route family to one C-003 does NOT block.
  (iii) B-004 is registered (PR #25) and ready to use as the
        new load-bearing bridge.
  (iv) Pivot 2 ((β)) remains as fallback if Pivot 1 also fails;
       Pivot 3 (dormancy) remains as the final option after
       Pivot 1 + Pivot 2 both fail (mirroring 03-p-vs-np's path).
  (v) Charter §2 spirit: not yet at the "accumulating attempts
      for their own sake" point; one un-tried route family
      remains.

The choice mirrors 03-p-vs-np's A009 (R1)→(R2) decision in
structure, but is taken at a different program-arc point: there,
the choice was forced by trigger firing; here, A005's trigger has
not fired but C-003 makes Pivot 1 the rational next move.

[§2 — New mini-trigger window for A013+]

By analogy with A005's window for A006-A008, set a 3-attempt
window for Pivot 1's first test:

  A013: P03 lemma-extraction on T2 (CFD sub-Kolmogorov rigor).
        Decompose T2 into sub-lemmas; identify the bottleneck.
        Analog of A007 for the new route.

  A014: technical attempt on the bottleneck. Analog of A009.

  A015: P07 adversarial audit. Analog of A008.

Falsifiability criteria for the Pivot-1 trigger:

  After A013-A015, if NONE of:
    (a') A T2 sub-lemma proof or near-complete proof;
    (b') Precise lemma-graph + gap labels for T2 consistent with
         BOTH (i) Tao-barrier audit AND (ii) C-003-orthogonality
         (a proof passing both must NOT reduce to LP/Bony-local
         direct-PDE estimates);
    (c') Falsification of T2 itself;
  is produced → Pivot 1 fails → consider Pivot 2 (β) or
  Pivot 3 (dormancy).

Budget for the Pivot-1 mini-window: 3 attempts (A013-A015). If
Pivot 1 succeeds at this window's level (criterion b'), the
program continues into A016+ on the new route. If it fails,
budget for Pivot 2: another 3 attempts (A016-A018). After 9 total
new attempts (A013-A021) without progress, dormancy is on the
table.

Total realistic timeline: 9 more attempts max before dormancy
becomes a serious recommendation (mirrors the 7-attempt original
budget × 3 routes).

[§3 — Verification-bar pre-audit on Pivot 1]

verification-bar.md §7 four NSE barriers:
  Supercriticality: T2's CFD-derived bound at a critical norm
    must operate at the critical scale. B-004 §4 T2 explicitly
    targets this. Pre-audit pass (conditional on T2's eventual
    formulation).

  Tao 2016 averaged-NSE: A013-A015 must verify that the CFD
    evidence cannot be interpreted on averaged NSE. Hou-Luo
    2014's numerical setup uses Δx_k discretization of true NSE
    (specifically axisymmetric); the averaged variant has not
    been computed. Pre-audit: PENDING (A015 P07 will check).

  Buckmaster-Vicol 2019 non-uniqueness: T2 targets smooth
    solutions; weak-solution non-uniqueness is out of scope.
    Pass.

  CFD-continuum gap: this is exactly the bridge T2 attempts.
    The audit obligation is precisely to RIGORIZE this gap, not
    just to use it heuristically. Pre-audit: CENTRAL OBLIGATION
    of the entire Pivot 1.

[§4 — Companion: mid-arc R6 cross-synthesis]

Per A010 and A011 follow-up §3, an R6 cross-synthesis on
A001-A011 is now strongly motivated. The R6 output is a separate
artifact at analysis/cross-synthesis/05-navier-stokes-2026-06-30.md
written in the same PR as A012 (analogous to PR #17 for the
03-p-vs-np dormancy synthesis).

A012 references the R6 as its companion; the R6 grounds A012's
pivot decision in the patterns across the full arc.

[§5 — Budget close]

A005's 7-attempt budget (A006-A012) closes here. Outcomes:
  A006 partial-insight (T1a + G_T1a_3)
  A007 partial-insight (T1b + trigger (b) ✓)
  A008 partial-insight (P07 + 2 patches)
  A009 partial-insight (direct degeneration)
  A010 partial-insight (paraproduct wall + literature audit)
  A011 partial-insight (C-003 registered)
  A012 partial-insight (Pivot 1 selected; new mini-window set)

All 7 partial-insight. Compare to dormant 03-p-vs-np's
equivalent 7-attempt span (A005-A011): 7 partial-insight + 1
dormancy enactment. Pattern is similar.

Difference: 05-NS reached the "Pivot 1 ready to try" state with
3 fewer attempts than 03-p-vs-np did the equivalent transition,
and with one fewer (R1)→(R2) attempt-trio because the early
commitment (A005) saved iterations.

[Charter §3 audit]

  L1: dependency-graph closure on the pivot decision. C-003,
      B-003, B-004 all referenced; no new external claims.
      Closed.
  L2-L7: n/a.

[R2 outcome label deliberation]

  - no-progress: false; produces a program-level decision +
    new trigger window.
  - survey: borderline.
  - partial-insight: matches — pivots the program with explicit
    falsifiability; analog of A005's commitment attempt.
  - flawed-attempt: false.
  - novel-approach: no.
  - claimed-solution, peer-reviewable: forbidden.

  Selected: partial-insight.
```
