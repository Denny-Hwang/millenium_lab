# P04 — Formalization (translate to Lean 4)

## When to Use

- When you move one lemma produced by P03 into Lean 4 + mathlib.
- Or when you remove one `sorry` from an existing Lean file.

This prompt handles **exactly one lemma at a time**. Do not attempt
multiple lemmas in a single invocation.

## Input Variables

- `${LEMMA_ID}` — e.g., `L05`.
- `${LEMMA_STATEMENT}` — natural-language statement.
- `${LEMMA_DEPENDENCIES}` — list of dependent lemmas / external
  theorems.
- `${TARGET_FILE}` — target `.lean` file path (e.g.,
  `candidates/PC-001/lemmas/L05.lean`).

## Prerequisite Reading

- `formalization/README.md`
- `${TARGET_FILE}` (if it already exists)
- The `.lean` files of the dependent lemmas

## Prompt Body

```
You are a Lean 4 + mathlib professional. Formalize one lemma.

Lemma ID: ${LEMMA_ID}
Statement: ${LEMMA_STATEMENT}
Dependencies: ${LEMMA_DEPENDENCIES}
Target file: ${TARGET_FILE}

Rules:
1. Keep imports minimal; prefer mathlib's higher-level modules.
2. Statement form: `theorem ${LEMMA_ID} : ... := by ...`.
3. Try proofs in this order:
   a. Direct application of an existing mathlib theorem.
   b. Invocation of a dependent lemma.
   c. Automation: `decide` / `norm_num` / `simp` / `ring` / `linarith`.
   d. If still stuck, mark `sorry` clearly and leave the reason as a
      comment.
4. Add one-line natural-language comments explaining the intent of each
   step.
5. Do not assume the file compiles. If you are unsure of an exact
   mathlib theorem name, do not guess — leave a 'TODO: confirm theorem
   name' comment.
6. State `open Mathlib...` namespaces explicitly when applicable.

Produce one full `.lean` file content followed by a Markdown report
containing:
- mathlib theorems used
- remaining `sorry` and their reasons
- next-step recommendations (other lemmas, more automation, missing
  mathlib theorems, etc.)
```

## Output Format

```text
-- file: ${TARGET_FILE}
import Mathlib...

namespace ...

theorem ${LEMMA_ID} : ... := by
  ...

end ...
```

```markdown
## mathlib theorems used
- ...

## remaining sorry
- location ...: reason ...

## next steps
- ...
```

## Follow-ups

- Save the file and run `lake build` to verify.
- On build failure, re-invoke P04 (same lemma, with extra information).
- On build success, update the candidate's `formalization_progress`.
