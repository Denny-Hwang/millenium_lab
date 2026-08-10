# formalization/ledger/ — The Repository's Plans and Progress, in Lean

This is a dependency-free Lean 4 package. It holds the repository's own
records — problem statuses, attempts, the claims those attempts made,
conjectures, bridges, candidates, and the forward plans — as Lean values,
together with the charter's rules about them as decidable predicates and a
kernel-checked proof that the current state satisfies them.

The point is that "we are following our own process" stops being something
a reviewer has to re-read and becomes something CI answers. The full
specification is in
[`../../docs/methodology/lean-ledger.md`](../../docs/methodology/lean-ledger.md).

## What is here

| Module | Contents |
|--------|----------|
| `Ledger/Core.lean` | The vocabulary: `Problem`, `Level`, `Check`, `Outcome`, `Claim`, `Attempt`, `Conjecture`, `Bridge`, `Candidate`, `Milestone`, `Plan`, `Repo`. |
| `Ledger/Invariants.lean` | The charter's rules as `Bool`-valued predicates, one definition per written rule. |
| `Ledger/Plan.lean` | Hand-written forward plans, one per `active` or `dormant` problem. |
| `Ledger/Statements/` | The logical shape of each active program's mathematics — mathlib-free, with the analytic content as parameters. |
| `Ledger/Generated/` | Projections of the YAML metadata. Do not edit; run `python scripts/gen-ledger.py`. |
| `Ledger/Repo.lean` | `repo`, `repo_valid`, and the standing facts about where the project is. |

## Building

```bash
cd formalization/ledger
lake build
```

There is no `lake update` step and no mathlib download: the package
requires nothing, so a cold build is on the order of a minute. CI runs it
on every pull request that touches metadata, plans, or the ledger itself
(`.github/workflows/lean-ledger.yml`).

## Two packages, deliberately

| | `formalization/` | `formalization/ledger/` |
|---|---|---|
| Depends on | mathlib4 | nothing |
| Holds | mathematics: candidate lemmas and proofs | the repository's records and plans |
| Build cost | tens of minutes with a warm cache | seconds |
| Failing build means | a lemma does not typecheck | the repository is recorded in a state the charter forbids |

Keeping them apart is what makes the second column cheap enough to be
required on every pull request.

## What this package does not do

It does not verify any mathematics. `Ledger/Statements/` fixes the
*shape* of the active programs — which implications compose into a target,
which conjecture blocks which route — with the analytic objects left as
parameters of a structure, because mathlib does not have the critical-space
ladder or a computation model to instantiate them with. So
`cmiA_of_program` is a real theorem about the program's logic, and it is
not a step toward the Millennium problem. `Ledger.repo`'s
`no_formal_verification` records exactly that, and stays a theorem until
the day it stops being true.

## Adding to the ledger

- New attempt, conjecture, bridge or candidate: fill in its `meta.yaml`
  (the `claims` block is required for attempts) and run
  `python scripts/gen-ledger.py`.
- Change of direction on a problem: edit `Ledger/Plan.lean` in the same PR
  as `docs/problems/<problem>/status.md`.
- A claim whose logical shape is worth pinning down: add the declaration
  under `Ledger/Statements/`, then point the claim's `formal_target` at it
  and move its `status` to `shape-formalized`.
