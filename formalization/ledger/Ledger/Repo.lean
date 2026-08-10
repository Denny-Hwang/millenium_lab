/-
  Ledger.Repo — the repository's current state, and the proof that it obeys
  the charter.

  `repo` is assembled from the generated projections of the metadata plus
  the hand-written plans. `repo_valid` is the point of the whole package:
  the Lean kernel evaluates every rule in `Ledger.Invariants` against the
  actual recorded state, so a pull request that mislabels an outcome,
  claims a verification level out of order, registers a candidate without a
  bridge, or files an attempt with no claims does not build.

  The named theorems after it are facts about where the project actually
  stands. They are deliberately the kind of statement that would be
  embarrassing to get wrong in a README: no problem is solved here, nothing
  has been formally verified yet, and no proof candidate exists.
-/
import Ledger.Core
import Ledger.Invariants
import Ledger.Plan
import Ledger.Generated.Problems
import Ledger.Generated.Attempts
import Ledger.Generated.Conjectures
import Ledger.Generated.Bridges
import Ledger.Generated.Candidates

namespace Ledger

/-- Everything the repository currently records. -/
def repo : Repo where
  problems := Generated.Problems.all
  attempts := Generated.Attempts.all
  conjectures := Generated.Conjectures.all
  bridges := Generated.Bridges.all
  candidates := Generated.Candidates.all
  plans := Plan.all

/-- The repository's recorded state satisfies every rule in
    `Ledger.Invariants`. Checked by the kernel on every build. -/
set_option maxRecDepth 8000 in
theorem repo_valid : repo.valid = true := by decide

/-- No attempt claims a solution. Charter §2 and AGENTS.md §7 forbid the
    label before L6; this is the standing check that nobody has slipped. -/
set_option maxRecDepth 8000 in
theorem no_claimed_solution :
    repo.attempts.all (fun a => !(a.outcome == Outcome.claimedSolution)) = true := by
  decide

/-- Nothing in this repository has been peer reviewed. -/
set_option maxRecDepth 8000 in
theorem no_peer_reviewable :
    repo.attempts.all (fun a => !(a.outcome == Outcome.peerReviewable)) = true := by
  decide

/-- No attempt has passed L3: not one line of this repository's mathematics
    is machine-checked yet. The ledger checks the bookkeeping, not the
    mathematics, and this theorem is what keeps the difference visible. -/
set_option maxRecDepth 8000 in
theorem no_formal_verification :
    repo.attempts.all (fun a => !a.verification.l3.isPass) = true := by
  decide

/-- No proof candidate has been registered. -/
theorem no_candidates : repo.candidates = [] := by rfl

end Ledger
