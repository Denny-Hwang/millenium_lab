# CLAUDE.md — Claude Code Specific Additional Instructions

> This document **complements** [`AGENTS.md`](AGENTS.md); it does not
> override it. Claude Code sessions always follow the rules below.

---

## 1. Procedure at the Start of Every Session

1. **Read `AGENTS.md` first.** Skip if it is already in context, but always
   re-read after a fresh session start or right after a context compaction.
2. Then check the core principles (§4) and verification bar (§3) in
   [`charter.md`](charter.md).
3. Read the `README.md` or `_INDEX.md` of the directory you will work in.
4. If a target problem is in scope, read
   `docs/problems/<problem>/README.md`.

In the first reply of the session, report in a single line that the four
steps above are complete. (Example: "Confirmed: AGENTS.md / charter.md /
docs/problems/02-riemann/.")

---

## 2. Creating a New Attempt

**Do not create folders by hand.** Call the script:

```bash
scripts/new-attempt.sh <problem-id> <model-name>
```

- `<problem-id>` is one of `01-poincare`, `02-riemann`, ..., `07-bsd`.
- `<model-name>` is the current session's model ID (e.g., `claude-opus-4-7`).
- The script:
  - Issues the next available `A###` ID.
  - Copies `attempts/_TEMPLATE`.
  - Auto-fills the `id`, `problem`, `date`, and `model` fields in
    `meta.yaml`.

If the script fails, do not create the folder manually — report to the user.

---

## 3. Use Standard Prompts

Do not write prompts from scratch. Pick from the library:

[`prompts/_INDEX.md`](prompts/_INDEX.md)

Each prompt has:

- when to use,
- input variables,
- prerequisite-reading file list (paths inside the repository),
- the prompt body,
- output-format specification,
- follow-up actions.

If you need a variant, propose a new `P##` PR under `prompts/` first.
Inline variants are forbidden.

---

## 4. Use Standard Routines

For multi-step work, follow the routines (R1–R6) in
[`routines/_INDEX.md`](routines/_INDEX.md).

- `R1-attempt-runner.md` — create and execute a new attempt.
- `R2-result-classifier.md` — propose outcome labels for a result.
- `R3-dashboard-builder.md` — refresh the README progress table.
- `R4-formalizer.md` — translate lemmas into Lean.
- `R5-weekly-report.md` — weekly progress summary.
- `R6-cross-attempt-synthesis.md` — find patterns across attempts.

---

## 5. Pre-Commit / Pre-PR Self Checks

Run the following before opening a PR (you can run them directly via Bash):

```bash
# Metadata validation
python scripts/validate-meta.py

# Dashboard reflects actual state
python scripts/update-dashboard.py --check
```

If both commands exit with code 0, you pass.

---

## 6. Tool Priority

1. **Read / Edit / Write** — single-file work.
2. **Grep / Bash `find`** — search.
3. **TodoWrite** — always use for tasks with three or more steps.
4. **Agent (Explore)** — broad codebase exploration.
5. **Agent (Plan)** — when you need a strategy for a new attempt or
   candidate.

This repository does not call external models from inside its workflow.
"Formalization / natural-language proof" work is handed off to the same
session or to a future Claude Code session — not to other LLM APIs.

---

## 7. Output Tone

- Reports to the user are short and fact-first.
- All content authored for the repository must be in English (see
  AGENTS.md §10 Language Policy). This includes attempt and candidate
  artifacts, prompts, routines, scripts, schemas, commit messages, and PR
  titles/bodies. The previous rule that allowed a Korean body with English
  keys is superseded; YAML field names, IDs, and file paths remain in
  their canonical English form, and the surrounding prose is now also in
  English.
- Replies in chat may match the user's language; only repository content
  is required to be English.
- Never hand the user a placeholder verbatim. If a placeholder remains,
  mark it explicitly with a `TODO: ...` marker and surface the follow-up
  required.

---

## 8. When the Charter Conflicts

If the charter or AGENTS conflict with a user request, **stop work and
report the conflict to the user.** Charter amendments live in their own PR.
