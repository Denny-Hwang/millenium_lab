# P09 — Ledger Entry (turn a finished result into checkable claims)

## When to Use

- When an attempt has finished and `result.md` is written, before opening
  the PR: convert its key insights into the `claims:` block of `meta.yaml`.
- When a later attempt changes the status of an earlier claim (a claim gets
  refuted, or its Lean statement lands).

This prompt produces bookkeeping, not mathematics. If a claim needs a Lean
*statement* written, that is P04 (against mathlib) or a hand-written
declaration under `Ledger/Statements/` (shape only).

## Input Variables

- `${ATTEMPT_ID}` — e.g. `A014`.
- `${RESULT_MD}` — the finished `result.md`.
- `${EXISTING_STATEMENTS}` — declarations already available under
  `formalization/ledger/Ledger/Statements/`.

## Prerequisite Reading

- `docs/methodology/lean-ledger.md` (§3 Claims, §4 Statements)
- `attempts/<problem>/${ATTEMPT_ID}-*/result.md`
- `formalization/ledger/Ledger/Statements/*.lean` for the target problem
- The `claims:` blocks of the two or three preceding attempts on the same
  problem, so that a claim which supersedes an earlier one says so

## Prompt Body

```
You are recording an attempt's output in a ledger that a later session will
check rather than re-read. Convert the result below into claims.

Attempt: ${ATTEMPT_ID}
Result: ${RESULT_MD}
Lean statements already available: ${EXISTING_STATEMENTS}

Produce one claim per thing the attempt asserts. For each:

1. id: ${ATTEMPT_ID}-K<n>, numbered from 1 without gaps.
2. statement: the assertion itself in ONE sentence, in English. Not a
   summary of it, not a title. If you cannot write it as a sentence that
   could be true or false, it is not a claim — either sharpen it or drop
   it.
3. kind: finding | proposition | cited-theorem | refutation | conjecture |
   definition | methodological | open-question.
   - Use `finding` when the attempt observed something real but did not
     sharpen it into a provable statement. This is the common case for
     panel and survey output and is the honest answer.
   - Use `proposition` only when someone is expected to prove it.
   - Use `methodological` for statements about our own process (triggers,
     budgets, pivots, document hygiene).
4. status: what Lean artefact exists TODAY.
   unformalized | shape-formalized | stated | proved | refuted | retracted.
   Default to `unformalized`. Use `shape-formalized` only if you name an
   existing declaration in formal_target.
5. formalizability: mathlib-ready | needs-infrastructure | shape-only |
   not-mathematical. If `needs-infrastructure`, the statement must name
   what is missing (e.g. "BMO^{-1} and Besov spaces are not in mathlib").
6. formal_target: the fully-qualified declaration, when status is
   shape-formalized or stronger. Do not invent declaration names — only
   use ones from ${EXISTING_STATEMENTS}.

Then, separately, list any claim from an EARLIER attempt on this problem
whose status this attempt changes (refuted, superseded, or now formalized),
with the id and the new status.

Rules:
- Do not upgrade a status to make progress look better. `unformalized` is
  the correct answer far more often than not.
- Do not merge two assertions into one claim to keep the list short.
- Every claim must be checkable by someone who was not in the session.
```

## Output Format

```yaml
claims:
  - id: A014-K1
    kind: finding
    status: unformalized
    formalizability: needs-infrastructure
    statement: "..."
  - id: A014-K2
    kind: conjecture
    status: shape-formalized
    formalizability: shape-only
    statement: "..."
    formal_target: Ledger.Statements.NavierStokes.C003
```

```markdown
## Status changes to earlier claims
- A011-K1: shape-formalized -> refuted (reason, one line)

## Claims that could not be stated as claims
- ... (and why)
```

## Follow-ups

- Paste the `claims:` block into `meta.yaml`, apply the status changes to
  the earlier attempts' metadata, then run
  `python scripts/gen-ledger.py` and `python scripts/validate-meta.py`.
- Build the ledger: `cd formalization/ledger && lake build`.
- If a claim deserves a Lean statement that does not exist yet, that is a
  separate step — P04 for mathlib-backed statements, or a hand-written
  declaration under `Ledger/Statements/` for shape-only ones.
