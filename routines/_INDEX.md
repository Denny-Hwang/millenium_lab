# routines/ — Claude Code 표준 루틴

본 디렉토리는 복합 작업을 표준화한 루틴(R1~R6)을 담습니다. Claude Code 세션은
복합 작업을 시작하기 전에 본 인덱스를 확인하고 적합한 루틴을 따릅니다.
다른 에이전트도 자유롭게 참고 가능합니다.

| ID | 이름 | 한 줄 설명 | 사용 prompts |
|----|------|-------------|---------------|
| [R1](R1-attempt-runner.md) | Attempt Runner | 새 attempt 생성·실행 | P01 → P02/P03 |
| [R2](R2-result-classifier.md) | Result Classifier | result.md → outcome 라벨 후보 | (없음) |
| [R3](R3-dashboard-builder.md) | Dashboard Builder | README의 진행 표 갱신 | (없음) |
| [R4](R4-formalizer.md) | Formalizer | 보조정리 → Lean | P04 |
| [R5](R5-weekly-report.md) | Weekly Report | 주간 진행 요약 | (없음) |
| [R6](R6-cross-attempt-synthesis.md) | Cross-attempt Synthesis | 시도들 가로지르는 패턴 | P02 (선택) |

## 호출 컨벤션

루틴은 Bash·Python 명령과 표준 프롬프트의 조합으로 정의됩니다. 각 루틴 파일은
다음을 명시합니다.

1. **호출 방법**
2. **입력**
3. **단계별 작업**
4. **출력**
5. **사용하는 prompts/ID**
