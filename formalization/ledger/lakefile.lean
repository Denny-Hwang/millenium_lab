import Lake
open Lake DSL

-- millennium-lab ledger package.
--
-- This package has no dependencies, on purpose. It carries the repository's
-- plans and progress and the charter's rules about them, so it has to build
-- in seconds on every pull request. Mathematics that needs mathlib belongs
-- to the package one directory up (`formalization/`), not here.
package «millennium-ledger» where
  leanOptions := #[
    ⟨`pp.unicode.fun, true⟩,
    ⟨`autoImplicit, false⟩
  ]

@[default_target]
lean_lib «Ledger» where
  globs := #[.submodules `Ledger]
