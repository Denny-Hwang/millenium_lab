/-
  Ledger.Plan — the forward half of the ledger.

  Everything else in this package records what happened. This module
  records what the repository intends to do next, in the same checked
  form: each active problem has one plan, each plan has numbered
  milestones that may only depend on earlier ones, and a milestone that
  aims at a Lean declaration names it.

  Plans are hand-written (they are decisions, not derived data) and are
  edited when a status.md changes direction. `Ledger.Invariants` checks
  their shape; `scripts/gen-ledger.py` checks that a plan exists for every
  problem that is `active` or `dormant`.

  Sources: `docs/problems/03-p-vs-np/status.md` (re-activation, 2026-07-04),
  `docs/problems/05-navier-stokes/status.md` (direction commitment,
  2026-05-26), and attempts A012–A013 on both problems.
-/
import Ledger.Core

namespace Ledger.Plan

/-- 05-navier-stokes, Pivot 1 as selected by A012: stay in direction (α)
    (global regularity), switch route from B-003/T1 to B-004/T2, the
    discrete-to-continuum transfer. A013 opened the route; the crux is
    `G_T2_1`. -/
def navierStokes : Ledger.Plan where
  problem := .navierStokes
  direction :=
    "Direction (α) global regularity for CMI (A), via bridge B-004 / transformation T2 "
    ++ "(uniform critical-norm control on discrete CFD solutions transfers to the continuum limit), "
    ++ "composed with ESS 2003 at the L^3 endpoint."
  milestones := [
    { num := 0
      goal :=
        "T2 lemma graph with gap labels, Tao-barrier audit at statement level, "
        ++ "and C-003-orthogonality verification (A013)."
      targetLevel := .L1
      dependsOn := []
      status := .achieved
      formalTarget := some "Ledger.Statements.NavierStokes.T2" },
    { num := 1
      goal :=
        "Close G_T2_1: critical-norm compactness for discrete-NSE sequences "
        ++ "(concentration-compactness or Aubin-Lions). The crux of the route."
      targetLevel := .L1
      dependsOn := [0]
      status := .planned
      formalTarget := some "Ledger.Statements.NavierStokes.T2" },
    { num := 2
      goal :=
        "Close G_T2_2: uniform-in-resolution CFD bounds in the critical norm, "
        ++ "with the numerical evidence preserved under artifacts/."
      targetLevel := .L2
      dependsOn := [0]
      status := .planned
      formalTarget := none },
    { num := 3
      goal :=
        "P07 adversarial audit of the T2 route by a different model or session, "
        ++ "re-running the A008 attack set against the transfer argument."
      targetLevel := .L4
      dependsOn := [1, 2]
      status := .planned
      formalTarget := none },
    { num := 4
      goal :=
        "Instantiate Ledger.Statements.NavierStokes.Setting against mathlib analysis "
        ++ "(Besov / BMO^-1 infrastructure does not exist yet; upstream what is reusable)."
      targetLevel := .L3
      dependsOn := [1]
      status := .planned
      formalTarget := some "Ledger.Statements.NavierStokes.cmiA_of_program" }
  ]
  budgetAttempts := 8
  pivotTrigger :=
    "A012 set 9 attempts (A013-A021) before dormancy is seriously on the table; A013 is spent. "
    ++ "If milestone 1 produces neither a proof nor a precise sub-lemma graph within the Pivot 1 "
    ++ "window (A014-A015), fall back to Pivot 2 ((beta) blowup via B-004 / T3), then Pivot 3 (dormancy)."

/-- 03-p-vs-np, re-activated 2026-07-04. A012 refuted the semialgebraic
    half of re-activation trigger (1) and left four named cracks; the plan
    is to spend the cheapest ones first. -/
def pVsNP : Ledger.Plan where
  problem := .pVsNP
  direction :=
    "Test the four residual cracks A012 left (K4), cheapest-first, against the model-lift wall: "
    ++ "the wall, not the C-002 wording, is now the object under attack."
  milestones := [
    { num := 0
      goal :=
        "Literature trace on the psd rank / SDP extension complexity of the perfect matching "
        ++ "polytope (K4-i); establish current status and what either resolution implies."
      targetLevel := .L1
      dependsOn := []
      status := .planned
      formalTarget := none },
    { num := 1
      goal :=
        "Construct the Cook-Levin tableau spectrahedral encoding at the smallest non-trivial "
        ++ "scale and run the locality / relativization audit (K4-ii)."
      targetLevel := .L2
      dependsOn := []
      status := .planned
      formalTarget := some "Ledger.Statements.PvsNP.Encoding" },
    { num := 2
      goal :=
        "Bounded-cancellation arithmetic models (K4-iii): the untested half of re-activation "
        ++ "trigger (1); entry points Jerrum-Snir 1982 and A011's monotone analysis."
      targetLevel := .L1
      dependsOn := []
      status := .planned
      formalTarget := some "Ledger.Statements.PvsNP.C002" },
    { num := 3
      goal :=
        "C-002 statement-revision PR: fold in the model-lift wall (A012 K1) and the "
        ++ "XOR / characteristic-2 boundary (A012 K2) per the schema-and-erratum discipline."
      targetLevel := .L1
      dependsOn := [0, 1, 2]
      status := .planned
      formalTarget := some "Ledger.Statements.PvsNP.C002_of_modelLiftWall" },
    { num := 4
      goal :=
        "Cross-model adversarial pass on A012's panel verdicts (charter 4.3): is the "
        ++ "model-lift-wall framing falsifiable? The K4 cracks are the handles."
      targetLevel := .L4
      dependsOn := [0, 1, 2]
      status := .planned
      formalTarget := none }
  ]
  budgetAttempts := 6
  pivotTrigger :=
    "Proposed here, since no budget was recorded when the arc was re-activated: if none of "
    ++ "milestones 0-2 produces partial-insight or stronger within six attempts, return the "
    ++ "problem to dormant under failure-criteria 3.2, as A010 and A011 did for the H_0 arc."

/-- Every plan the repository currently holds. -/
def all : List Ledger.Plan := [navierStokes, pVsNP]

end Ledger.Plan
