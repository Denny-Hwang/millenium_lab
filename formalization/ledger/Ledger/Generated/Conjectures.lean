/-
  Ledger.Generated.Conjectures - byproduct conjectures.

  GENERATED FILE — do not edit by hand.
  Regenerate with `python scripts/gen-ledger.py` after changing the
  metadata it is projected from (conjectures/C-*/meta.yaml).
-/
import Ledger.Core

namespace Ledger.Generated.Conjectures

def all : List Conjecture := [
  { num := 1, parent := .pVsNP, parentAttempt := 9,
    evidence := .partialEvidence, leanStatus := .partialProgress,
    statement := "No coherent sheaf F on any algebraic moduli of Boolean AC^0 circuits admits a cohomology class assignment f -> [F]_f (in any fixed cohomological degree) satisfying the biconditional [F]_f != 0 iff f is not in AC^0. (Boolean-rigidity obstruction.)",
    formalTarget := some "Ledger.Statements.PvsNP.C001" },
  { num := 2, parent := .pVsNP, parentAttempt := 11,
    evidence := .partialEvidence, leanStatus := .partialProgress,
    statement := "Discrete-vs-continuous wall: no algebraic-geometric moduli of circuits is simultaneously (a) positive-dimensional and (b) faithful to Boolean hardness. Every encoding faithful to Boolean (or monotone-Boolean) complexity is 0-dimensional (rigid); every positive-dimensional encoding is hardness-blind. Generalizes C-001 across Boolean, arithmetic, and monotone encodings.",
    formalTarget := some "Ledger.Statements.PvsNP.C002" },
  { num := 3, parent := .navierStokes, parentAttempt := 11,
    evidence := .partialEvidence, leanStatus := .partialProgress,
    statement := "No proof of the conditional implication \"u in L^∞_t BMO^{-1} on [0, T) implies u in L^∞_t L^q on [0, T) for some q in (3, 6]\" for smooth 3D incompressible Navier-Stokes solutions from CMI initial data simultaneously (a) passes the Tao-barrier audit (uses the divergence-free condition essentially, in a way averaged NSE cannot replicate), AND (b) reduces to estimates that are local in Littlewood-Paley / Bony frequency decomposition. Equivalently: the global-in-frequency div-free cancellation and the local-per-frequency-block estimates required for BMO^{-1} → L^q control are structurally incompatible.",
    formalTarget := some "Ledger.Statements.NavierStokes.C003" }
]

end Ledger.Generated.Conjectures
