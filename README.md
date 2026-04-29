# Millennium Lab

A long-running research program that attempts the seven Millennium Prize
Problems through **consilient collaboration** between AI agents and human
mathematicians. This repository is not a heap of attempts — it is a
**reproducible pipeline** for gradually shaping proof candidates that can
pass peer review. All work happens in a cloud-only GitHub environment;
contributors include both humans and agents (Claude Code, Codex, etc.).

> Some tables in this README (in particular "Progress") are auto-updated.
> Do not edit them by hand; refresh them via
> `scripts/update-dashboard.py` or the `update-dashboard.yml` GitHub
> Action.

---

## Progress (auto-updated)

<!-- DASHBOARD:BEGIN -->

| ID | Problem | Status | Active candidates | Latest attempt |
|----|---------|--------|-------------------|-----------------|
| 01 | Poincaré Conjecture | solved-2003 | — | — |
| 02 | Riemann Hypothesis | not-started | — | — |
| 03 | P vs NP | not-started | — | A002 (2026-04-29) |
| 04 | Yang–Mills Existence and Mass Gap | not-started | — | — |
| 05 | Navier–Stokes Existence and Smoothness | not-started | — | — |
| 06 | Hodge Conjecture | not-started | — | — |
| 07 | Birch and Swinnerton-Dyer Conjecture | not-started | — | — |

<!-- DASHBOARD:END -->

Status label definitions live in
[`docs/methodology/outcome-taxonomy.md`](docs/methodology/outcome-taxonomy.md).

---

## Directory Guide

| Path | Purpose |
|------|---------|
| [`charter.md`](charter.md) | Project charter (goals, non-goals, L1–L7 verification, core principles, prize rules) |
| [`AGENTS.md`](AGENTS.md) | **Common conventions every agent must read before starting work** |
| [`CLAUDE.md`](CLAUDE.md) | Claude Code specific additional instructions |
| [`CONTRIBUTING.md`](CONTRIBUTING.md) | Conventions for human contributors |
| [`docs/methodology/`](docs/methodology/) | Proof pipeline, verification protocol, failure criteria |
| [`docs/problems/`](docs/problems/) | Per-problem statements, equivalent forms, prior results, failed approaches |
| [`schemas/`](schemas/) | All metadata YAML schemas (single source of truth for validation) |
| [`attempts/`](attempts/) | Per-attempt artifacts (transcripts are immutable after merge) |
| [`candidates/`](candidates/) | Formal proof candidates (lemmas, gaps, attack records) |
| [`conjectures/`](conjectures/) | Side conjectures distinct from the main problem |
| [`bridges/`](bridges/) | Inter-field bridges (e.g., Riemann ↔ random matrices) |
| [`prompts/`](prompts/) | Standard prompt library (P01–P08) |
| [`routines/`](routines/) | Claude Code standard routines (R1–R6) |
| [`scripts/`](scripts/) | Scaffolding, validation, and dashboard scripts |
| [`formalization/`](formalization/) | Lean 4 + mathlib formalization environment |
| [`adversarial/`](adversarial/) | Self-refutation track (counterexample search, proof attacks) |
| [`reviews/`](reviews/) | Internal, external, and journal review records |
| [`analysis/`](analysis/) | Longitudinal meta analysis (auto-updated) |
| [`data/`](data/) | Derived data (e.g., `attempts.csv`) |

---

## Quick Start

A new contributor (human or agent) should read in this order and then
start work.

1. [`charter.md`](charter.md) — what the project pursues and what it does
   not.
2. [`AGENTS.md`](AGENTS.md) — entry rules per directory, frozen areas,
   commit and PR conventions.
3. [`docs/methodology/proof-pipeline.md`](docs/methodology/proof-pipeline.md)
   — the hypothesis → attempt → candidate → formalization → review →
   journal pipeline.
4. [`docs/methodology/verification-protocol.md`](docs/methodology/verification-protocol.md)
   — verification levels L1–L7.
5. [`docs/problems/_INDEX.md`](docs/problems/_INDEX.md) — which problems
   are active vs dormant.
6. Start work:
   - New attempt: `scripts/new-attempt.sh <problem-id> <model-name>`
   - Promote to candidate: `scripts/new-candidate.sh <attempt-id>`
   - New conjecture: `scripts/new-conjecture.sh <problem-id>`
   - New bridge: `scripts/new-bridge.sh <slug>`
7. Look up [`prompts/_INDEX.md`](prompts/_INDEX.md) when you need a
   standard prompt.

---

## Language

All content authored in this repository must be in English. See
[`AGENTS.md`](AGENTS.md) §10 (Language Policy).

---

## License

See [`LICENSE`](LICENSE) (currently MIT, subject to change).

## Disclaimer and Prize

For the USD 1,000,000 Clay Mathematics Institute (CMI) prize rules, see
the "CMI Prize Rules" section of [`charter.md`](charter.md). Nothing in
this repository, by itself, automatically confers prize eligibility.
