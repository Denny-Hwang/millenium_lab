# formalization/ — Lean 4 + mathlib 환경

본 디렉토리는 후보(candidates)의 자연어 보조정리를 **기계 검증 가능한 Lean 4
정리**로 옮기기 위한 환경을 제공합니다. 본 저장소는 다른 형식체계(Coq, Isabelle
등)를 사용하지 않습니다(헌장 §4.2).

## 환경

- **Lean**: `lean-toolchain` 파일에 명시된 stable 버전 사용 (현재
  `leanprover/lean4:v4.29.1`).
- **빌드 도구**: [Lake](https://github.com/leanprover/lean4/tree/master/src/lake).
- **표준 라이브러리**: [mathlib4](https://github.com/leanprover-community/mathlib4).

## 셋업 방법

로컬에서:

```bash
# 1) elan 설치 (Lean toolchain manager)
curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh

# 2) 본 디렉토리에서 빌드
cd formalization
lake update           # mathlib 의존성 가져오기 (수 분 ~ 수십 분)
lake build            # 전체 빌드
```

## CI 빌드

`.github/workflows/lean-build.yml` 에서 `formalization/**` 변경 시 자동 빌드.

- 빌드 실패는 PR 차단 사유.
- 빌드 시간 단축을 위해 mathlib cache는 GitHub cache action으로 보존됩니다.

## 디렉토리 구조

```
formalization/
  README.md
  lakefile.lean          # 본 패키지 설정
  lean-toolchain         # Lean 버전 고정
  shared/                # 7개 문제 공통 인프라 (정의·표기·도구)
    README.md
  projects/              # 문제별 형식화
    README.md
    01-poincare/         # (참고용 — 새 작업 머지 안 함)
    02-riemann/
    ...
    07-bsd/
```

## 후보 보조정리의 위치

- 자연어: `candidates/PC-###/lemmas/L##.md`
- Lean 본문: `candidates/PC-###/lemmas/L##.lean`
- 본 디렉토리의 `projects/<problem>/PC-###/` 는 후보 단위로 묶인 **빌드
  엔트리포인트**(`Main.lean`)를 제공합니다.

## 의존성 정책

- mathlib import 는 가능한 한 좁게 유지(예: `import Mathlib.NumberTheory.LSeries`).
- 새로운 외부 의존성은 헌장 개정 PR이 필요합니다.

## 작업 권장 흐름

1. `candidates/PC-###/lemmas/L##.md`를 읽는다.
2. R4(Formalizer) 루틴 또는 P04 프롬프트로 `.lean` 초안을 만든다.
3. `lake build` 통과하면 후보 메타의 `formalization_progress`를 갱신.
4. 통과하지 못한 부분은 `sorry`와 함께 한 줄 주석으로 사유 명시.
