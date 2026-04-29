# R6 — Cross-attempt Synthesis

## Invocation

```
user: R6 <problem-id> [<window-days>]
```

If `<window-days>` is omitted, default to 90.

## Input

- Target problem ID.
- Analysis window in days.

## Steps

1. Collect every attempt folder for the target problem within the
   window.
2. Aggregate each attempt's `meta.yaml.outcome`, `key_insights`,
   `follow_ups`, `novel_bridges`.
3. Detect patterns:
   - **Recurring blockers** — repeated lemma failures at the same
     expression / location.
   - **Converging insights** — different attempts arriving at the
     same object / theorem.
   - **Latent bridges** — two attempts in different fields pointing
     at the same phenomenon.
4. For each pattern, write a one-paragraph summary + recommendation:
   - Whether to promote to a new candidate.
   - Whether to register a new conjecture.
   - Whether to register a new bridge (recommend invoking P02).
5. If a single problem has ≥5 `no-progress` attempts, automatically
   suggest considering a dormant transition (final decision is the
   user's).

## Output

- `analysis/cross-synthesis/<problem>-<date>.md`
- Issue or PR recommendation per discovered pattern.

## Prompts Used

- Optional: `P02-bridge-discovery` (if a latent bridge is found).
