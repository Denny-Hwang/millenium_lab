import Lake
open Lake DSL

-- millennium-lab formalization package.
--
-- This package bundles the shared infrastructure for the seven problems
-- (`shared`) and the per-problem projects (`projects`). mathlib is pinned to
-- a released tag rather than `master`: the tag and `lean-toolchain` are a
-- matched pair, so a build is reproducible and a mathlib change upstream
-- cannot break a pull request that did not touch Lean.
--
-- Bumping the pin means changing both `lean-toolchain` and the tag below to
-- the same version, in one PR.
--
-- The repository's plans and progress live in the separate, dependency-free
-- package under `ledger/`; keep records out of this one.
package «millennium-lab» where
  leanOptions := #[
    ⟨`pp.unicode.fun, true⟩,
    ⟨`autoImplicit, false⟩
  ]

require mathlib from git
  "https://github.com/leanprover-community/mathlib4" @ "v4.29.0"

@[default_target]
lean_lib «MillenniumLab» where
  -- Every module is discovered under MillenniumLab/.
  globs := #[.submodules `MillenniumLab]
