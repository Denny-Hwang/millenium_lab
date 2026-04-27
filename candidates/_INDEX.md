# candidates/ — 정식 증명 후보 인덱스

본 인덱스는 모든 후보를 한곳에 모아 보여줍니다. 자동 갱신 대상
(`scripts/build-data.py`).

<!-- CANDIDATES:BEGIN -->

| 후보 ID | 문제 | Status | L1~L7 | 형식화(%) | 출처 attempts |
|---------|------|--------|-------|-----------|----------------|
| _empty_ | _empty_ | _empty_ | _empty_ | _empty_ | _empty_ |

<!-- CANDIDATES:END -->

---

## 새 후보 만들기

```bash
scripts/new-candidate.sh <attempt-id> [<attempt-id> ...]
```

`<attempt-id>` 1개 이상 필요. 후보의 `origin_attempts`에 자동 기록됩니다.

자세한 절차는 [`../docs/methodology/proof-pipeline.md`](../docs/methodology/proof-pipeline.md) §3
와 [`_TEMPLATE/`](_TEMPLATE/)을 참조하세요.

## 디렉토리 컨벤션

```
candidates/
  PC-001-<short-slug>/
    meta.yaml
    status.md
    claim.md
    strategy.md
    main-proof.md
    gaps.md
    attacks.md
    lemmas/
      L01.md
      L01.lean
    reviews/        ← 머지 후 동결
```
