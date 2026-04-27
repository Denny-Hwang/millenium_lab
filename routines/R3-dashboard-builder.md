# R3 — Dashboard Builder

## 호출 방법

```
사용자: R3
```

또는 GitHub Actions(`.github/workflows/update-dashboard.yml`)에서 자동 실행.

## 입력

없음. 저장소 전체를 스캔합니다.

## 단계별 작업

1. `python scripts/build-data.py` 실행 → `data/attempts.csv` 등 생성.
2. `python scripts/update-dashboard.py` 실행:
   - `README.md`의 `<!-- DASHBOARD:BEGIN --> ... <!-- DASHBOARD:END -->` 사이를
     7개 문제의 status·활성 후보 수·최근 attempt 정보로 갱신.
   - `docs/problems/_INDEX.md`의 `<!-- PROBLEMS:BEGIN --> ...` 갱신.
   - `attempts/_INDEX.md`, `candidates/_INDEX.md`,
     `conjectures/_INDEX.md`, `bridges/_INDEX.md`도 같은 방식으로 갱신.
3. `--check` 모드면 변경이 있으면 종료 코드 1, 없으면 0.
4. 변경이 있다면 다음 메시지로 커밋: `chore(infra): 대시보드 갱신`.

## 출력

- 갱신된 README/INDEX 파일들.
- (CI 모드) 자동 PR 또는 main 직접 커밋.

## 주의

- `analysis/` 하위는 본 루틴이 직접 갱신하지 않습니다. 별도 분석 루틴이 처리.
