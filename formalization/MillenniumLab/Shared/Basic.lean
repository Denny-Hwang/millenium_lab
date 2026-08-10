/-
  MillenniumLab.Shared.Basic — root of the shared formalization infrastructure.

  `lakefile.lean` declares the library `MillenniumLab`, but the directory it
  globs over did not exist, so `lake build` failed before compiling anything.
  This module is the root of that library. It is deliberately almost empty:
  the shared infrastructure fills out when the first candidate needs it
  (see ../../shared/README.md), and inventing definitions ahead of a use is
  how shared layers rot.

  What it does carry is a smoke test — a one-line theorem that only compiles
  if the pinned mathlib actually resolves. That is what makes a green
  `lean-build` mean something today.

  The repository's plans and progress are NOT recorded here; they live in the
  dependency-free ledger package (`../ledger/`), charter §4.7.
-/
import Mathlib.Data.Real.Basic

namespace MillenniumLab.Shared

/-- Smoke test: the pinned mathlib is present and usable from this package. -/
theorem real_add_comm (x y : ℝ) : x + y = y + x := add_comm x y

end MillenniumLab.Shared
