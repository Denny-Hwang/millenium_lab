# formalization/ — Lean 4 + mathlib Environment

This directory provides the environment for translating natural-language
lemmas of candidates into **machine-checkable Lean 4 theorems**. This
repository does not use other formal systems (Coq, Isabelle, etc.) —
charter §4.2.

## Environment

- **Lean**: stable version pinned in `lean-toolchain` (currently
  `leanprover/lean4:v4.29.1`).
- **Build tool**: [Lake](https://github.com/leanprover/lean4/tree/master/src/lake).
- **Standard library**: [mathlib4](https://github.com/leanprover-community/mathlib4).

## Local Setup

```bash
# 1) Install elan (the Lean toolchain manager)
curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh

# 2) Build from this directory
cd formalization
lake update           # fetch mathlib (a few minutes to tens of minutes)
lake build            # full build
```

## CI Build

`.github/workflows/lean-build.yml` triggers automatically on changes to
`formalization/**`.

- A failing build blocks the PR.
- Mathlib build cache is preserved by GitHub's cache action to keep
  build times low.

## Directory Structure

```
formalization/
  README.md
  lakefile.lean          # this package's configuration
  lean-toolchain         # pinned Lean version
  shared/                # shared infrastructure for the seven problems (definitions, notation, tools)
    README.md
  projects/              # per-problem formalization
    README.md
    01-poincare/         # (reference only — new work cannot be merged)
    02-riemann/
    ...
    07-bsd/
```

## Where Candidate Lemmas Live

- Natural language: `candidates/PC-###/lemmas/L##.md`
- Lean body: `candidates/PC-###/lemmas/L##.lean`
- This directory's `projects/<problem>/PC-###/` holds the build entry
  point (`Main.lean`) per candidate.

## Dependency Policy

- Keep mathlib imports as narrow as possible (e.g.,
  `import Mathlib.NumberTheory.LSeries`).
- New external dependencies require a charter-amendment PR.

## Recommended Workflow

1. Read `candidates/PC-###/lemmas/L##.md`.
2. Draft the `.lean` via R4 (Formalizer) or prompt P04.
3. If `lake build` passes, update the candidate's
   `formalization_progress`.
4. For unfinished pieces, mark `sorry` and add a one-line comment
   explaining the reason.
