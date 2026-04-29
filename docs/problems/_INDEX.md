# Millennium Problems — Status Index

This index gives a one-glance view of the current status for each of the
seven target problems. The table can be auto-refreshed by
`scripts/update-dashboard.py`, but this file also serves as a directory
guide and may be edited manually. (When in conflict, the auto-refreshed
version wins.)

> Status label definitions live in
> [`../methodology/outcome-taxonomy.md`](../methodology/outcome-taxonomy.md)
> and [`../methodology/failure-criteria.md`](../methodology/failure-criteria.md).

<!-- PROBLEMS:BEGIN -->

| ID | Directory | Problem | Status | Active candidates | Latest attempt |
|----|-----------|---------|--------|-------------------|-----------------|
| 01 | [01-poincare](01-poincare/) | Poincaré Conjecture | solved-2003 | 0 | — |
| 02 | [02-riemann](02-riemann/) | Riemann Hypothesis | not-started | 0 | — |
| 03 | [03-p-vs-np](03-p-vs-np/) | P vs NP | not-started | 0 | A002 (2026-04-29) |
| 04 | [04-yang-mills](04-yang-mills/) | Yang–Mills Existence and Mass Gap | not-started | 0 | — |
| 05 | [05-navier-stokes](05-navier-stokes/) | Navier–Stokes Existence and Smoothness | not-started | 0 | — |
| 06 | [06-hodge](06-hodge/) | Hodge Conjecture | not-started | 0 | — |
| 07 | [07-bsd](07-bsd/) | Birch and Swinnerton-Dyer Conjecture | not-started | 0 | — |

<!-- PROBLEMS:END -->

---

## Allowed status values

- `solved-YYYY` — solved externally (reference only).
- `not-started` — no merged attempt yet.
- `active` — work in progress; may have active candidates.
- `dormant` — moved to dormancy after a stretch of no progress
  (re-activation triggers stated in the dormancy PR).

Detailed rules: [`../methodology/failure-criteria.md`](../methodology/failure-criteria.md).
