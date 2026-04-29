# bridges/ — Inter-field Bridge Index

This directory preserves **bridges** that connect two or more fields,
each as a single Markdown document. In this repository bridges are
first-class outputs alongside attempts and candidates.

Auto-updated.

<!-- BRIDGES:BEGIN -->

| ID | Field ↔ Field | Linked problems | Maturity | Status |
|----|---------------|------------------|----------|--------|
| _empty_ | _empty_ | _empty_ | _empty_ | _empty_ |

<!-- BRIDGES:END -->

---

## Create a New Bridge

```bash
scripts/new-bridge.sh <slug>
```

`<slug>` is short kebab-case, e.g., `riemann-random-matrices`.

## Maturity Definitions

- **established** — a well-known connection acknowledged in the
  literature.
- **emerging** — actively researched by some groups.
- **speculative** — hypothetical, weak evidence.
- **ai-discovered** — first surfaced explicitly via an AI attempt in
  this repository.

## Single-Bridge Document Form

This directory holds one `.md` file per bridge (no sub-directories).
See [`_TEMPLATE.md`](_TEMPLATE.md) for the form.
