# formalization/shared/ — 7개 문제 공통 인프라

본 하위 디렉토리는 여러 문제에 걸쳐 재사용되는 **공통 정의·표기·도구**를
보관합니다.

## 예시 (placeholder)

- 표기 통일 (예: ℝ, ℂ, ℕ 의 alias)
- 자주 쓰는 보조정리 묶음
- mathlib 부족분(아직 PR 되지 않은 정리)의 임시 보존

## 작업 정책

- 본 폴더의 모듈은 `MillenniumLab.Shared.*` 네임스페이스를 사용합니다.
- 새 모듈을 추가할 때는:
  1. `formalization/MillenniumLab/Shared/<Topic>.lean` 에 작성.
  2. 본 README 의 표에 항목 추가.
  3. 추가가 mathlib에 흡수 가능하면 mathlib 본가에 PR도 함께 제안.

> TODO: 추후 정밀 작성. 본 폴더는 첫 후보가 등장한 후 자연스럽게 채워질
> 예정입니다. 작성 시 참고할 사항 — 어떤 보조정리가 두 문제 이상에서 인용되면
> 즉시 본 폴더로 추출.
