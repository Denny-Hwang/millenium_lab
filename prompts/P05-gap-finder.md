# P05 — Gap Finder

## When to Use

- Right after L1–L3 pass on a candidate, before sending materials to
  external review.
- Or when an agent in a different model / different session reads the
  candidate to hunt for gaps.

## Input Variables

- `${CANDIDATE_ID}` — e.g., `PC-001`.
- `${MAIN_PROOF}` — body of `main-proof.md`.
- `${LEMMAS}` — combined bodies of `lemmas/L##.md`.
- `${CLAIM}` — body of `claim.md`.
- `${STRATEGY}` — body of `strategy.md`.

## Prerequisite Reading

- All of `candidates/${CANDIDATE_ID}/`
- `docs/methodology/verification-protocol.md`
- `docs/problems/<problem>/known-results.md`

## Prompt Body

```
You are an adversarial reviewer of candidate ${CANDIDATE_ID}, hunting
for gaps that the candidate's author missed.

Materials:
- claim: ${CLAIM}
- strategy: ${STRATEGY}
- main-proof: ${MAIN_PROOF}
- lemmas: ${LEMMAS}

Rules:
1. Inspect each of the eight gap kinds:
   a. Implicit assumption — not stated in the body, but essential.
   b. Uniformity failure — uniformity over conditions like "for
      sufficiently large N".
   c. Dimension/scale — applying a finite-dimensional theorem in
      infinite dimensions.
   d. Domain/codomain — the function's domain is not closed.
   e. Measure-zero blindness — behavior on a measure-zero set.
   f. Citation distortion — assumptions of a cited external theorem do
      not match the body's assumptions.
   g. Circular reasoning — the conclusion (or an equivalent) is used
      somewhere.
   h. Edge case — a case close to a known counterexample.
2. For each gap, record:
   - Gap ID (G001 onward)
   - Location (file, section, line)
   - Kind (one of the eight)
   - Severity (minor / major / lethal)
   - 1–2 candidate ways to close the gap
3. At the end, condense the top three gaps to address before external
   review.

Produce Markdown.
```

## Output Format

```markdown
## Gap list

### G001 — {title}
- Location: ...
- Kind: ...
- Severity: minor / major / lethal
- How to close: ...
(repeat)

## Pre-external-review priorities
1. G0XX
2. G0XX
3. G0XX
```

## Follow-ups

- Migrate the gaps into
  `candidates/${CANDIDATE_ID}/gaps.md` (deduplicating).
- If a lethal gap is found, route the candidate's status back to the
  adversarial track.
