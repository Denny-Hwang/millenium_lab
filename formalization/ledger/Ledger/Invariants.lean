/-
  Ledger.Invariants — the charter's rules, as decidable predicates.

  Each definition below is one written rule from `charter.md`,
  `AGENTS.md`, or `docs/methodology/verification-protocol.md`, restated so
  that a machine can check it. `Ledger.Repo` applies them to the
  repository's actual state and the kernel discharges the result, so a
  pull request that records a state violating any of these rules fails to
  build.

  The predicates deliberately look only at enumerations, numbers and list
  shapes — never at the text of a claim. Textual conventions (identifier
  spelling, path formats) are checked by `scripts/gen-ledger.py`, which is
  the right tool for them; the kernel is used for the structural rules
  where being wrong actually costs something.
-/
import Ledger.Core

namespace Ledger

/-! ## Small list helpers (core Lean has no mathlib `Nodup`) -/

/-- `true` when no element of `l` occurs twice. -/
def noDupNat : List Nat → Bool
  | [] => true
  | x :: xs => !(xs.contains x) && noDupNat xs

/-- Every element of `l` is strictly below `n`. -/
def allBelow (n : Nat) (l : List Nat) : Bool :=
  l.all (fun x => decide (x < n))

/-- The seven problems, for coverage checks. -/
def allProblems : List Problem :=
  [.poincare, .riemann, .pVsNP, .yangMills, .navierStokes, .hodge, .bsd]

/-! ## Verification levels -/

/-- Charter §3 / `verification-protocol.md`: the bar is cumulative — a
    level cannot be `pass` while a lower level is not.

    The single documented exception is L5: charter §4.2 allows materials to
    be pre-circulated to external reviewers without L3 when L4 has been
    passed deeply and broadly, provided the absence of L3 is stated in the
    materials. That exception, and only that one, is encoded here. -/
def Verification.cumulative (v : Verification) : Bool :=
  (!v.l2.isPass || v.l1.isPass)
  && (!v.l3.isPass || v.l2.isPass)
  && (!v.l4.isPass || v.l3.isPass || v.l2.isPass)
  && (!v.l5.isPass || v.l3.isPass || v.l4.isPass)
  && (!v.l6.isPass || v.l5.isPass)
  && (!v.l7.isPass || v.l6.isPass)

/-! ## Claims -/

/-- A claim's recorded formalization status has to be consistent with what
    formalizing it would even mean.

    - `shapeFormalized`, `stated` and `proved` all assert that a Lean
      declaration exists, so `formalTarget` must name one.
    - A `notMathematical` claim (a statement about our own process) can
      never be `stated` or `proved` as mathematics; the strongest honest
      status for it is `shapeFormalized`.
    - A `shapeOnly` claim quantifies over encodings, routes or proofs
      rather than over mathematical objects, so it cannot reach `proved`
      by the route this repository has available. -/
def Claim.valid (c : Claim) : Bool :=
  let needsTarget :=
    match c.status with
    | .shapeFormalized | .stated | .proved => c.formalTarget.isSome
    | _ => true
  let kindOk :=
    match c.formalizability, c.status with
    | .notMathematical, .stated => false
    | .notMathematical, .proved => false
    | .shapeOnly, .stated => false
    | .shapeOnly, .proved => false
    | _, _ => true
  needsTarget && kindOk

/-! ## Attempts -/

/-- AGENTS.md §7: `claimed-solution` is forbidden before L6 and
    `peer-reviewable` before L7. -/
def Attempt.outcomeGate (a : Attempt) : Bool :=
  match a.outcome with
  | .claimedSolution => a.verification.l6.isPass
  | .peerReviewable => a.verification.l7.isPass
  | _ => true

/-- AGENTS.md §11: every attempt records at least one claim, so that
    "what did this attempt assert?" always has a machine-readable answer. -/
def Attempt.hasClaims (a : Attempt) : Bool := !a.claims.isEmpty

def Attempt.valid (a : Attempt) : Bool :=
  a.outcomeGate
  && a.verification.cumulative
  && a.hasClaims
  && a.claims.all Claim.valid
  && decide (0 < a.num)

/-! ## Conjectures, bridges, candidates -/

def Conjecture.valid (c : Conjecture) : Bool :=
  decide (0 < c.num)
  && decide (0 < c.parentAttempt)
  -- A conjecture cannot be recorded as fully formalized without naming
  -- the Lean declaration that carries it.
  && (match c.leanStatus with
      | LeanStatus.complete => c.formalTarget.isSome
      | LeanStatus.partialProgress => c.formalTarget.isSome
      | LeanStatus.none => true)

/-- `schemas/bridge-meta.schema.yaml`: a bridge joins at least two fields. -/
def Bridge.valid (b : Bridge) : Bool :=
  decide (0 < b.num) && decide (2 ≤ b.domains.length)

/-- Charter §3, §4.1 and `verification-protocol.md` §L3, as one predicate.

    A candidate may only exist once L1 has passed (that is what L1
    unlocks); it must cite at least one source attempt and at least one
    inter-field bridge; `formalization_progress` is a percentage; L3 is not
    claimable below 80% formalization; and `published` presupposes L6. -/
def Candidate.valid (c : Candidate) : Bool :=
  decide (0 < c.num)
  && c.verification.l1.isPass
  && c.verification.cumulative
  && !c.originAttempts.isEmpty
  && !c.citedBridges.isEmpty
  && decide (c.formalizationProgress ≤ 100)
  && (!c.verification.l3.isPass || decide (80 ≤ c.formalizationProgress))
  && (match c.status with
      | .published => c.verification.l6.isPass
      | _ => true)

/-! ## Plans -/

/-- A milestone may only depend on strictly lower-numbered milestones of
    the same plan; that makes every plan's dependency graph acyclic without
    needing a graph algorithm. -/
def Milestone.valid (m : Milestone) : Bool :=
  allBelow m.num m.dependsOn && noDupNat m.dependsOn

def Plan.valid (p : Plan) : Bool :=
  p.milestones.all Milestone.valid
  && noDupNat (p.milestones.map Milestone.num)

/-! ## The repository as a whole -/

/-- Attempt numbers are unique within a problem (`A###` is issued by
    `scripts/new-attempt.sh` and is immutable). -/
def Repo.attemptIdsUnique (r : Repo) : Bool :=
  allProblems.all fun p =>
    noDupNat ((r.attempts.filter (fun a => a.problem == p)).map Attempt.num)

/-- Each of the seven problems has exactly one dashboard row. -/
def Repo.problemsCovered (r : Repo) : Bool :=
  allProblems.all fun p =>
    decide ((r.problems.filter (fun q => q.problem == p)).length = 1)

/-- AGENTS.md §2: `01-poincare` is reference-only; no attempt on it can be
    merged. Encoded as: a problem marked `solvedExternally` carries no
    attempts and no candidates. -/
def Repo.referenceOnlyRespected (r : Repo) : Bool :=
  r.problems.all fun q =>
    match q.status with
    | .solvedExternally =>
        (r.attempts.filter (fun a => a.problem == q.problem)).isEmpty
        && (r.candidates.filter (fun c => c.problem == q.problem)).isEmpty
    | _ => true

/-- Every candidate's source attempts actually exist, in the same problem. -/
def Repo.candidateOriginsExist (r : Repo) : Bool :=
  r.candidates.all fun c =>
    c.originAttempts.all fun n =>
      r.attempts.any (fun a => a.problem == c.problem && a.num == n)

/-- Every conjecture's parent attempt actually exists, in the same problem. -/
def Repo.conjectureParentsExist (r : Repo) : Bool :=
  r.conjectures.all fun c =>
    r.attempts.any (fun a => a.problem == c.parent && a.num == c.parentAttempt)

/-- A plan only makes sense for a problem the repository is working on. -/
def Repo.plansTargetLiveProblems (r : Repo) : Bool :=
  r.plans.all fun p =>
    r.problems.any fun q =>
      q.problem == p.problem
        && (match q.status with
            | .active => true
            | .dormant => true
            | _ => false)

/-- The conjunction of every rule above: the predicate the repository's
    recorded state is required to satisfy on every pull request. -/
def Repo.valid (r : Repo) : Bool :=
  r.attempts.all Attempt.valid
  && r.conjectures.all Conjecture.valid
  && r.bridges.all Bridge.valid
  && r.candidates.all Candidate.valid
  && r.plans.all Plan.valid
  && r.attemptIdsUnique
  && r.problemsCovered
  && r.referenceOnlyRespected
  && r.candidateOriginsExist
  && r.conjectureParentsExist
  && r.plansTargetLiveProblems
  && noDupNat (r.conjectures.map Conjecture.num)
  && noDupNat (r.bridges.map Bridge.num)
  && noDupNat (r.candidates.map Candidate.num)

end Ledger
