# formalization/projects/ — 문제별 형식화 작업

본 하위 디렉토리는 7개 문제별로 형식화 산출물을 묶습니다. 각 후보는
`<problem>/PC-###/Main.lean` 을 빌드 엔트리포인트로 가지며, 보조정리는
`candidates/PC-###/lemmas/*.lean`에 두고 본 디렉토리에서는 import 합니다.

## 디렉토리 (placeholder)

```
projects/
  01-poincare/   # 참고용 — 새 작업 머지 안 함
  02-riemann/
  03-p-vs-np/
  04-yang-mills/
  05-navier-stokes/
  06-hodge/
  07-bsd/
```

> TODO: 추후 정밀 작성. 첫 후보가 본 디렉토리를 사용할 때 그 후보의
> README 에 본 폴더로의 진입 절차를 추가합니다.

## 본 폴더의 디렉토리 추가 절차

1. 후보가 등록되면 `<problem>/PC-###/` 폴더를 만든다.
2. `Main.lean`에 후보의 모든 보조정리를 import.
3. `lakefile.lean` 의 `lean_lib` globs는 `MillenniumLab.*` 전체를 잡으므로
   추가 설정은 필요 없음.
