/-
  Ledger.Generated.Bridges - inter-field bridges.

  GENERATED FILE — do not edit by hand.
  Regenerate with `python scripts/gen-ledger.py` after changing the
  metadata it is projected from (bridges/B-*.md front matter).
-/
import Ledger.Core

namespace Ledger.Generated.Bridges

def all : List Bridge := [
  { num := 1, domains := ["geometric-complexity-theory", "homological-complexity"],
    problems := [.pVsNP],
    maturity := .aiDiscovered, status := .active },
  { num := 2, domains := ["circuit-complexity", "homological-complexity"],
    problems := [.pVsNP],
    maturity := .aiDiscovered, status := .dormant },
  { num := 3, domains := ["harmonic-analysis", "nonlinear-pde"],
    problems := [.navierStokes],
    maturity := .aiDiscovered, status := .active },
  { num := 4, domains := ["computational-fluid-dynamics", "nonlinear-pde"],
    problems := [.navierStokes],
    maturity := .speculative, status := .active }
]

end Ledger.Generated.Bridges
