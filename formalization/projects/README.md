# formalization/projects/ — Per-problem Formalization

This sub-directory groups formalization outputs by problem. Each
candidate has `<problem>/PC-###/Main.lean` as its build entry point;
lemmas live under `candidates/PC-###/lemmas/*.lean` and are imported
here.

## Layout (placeholder)

```
projects/
  01-poincare/   # reference only — no new work merged
  02-riemann/
  03-p-vs-np/
  04-yang-mills/
  05-navier-stokes/
  06-hodge/
  07-bsd/
```

> TODO: write a precise version later. When the first candidate uses
> this directory, add the entry procedure to that candidate's README.

## How to Add a Folder Here

1. When a candidate is registered, create
   `<problem>/PC-###/`.
2. Import every lemma of the candidate from `Main.lean`.
3. The `lakefile.lean`'s `lean_lib` globs already cover
   `MillenniumLab.*`, so no extra configuration is needed.
