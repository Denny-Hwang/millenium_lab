# Transcript — full AI conversation (frozen after merge)

> ⚠️ This file is **immutable** after the PR is merged — no edits, no
> deletions, not even typo or line-break fixes. Corrections are
> recorded in this folder's `result.md`.

---

## Meta

- Attempt ID: A006
- Model: claude-opus-4-7
- Start: 2026-05-27 (continuing the 05-navier-stokes A001-A005 arc)
- End: 2026-05-27
- Environment: Claude Code on the Web at HEAD after PR #27 merge
  (A005 direction commitment to (α) via B-003 / T1).

---

## Body

```text
[Session task framing]

P03 lemma extraction on T1a (small-data BMO^{-1} → L^3 along-flow)
under the (α) direction commitment from A005. First technical
attempt on the committed route.

[Reading]

- A005 result.md (T1a statement; pivot trigger).
- B-003 §2-§4 (Koch-Tataru 2001 structure; T1 transformations).
- statement.md "Conventions" (CMI initial-data class: smooth,
  divergence-free, decaying per Fefferman 2000 §A).
- known-results.md §4 (Koch-Tataru: small BMO^{-1} → global mild
  solution; Kato 1964: small L^3 → global mild solution).
- equivalent-forms.md §3 (the strict-inclusion chain
  Ḣ^{1/2} ⊂ L^3 ⊂ ... ⊂ BMO^{-1} ⊂ Ḃ^{-1}_{∞,∞}).

[Step 1 — Restate T1a precisely]

T1a (A005 §2). For u_0 in BMO^{-1}(R^3) with sufficiently small
norm, the Koch-Tataru 2001 global mild solution lies in
L^∞_t L^3.

[Step 2 — Initial-data class disambiguation]

The CMI sub-question (A) (per statement.md) restricts u_0 to the
*smooth, divergence-free, decaying* class — Fefferman 2000 §A.
For such u_0:

  - u_0 ∈ C^∞ ∩ L^p(R^3) for every p (by decay + boundedness on
    compact sets). In particular u_0 ∈ L^3.
  - u_0 ∈ BMO^{-1} (by embedding L^3 ⊂ BMO^{-1}, with
    ||u_0||_{BMO^{-1}} ≤ C ||u_0||_{L^3}).

So WITHIN the CMI class, "small in BMO^{-1}" is ENTAILED by
"small in L^3" (since the embedding constant is finite), but NOT
vice versa: a CMI datum could be small in L^3 (Kato regime) or
large in L^3 but small in BMO^{-1} (Koch-Tataru regime
strictly enlarged).

The genuine T1a question inside CMI is therefore:

  For u_0 smooth decaying, with ||u_0||_{BMO^{-1}} small but
  ||u_0||_{L^3} possibly large, does the Koch-Tataru solution
  satisfy u ∈ L^∞_t L^3?

[Step 3 — Sub-lemmas]

L_T1a_1. (Existence-and-uniqueness, Koch-Tataru 2001.) For
  ||u_0||_{BMO^{-1}} < ε_KT (a universal small constant), there
  exists a unique global mild solution u in the Koch-Tataru class
  X_KT := { u : sup_t √t ||u(t)||_{L^∞} < ∞ ; ∫_0^∞ ∫ |u|^2
  dx dt is a Carleson measure of suitable type }.
  Difficulty: low — published theorem.
  Dependencies: none external to A006.

L_T1a_2. (CMI restriction.) Under CMI hypotheses (smooth, divergent-
  free, decaying u_0), u_0 ∈ L^3 ∩ BMO^{-1}.
  Difficulty: low — direct embedding.

L_T1a_3. (Mild-solution agreement, small data.) If u_0 ∈ L^3 ∩
  BMO^{-1} with both norms small, the Kato solution and the
  Koch-Tataru solution coincide on their common interval of
  existence.
  Difficulty: low — uniqueness in a common subspace; cf. Lemarié-
  Rieusset 2018 Ch. 9.
  Dependencies: L_T1a_1; Kato 1964.

L_T1a_4. (Kato endpoint, small L^3.) If u_0 ∈ L^3 small, the Kato
  global mild solution is in L^∞_t L^3.
  Difficulty: low — published (Kato 1984).
  Dependencies: none.

L_T1a_5. (Substantive T1a inside CMI.) For u_0 smooth decaying,
  ||u_0||_{BMO^{-1}} < ε_KT but ||u_0||_{L^3} possibly large,
  the Koch-Tataru solution is in L^∞_t L^3.
  Difficulty: HIGH — this is the genuine T1a question. Open.

[Step 4 — Trivial case via L_T1a_3 + L_T1a_4]

If we add to L_T1a_5 the further assumption that ||u_0||_{L^3}
is ALSO small, then by L_T1a_3 the Koch-Tataru solution equals
the Kato solution, which by L_T1a_4 is in L^∞_t L^3. So T1a
holds **trivially** under the *additional* smallness assumption.

This is the "T1a-trivial" sub-case. It does NOT advance the
program — it merely rephrases Kato's theorem.

[Step 5 — Substantive case: L_T1a_5]

The non-trivial content of T1a is exactly L_T1a_5:

  Hypothesis: u_0 smooth decaying with small BMO^{-1} norm but
  large L^3 norm.
  Conclusion: u ∈ L^∞_t L^3.

Whether such u_0 exist within CMI: yes, conceptually. Example
construction (sketch): take u_0 = ε_KT/2 · (oscillatory profile
on scale 1) summed over many widely-separated bumps. Each bump
has BMO^{-1}-norm contribution = ε_KT/(2N) (decoupled by
distance); total BMO^{-1} norm ≈ ε_KT/2. But L^3-norm scales as
N · (bump-L^3-norm), which can be made large.

So L_T1a_5 is the *real* question. Its answer is OPEN as far
as the literature reviewed for this attempt.

Why L_T1a_5 is hard:
  - Koch-Tataru's solution machinery controls a specific scaling
    norm (BMO^{-1} via tent-space / Carleson conditions). L^3 is
    a DIFFERENT critical scaling norm.
  - Propagating an L^3 bound along the Koch-Tataru flow requires
    bilinear estimates linking the Koch-Tataru class X_KT and
    L^3, which (to my reading) are not in the published
    literature in the required form.
  - The Albritton-Lemarié-Rieusset borderline-regularity
    literature contains close analogs but does not seem to
    state L_T1a_5 directly.

[Step 6 — Gaps]

G_T1a_1. (Major.) The bilinear estimate B(u, v) at the
  X_KT × X_KT → L^∞_t L^3 scale is not in the literature in the
  form needed. Need to: (a) state it precisely; (b) check
  whether it can be proved by Bony-paraproduct decomposition;
  (c) check whether it survives the Tao-barrier audit (B-003 T3
  / verification-bar §7).

G_T1a_2. (Major.) The "small in BMO^{-1} but large in L^3"
  initial-data class — does it admit clean structure (e.g., a
  closed subset of L^3 ∩ BMO^{-1} on which both norms behave
  comparably)? Without this, L_T1a_5 may be a strictly larger
  claim than is necessary for the program's downstream use.

G_T1a_3. (Major-but-not-lethal.) Even if L_T1a_5 holds, its
  COMBINATION with ESS 2003 yields only:
    "small BMO^{-1} ⇒ regularity"
  which is weaker than the original Koch-Tataru theorem
  ("small BMO^{-1} ⇒ global mild solution") in any clearly
  non-circular sense. The program needs to identify the *new
  content* T1a + ESS produces — likely the BMO^{-1} "smallness"
  threshold can be exposed via L^3 evaluation, but this is not
  spelled out.

  Status: G_T1a_3 suggests that the small-data sub-goal T1a may
  be of LIMITED value to the (α) program even if proved. The
  genuine target is T1b (large-data) which would close (A) via
  ESS 2003. T1a is a structural waypoint, not a payoff lemma.

[Step 7 — Delta against A005's T1a]

A005 §2 stated T1a as "plausibly provable via instantaneous
smoothing in Koch-Tataru regime." A006 sharpens:

  - The "instantaneous smoothing" intuition is for L^∞-type
    norms (Koch-Tataru's natural class). Extending it to L^3
    requires bilinear estimates linking X_KT and L^3 that are
    OPEN.

  - Inside the CMI class, T1a-trivial holds via Kato; T1a-
    substantive (L_T1a_5) is the real open question.

  - The decomposition into L_T1a_1 through L_T1a_5 isolates the
    difficulty cleanly in L_T1a_5.

  - G_T1a_3 surfaces a new concern: T1a's program-level
    leverage is more limited than A005's commitment statement
    suggested. The (α) program's real payoff is T1b (large-data).

[Step 8 — Verification-bar pre-audit]

statement.md "What does NOT count":
  Numerical-only: not relevant; this is an analytical attempt.
  Surrogate-model reductions: T1a uses true NSE bilinear form;
    pass.
  Conditional theorems: T1a is BY DESIGN conditional (BMO^{-1}
    smallness → L^3 boundedness). The verification-bar warns
    that conditional theorems "do not by themselves resolve
    (A)/(B)". A006 explicitly accepts this: T1a is a structural
    lemma feeding into the larger program, not a resolution
    claim.

verification-bar.md §7 four barriers:
  Supercriticality: L^3 and BMO^{-1} are both critical; T1a
    operates within the critical regime. Pass.
  Tao 2016 averaged-NSE: G_T1a_1 explicitly flags the need to
    check the bilinear estimate against averaged-NSE. Deferred to
    A008 (P07 adversarial).
  Buckmaster-Vicol non-uniqueness: T1a targets the smooth class
    (mild solutions equal smooth for small data); non-uniqueness
    of weak solutions is irrelevant. Pass.
  CFD-continuum gap: not applicable for T1a (analytical). Pass.

[Step 9 — Trigger evaluation per A005 §4]

A005's three trigger satisfaction conditions:
  (a) T1a proof / near-complete proof — partially achieved:
      T1a-trivial is proved (rephrasing of Kato); T1a-substantive
      (L_T1a_5) is identified as OPEN.
  (b) T1b lemma-graph — not yet attacked (A007's role).
  (c) T1 falsification — not produced.

A006 advances the program toward (a) at the trivial level but
not the substantive level. Per A005, this does NOT yet fire the
pivot trigger (A007-A008 remain). However, G_T1a_3 raises the
question of whether T1a's program-level value is high enough to
warrant 2 more attempts (A007 + A008) before pivot evaluation.

  Decision: proceed to A007 as planned. The (α) program retains
  the full 3-attempt window. A006 has produced a substantive
  refinement of T1a's structure without firing the trigger.

[Step 10 — Charter §3 audit]

  L1: dependency-graph closure. T1a decomposed into L_T1a_1
      through L_T1a_5, each with explicit dependencies (Koch-
      Tataru 2001, Kato 1964, embedding theorems, Lemarié-
      Rieusset 2018). Closed.
  L2: numerical / small-case — n/a for an analytical lemma
      decomposition.
  L3-L7: n/a.

[R2 outcome label deliberation]

  - no-progress: false. T1a's substantive content is isolated
    to L_T1a_5 with explicit gaps.
  - survey: borderline. The lemma decomposition organizes
    existing literature rather than producing new results.
  - partial-insight: matches better. G_T1a_3 surfaces a NEW
    structural concern about T1a's program-level leverage that
    A005 did not flag.
  - flawed-attempt: false; no false claim. (Specifically, A006
    does NOT claim to prove L_T1a_5; it explicitly marks it as
    OPEN.)
  - novel-approach: no new technique.
  - claimed-solution, peer-reviewable: forbidden.

  Selected: partial-insight.
```
