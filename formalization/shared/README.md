# formalization/shared/ — Shared Infrastructure for the Seven Problems

This sub-directory holds **shared definitions, notation, and tools**
reused across multiple problems.

## Examples (placeholder)

- Notation unification (e.g., aliases for ℝ, ℂ, ℕ)
- Bundles of frequently-used helper lemmas
- Temporary holding for mathlib gaps (theorems not yet upstreamed)

## Working Policy

- Modules in this folder use the namespace `MillenniumLab.Shared.*`.
- When adding a new module:
  1. Write under
     `formalization/MillenniumLab/Shared/<Topic>.lean`.
  2. Add an entry to the table in this README.
  3. If the addition is suitable for upstream mathlib, propose it
     there too.

> TODO: write a precise version later. This folder will fill out
> naturally after the first candidate appears. Reference point —
> whenever a lemma is cited in two or more problems, extract it here
> immediately.
