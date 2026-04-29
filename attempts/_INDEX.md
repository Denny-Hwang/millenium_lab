# attempts/ — Attempt Index

This index aggregates every attempt. The file is **auto-updated** by
`scripts/build-data.py` and `scripts/update-dashboard.py`. You do not
need to edit it by hand (auto-updates take precedence).

<!-- ATTEMPTS:BEGIN -->

| Attempt ID | Problem | Date | Model | Outcome | Verification |
|------------|---------|------|-------|---------|--------------|
| _empty_ | _empty_ | _empty_ | _empty_ | _empty_ | _empty_ |

<!-- ATTEMPTS:END -->

---

## Create a New Attempt

```bash
scripts/new-attempt.sh <problem-id> <model-name>
```

For the full procedure see [`../AGENTS.md`](../AGENTS.md) §2 and
[`_TEMPLATE/`](_TEMPLATE/).

## Directory Convention

```
attempts/
  <problem-id>/
    A001-2026-04-27-claude-opus-4-7/
      meta.yaml
      prompt.md
      transcript.md     ← frozen after merge
      result.md
      artifacts/
```
