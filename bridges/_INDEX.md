# bridges/ — 분야 간 다리 인덱스

본 디렉토리는 두 개 이상의 분야를 잇는 **다리(bridges)**를 단일 마크다운
문서로 보존합니다. 본 저장소에서 다리는 attempts·candidates와 동격의 1차
산출물입니다.

자동 갱신 대상.

<!-- BRIDGES:BEGIN -->

| ID | 분야 ↔ 분야 | 연결 문제 | Maturity | Status |
|----|--------------|-----------|----------|--------|
| _empty_ | _empty_ | _empty_ | _empty_ | _empty_ |

<!-- BRIDGES:END -->

---

## 새 다리 만들기

```bash
scripts/new-bridge.sh <slug>
```

`<slug>`는 kebab-case로 짧게. 예: `riemann-random-matrices`.

## 다리 maturity 정의

- **established** — 학계가 인정하는 잘 알려진 연결.
- **emerging** — 일부 그룹이 활발히 연구 중.
- **speculative** — 가설적, 강한 증거 부재.
- **ai-discovered** — 본 저장소의 AI 시도에서 처음 명시화된 다리.

## 단일 다리 문서 형식

본 디렉토리에는 다리 1개당 하나의 `.md` 파일을 둡니다(서브디렉토리 사용 안 함).
형식은 [`_TEMPLATE.md`](_TEMPLATE.md) 참조.
