# Failure Criteria — Abandonment and Dormancy

This document defines, at the candidate and problem level, **when to
declare abandonment or dormancy**. Without explicit criteria we risk
either clinging to hopeless candidates or quitting too early.

---

## 1. Candidate Abandonment Criteria

If any of the following holds, transition the candidate to
`status: abandoned`.

### 1.1 Confirmed lethal flaw

- An **unfixable** defect is confirmed during adversarial verification
  (L4) or external review (L5).
  - Example: a known counterexample to a core lemma.
  - Example: a used assumption is essentially violated and assumption
    weakening cannot work around it.

### 1.2 Formalization limit

- A core lemma stays at 0% formalization progress for six or more
  months.
- Exception: the formalization is hard but the natural-language proof is
  robust and external experts agree (requires maintainer consensus).

### 1.3 All source attempts withdrawn

- Every entry in the candidate's `origin_attempts` has been re-labeled
  to `flawed-attempt` or `no-progress`.

### 1.4 Charter violation

- It is clear that the candidate is solving a different statement than
  the official CMI one.
- Procedural violations that cannot be remedied (for instance, an
  attempt at external submission by an AI alone).

---

## 2. Handling Abandoned Candidates

- Do not delete. Update to `status: abandoned` and add the reason to
  `claim.md`.
- Record the following in `lessons-learned.md` (create if absent):
  - Where it broke.
  - Whether it was avoidable.
  - Whether other candidates carry the same risk.
- Move any byproduct conjectures or bridges to `conjectures/` or
  `bridges/`.

---

## 3. Transitioning a Problem to `dormant`

When all of the following hold, propose
`active` → `dormant` in `docs/problems/<problem>/status.md` via PR.

### 3.1 Quantitative conditions

- ≤ 2 new attempts in the last six months.
- Number of active candidates (`status: active`) = 0.
- Zero outcomes labeled `partial-insight` or `novel-approach` in the
  last six months.

### 3.2 Qualitative conditions

- The most recent R6 (cross-attempt synthesis) report strongly suggests
  "the same pattern repeating."
- It is reasonable to wait for a decisive advance from another field
  (for example, a new tool to become available).

Dormancy is **not abandonment.** A new attempt can re-activate the
problem at any time. The dormancy PR body must list the re-activation
triggers (e.g., availability of a specific tool, resolution of a
specific lemma).

---

## 4. Lifting Dormancy

- When a new attempt ends with outcome `partial-insight` or stronger,
  automatically propose returning to `active`.
- Alternatively, an external event (e.g., a result published in another
  field) may prompt a maintainer-submitted PR.

---

## 5. Transition to `solved`

- A transition to `status: solved-<year>` is allowed only after L7
  (two-year settlement).
- The Poincaré conjecture is already `solved-2003` (Perelman),
  independently of this repository's activity.

---

## 6. Abandonment / Dormancy PR Convention

```
verify(close): PC-### abandoned — {core reason}
problem(<id>): dormant transition — {conditions met}
problem(<id>): reactivate — {trigger}
```

The PR body includes the quantitative/qualitative checklist and cites
the paths of recovered byproduct assets (conjectures, bridges).
