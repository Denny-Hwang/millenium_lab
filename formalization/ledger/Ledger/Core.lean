/-
  Ledger.Core — the vocabulary in which this repository's plans and
  progress are expressed.

  Every artifact the repository produces (a problem's status, an attempt,
  a claim made by an attempt, a conjecture, a bridge, a candidate, a
  forward plan) has a value of one of the types below. `Ledger.Invariants`
  then states the charter's rules as decidable predicates over those
  values, and `Ledger.Repo` carries the machine-checked proof that the
  repository's current state satisfies them.

  This module depends on nothing but core Lean 4 — no mathlib. That is
  deliberate: the ledger must build in seconds on every pull request, so
  that "does the recorded state still satisfy the charter?" is a question
  CI answers on every change rather than a question a human re-reads.

  Mathematical content does NOT live here; it lives in
  `Ledger.Statements.*` (logical shape, mathlib-free) and, once the
  analytic objects exist, in the mathlib package under `formalization/`.
-/

namespace Ledger

/-! ## The seven target problems -/

/-- The seven Millennium Prize Problems, in the repository's own order. -/
inductive Problem where
  | poincare
  | riemann
  | pVsNP
  | yangMills
  | navierStokes
  | hodge
  | bsd
  deriving DecidableEq, Repr

/-- The directory slug used under `docs/problems/` and `attempts/`. -/
def Problem.slug : Problem → String
  | .poincare => "01-poincare"
  | .riemann => "02-riemann"
  | .pVsNP => "03-p-vs-np"
  | .yangMills => "04-yang-mills"
  | .navierStokes => "05-navier-stokes"
  | .hodge => "06-hodge"
  | .bsd => "07-bsd"

/-- Per-problem status as recorded in `docs/problems/<slug>/status.md`. -/
inductive ProblemStatus where
  /-- Registered, no attempt merged yet. -/
  | notStarted
  /-- Work in progress. -/
  | active
  /-- Parked after a structural wall or a stretch of no progress. -/
  | dormant
  /-- Settled outside this repository (01-poincare). Reference only. -/
  | solvedExternally
  deriving DecidableEq, Repr

/-! ## Verification levels (charter §3) -/

/-- The verification bar L1–L7. -/
inductive Level where
  | L1 | L2 | L3 | L4 | L5 | L6 | L7
  deriving DecidableEq, Repr

/-- The state of one verification level for one artifact. -/
inductive Check where
  | na
  | pending
  | pass
  | fail
  deriving DecidableEq, Repr

def Check.isPass : Check → Bool
  | .pass => true
  | _ => false

/-- The L1–L7 column of an attempt's or a candidate's `meta.yaml`. -/
structure Verification where
  l1 : Check
  l2 : Check
  l3 : Check
  l4 : Check
  l5 : Check
  l6 : Check
  l7 : Check
  deriving DecidableEq, Repr

def Verification.level : Verification → Level → Check
  | v, .L1 => v.l1
  | v, .L2 => v.l2
  | v, .L3 => v.l3
  | v, .L4 => v.l4
  | v, .L5 => v.l5
  | v, .L6 => v.l6
  | v, .L7 => v.l7

/-- Nothing verified yet. -/
def Verification.none : Verification :=
  { l1 := .na, l2 := .na, l3 := .na, l4 := .na,
    l5 := .na, l6 := .na, l7 := .na }

/-! ## Outcomes (AGENTS.md §7) -/

/-- The outcome label an attempt carries when it terminates. -/
inductive Outcome where
  | noProgress
  | survey
  | flawedAttempt
  | partialInsight
  | novelApproach
  /-- Forbidden before L6. -/
  | claimedSolution
  /-- Forbidden before L7. -/
  | peerReviewable
  deriving DecidableEq, Repr

def Outcome.label : Outcome → String
  | .noProgress => "no-progress"
  | .survey => "survey"
  | .flawedAttempt => "flawed-attempt"
  | .partialInsight => "partial-insight"
  | .novelApproach => "novel-approach"
  | .claimedSolution => "claimed-solution"
  | .peerReviewable => "peer-reviewable"

/-! ## Claims

A *claim* is the unit of knowledge an attempt adds to the repository. It
is what a later session has to be able to check. Every claim therefore
carries, besides its prose, three machine-readable judgements: what kind
of assertion it is, how far its formalization has got, and whether
formalizing it is currently possible at all. -/

/-- What kind of assertion a claim is. The kind decides what "verified"
would even mean for it. -/
inductive ClaimKind where
  /-- A substantive observation an attempt records, not yet sharpened into a
      proposition anyone could prove or refute. Most survey and panel output
      starts here; leaving it here is honest, not lazy. -/
  | finding
  /-- A mathematical proposition this repository asserts and must prove. -/
  | proposition
  /-- A proposition established in the literature and cited, not re-proved. -/
  | citedTheorem
  /-- A negative result: some route, statement, or hypothesis is refuted. -/
  | refutation
  /-- A stated-but-unproved conjecture (registered under `conjectures/`). -/
  | conjecture
  /-- A definition or a reformulation proposed by an attempt. -/
  | definition
  /-- A statement about the repository's own process, not about mathematics. -/
  | methodological
  /-- A question the attempt leaves open, named so a later attempt can pick it up. -/
  | openQuestion
  deriving DecidableEq, Repr

/-- How far this claim's formalization has actually got. -/
inductive ClaimStatus where
  /-- Prose only; no Lean representation yet. -/
  | unformalized
  /-- The logical shape is in Lean (`Ledger.Statements.*`), the analytic
      content is still a parameter of the statement. -/
  | shapeFormalized
  /-- Fully stated in Lean against real mathematical objects, proof pending. -/
  | stated
  /-- Stated and proved in Lean, no `sorry`. -/
  | proved
  /-- Shown false (by us or by a cited theorem). Kept, never deleted. -/
  | refuted
  /-- Withdrawn by a later attempt. Kept for the record. -/
  | retracted
  deriving DecidableEq, Repr

/-- Whether a full Lean formalization is reachable today, and if not, why. -/
inductive Formalizability where
  /-- mathlib already has the objects; only the work is missing. -/
  | mathlibReady
  /-- Needs mathematical infrastructure mathlib does not have yet
      (named in the claim's prose, e.g. BMO⁻¹ and Besov spaces). -/
  | needsInfrastructure
  /-- Only the logical shape is formalizable: the statement quantifies over
      encodings, routes, or proofs rather than over mathematical objects. -/
  | shapeOnly
  /-- A statement about this repository's process; not a mathematical claim. -/
  | notMathematical
  deriving DecidableEq, Repr

/-- One knowledge unit produced by an attempt. `formalTarget` names the
    Lean declaration that states it (e.g.
    `Ledger.Statements.NavierStokes.T1`), once one exists. -/
structure Claim where
  /-- Stable identifier, `A###-K#` scoped to the owning attempt. -/
  id : String
  kind : ClaimKind
  status : ClaimStatus
  formalizability : Formalizability
  /-- The claim itself, in one English sentence. -/
  statement : String
  formalTarget : Option String := none
  deriving Repr

/-! ## Artifacts -/

/-- One attempt: `attempts/<problem>/A###-<date>-<model>/`. -/
structure Attempt where
  problem : Problem
  /-- The numeric part of the `A###` identifier. Unique per problem. -/
  num : Nat
  /-- ISO 8601 date, as recorded in `meta.yaml`. -/
  date : String
  model : String
  outcome : Outcome
  verification : Verification
  claims : List Claim
  /-- Numeric parts of the `B-###` bridges this attempt discovered. -/
  novelBridges : List Nat
  deriving Repr

/-- Left-pad a number to the three-digit form used by every identifier. -/
def pad3 (n : Nat) : String :=
  let s := toString n
  if s.length ≥ 3 then s
  else if s.length = 2 then "0" ++ s
  else "00" ++ s

def Attempt.id (a : Attempt) : String := "A" ++ pad3 a.num

/-- Evidence from small cases / numerical experiment (L2-flavoured).
    `partialEvidence` spells out the metadata's `partial`, which cannot be a
    constructor name — `partial` is a Lean keyword. -/
inductive EvidenceStatus where
  | none
  | partialEvidence
  | strong
  | contradicted
  deriving DecidableEq, Repr

/-- How far a conjecture has been formalized. -/
inductive LeanStatus where
  | none
  | partialProgress
  | complete
  deriving DecidableEq, Repr

/-- One byproduct conjecture: `conjectures/C-###-<slug>/`. -/
structure Conjecture where
  num : Nat
  parent : Problem
  /-- The attempt that registered it. -/
  parentAttempt : Nat
  evidence : EvidenceStatus
  leanStatus : LeanStatus
  statement : String
  formalTarget : Option String := none
  deriving Repr

def Conjecture.id (c : Conjecture) : String := "C-" ++ pad3 c.num

/-- Maturity of a bridge, per `schemas/bridge-meta.schema.yaml`. -/
inductive Maturity where
  | established
  | emerging
  | speculative
  | aiDiscovered
  deriving DecidableEq, Repr

inductive BridgeStatus where
  | active
  | dormant
  | retracted
  deriving DecidableEq, Repr

/-- One inter-field bridge: `bridges/B-###-<slug>.md`. -/
structure Bridge where
  num : Nat
  /-- The endpoint fields; at least two (schema `minItems: 2`). -/
  domains : List String
  problems : List Problem
  maturity : Maturity
  status : BridgeStatus
  deriving Repr

def Bridge.id (b : Bridge) : String := "B-" ++ pad3 b.num

inductive CandidateStatus where
  | active
  | abandoned
  | published
  deriving DecidableEq, Repr

/-- One proof candidate: `candidates/PC-###-<slug>/`. -/
structure Candidate where
  num : Nat
  problem : Problem
  status : CandidateStatus
  lemmaCount : Nat
  /-- 0–100, as in `meta.yaml`. -/
  formalizationProgress : Nat
  /-- Numeric parts of the source `A###` attempts. Charter §4.1: non-empty. -/
  originAttempts : List Nat
  /-- Numeric parts of the cited `B-###` bridges. Charter §4.1: non-empty. -/
  citedBridges : List Nat
  verification : Verification
  deriving Repr

def Candidate.id (c : Candidate) : String := "PC-" ++ pad3 c.num

/-- One problem's entry in the dashboard. -/
structure ProblemRecord where
  problem : Problem
  status : ProblemStatus
  lastUpdated : String
  deriving Repr

/-! ## Plans

A plan is the forward half of the ledger: what the repository intends to
do next, in a form a later session can check itself against. Milestones
are numbered within their plan and may only depend on lower-numbered
milestones, so a plan's dependency graph is acyclic by construction. -/

inductive MilestoneStatus where
  | planned
  | inProgress
  | achieved
  | abandoned
  deriving DecidableEq, Repr

/-- One step of a plan. -/
structure Milestone where
  /-- Position within the owning plan; dependencies must be strictly lower. -/
  num : Nat
  /-- What has to become true. -/
  goal : String
  /-- The verification level this milestone is aiming at. -/
  targetLevel : Level
  /-- `num`s of milestones in the same plan that must land first. -/
  dependsOn : List Nat
  status : MilestoneStatus
  /-- The Lean declaration this milestone is trying to discharge, if any. -/
  formalTarget : Option String := none
  deriving Repr

/-- The committed forward plan for one problem. -/
structure Plan where
  problem : Problem
  /-- The committed direction, in one sentence. -/
  direction : String
  milestones : List Milestone
  /-- Attempts remaining before the pivot/dormancy decision is forced. -/
  budgetAttempts : Nat
  /-- What must happen for the plan to be abandoned. -/
  pivotTrigger : String
  deriving Repr

/-- The whole recorded state of the repository. -/
structure Repo where
  problems : List ProblemRecord
  attempts : List Attempt
  conjectures : List Conjecture
  bridges : List Bridge
  candidates : List Candidate
  plans : List Plan
  deriving Repr

end Ledger
