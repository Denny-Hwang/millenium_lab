# The Lean Ledger — Expressing Plans and Progress So They Can Be Checked

This document specifies how the repository's **plans and progress** are
written in Lean 4, why they are, and what a contributor has to do about it.
The charter principle behind it is §4.7 (Lean-expressibility). The package
lives at [`formalization/ledger/`](../../formalization/ledger/).

---

## 1. The problem this solves

This repository is a long-running program with many sessions, several
models, and a bar (L1–L7) that only means something if it is applied the
same way each time. Until now every rule in the charter was enforced by
someone re-reading it: that an outcome label matches the verification
level, that a candidate cites a bridge, that a plan's steps depend only on
steps that come earlier, that an attempt's claims are recorded at all.
Prose rules checked by prose review drift. Twenty-five attempts in, nobody
re-reads all of it.

So the records themselves are Lean values, the rules are decidable
predicates over those values, and the current state carries a
kernel-checked proof that it satisfies them
(`Ledger.repo_valid`). A pull request that records a forbidden state does
not build.

Two things this explicitly does **not** claim:

- It does not verify any mathematics. `Ledger.repo`'s
  `no_formal_verification` theorem says, in Lean, that no attempt in this
  repository has passed L3. That stays a theorem until it stops being true.
- It does not replace the mathlib package. Mathematics that needs real
  analysis or real algebra goes to [`formalization/`](../../formalization/),
  which depends on mathlib and is slow. The ledger depends on nothing and
  is fast, which is what lets CI require it on every metadata change.

---

## 2. What is expressed, and where it comes from

| Recorded thing | Lean type | Source of truth |
|----------------|-----------|-----------------|
| Problem status | `Ledger.ProblemRecord` | `docs/problems/<id>/status.md` front matter |
| Attempt | `Ledger.Attempt` | `attempts/<problem>/A###-*/meta.yaml` |
| Claim made by an attempt | `Ledger.Claim` | the `claims:` block of that `meta.yaml` |
| Conjecture | `Ledger.Conjecture` | `conjectures/C-###-*/meta.yaml` |
| Bridge | `Ledger.Bridge` | `bridges/B-###-*.md` front matter |
| Candidate | `Ledger.Candidate` | `candidates/PC-###-*/meta.yaml` |
| Forward plan | `Ledger.Plan` | hand-written in `Ledger/Plan.lean` |
| Mathematical shape of a program | `Ledger/Statements/*` | hand-written |

Everything in the first six rows is **generated**:
`python scripts/gen-ledger.py` projects the YAML into
`Ledger/Generated/*.lean`, and `--check` fails if the committed projection
is stale. Never edit a file under `Generated/`.

The last two rows are **written by hand**, because they are decisions and
mathematics rather than derived data.

---

## 3. Claims

A claim is the unit of knowledge an attempt adds. Every attempt records at
least one; the schema requires it and the ledger's `Attempt.hasClaims`
checks it. A claim is not a summary of an insight — it is the assertion
itself, in one sentence, plus three judgements a later session needs.

```yaml
claims:
  - id: A013-K3
    kind: open-question
    status: unformalized
    formalizability: needs-infrastructure
    statement: "G_T2_1 (lethal-if-unresolved): establish L_T2_2 critical-norm
      compactness for discrete-NSE sequences."
    formal_target: Ledger.Statements.NavierStokes.T2   # optional
```

**`id`** — `<attempt-id>-K<n>`, numbered from 1 without gaps.

**`kind`** — what sort of assertion it is, which decides what "verified"
would even mean for it.

| kind | use for |
|------|---------|
| `finding` | a substantive observation, not yet a sharp proposition |
| `proposition` | a mathematical statement we assert and must prove |
| `cited-theorem` | a published theorem we rely on and do not re-prove |
| `refutation` | a route, statement or hypothesis shown false |
| `conjecture` | a stated-but-unproved conjecture (also registered under `conjectures/`) |
| `definition` | a definition or reformulation the attempt proposes |
| `methodological` | a statement about our own process, not about mathematics |
| `open-question` | a question left open, named so a later attempt can take it |

Leaving a claim at `finding` is honest, not lazy. Most panel and survey
output starts there. Promoting it to `proposition` is a commitment that
someone has to discharge.

**`status`** — how far the formalization has actually got:
`unformalized` → `shape-formalized` (the logical shape is in
`Ledger/Statements/`, the mathematical content is still a parameter) →
`stated` (stated in Lean against real objects) → `proved` (no `sorry`).
`refuted` and `retracted` are terminal and are never deleted — charter
§4.4.

**`formalizability`** — whether a full formalization is reachable today:

- `mathlib-ready` — mathlib has the objects; only the work is missing.
- `needs-infrastructure` — needs mathematics mathlib does not have
  (name it in the statement: BMO⁻¹, Besov spaces, a computation model).
- `shape-only` — the claim quantifies over encodings, routes or proofs
  rather than over mathematical objects, so only its shape is formalizable.
- `not-mathematical` — a statement about this repository's process.

**`formal_target`** — the fully-qualified Lean declaration carrying the
claim. Required once `status` is `shape-formalized` or stronger;
`gen-ledger.py` checks that the declaration exists.

The invariants refuse two combinations: a `shape-formalized` or stronger
claim without a `formal_target`, and a `shape-only` or `not-mathematical`
claim marked `stated` or `proved` — you cannot state a claim about a family
of proofs against real mathematical objects, so saying you did is a
bookkeeping error.

---

## 4. Statements: how much mathematics goes in

`Ledger/Statements/` holds the logical shape of each active program: the
objects are parameters of a structure, the statements are `Prop`s over
those parameters, and the theorems are the compositions the program
depends on. For example, `NavierStokes.cmiA_of_program` says that local
existence, a BMO⁻¹ bound along the flow, T1 and ESS jointly give CMI (A) —
a real theorem about our reasoning, proved in four lines, and not a step
toward the Millennium problem.

The rule of thumb:

- If mathlib can express the objects, put the statement in the **mathlib**
  package and mark the claim `mathlib-ready`.
- If it cannot, put the *shape* here, mark the claim `shape-formalized`
  with `formalizability: needs-infrastructure`, and name the missing
  infrastructure in the claim's statement. That naming is what turns "we
  cannot formalize this" into a work item.
- If the claim is about families of proofs or encodings (C-001, C-002,
  C-003, the model-lift wall), the shape is the honest ceiling. Mark it
  `shape-only`.

Do not fake the analytic content. An axiomatized `BMO⁻¹` that "typechecks"
would make `no_formal_verification` false while proving nothing.

---

## 5. Plans

`Ledger/Plan.lean` holds one `Plan` per problem that is `active` or
`dormant`; `gen-ledger.py` fails if one is missing. A plan carries the
committed direction, the attempt budget before a pivot is forced, the
pivot trigger, and numbered milestones. A milestone may only depend on
strictly lower-numbered milestones of the same plan, so the dependency
graph is acyclic by construction rather than by inspection
(`Milestone.valid`).

A milestone's `formalTarget` names the Lean declaration it is trying to
discharge, when there is one. That is what makes a plan checkable later:
the milestone is done when the declaration exists and its claim's status
has moved.

Edit `Plan.lean` in the same PR as the `status.md` whose direction it
follows.

---

## 6. The rules the kernel enforces

Each is one definition in `Ledger/Invariants.lean`, and each restates a
written rule:

| Predicate | Rule |
|-----------|------|
| `Attempt.outcomeGate` | AGENTS.md §7 — `claimed-solution` needs L6, `peer-reviewable` needs L7 |
| `Verification.cumulative` | charter §3 — levels are cumulative, with the one documented L5-without-L3 exception of charter §4.2 |
| `Attempt.hasClaims` | AGENTS.md §11 — every attempt records at least one claim |
| `Claim.valid` | §3 above — status, formalizability and target have to agree |
| `Candidate.valid` | charter §3, §4.1 and L3 criteria — L1 before registration, at least one source attempt and one bridge, progress ≤ 100, no L3 below 80%, `published` needs L6 |
| `Conjecture.valid` | a conjecture claiming Lean progress names the declaration |
| `Bridge.valid` | bridge schema — at least two endpoint fields |
| `Milestone.valid`, `Plan.valid` | §5 above — acyclic, unique milestone numbers |
| `Repo.attemptIdsUnique` | `A###` is issued once per problem |
| `Repo.problemsCovered` | all seven problems have exactly one row |
| `Repo.referenceOnlyRespected` | AGENTS.md §2 — nothing is merged against 01-poincare |
| `Repo.candidateOriginsExist`, `Repo.conjectureParentsExist` | referenced attempts exist, in the same problem |
| `Repo.plansTargetLiveProblems` | plans only for problems being worked on |

The predicates look at enumerations, numbers and list shapes, never at the
text of a claim. Textual conventions (identifier spelling, that a
`formal_target` names a real declaration, that an active problem has a
plan) are checked by `gen-ledger.py`, which is the right tool for them.

---

## 7. Workflow

Running a new attempt:

1. `scripts/new-attempt.sh <problem> <model>` as before.
2. Fill in `meta.yaml`, including the `claims:` block — one claim per thing
   the attempt asserts. Prompt [P09](../../prompts/P09-ledger-entry.md)
   does this from a finished `result.md`.
3. `python scripts/gen-ledger.py`
4. `python scripts/validate-meta.py`
5. `cd formalization/ledger && lake build`

Changing a problem's direction: edit `status.md` and `Ledger/Plan.lean`
together, then regenerate.

Formalizing a claim: add the declaration under `Ledger/Statements/` (or in
the mathlib package), point `formal_target` at it, move `status` forward,
regenerate. Routine [R7](../../routines/R7-ledger-sync.md) is the
step-by-step version.

---

## 8. When a rule is wrong

If the ledger rejects a state you believe is correct, the rule is the thing
to change, not the record. Open a PR that changes the predicate in
`Ledger/Invariants.lean` **and** the sentence in the charter or AGENTS.md
it restates, and say in the PR body which written rule moved. Editing a
record to slip past a check, or weakening a predicate without moving the
prose, is the failure mode this package exists to prevent.
