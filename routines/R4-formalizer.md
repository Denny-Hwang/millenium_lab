# R4 — Formalizer

## 호출 방법

```
사용자: R4 <candidate-id> <lemma-id>
```

## 입력

- `candidate-id` — `PC-###`
- `lemma-id` — `L##`

## 단계별 작업

1. `candidates/<candidate>/lemmas/<lemma>.md` 와 `<lemma>.lean`을 읽는다.
2. `formalization/README.md`와 `formalization/shared/`의 공통 인프라를 참조.
3. 표준 프롬프트 `P04-formalization`을 호출하여 `.lean` 본문 후보를 생성.
4. 결과를 `<lemma>.lean`에 적용하고 `lake build`(또는 CI)로 빌드.
5. 빌드 결과:
   - 통과: 후보 메타의 `formalization_progress`를 갱신, 가능하면 `verification_status.L3`
     를 `pass` 또는 부분 pending으로 갱신.
   - 실패: 실패 로그를 lemmas 폴더에 보존, sorry 또는 추가 보조정리 필요 여부 판단.
6. 변화가 의미 있으면 PR 생성: `formal(<problem>): <lemma-id> {진척}`.

## 출력

- 갱신된 `.lean` 파일.
- 갱신된 `meta.yaml` (formalization_progress).
- (필요시) 새 보조정리 분리 PR.

## 사용하는 prompts

- 필수: `P04-formalization`
