# Verification Protocol — L1 to L7

This document defines the **detailed pass criteria** for the verification
levels summarized in [`charter.md`](../../charter.md) §3. Every attempt
and candidate measures progress against the table below.

---

## L1 — Self-consistency

**Target**: just before candidate registration.

**Pass criteria (all must hold)**:

1. The conclusion stated in `claim.md` is described as equivalent to (or
   a strong correspondent of) the official CMI statement.
2. Every lemma referenced in `main-proof.md` has a file in `lemmas/`.
3. The dependency graph among lemmas is closed (external theorems are
   allowed only as **explicit citations**).
4. All assumptions and axioms used are listed in `strategy.md`
   (including whether the axiom of choice is used).
5. Every known gap is labeled in `gaps.md` with `severity`:
   minor/major/lethal.

**Deliverable**: a `verify(L1): PC-### pass` commit and PR.

---

## L2 — Computational Consistency

**Target**: after L1.

**Pass criteria**:

1. At least three reductions of the candidate's conclusion to verifiable
   small cases are defined.
2. The numerical/computational outputs in each case do not contradict the
   candidate's claim.
3. Experiment code and outputs are preserved under
   `attempts/<problem>/A###-.../artifacts/` or
   `candidates/PC-###/lemmas/L##/numerical/`.
4. Statistical alignment checks (e.g., Riemann ↔ random matrix) are
   recorded when applicable.

---

## L3 — Formal Verification

**Target**: after L2.

**Pass criteria**:

1. The Lean 4 build of the core lemmas passes in CI.
2. `main-proof.lean` exists and carries 1:1 comments mapping its core
   steps to the natural-language version.
3. The `formalization_progress` field is ≥80.
4. Any use of `axiom` or `sorry` is restricted to explicitly cited
   external theorems or to known, labeled gaps.

> L3 may be passed without 100% formalization, but the submission package
> must include the list of un-formalized parts.

---

## L4 — Adversarial Verification

**Target**: after L3 (in special cases, may run in parallel with L3).

**Pass criteria**:

1. `adversarial/proof-attacks/PC-###/` contains all of:
   - At least one assumption-weakening trial.
   - Counterexample search results.
   - Intentional gap-attack results.
2. Every gap discovered is **returned to the candidate and closed**, with
   the closure proved via PR.
3. The final attack round was performed by a **different model or
   session** from the candidate's author.

---

## L5 — Informal External Expert Review

**Target**: after L4.

**Pass criteria**:

1. At least three experts in the relevant field return informal reviews.
2. **Zero** lethal-flaw reports.
3. Minor/major reports are addressed by candidate updates and re-reviewed.

---

## L6 — Peer-Reviewed Publication

**Target**: after L5.

**Pass criteria**:

1. Published in a journal CMI recognizes as authoritative.
2. The acceptance decision and all round-by-round peer-review exchanges
   are preserved.

---

## L7 — Two-Year Settlement

**Target**: 24 months after L6.

**Pass criteria**:

1. Zero essential refutations.
2. Errata registrations are limited to non-fatal corrections.
3. No essential gap newly surfaces in the citing literature.

---

## Verification-Level / Metadata-Label Correspondence

| Level | Allowed outcomes | Allowed candidate status |
|-------|------------------|---------------------------|
| L1 passed | partial-insight, novel-approach | active |
| L2–L4 passed | (same) | active |
| L5 passed | (same) | active |
| L6 passed | claimed-solution | published |
| L7 passed | peer-reviewable | published |

---

## Verification PR Convention

Each level pass is recorded as a separate PR. Commit and PR titles use
the form:

```
verify(L#): PC-### {one-line summary}
```

The PR body includes the pass-criterion checklist and cites the paths of
the related artifacts.
