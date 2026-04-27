# AGENTS.md — 에이전트 공통 작업 규약

> 본 문서는 이 저장소에서 작업하는 **모든 AI 에이전트**(Claude Code, Codex,
> 그 외 자동화 도구)가 작업 시작 전 반드시 읽어야 하는 공통 규약입니다.
> Claude Code 전용 추가 지침은 [`CLAUDE.md`](CLAUDE.md)를 별도로 참조하세요.

---

## 1. 작업 시작 시 읽기 순서

새 세션이 시작될 때마다 다음 순서로 파일을 읽으세요. 이미 컨텍스트에 있다면
중복 읽기는 생략 가능합니다.

1. [`README.md`](README.md) — 디렉토리 개요와 현재 진행 상태
2. **이 파일** (`AGENTS.md`)
3. [`charter.md`](charter.md) — 목표·비목표·검증 기준·핵심 원칙
4. 작업 영역에 해당하는 디렉토리의 `README.md` 또는 `_INDEX.md`
5. 작업이 표적 문제를 가질 경우, [`docs/problems/<problem>/README.md`](docs/problems/)
6. 사용할 표준 프롬프트가 있을 경우, [`prompts/_INDEX.md`](prompts/_INDEX.md)에서
   해당 프롬프트의 사전 읽기 파일 목록

---

## 2. 디렉토리별 진입 규칙과 책임

| 경로 | 진입 시 책임 |
|------|---------------|
| `attempts/` | `_TEMPLATE`을 그대로 복사할 것. ID는 `scripts/new-attempt.sh`로만 발급. |
| `candidates/` | 출처 attempt가 최소 1개 명시되어야 함. `origin_attempts` 비어있으면 PR 차단. |
| `conjectures/` | 문제 본 증명에 직접 기여하지 않더라도 가치 있는 추측을 보존. |
| `bridges/` | 두 분야 이상을 연결하는 단일 마크다운 문서. |
| `formalization/` | Lean 4 + mathlib만 사용. 다른 형식체계 도입 시 헌장 개정 PR 필요. |
| `adversarial/` | 자기 자신을 깨려는 노력이 들어오는 곳. 후보 제출자가 직접 채우지 않는 것이 권장됨. |
| `reviews/` | 외부 송부물은 사람 메인테이너 서명 없이 추가 금지. |
| `analysis/` | 자동 갱신 대상. 직접 편집 금지(스크립트 통해서만). |
| `data/` | 파생 데이터만. 원본 데이터는 attempts·candidates에 둘 것. |
| `prompts/` | 프롬프트 추가 시 `_INDEX.md` 매트릭스도 함께 갱신. |
| `routines/` | Claude Code 표준 절차. 다른 에이전트도 참고 가능. |
| `scripts/` | 실행 가능 스크립트만. 인자 검증 필수. |
| `schemas/` | 스키마는 단일 진실 원천. 추가/변경은 별도 PR + 마이그레이션 계획 첨부. |

---

## 3. 절대 수정·삭제 금지 영역 (Frozen Areas)

다음 파일·디렉토리는 머지된 이후 어떤 에이전트도 수정·삭제·이름 변경할 수
없습니다(오타 수정 포함). 해당 영역의 변경은 인간 메인테이너의 직접 커밋만
허용됩니다.

- `attempts/**/transcript.md` — AI 대화 전문은 머지 즉시 동결됨.
- `candidates/*/reviews/` — 받은 리뷰는 원본 보존이 원칙.
- `reviews/external/**` — 외부 전문가의 글은 본인 동의 없이 수정 불가.
- `reviews/publication-track/**` — 저널 송부 공식 문서.
- 게재 후의 `candidates/PC-*/main-proof.md`(`status: published` 표시된 후) —
  사실관계 정정은 별도 PR + erratum 절차.

이 규칙을 어기는 PR은 CI(`claim-integrity.yml`)에서 차단됩니다.

---

## 4. 새 작업 시 사용할 스크립트

**손으로 폴더를 만들지 말고 반드시 스크립트를 사용하세요.** 스크립트는 ID
중복 검사·메타 자동 채움·템플릿 복사를 보장합니다.

```bash
# 새 시도
scripts/new-attempt.sh <problem-id> <model-name>
# 예: scripts/new-attempt.sh 02-riemann claude-opus-4-7

# 새 후보 (출처 attempt 1개 이상 필요)
scripts/new-candidate.sh <attempt-id> [<attempt-id> ...]

# 새 추측
scripts/new-conjecture.sh <problem-id>

# 새 다리
scripts/new-bridge.sh <slug>   # 예: riemann-random-matrices

# 모든 메타 검증 (PR 전 권장)
python scripts/validate-meta.py

# 대시보드 갱신 (보통 CI가 처리)
python scripts/update-dashboard.py
```

---

## 5. 커밋 메시지 규약

### 5.1 영역별 스캐폴딩 / 인프라

```
chore(scaffold): {영역} 골격 추가
chore(infra): {영역} 변경 사유
```

### 5.2 시도·후보·추측·다리

```
attempt(<problem>): A### {한 줄 요지}
candidate(<problem>): PC-### {한 줄 요지}
conjecture(<problem>): C-### {한 줄 요지}
bridge: B-### {한 줄 요지}
```

### 5.3 형식화

```
formal(<problem>): {보조정리 ID 또는 모듈} {진척}
```

### 5.4 검증·리뷰

```
verify(<level>): <target-id> {결과 요약}
review(<kind>): <target-id> {리뷰어/요지}
```

### 5.5 일반 규칙

- 한국어 본문 가능, 단 영역명·ID·파일 경로는 영문 유지.
- 한 커밋에 두 영역 이상의 변경이 섞이지 않게 분리.
- 머지된 attempt transcript에 손대는 커밋은 자동 차단됨.

---

## 6. PR 생성 규약

- PR 제목은 커밋 규약과 동일한 형식의 한 줄 요지를 사용합니다.
- PR 본문에는 [`.github/PULL_REQUEST_TEMPLATE.md`](.github/PULL_REQUEST_TEMPLATE.md)
  체크리스트를 모두 채워야 합니다.
- 메타 검증(`validate-meta.yml`)·형식화 빌드(`lean-build.yml`)·청구
  무결성(`claim-integrity.yml`) 워크플로가 모두 통과해야 머지 가능합니다.
- AI 에이전트가 생성한 PR은 본문 첫 줄에 `[agent: <model-id>]` 태그를 답니다.
  예: `[agent: claude-opus-4-7]`.
- 외부 송부물(저널 투고 등)을 만드는 PR은 인간 메인테이너 1명 이상의 명시적
  approve가 있어야 합니다.

---

## 7. 결과 라벨링 규약

attempt가 종료되면 `result.md`에 outcome 라벨을 1개 부여합니다. 라벨 후보:

- `no-progress`
- `survey`
- `flawed-attempt`
- `partial-insight`
- `novel-approach`
- `claimed-solution` *(L6 통과 전엔 사용 불가)*
- `peer-reviewable` *(L7 통과 전엔 사용 불가)*

자세한 정의: [`docs/methodology/outcome-taxonomy.md`](docs/methodology/outcome-taxonomy.md).

---

## 8. 금지 사항 요약

1. 머지된 transcript/리뷰 수정.
2. ID 직접 부여(스크립트 우회).
3. 스키마 우회한 메타데이터 작성.
4. L3 형식 검증 우회한 외부 송부.
5. AI 단독 명의로의 외부 발표.
6. CMI 공식 진술과 다른 명제로 "사실상 풀었다" 주장.
7. CI 우회 머지(`--no-verify` 등).
8. `analysis/` 하위 직접 편집.

---

## 9. 의문이 들 때

규약과 실제 작업이 충돌하면 작업을 중단하고 PR 본문이나 issue로 헌장 개정을
제안하세요. **규약을 침묵으로 어기지 마세요.** 침묵은 가장 큰 비용입니다.
