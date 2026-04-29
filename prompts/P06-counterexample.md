# P06 — Counterexample Search

## When to Use

To computationally search for counterexample candidates against a
conjecture's or candidate's conclusion.

## Input Variables

- `target_id` — `C-###` or `PC-###`
- `target_statement` — natural-language statement
- `search_space_hint` — search-space hint (e.g., "elliptic curves with
  discriminant ≤ 1e6")
- `budget_minutes` — search budget

## Prerequisite Reading

- The target's `statement.md` or `claim.md`
- The same problem's `failed-approaches.md`
- Existing numerical data under `attempts/.../artifacts/` if available

## Prompt Body

```
Role: you are a computational mathematician hunting for a
counterexample.
Target: {{target_id}} — {{target_statement}}
Search space hint: {{search_space_hint}}
Budget: {{budget_minutes}} minutes

Do the following:
1. Specify the statement as a checkable boolean predicate P(x).
   Example: P(x) := there exists s with ζ(s)=0 and Re(s) ≠ 1/2.
2. Define the search space precisely (region + distribution or
   lattice).
3. Provide pseudocode that runs within {{budget_minutes}}:
   - sample x → evaluate P(x) → log
4. List every counterexample candidate found in the format below.
5. If no counterexample is found, report that as the result (strong
   numerical evidence).

Notes:
- Specify a sanity-check procedure to filter floating-point false
  positives.
- Specify reproducible seeds / inputs.
```

## Output Format

```yaml
predicate: |
  ...
search_space: ...
algorithm_sketch: |
  ...
counterexample_candidates:
  - input: ...
    P_value: true | false
    sanity_checks: [...]
verdict: counterexample-found | strong-evidence-no-counterexample | inconclusive
```

## Follow-ups

- `counterexample-found` → set the candidate's / conjecture's
  `verification_status.L2` to `fail`; consider `abandoned` for the
  candidate.
- `strong-evidence-no-counterexample` → update the conjecture's
  `numerical_evidence_status` to `partial` or `strong`.
- Preserve inputs and outputs under `artifacts/` or
  `numerical-evidence/`.
