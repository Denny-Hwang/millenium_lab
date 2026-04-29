# Contributing to Millennium Lab

This document is the guide for **human contributors**. AI agents should
consult [`AGENTS.md`](AGENTS.md) and [`CLAUDE.md`](CLAUDE.md) instead.

---

## 0. Before You Start

1. Read [`charter.md`](charter.md) at least once. Contributions that do
   not agree with this project's goals, non-goals, and verification bar
   cannot be merged.
2. This repository is a **research-output repository**, not a typical
   SaaS codebase. Units of contribution are not "features" but
   **attempts, candidates, bridges, and conjectures**.

---

## 1. Workflow

```
fork & clone
  → new branch (feature/<short-name> or attempt/<problem>/<slug>)
  → create folder via script
  → fill in metadata and prose
  → local validation (validate-meta.py / lean build)
  → commit (follow conventions)
  → push & PR
```

---

## 2. Commit Message Convention

Follows [`AGENTS.md` §5](AGENTS.md). Examples:

```
attempt(02-riemann): A012 verify alignment between zeta zeros and random matrix statistics
candidate(04-yang-mills): PC-003 update fine-tuning lemma for the mass-gap lower bound
chore(scaffold): bridges area skeleton added
formal(05-navier-stokes): L07 lemma — resolve dependency on mathlib Real.norm
verify(L4): PC-002 assumption-weakening attack — survives
review(internal): PC-002 internal-review-001 — flag: gap at §3.2
```

All commit messages must be in English (AGENTS.md §10 Language Policy).

---

## 3. PR Checklist

When opening a PR, complete every item in
[`.github/PULL_REQUEST_TEMPLATE.md`](.github/PULL_REQUEST_TEMPLATE.md).
The essentials are:

- [ ] `python scripts/validate-meta.py` passes.
- [ ] The `_INDEX.md` or `README.md` of the touched area is updated.
- [ ] (If applicable) Lean build passes locally.
- [ ] (If applicable) The outcome label matches the taxonomy definition.
- [ ] Commit messages follow the convention.
- [ ] No modifications to merged transcripts or reviews.

---

## 4. Picking a Target Problem

Check status in `docs/problems/_INDEX.md`.

- `solved-2003` — reference only. Direct attempts cannot be merged.
- `not-started` — the most surface area for new progress.
- `active` — work in progress. Read existing `candidates/` first to
  avoid duplication.
- `dormant` — moved to dormancy after a period of no progress.
  Re-activation requires a separate PR with rationale.

---

## 5. Contributing to Formalization

Read [`formalization/README.md`](formalization/README.md) first.

- Lean 4 + mathlib only.
- Keep PRs small (one lemma at a time). Large PRs are slow to review and
  slow to merge.
- Common infrastructure under `formalization/shared/` should follow
  mathlib conventions where possible.

---

## 6. External Reviews / Publication Track

External experts' writings are added directly by maintainers. Regular
contributors do not open PRs to those areas.

---

## 7. Code of Conduct

- Critique aims at **ideas and proofs**, not at people.
- When you find a gap, do not blame the candidate's author. State the
  gap precisely and move it to the adversarial track.
- AI artifacts and human artifacts must pass the same verification bar.

---

## 8. License

Every contribution is assumed to agree with this repository's
[`LICENSE`](LICENSE).
