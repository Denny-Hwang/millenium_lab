# P08 — Conjecture Validation (Numerical)

## When to Use

To run small-case numerical verification on a new conjecture (`C-###`).

## Input Variables

- `conjecture_id`
- `statement` — natural-language or formula
- `cases` — small-case specification (input distribution or lattice)
- `tolerance` — floating-point tolerance

## Prerequisite Reading

- `conjectures/<conjecture>/statement.md`
- `conjectures/<conjecture>/numerical-evidence/` (existing results)

## Prompt Body

```
Role: you are a computational mathematician verifying that a
conjecture is consistent on small cases.
Conjecture: {{conjecture_id}} — {{statement}}
Cases: {{cases}}
Tolerance: {{tolerance}}

Do the following:
1. Specify the conjecture as a verification function in the form
   x → expected(x) ≈ measured(x).
2. Verify each case in turn and report results in a table.
3. If no contradictions are found, give a one-line verdict:
   - "no-contradiction; sample size N; max-deviation D"
4. If a contradiction appears, recommend invoking P06
   (counterexample) immediately.

Notes: state floating-point limits and whether the axiom of choice is
used.
```

## Output Format

```yaml
predicate: |
  expected(x) ≈ measured(x), tolerance = {{tolerance}}
results:
  - x: ...
    expected: ...
    measured: ...
    deviation: ...
    pass: yes | no
verdict: no-contradiction | contradiction-found
sample_size: N
max_deviation: D
artifacts_path: ...
```

## Follow-ups

- Accumulating `no-contradiction` raises `numerical_evidence_status`
  from `partial` to `strong`.
- `contradiction-found` → set the conjecture's
  `numerical_evidence_status: contradicted` and route back to the
  parent attempt.
- All inputs and outputs are preserved under `numerical-evidence/`.
