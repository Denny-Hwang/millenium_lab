# AGENTS.md — Common Working Conventions for All Agents

> This document is the common convention that **every AI agent** working in
> this repository (Claude Code, Codex, and other automation tools) must read
> before starting work. Claude Code-specific additional instructions are kept
> separately in [`CLAUDE.md`](CLAUDE.md).

---

## 1. Reading Order at Session Start

Read the following files in order at the start of every new session.
Skip items already in context.

1. [`README.md`](README.md) — directory overview and current progress.
2. **This file** (`AGENTS.md`).
3. [`charter.md`](charter.md) — goals, non-goals, verification bar, core
   principles.
4. The `README.md` or `_INDEX.md` of the directory you are entering.
5. If your work targets a problem, [`docs/problems/<problem>/README.md`](docs/problems/).
6. If you are using a standard prompt, the prerequisite-reading list of that
   prompt in [`prompts/_INDEX.md`](prompts/_INDEX.md).

---

## 2. Per-Directory Entry Rules and Responsibilities

| Path | Responsibility on entry |
|------|--------------------------|
| `attempts/` | Copy `_TEMPLATE` verbatim. IDs are issued only by `scripts/new-attempt.sh`. |
| `candidates/` | At least one source attempt must be cited. PRs with empty `origin_attempts` are blocked. |
| `conjectures/` | Preserve valuable conjectures even when they do not directly contribute to the main proof. |
| `bridges/` | A single Markdown document connecting two or more fields. |
| `formalization/` | Lean 4 + mathlib only. Adopting another formal system requires a charter-amendment PR. |
| `adversarial/` | Where attempts to break our own work land. Candidate authors should not fill this themselves. |
| `reviews/` | External submissions cannot be added without a human maintainer signature. |
| `analysis/` | Auto-updated. Do not edit directly (only via scripts). |
| `data/` | Derived data only. Raw data lives under `attempts/` and `candidates/`. |
| `prompts/` | When adding a prompt, also update the `_INDEX.md` matrix. |
| `routines/` | Claude Code standard procedures. Other agents may consult freely. |
| `scripts/` | Executable scripts only. Argument validation is required. |
| `schemas/` | Schemas are the single source of truth. Additions/changes require a separate PR with a migration plan attached. |

---

## 3. Frozen Areas (Modification/Deletion Forbidden)

The following files and directories must not be modified, deleted, or renamed
by any agent after they are merged (typo fixes included). Changes to these
areas are only permitted by direct commits from a human maintainer.

- `attempts/**/transcript.md` — full AI conversations are frozen as soon as
  merged.
- `candidates/*/reviews/` — received reviews must be preserved verbatim.
- `reviews/external/**` — external experts' writings cannot be modified
  without their consent.
- `reviews/publication-track/**` — official journal submission documents.
- `candidates/PC-*/main-proof.md` after publication (i.e., once
  `status: published` is set) — factual corrections require a separate PR
  plus an erratum procedure.

PRs that violate this rule are blocked by CI (`claim-integrity.yml`).

---

## 4. Scripts to Use for New Work

**Do not create folders by hand. Use the scripts.** They guarantee ID
uniqueness, automatic metadata population, and correct template copying.

```bash
# New attempt
scripts/new-attempt.sh <problem-id> <model-name>
# e.g.: scripts/new-attempt.sh 02-riemann claude-opus-4-7

# New candidate (requires at least one source attempt)
scripts/new-candidate.sh <attempt-id> [<attempt-id> ...]

# New conjecture
scripts/new-conjecture.sh <problem-id>

# New bridge
scripts/new-bridge.sh <slug>   # e.g., riemann-random-matrices

# Validate all metadata (recommended before opening a PR)
python scripts/validate-meta.py

# Refresh the dashboard (CI normally handles this)
python scripts/update-dashboard.py
```

---

## 5. Commit Message Conventions

### 5.1 Scaffolding / Infrastructure (per area)

```
chore(scaffold): {area} skeleton added
chore(infra): {area} change rationale
```

### 5.2 Attempts / Candidates / Conjectures / Bridges

```
attempt(<problem>): A### {one-line summary}
candidate(<problem>): PC-### {one-line summary}
conjecture(<problem>): C-### {one-line summary}
bridge: B-### {one-line summary}
```

### 5.3 Formalization

```
formal(<problem>): {lemma id or module} {progress note}
```

### 5.4 Verification / Review

```
verify(<level>): <target-id> {result summary}
review(<kind>): <target-id> {reviewer/summary}
```

### 5.5 General Rules

- Commit messages must be in English (see §10 Language Policy). Area names,
  IDs, and file paths are always in their canonical English form.
- Do not mix changes from two or more different areas in a single commit.
- Commits that modify a merged attempt's `transcript.md` are blocked
  automatically.

---

## 6. PR Conventions

- The PR title uses the same one-line format as commit messages.
- The PR body must complete every checklist item from
  [`.github/PULL_REQUEST_TEMPLATE.md`](.github/PULL_REQUEST_TEMPLATE.md).
- Metadata validation (`validate-meta.yml`), formalization build
  (`lean-build.yml`), and claim integrity (`claim-integrity.yml`) workflows
  must all pass before merge.
- PRs created by an AI agent must include `[agent: <model-id>]` on the first
  line of the PR body. Example: `[agent: claude-opus-4-7]`.
- PRs that produce external submissions (journal submissions, etc.) require
  explicit approval from at least one human maintainer.

---

## 7. Outcome Labeling Convention

When an attempt is finished, exactly one outcome label is assigned in
`result.md`. Allowed labels:

- `no-progress`
- `survey`
- `flawed-attempt`
- `partial-insight`
- `novel-approach`
- `claimed-solution` *(forbidden before L6)*
- `peer-reviewable` *(forbidden before L7)*

Definitions: [`docs/methodology/outcome-taxonomy.md`](docs/methodology/outcome-taxonomy.md).

---

## 8. Forbidden Actions (Summary)

1. Modifying merged transcripts or reviews.
2. Assigning IDs by hand (bypassing the scripts).
3. Writing metadata that bypasses the schema.
4. External submissions without L3 formal verification.
5. External announcement under an AI agent's sole authorship.
6. Claiming a problem is "essentially solved" with a statement that differs
   from the official CMI statement.
7. Bypassing CI on merge (`--no-verify` etc.).
8. Editing files under `analysis/` directly.

---

## 9. When in Doubt

If a convention conflicts with the work in front of you, stop and propose a
charter amendment in the PR body or in a dedicated issue. **Never break a
convention silently.** Silence is the most expensive failure mode.

---

## 10. Language Policy

All content authored in this repository — Markdown documents, code comments,
schema descriptions, commit messages, PR titles and bodies, attempt and
candidate artifacts, prompts, routines, and scripts — must be written in
**English**.

Scope and exceptions:

- **Applies to**: every file in this repository, every commit message, every
  PR title and body, and every artifact produced by an agent for the
  repository (e.g., `attempts/**/result.md`, `attempts/**/prompt.md`,
  `candidates/**/main-proof.md`, prompts, routines, schemas, scripts).
- **Does not apply to**: chat replies between an agent and the user (the
  agent may match the user's language), and proper nouns / mathematical
  notation that have no natural English form.
- **Existing frozen files**: merged transcripts and reviews are frozen
  (§3) and must not be retroactively translated. New transcripts written
  after this policy is in force must be in English.
- **Conflicting earlier text**: any earlier instruction permitting
  non-English body content (in particular the previous wording of §5.5
  that allowed a Korean body and CLAUDE.md §7 that required "Korean
  body + English keys") is superseded by this section.

PRs that introduce non-English content are subject to a request for
re-authoring.
