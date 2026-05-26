# Transcript — full AI conversation (frozen after merge)

> ⚠️ This file is **immutable** after the PR is merged — no edits, no
> deletions, not even typo or line-break fixes. Corrections are
> recorded in this folder's `result.md`.

---

## Meta

- Attempt ID: A005
- Model: claude-opus-4-7
- Start: 2026-05-26
- End: 2026-05-26
- Environment: Claude Code on the Web at HEAD after PR #26 merge
  (A001-A004 scaffold complete).

---

## Body

```text
[Session task framing]

User has explicitly chosen direction (α) — global regularity — with
B-003's T1 (BMO^{-1} → L^3 along-flow) as the next attack vector.
This attempt formalizes the commitment with sub-goal decomposition
and a precise pivot trigger.

The methodology lesson from 03-p-vs-np dormancy is to set the
trigger EARLY and make it falsifiable in a small number of
attempts. (A007 in the dormant program committed too late; A009
fired the trigger but the program had accumulated 5 attempts of
'productive convergence on a wall' first.)

[Reading]

- A001-A004 result.md (scaffold).
- B-003 §4 (T1-T3) and §3 (stuck points).
- B-004 §4 (T1-T3) and §3 (stuck points).
- verification-bar.md §7 (three-barrier audit table).
- 03-p-vs-np cross-synthesis (dormancy lesson).

[§1 — Commitment]

Direction: (α) GLOBAL REGULARITY for CMI sub-case (A)
(R^3 case). Sub-case (C) (T^3 case) is mostly parallel and will
be addressed implicitly.

Target invariant: L^3(R^3) — the ESS 2003 endpoint of the
critical-norm ladder. A large-data L^∞_t L^3_x bound from all
decaying smooth data ⇒ regularity ⇒ CMI (A).

Route: B-003's T1 — prove that L^∞_t BMO^{-1} bound along smooth
NSE flow implies L^∞_t L^3 bound. Combined with ESS 2003, this
strengthens the sufficient condition from L^3 to BMO^{-1}, the
largest critical Banach space at which any well-posedness is
currently known (Koch-Tataru 2001).

Why T1 over T2 or T3 (B-003's other transformations):
  T1 — proves a CONDITIONAL theorem (BMO^{-1} → L^3 along-flow)
       that doesn't itself bound a critical norm but enlarges the
       set of sufficient conditions for regularity. Falsifiable.
  T2 — small-large data interpolation: vague target, harder to
       set a 3-attempt falsifiability window.
  T3 — Tao-barrier quantification: meta-level, not a forward step.

T1 is selected because it has the cleanest falsifiable structure.

[§2 — Sub-goal decomposition of T1]

T1: For every smooth NSE solution u on [0, T) with u(0) decaying,
    if u ∈ L^∞_t([0, T); BMO^{-1}(R^3)), then u ∈ L^∞_t([0, T);
    L^3(R^3)).

Three sub-goals:

  T1a (small-data version). For u(0) sufficiently small in
       BMO^{-1}, the Koch-Tataru 2001 solution is global; T1a
       asserts that this solution lies in L^∞_t L^3.

       Heuristic: small-data Koch-Tataru solutions enjoy
       instantaneous smoothing; the L^∞_t L^3 bound likely holds.
       Plausibly provable.

  T1b (large-data version). For arbitrary smooth decaying u(0)
       (possibly large in BMO^{-1}), assuming u ∈ L^∞_t BMO^{-1}
       on [0, T), prove u ∈ L^∞_t L^3 on [0, T).

       Heuristic: this is the structurally hard case. The known
       partial-result literature (Albritton borderline regularity,
       Lemarié-Rieusset 2018 Ch. 9-10) hints at the methods but
       not at the conclusion.

  T1c (Tao-barrier audit per verification-bar §7). Identify the
       specific NSE cancellation in B(u, v) = P(u·∇v) that
       distinguishes the proof of T1 from the (false) analog on
       averaged NSE.

       Heuristic: any proof using only sub-critical estimates is
       barrier-blocked. A T1 proof must use critical estimates AND
       a NSE-specific cancellation.

[§3 — Stage plan A006-A008]

  A006 attacks T1a. Prompt: P03 lemma extraction on the
       small-data Koch-Tataru proof, with the L^∞_t L^3 conclusion
       as a new target lemma. If T1a is plausibly true, A006 should
       sketch a proof or identify a precise gap.

  A007 attacks T1b. Prompt: P03 lemma extraction on the large-data
       BMO^{-1} → L^3 implication, focusing on the bilinear estimate
       B(u, v) at the BMO^{-1} → L^3 scale. Likely outcome:
       identify one or more gap labels reflecting the genuine
       difficulty. Honest expectation is partial-insight.

  A008 runs the Tao-barrier audit per verification-bar §7. Prompt:
       P07 adversarial review (analog of A003 in the dormant
       program) on whatever A006/A007 produced. If A006/A007 used
       only barrier-blocked estimates, A008 catches it.

[§4 — Pivot trigger conditions]

If, after A006-A008, the program has NOT produced AT LEAST ONE of:
  (a) a proof or near-complete proof of T1a, OR
  (b) a precise lemma-graph + gap labels for T1b that is consistent
      with the Tao-barrier audit, OR
  (c) a falsification of T1 (counterexample, or a structural
      obstruction equivalent to the discrete-vs-continuous wall
      C-002 in scale),

then the program PIVOTS:

  Pivot 1: switch route within (α). Try T2 (small-large
    interpolation) or move to B-004 + T2 (sub-Kolmogorov rigor).
  Pivot 2 (if Pivot 1 fails for two more attempts): switch
    direction to (β) blowup via B-004 + T3 (Hou-Luo-scenario rigor).
  Pivot 3 (if (β) also fails for two more attempts): consider
    dormancy following 03-p-vs-np precedent.

The trigger is FALSIFIABLE within 3 attempts. The pivots add at
most 4 more attempts before dormancy is on the table.

[§5 — Verification-bar pre-audit]

verification-bar.md §7 lists four NSE-specific barriers; T1 must
address each.

  Barrier: Supercriticality (scaling of energy in 3D).
  T1 plan: use CRITICAL estimates throughout. Identify the precise
    bilinear estimate B(u,v) at the BMO^{-1} → L^3 scale; ensure
    no sub-critical detour.

  Barrier: Tao 2016 averaged-NSE.
  T1 plan: the proof must exploit the divergence-free condition
    ∇·u = 0 and/or the specific pressure structure. T1c (sub-goal)
    forces this identification.

  Barrier: Buckmaster-Vicol 2019 non-uniqueness.
  T1 plan: T1 targets SMOOTH solutions, not weak. The non-uniqueness
    is irrelevant to the target class; explicitly stated.

  Barrier: numerical-vs-continuum gap.
  T1 plan: T1 is purely analytical; CFD evidence is heuristic-only.
    B-004 + T2 (deferred to a future attempt) would address this.

Pre-audit verdict: T1 is consistent with all four barriers. A006-A008
must close the audit in detail.

[R2 outcome label deliberation]

  - no-progress: false; produces a commitment and a sub-goal
    decomposition.
  - survey: borderline — the document organizes existing material.
  - partial-insight: matches better. The commitment to T1 with
    falsifiable pivot triggers is a program-level structural
    contribution. The 03-p-vs-np lesson is applied explicitly.
  - flawed-attempt: false.
  - novel-approach: not for this attempt (no new technique).
  - claimed-solution, peer-reviewable: forbidden.

  Selected: partial-insight.

[Charter §3 audit]

  L1: dependency-graph closure. Sub-goals T1a/T1b/T1c reference
      B-003, Koch-Tataru 2001, ESS 2003, Tao 2016 averaged NSE,
      Buckmaster-Vicol 2019. Closed.
  L2-L7: n/a (strategic document, not a numerical claim).
```
