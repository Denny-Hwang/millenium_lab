# R4 — Formalizer

## Invocation

```
user: R4 <candidate-id> <lemma-id>
```

## Input

- `candidate-id` — `PC-###`
- `lemma-id` — `L##`

## Steps

1. Read `candidates/<candidate>/lemmas/<lemma>.md` and `<lemma>.lean`.
2. Reference `formalization/README.md` and the shared infrastructure
   under `formalization/shared/`.
3. Invoke standard prompt `P04-formalization` to produce a candidate
   `.lean` body.
4. Apply the result to `<lemma>.lean` and build with `lake build` (or
   CI).
5. Build outcome:
   - Pass: update the candidate's `formalization_progress`; if
     possible update `verification_status.L3` to `pass` or partial
     `pending`.
   - Fail: preserve the failure log under the lemmas folder; decide
     whether `sorry` or additional auxiliary lemmas are needed.
6. If the change is meaningful, open a PR:
   `formal(<problem>): <lemma-id> {progress}`.

## Output

- Updated `.lean` file.
- Updated `meta.yaml` (`formalization_progress`).
- (If needed) PR splitting out a new auxiliary lemma.

## Prompts Used

- Required: `P04-formalization`
