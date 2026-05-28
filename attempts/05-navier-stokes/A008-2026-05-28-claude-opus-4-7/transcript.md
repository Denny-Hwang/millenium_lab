# Transcript — full AI conversation (frozen after merge)

> ⚠️ This file is **immutable** after the PR is merged — no edits, no
> deletions, not even typo or line-break fixes. Corrections are
> recorded in this folder's `result.md`.

---

## Meta

- Attempt ID: A008
- Model: claude-opus-4-7
- Start: 2026-05-28
- End: 2026-05-28
- Environment: Claude Code on the Web at HEAD after PR #29 merge
  (A007 T1b Duhamel + G_T1b_1 + trigger (b) achieved).

---

## Body

```text
[Session task framing]

P07 adversarial review on A006 + A007 / T1 program. Third (and
final) attempt of A005's 3-attempt window. Goal: audit the lemma
graphs at the RESOLUTION level (beyond the lemma-statement level
A007 covered) and re-evaluate A005's pivot trigger.

Caveat per P07: ideally the adversarial reviewer is from a
different model and session than the authors. This is not the case
here (same Claude Code on the Web session as A001-A007). The
adversarial discipline is enforced explicitly: I deliberately
attempt to break A006/A007, not to defend them.

[Reading]

- A005, A006, A007 result.md (the targets).
- B-003 §3 (stuck points; cross-check).
- verification-bar.md §7 (four-barrier table).
- 03-p-vs-np A003 transcript (template for P07 attack scenarios).

[Attack A1 — weaken_assumption on T1a (L_T1a_1 Koch-Tataru)]

  Scenario. Weaken L_T1a_1's smallness assumption ||u_0||_{BMO^{-1}}
  < ε_KT by an arbitrarily small ε > 0. The Koch-Tataru theorem is
  threshold-dependent; the threshold ε_KT is universal.

  Breakage. None at the lemma level — the threshold ε_KT is a
  universal constant of the Koch-Tataru theorem; perturbing it
  shrinks the regime but doesn't break the existence.

  Survival. L_T1a_1 is robust; the small-data regime is non-empty
  for any ε ≤ ε_KT.

  Verdict: survives.

[Attack A2 — chain_lethal_lemma_failure on T1a (L_T1a_5)]

  Scenario. Suppose the literature has a counterexample to L_T1a_5:
  a CMI u_0 with small BMO^{-1} but large L^3 norm whose Koch-Tataru
  solution does NOT lie in L^∞_t L^3. Did A006 miss this?

  Breakage. If such a counterexample exists, L_T1a_5 is false,
  the substantive part of T1a fails, and G_T1a_3's leverage
  concern becomes amplified into a hard structural obstruction.

  Survival argument (partial). I have NOT located such a
  counterexample in the published literature reviewed (Lemarié-
  Rieusset 2018; Albritton; Auscher-Frey-Monniaux). The bump
  construction in A006's example is genuinely "small BMO^{-1} /
  large L^3" inside CMI, but A006 does not assert that its
  Koch-Tataru solution leaves L^3 — only that the L^3 norm is not
  obviously controlled. So the question is OPEN, not refuted.

  Verdict: needs-patch:explicit-literature-search-for-counterexample.
  This is a follow-up action: a careful audit of borderline
  regularity criteria might either prove L_T1a_5 or refute it.

[Attack A3 — domain_swap on T1b (R^3 → T^3)]

  Scenario. Replace R^3 with the torus T^3 (CMI sub-case (C)). On
  T^3 the BMO^{-1} ⊂ L^3 embedding is automatic via boundedness
  on a compact manifold; L^3(T^3) is finite for any L^∞(T^3)
  function.

  Breakage. On T^3, the Koch-Tataru small-data theorem still
  holds (with adapted critical spaces). L_T1b_3b's auxiliary L^q
  control may be ROUTINE on T^3 because of the compact-manifold
  embeddings, which would TRIVIALIZE T1b for sub-case (C). If T1b
  is trivial on T^3, the program's value is reduced to sub-case
  (A).

  Survival argument (partial). On T^3, T1b's content reduces:
  BMO^{-1}(T^3) is closely related to L^∞(T^3) modulo constants,
  and L^∞(T^3) ⊂ L^3(T^3) is automatic. So L_T1b_3b on T^3 is
  trivial via the embedding. But on R^3 the BMO^{-1} ⊂ L^3
  embedding is NOT automatic (BMO^{-1}(R^3) contains
  non-decaying / oscillatory data outside L^3). The R^3 case
  retains the substantive content.

  This is INFORMATIVE: it shows T1b's substantive content is
  specific to R^3 (sub-case (A)). The program's focus on (A) is
  correctly placed.

  Verdict: survives — but with the note that A007's
  decomposition should explicitly distinguish R^3 vs T^3
  sub-cases in a future revision.

[Attack A4 — circular_reasoning_check on T1b]

  Scenario. Does the L_T1b_3b derivation IMPLICITLY assume the
  conclusion u ∈ L^∞_t L^3 somewhere in its hypothesis chain?
  This would render T1b circular.

  Breakage. Auxiliary L^q (q > 3) is HARDER than L^3 in the
  embedding direction, so a derivation of L^q from BMO^{-1} +
  smoothness + energy cannot use the L^3 conclusion as a stepping
  stone without circularity.

  However, A007's L_T1b_3 argument structure is:
    L^∞_t BMO^{-1} (hyp) + smoothness + energy
      → L^∞_t L^q  (L_T1b_3b)
      → L^∞_t L^3  (L_T1b_3a Duhamel time-integral)

  L^3 is the CONCLUSION, not an intermediate. So no circularity.

  Survival. Direct verification.

  Verdict: survives.

[Attack A5 — quantifier_alternation_check on T1b]

  Scenario. Does T1b's statement have a hidden quantifier flip
  between "for all u_0" and "there exists a constant"? Recall
  A003's A6 attack on the dormant 03-p-vs-np H_AC^0 quantifiers.

  Breakage. T1b (A007 §1): "For initial data u_0 smooth decaying
  ... Let u be the corresponding smooth NSE solution on [0, T).
  Suppose u ∈ L^∞([0, T); BMO^{-1}). Then u ∈ L^∞([0, T); L^3),
  with bound depending on ||u_0||_{L^3 ∩ BMO^{-1}},
  ||u||_{L^∞_t BMO^{-1}}, and T."

  Quantifier reading: ∀ u_0, ∀ smooth solution u of NSE from u_0,
  IF u ∈ L^∞_t BMO^{-1} on [0, T) THEN u ∈ L^∞_t L^3 on [0, T)
  with a bound depending on the named quantities.

  The bound is allowed to depend on u_0 and the BMO^{-1} hypothesis
  size (in particular, T). Is this dependence acceptable for
  closing CMI (A)?

  For (A), we need T1b in a form usable with ESS 2003: u ∈
  L^∞_t L^3 on [0, T*) for ANY breakdown time T*. The T-dependence
  in T1b's bound becomes T*-dependence; if T* < ∞ (blowup), the
  bound is finite; if T* = ∞ (global existence), the bound's
  behavior as T → ∞ matters.

  G_T1b_2 (A007 §3) already flagged this. T1b's quantifier
  structure is OK for combining with ESS up to T*-blowup, but
  global-in-time uniform bounds require an additional argument
  (G_T1b_2). NOT a hidden quantifier flip; the dependence is
  explicit.

  Verdict: survives.

[Attack A6 — tao_barrier_resolution_audit on G_T1b_1]

  Scenario. A007 satisfied the Tao-barrier audit at the
  LEMMA-STATEMENT level (Duhamel uses P + ∇·u = 0). But the
  RESOLUTION of G_T1b_1 — actually establishing L_T1b_3b — may
  use estimates that also work on averaged NSE. If so, the
  RESOLUTION-level audit FAILS, and a proof following A007's
  decomposition might be barrier-blocked.

  Breakage analysis. Possible proofs of L_T1b_3b:

    (a) Paraproduct decomposition of u ⊗ u + heat-semigroup
        estimates. The paraproduct uses Bony-style splitting
        T_u v + T_v u + R(u, v). This is a HA tool that does NOT
        intrinsically use ∇·u = 0; it would also apply to
        averaged NSE. WARNING: a paraproduct-only proof of
        L_T1b_3b would be barrier-blocked.

    (b) Vorticity-equation approach. The vorticity equation
        ∂_t ω + u · ∇ω = ω · ∇u + ν Δω uses the divergence-free
        condition essentially. A vorticity-based proof of L_T1b_3b
        would survive the barrier audit. But constructing such a
        proof is itself non-trivial.

    (c) Direct energy-method extension. Combining the energy
        identity (uses ∇·u = 0) with the BMO^{-1} hypothesis to
        get L^q control. Such a proof would be barrier-safe.

  Status. G_T1b_1's resolution must use approach (b) or (c) (or
  another approach that genuinely needs ∇·u = 0); a pure
  paraproduct approach (a) would fail the resolution-level audit.

  A007 did NOT specify which approach G_T1b_1 will use; this is
  legitimate — A007 only sets up the gap. But A009+ must commit
  to a specific approach and pass the audit at that level.

  Verdict: needs-patch:explicit-approach-and-resolution-level-audit
  for G_T1b_1. The lemma-statement-level audit is satisfied; the
  resolution-level audit is conditional on A009+'s approach
  choice.

[Attack A7 — weaken_assumption on energy hypothesis]

  Scenario. T1b's L_T1b_3b uses "smoothness + energy" as auxiliary
  inputs. What if "energy" means the energy inequality ∫ ||∇u||^2
  dt < ∞ but the integration is degraded (e.g., suitable weak
  solution, not strong)?

  Breakage. Weak / suitable-weak solutions don't necessarily
  satisfy the BMO^{-1} hypothesis with the same control as smooth
  solutions; A007 restricts to the smooth class explicitly.
  Buckmaster-Vicol 2019 non-uniqueness lives in weak solutions
  only.

  Survival. T1b targets smooth solutions (A007 §1 explicit). Weak
  / suitable-weak solutions are out of scope; non-uniqueness
  caveat does not bite.

  Verdict: survives.

[Round verdict]

  Six attacks (A1, A2, A3, A4, A5, A6, A7 — wait, that's 7
  attacks counting A2 and A6 as needs-patch).

  Counts:
    - 5 SURVIVES: A1, A3, A4, A5, A7.
    - 2 NEEDS-PATCH: A2 (literature search for L_T1a_5
      counterexample); A6 (resolution-level Tao-barrier audit
      requires A009+ to specify approach).
    - 0 LETHAL.

  Round verdict: PARTIAL — needs-patch (not lethal). Both patches
  are FORWARD-LOOKING: they specify follow-up work rather than
  flagging defects in A006/A007 themselves.

  Suggested patches:
    Patch 1 (for A2). A009 or follow-up: explicit literature audit
      (Albritton, Auscher-Frey-Monniaux, Bourgain-Pavlovic) for
      a possible L_T1a_5 counterexample within CMI. If found,
      T1a-substantive fails and the program retreats to
      Koch-Tataru-style content only (amplifying G_T1a_3).
    Patch 2 (for A6). A009+: specify the approach to G_T1b_1
      (paraproduct-only vs vorticity vs direct energy method). If
      paraproduct-only, REJECT as barrier-blocked. If vorticity
      or energy method, run a fresh statement-level audit on the
      specific approach.

[A005 pivot trigger re-evaluation]

  A005's three criteria:
    (a) T1a proof or near-complete: PARTIAL (trivial sub-case
        only, per A006).
    (b) T1b lemma-graph + gap labels (Tao-barrier consistent):
        ACHIEVED (per A007). A008 confirms at the
        lemma-statement level; flags resolution-level audit as
        a separate ongoing requirement (Patch 2).
    (c) T1 falsification: not produced.

  Trigger condition was "if NONE of (a)/(b)/(c) → pivot." (b) IS
  achieved.

  TRIGGER DOES NOT FIRE. The (α) program continues per the
  committed route.

  A009+ inherits the patches: investigate the L_T1a_5
  counterexample question; choose an approach to G_T1b_1 and
  pass the resolution-level audit.

[Reflection on 3-attempt window]

  A006-A007-A008 form A005's 3-attempt evaluation window. Outcomes:
    A006: partial-insight (T1a decomposition + G_T1a_3).
    A007: partial-insight (T1b decomposition + trigger (b)
          achieved).
    A008: this attempt — partial-insight (adversarial audit;
          partial round verdict; pivot does not fire).

  Window assessment: the (α) program is BETTER positioned than
  03-p-vs-np was at the equivalent point. The 03-p-vs-np A005-
  A007 produced trivializations and dual obstructions; here
  A006-A008 produces a clean lemma graph with a single named
  bottleneck (G_T1b_1) and explicit recommendations for A009.

  Future budget per A005: A006-A012 (max 7 before dormancy
  threshold). 3 used; 4 remain.

[Charter §3 audit]

  L1: dependency-graph closure on the audit; all citations
      consistent with A006-A007 references. Closed.
  L2-L7: n/a for an adversarial audit.

[R2 outcome label deliberation]

  - no-progress: false; produces a structured audit with
    actionable patches.
  - survey: borderline.
  - partial-insight: matches — A006/A007 are NOT defective
    (no lethal verdicts), but the audit surfaces two patches
    that constrain A009+ design. The resolution-level Tao-barrier
    audit (A6) is a SUBSTANTIVE structural finding.
  - flawed-attempt: false; no false claim.
  - novel-approach: no.
  - claimed-solution, peer-reviewable: forbidden.

  Selected: partial-insight.
```
