import Lake
open Lake DSL

-- millennium-lab formalization package.
-- 본 패키지는 7개 문제 공통 인프라(shared)와 문제별 프로젝트(projects)를 묶는다.
-- mathlib4 의존성은 lake-manifest.json 으로 잠긴다(필요 시 lake update).
package «millennium-lab» where
  leanOptions := #[
    ⟨`pp.unicode.fun, true⟩,
    ⟨`autoImplicit, false⟩
  ]

require mathlib from git
  "https://github.com/leanprover-community/mathlib4" @ "master"

@[default_target]
lean_lib «MillenniumLab» where
  -- 모든 모듈은 MillenniumLab/ 하위에서 발견됨.
  globs := #[.submodules `MillenniumLab]
