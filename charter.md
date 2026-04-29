# Millennium Lab Charter

> This document is the charter of the Millennium Lab project. Every
> contributor (human or agent) must read it through at least once before
> starting work. Decisions that conflict with this charter must be raised
> in the PR body together with an explicit charter-amendment proposal.

---

## 1. Goals

Millennium Lab's ultimate goal is to produce, for **at least one** of the
seven Millennium Prize Problems selected by the Clay Mathematics Institute
(CMI) in 2000, a proof that satisfies **all** of the following:

1. **Internal consistency**: the internal logic is closed and contradiction
   free.
2. **Computational consistency**: no contradictions are observed against
   verifiable small cases or numerical experiments.
3. **Formal verification**: the core lemmas and the main theorems are
   machine-checked under Lean 4 + mathlib.
4. **Adversarial robustness**: the proof survives deliberate attacks
   (counterexample search, gap finding, assumption weakening).
5. **External expert review**: multiple recognized experts in the relevant
   field complete an informal review without flagging a lethal flaw.
6. **Authoritative journal publication**: the proof appears in a refereed
   mathematics publication of worldwide repute that CMI recognizes.
7. **Two-year settling period**: at least two years pass after publication
   without the community refuting the result.

Secondary goals include:

- **Conjectures, bridges, and tools as byproducts**: even when an artifact
  does not directly contribute to a solution, new conjectures
  (`conjectures/`), inter-field bridges (`bridges/`), and shared
  formalization infrastructure (`formalization/shared/`) are themselves
  assets and are preserved and published.
- **A reproducible research pipeline**: standardize attempts, candidates,
  and verification through metadata so that any human or agent can pick up
  the work using the same procedure.
- **Failure as an asset**: even failed attempts must record the cause
  (a labeled outcome) so that the same mistake is not repeated.

---

## 2. Non-goals

The following are **not** goals of this project.

- **Accumulating attempts for its own sake**: a growing pile of attempt
  folders has no value in itself. Attempts labeled `no-progress` are
  routinely consolidated and summarized.
- **AI-only proof bragging rights**: we do not claim "the AI proved it"
  without critical human verification. We treat AI as a **tool and a
  colleague**, with final responsibility always resting on humans.
- **Speed competitions**: being first to publish is not part of our value
  function. Skipping any of L1–L7 is a charter violation.
- **The prize itself**: the one-million-dollar prize is a byproduct, not a
  goal. Any attempt to bypass the procedural requirements in §6 is
  forbidden.
- **Arbitrary rephrasing of the official statement**: we do not claim a
  problem is "essentially solved" by proving a different statement than
  the official CMI one.

---

## 3. Verification Bar — L1 to L7

The full definitions live in
[`docs/methodology/verification-protocol.md`](docs/methodology/verification-protocol.md).
At charter level:

| Level | Name | Pass criteria | What it unlocks |
|-------|------|---------------|------------------|
| L1 | Self-consistency | The lemma dependency graph of the candidate proof is closed and all assumptions are stated explicitly | Registration in `candidates/` |
| L2 | Computational | Small cases and numerical experiments reveal no contradiction | Entry to adversarial track |
| L3 | Formal | Core lemmas build under Lean 4 | External review may be requested |
| L4 | Adversarial | All planned attacks under `adversarial/proof-attacks/` fail | Submission of materials to external reviewers |
| L5 | Informal external review | At least three recognized experts find no lethal flaw | Eligible for journal submission |
| L6 | Peer review | Accepted and published in an authoritative journal | Use of the `claimed-solution` label |
| L7 | Two-year settling | 24 months after publication without refutation, no essential gap surfaced in the citing literature | Final `peer-reviewable` label |

Only candidates that pass L7 are eligible to attempt a CMI prize claim.

---

## 4. Core Principles

### 4.1 Consilient Approach

Millennium problems are unlikely to fall to the tools of a single field.
We mandate:

- Every attempt must pass through
  [`prompts/P01-multi-perspective.md`](prompts/P01-multi-perspective.md)
  (a five-domain panel simulation) at least once.
- Promotion to a candidate must cite at least one inter-field bridge from
  `bridges/`.
- Newly discovered inter-field bridges are recorded even when they are not
  directly relevant to a solution.

### 4.2 Formalization Backbone

Natural-language proofs that "look plausible" are not our deliverable.
Every candidate progresses gradually and forcibly toward Lean 4
formalization.

- Each core lemma carries a `formalization_progress` value in 0–100.
- L5 (external review) cannot be reached without L3. As an exception, when
  L4 (adversarial) has been passed deeply and broadly, materials may be
  pre-circulated to external reviewers; in that case the absence of L3
  must be stated explicitly in the materials.

### 4.3 Adversarial Verification

A candidate is not trusted until it survives attempts to break itself.

- Every candidate must have at least one attack record in
  `adversarial/proof-attacks/{candidate-id}/`.
- Attacks include: assumption-weakening trials, counterexample candidate
  search, and domino evaluation under partial-incompleteness assumptions
  on dependent lemmas.
- The attacking agent and the candidate's author should be different
  models or sessions whenever possible.

### 4.4 Failure as Asset

- Every attempt receives an outcome label
  (`docs/methodology/outcome-taxonomy.md`).
- Once five or more `no-progress` attempts accumulate, they enter
  cross-attempt synthesis (routine R6) — we look for shared blockers.
- Abandoned candidates (`status: abandoned`) are not deleted. They are
  preserved together with the reason for abandonment.

### 4.5 Single Source of Truth

- Metadata schemas live in `schemas/` as the single source. No tool in
  the repository may bypass the schema.
- IDs are sortable immutable identifiers only (`A001`, `PC-001`, `B001`,
  `C001`).
- Standard prompts live in `prompts/`. Any prompt found elsewhere must be
  absorbed into the standard library or deleted.

### 4.6 Final Human Responsibility

- An AI agent cannot publish any attempt, candidate, or review externally
  on its own.
- Every external submission (journal submission, external review request,
  press release) goes through a human-maintainer-signed PR.
- Anything an AI agent produces records that fact in the metadata
  (`model` field). Authorship credit follows a separate procedure.

---

## 5. Workflow Summary

Detailed steps live in
[`docs/methodology/proof-pipeline.md`](docs/methodology/proof-pipeline.md).

```
idea
  → attempt (single-session unit, attempts/<problem>/A###-...)
  → candidate (candidates/PC-###-...) — composed from meaningful attempts
  → formalization (formalization/projects/<problem>/...)
  → adversarial verification (adversarial/...)
  → external review (reviews/external/...)
  → journal submission (reviews/publication-track/...)
  → publication
  → two-year settling monitor
```

Each stage transition is recorded by a PR and an outcome-label change.

---

## 6. CMI Prize Rules

This project does not bypass CMI's official rules. The essentials:

- **Prize**: USD 1,000,000 per problem solved.
- **Eligibility**:
  1. The proof must appear in a refereed mathematics publication of
     worldwide repute that CMI recognizes.
  2. A *general acceptance period* of at least **two years** after
     publication must elapse before eligibility is assessed.
  3. The CMI Scientific Advisory Board recommends, and the CMI Board of
     Directors decides.
  4. The Poincaré conjecture has the precedent of Perelman declining the
     prize, indicating that no awardee is forced to accept it.
- **Implications for this repository**:
  - No candidate is "solved" before publication (see status definitions).
  - Until two years after publication, the README's progress table does
    not display anything beyond `claimed-solution`.
  - A prize claim **always** goes through human-maintainer consensus and
    legal review.

> The wording above is a paraphrase. The actual procedure always follows
> the latest official text at the
> [CMI Millennium Problems page](https://www.claymath.org/millennium-problems/).

---

## 7. Contributor Tiers and Permissions

- **Maintainer (human)**: holds charter-amendment, release, and
  external-submission authority.
- **Contributor (human)**: proposes attempts, candidates, bridges,
  conjectures, and tools via PR.
- **Agent (AI)**: opens PRs only under the rules in `AGENTS.md`. Cannot
  initiate external submissions.

Permission changes go through a separate PR (file: `GOVERNANCE.md`, to be
added).

---

## 8. Charter Changelog

Every charter change happens via PR; the change history uses git log as
its single source of truth. We do not maintain a separate changelog
section (duplication risk).

---

## 9. Glossary (Brief)

- **attempt**: a single-session AI attempt. ID format `A###`.
- **candidate**: a formal proof candidate. ID format `PC-###`.
- **conjecture**: a conjecture distinct from the main problem. ID format
  `C-###`.
- **bridge**: a bridge between two fields. ID format `B-###`.
- **outcome**: the result label of an attempt; see the taxonomy.
- **L1–L7**: verification levels.
- **dormant**: a target problem moved to a dormant state after a stretch
  of no progress.

Detailed definitions live in `docs/methodology/`.
