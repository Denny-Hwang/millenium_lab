# R2 — Result Classifier

## Invocation

```
user: R2 <attempt-folder>
```

## Input

- `attempt-folder` — e.g.,
  `attempts/02-riemann/A012-2026-04-27-claude-opus-4-7/`

## Steps

1. Read the folder's `result.md`, `meta.yaml`, and `transcript.md` (as
   needed).
2. Reference the seven label definitions in
   `docs/methodology/outcome-taxonomy.md`.
3. Apply this decision tree:
   - No new insights and no synthesis → `no-progress`.
   - Synthesis is good but no new progress → `survey`.
   - Clear flaw (assumption violation, circular reasoning, ignored
     known counterexample) → `flawed-attempt`.
   - Partial insight worth follow-up citation → `partial-insight`.
   - Approach not present in existing literature → `novel-approach`.
   - Use of `claimed-solution` / `peer-reviewable` without L6/L7 →
     reject immediately.
4. Present one candidate label and a one-paragraph reason to the user.
5. On agreement, update the `outcome` field in `meta.yaml`.

## Output

- One candidate label + one-paragraph reason.
- On agreement, a PR updating `meta.yaml`.

## Prompts Used

None (this routine is metadata classification; it does not center on a
model call).
