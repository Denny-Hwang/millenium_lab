# R1 — Attempt Runner

## Invocation

```
user: R1 <problem-id> <model-name> [<hypothesis>]
```

Or in natural language: "start a new attempt on 02-riemann."

## Input

- `problem` — target problem ID (e.g., `02-riemann`).
- `model` — current session model ID (e.g., `claude-opus-4-7`).
- `hypothesis` — one-paragraph hypothesis (if omitted, ask the user).

## Steps

1. Confirm AGENTS.md / charter.md (§3, §4) /
   `docs/problems/<problem>/README.md`.
2. Apply `prompts/P01-multi-perspective.md`. If the result's
   `promote_to_attempt` is `no`, report to the user and stop.
3. Run `bash scripts/new-attempt.sh <problem> <model>`. Remember the
   new folder path.
4. Record the standard prompt ID and input variables used in the new
   folder's `prompt.md`.
5. Perform the body of the attempt. Invoke P02 or P03 if needed.
6. At the end, write `result.md`:
   - Key insights, follow-ups, one outcome label candidate.
7. Update `meta.yaml`:
   - `outcome`, `key_insights`, `follow_ups`, `references`,
     `novel_bridges`, `duration_minutes`, `verification_status` (only
     applicable levels).
8. Invoke R2 (Result Classifier) to validate the outcome label.
9. State the prompt ID and the outcome in the PR body before opening
   the PR.

## Output

- A new attempt folder (all five files).
- One PR (commit message convention:
  `attempt(<problem>): A### {summary}`).

## Prompts Used

- Required: `P01-multi-perspective`
- Optional: `P02-bridge-discovery`, `P03-lemma-extraction`
