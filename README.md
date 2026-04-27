# Millennium Lab

7대 밀레니엄 수학 난제(Millennium Prize Problems)를 AI 에이전트와 인간 수학자의
**통섭적(consilient) 협력**으로 해결 시도하는 장기 연구 프로그램입니다.
이 저장소는 단순한 시도 누적 공간이 아니라, 동료심사 통과가 가능한 수준의
증명 후보를 점진적으로 빚어내기 위한 **재현 가능한 파이프라인**입니다.
모든 작업은 cloud-only GitHub 환경에서 진행되며, 기여자는 사람과 에이전트(Claude
Code, Codex 등) 모두를 포함합니다.

> 이 README의 일부 표(특히 "진행 상태")는 자동 갱신 대상입니다. 직접 수정하지
> 마시고, `scripts/update-dashboard.py` 또는 GitHub Actions(`update-dashboard.yml`)을
> 통해 갱신해 주세요.

---

## 진행 상태 (자동 갱신 대상)

<!-- DASHBOARD:BEGIN -->

| ID | 문제 | Status | 활성 후보 | 최근 시도 |
|----|------|--------|-----------|-----------|
| 01 | Poincaré Conjecture | solved-2003 | — | — |
| 02 | Riemann Hypothesis | not-started | — | — |
| 03 | P vs NP | not-started | — | — |
| 04 | Yang–Mills Existence and Mass Gap | not-started | — | — |
| 05 | Navier–Stokes Existence and Smoothness | not-started | — | — |
| 06 | Hodge Conjecture | not-started | — | — |
| 07 | Birch and Swinnerton-Dyer Conjecture | not-started | — | — |

<!-- DASHBOARD:END -->

상태 라벨 정의는 [`docs/methodology/outcome-taxonomy.md`](docs/methodology/outcome-taxonomy.md)를 참고하세요.

---

## 디렉토리 가이드

| 경로 | 용도 |
|------|------|
| [`charter.md`](charter.md) | 프로젝트 헌장(목표·비목표·검증 기준 L1~L7·핵심 원칙·상금 규칙) |
| [`AGENTS.md`](AGENTS.md) | **모든 에이전트가 작업 시작 전 반드시 읽을 공통 규약** |
| [`CLAUDE.md`](CLAUDE.md) | Claude Code 전용 추가 지침 |
| [`CONTRIBUTING.md`](CONTRIBUTING.md) | 사람 기여자용 규약 |
| [`docs/methodology/`](docs/methodology/) | 증명 파이프라인·검증 프로토콜·실패 기준 |
| [`docs/problems/`](docs/problems/) | 7개 문제별 진술·동치 명제·기존 결과·실패 사례 |
| [`schemas/`](schemas/) | 모든 메타데이터 YAML 스키마(검증의 단일 진실 원천) |
| [`attempts/`](attempts/) | AI 시도 단위 작업물(머지 후 transcript는 불변) |
| [`candidates/`](candidates/) | 정식 증명 후보(보조정리·빈틈·공격 기록 포함) |
| [`conjectures/`](conjectures/) | 본문 문제와 별개의 부산 추측들 |
| [`bridges/`](bridges/) | 분야 간 다리(예: Riemann↔random matrices) |
| [`prompts/`](prompts/) | 표준 프롬프트 라이브러리(P01~P08) |
| [`routines/`](routines/) | Claude Code 표준 루틴(R1~R6) |
| [`scripts/`](scripts/) | 스캐폴딩·검증·대시보드 갱신 스크립트 |
| [`formalization/`](formalization/) | Lean 4 + mathlib 형식화 환경 |
| [`adversarial/`](adversarial/) | 자체 반증 트랙(반례 탐색·증명 공격) |
| [`reviews/`](reviews/) | 내부/외부/저널 리뷰 기록 |
| [`analysis/`](analysis/) | 종단적 메타 분석(자동 갱신 대상) |
| [`data/`](data/) | 파생 데이터(attempts.csv 등) |

---

## 빠른 시작

신규 기여자(사람 또는 에이전트)는 다음 순서로 읽고 작업을 시작합니다.

1. [`charter.md`](charter.md) — 프로젝트가 추구하는 것과 추구하지 않는 것
2. [`AGENTS.md`](AGENTS.md) — 디렉토리별 진입 규칙·금지 영역·커밋·PR 규약
3. [`docs/methodology/proof-pipeline.md`](docs/methodology/proof-pipeline.md) — 가설→시도→후보→형식화→리뷰→저널 단계
4. [`docs/methodology/verification-protocol.md`](docs/methodology/verification-protocol.md) — L1~L7 검증 단계
5. [`docs/problems/_INDEX.md`](docs/problems/_INDEX.md) — 어떤 문제가 활성/휴면 상태인지
6. 작업 시작:
   - 새 시도: `scripts/new-attempt.sh <problem-id> <model-name>`
   - 새 후보 승격: `scripts/new-candidate.sh <attempt-id>`
   - 새 추측: `scripts/new-conjecture.sh <problem-id>`
   - 새 다리: `scripts/new-bridge.sh <slug>`
7. 표준 프롬프트가 필요하면 [`prompts/_INDEX.md`](prompts/_INDEX.md) 참조

---

## 라이선스

[`LICENSE`](LICENSE) 참조 (현재 MIT, 추후 변경 가능).

## 면책 및 상금

100만 달러 클레이 수학연구소(CMI) 상금 규칙은 [`charter.md`](charter.md)의
"상금 규칙" 섹션을 참고하세요. 본 저장소의 어떤 산출물도 그 자체로는 자동으로
상금 자격을 부여하지 않습니다.
