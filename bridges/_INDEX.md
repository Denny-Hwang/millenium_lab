# bridges/ — Inter-field Bridge Index

This directory preserves **bridges** that connect two or more fields,
each as a single Markdown document. In this repository bridges are
first-class outputs alongside attempts and candidates.

Auto-updated.

<!-- BRIDGES:BEGIN -->

| ID | Field ↔ Field | Linked problems | Maturity | Status |
|----|---------------|------------------|----------|--------|
| [B-001](B-001-gct-homological-circuit.md) | geometric-complexity-theory ↔ homological-complexity | 03-p-vs-np | ai-discovered | active |
| [B-002](B-002-natural-proofs-sheaf-cohomology.md) | circuit-complexity ↔ homological-complexity | 03-p-vs-np | ai-discovered | active |

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
