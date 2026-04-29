# candidates/ — Formal Proof Candidate Index

This index aggregates every candidate. Auto-updated
(`scripts/build-data.py`).

<!-- CANDIDATES:BEGIN -->

| Candidate ID | Problem | Status | L1–L7 | Formalization (%) | Origin attempts |
|--------------|---------|--------|-------|-------------------|------------------|
| _empty_ | _empty_ | _empty_ | _empty_ | _empty_ | _empty_ |

<!-- CANDIDATES:END -->

---

## Create a New Candidate

```bash
scripts/new-candidate.sh <attempt-id> [<attempt-id> ...]
```

At least one `<attempt-id>` is required and is recorded automatically
in the candidate's `origin_attempts`.

For the full procedure see
[`../docs/methodology/proof-pipeline.md`](../docs/methodology/proof-pipeline.md) §3
and [`_TEMPLATE/`](_TEMPLATE/).

## Directory Convention

```
candidates/
  PC-001-<short-slug>/
    meta.yaml
    status.md
    claim.md
    strategy.md
    main-proof.md
    gaps.md
    attacks.md
    lemmas/
      L01.md
      L01.lean
    reviews/        ← frozen after merge
```
