/-
  Ledger.Generated.Problems - the seven problems' recorded status.

  GENERATED FILE — do not edit by hand.
  Regenerate with `python scripts/gen-ledger.py` after changing the
  metadata it is projected from (docs/problems/*/status.md front matter).
-/
import Ledger.Core

namespace Ledger.Generated.Problems

/-- One row per problem, in repository order. -/
def all : List ProblemRecord := [
  { problem := .poincare, status := .solvedExternally,
    lastUpdated := "2026-04-27" },
  { problem := .riemann, status := .notStarted,
    lastUpdated := "2026-04-27" },
  { problem := .pVsNP, status := .active,
    lastUpdated := "2026-07-04" },
  { problem := .yangMills, status := .notStarted,
    lastUpdated := "2026-04-27" },
  { problem := .navierStokes, status := .active,
    lastUpdated := "2026-05-26" },
  { problem := .hodge, status := .notStarted,
    lastUpdated := "2026-04-27" },
  { problem := .bsd, status := .notStarted,
    lastUpdated := "2026-04-27" }
]

end Ledger.Generated.Problems
