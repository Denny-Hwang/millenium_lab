# R7 — Ledger Sync

Keeps the Lean ledger in step with the repository's records (charter §4.7).
Run it as the last step of any PR that touches an attempt, conjecture,
bridge, candidate, problem status, or plan.

## Invocation

```
user: R7 [<target>]
```

`<target>` is optional; with no argument, sync everything.

## Input

- The metadata changed in this PR.
- `docs/methodology/lean-ledger.md` (the spec).

## Steps

1. **Claims.** For every attempt touched, confirm `meta.yaml` has a
   `claims:` block and that each claim's `status` describes a Lean artefact
   that actually exists. If the attempt is new or newly finished, run
   prompt `P09-ledger-entry` against its `result.md` instead of writing the
   block by hand.
2. **Plans.** If a problem's `status.md` changed direction, status, or
   budget, edit `formalization/ledger/Ledger/Plan.lean` to match: the
   committed direction, the milestones with their dependencies, the
   remaining attempt budget, and the pivot trigger. A problem that is
   `active` or `dormant` must have exactly one plan.
3. **Statements.** If this PR added a Lean declaration under
   `Ledger/Statements/` (or a mathlib-backed statement under
   `formalization/`), point the relevant claims' `formal_target` at it and
   move their `status` forward — usually `unformalized` →
   `shape-formalized`, or `shape-formalized` → `stated`.
4. **Regenerate.**
   ```bash
   python scripts/gen-ledger.py
   ```
   Never hand-edit `Ledger/Generated/**`.
5. **Check.**
   ```bash
   python scripts/validate-meta.py
   python scripts/gen-ledger.py --check
   cd formalization/ledger && lake build
   ```
6. **On a build failure**, read what failed before changing anything:
   - `repo_valid` failing means the recorded state violates a charter rule.
     Fix the record. If you believe the rule is wrong, change the predicate
     *and* the prose it restates, in the same PR, and say so in the PR body
     (AGENTS.md §8.10).
   - `gen-ledger.py` failing on a `formal_target` means the declaration
     does not exist. Either write it or drop the claim's status back.
7. Commit the regenerated files together with the metadata change, in one
   commit: `chore(infra): ledger sync for <target>`.

## Output

- Updated `meta.yaml` files (`claims`, `lean_statement`, `cited_bridges`).
- Updated `Ledger/Plan.lean` when direction changed.
- Regenerated `Ledger/Generated/*.lean`.
- Green `validate-meta`, `gen-ledger --check`, and `lake build`.

## Prompts Used

- Optional: `P09-ledger-entry` (claims from a finished result).
- Optional: `P04-formalization` (when a claim's Lean statement is
  mathlib-backed).
