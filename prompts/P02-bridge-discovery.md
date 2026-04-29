# P02 — Bridge Discovery

## When to Use

- When P01 identifies a new bridge candidate, or
- When ≥5 attempts on the same target problem have accumulated and R6
  surfaces a cross-field pattern.

## Input Variables

- `${DOMAIN_A}`, `${DOMAIN_B}` — two field slugs.
- `${PROBLEM_IDS}` — list of target problem IDs that this bridge could
  affect.
- `${CONTEXT_TRIGGER}` — what prompted the bridge (e.g., a specific
  insight from a specific attempt).

## Prerequisite Reading

- `bridges/_INDEX.md`
- `bridges/_TEMPLATE.md`
- `docs/methodology/proof-pipeline.md`
- The `README.md` and `known-results.md` of the relevant problem
  directories.

## Prompt Body

```
You are tasked with discovering and evaluating a possible bridge
between ${DOMAIN_A} and ${DOMAIN_B}.

Context: ${CONTEXT_TRIGGER}.
Candidate target problems: ${PROBLEM_IDS}.

Follow this procedure:

1. List five candidate objects, languages, or theorems shared by the
   two fields.
2. Label each candidate's maturity:
   - established: a known connection acknowledged in the literature.
   - emerging: under research by some groups.
   - speculative: hypothetical, weak evidence.
   - ai-discovered: first surfaced explicitly in this session.
3. Pick the strongest candidate and propose 1–3 statements or
   transformations on top of it that could contribute to
   ${PROBLEM_IDS}.
4. Provide at least one way the bridge could fail immediately
   (false-bridge possibility).
5. For each of the six sections in bridges/_TEMPLATE.md, suggest the
   bullet points that would populate the new bridge document.

Produce Markdown using the five section headers below.
```

## Output Format

```markdown
## 1. Five candidates
- candidate1 — describe object/language/theorem
- ...

## 2. Maturity labels
- candidate1: established/emerging/speculative/ai-discovered — reason
- ...

## 3. Statements/transformations on the chosen candidate
- ...

## 4. False-bridge possibilities
- ...

## 5. Content for _TEMPLATE.md sections
- 1. Why connected: ...
- 2. Known results: ...
- 3. Stuck points: ...
- 4. Open directions: ...
- 5. Connection to this repository: ...
- 6. References: ...
```

## Follow-ups

- If the output is concrete enough, run `scripts/new-bridge.sh <slug>`
  and migrate the output into the new bridge document.
- If maturity is `speculative` or higher, follow-up attempts may cite
  the bridge.
