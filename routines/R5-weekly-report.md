# R5 — Weekly Report

## Invocation

```
user: R5 [<week-of-date>]
```

If `<week-of-date>` is omitted, the week containing today.

## Input

- The Monday starting the week.

## Steps

1. Collect commits in the week with
   `git log --since=<monday> --until=<sunday>`.
2. Extract:
   - Newly registered attempts (`attempt(...)` commits)
   - Newly registered or updated candidates
   - New conjectures, new bridges
   - Formalization progress changes (`formal(...)` commits)
   - Verification-level passes/failures (`verify(L#)`)
   - External / internal review events (`review(...)`)
3. Check whether any status in `docs/problems/_INDEX.md` changed.
4. Extract candidate items to update in
   `analysis/per-problem-progress.md`.
5. Write an English summary in five sections: progress / regressions /
   discoveries / risks / priorities for next week.
6. Save the result as `analysis/weekly/<YYYY-Www>.md` and open a PR.

## Output

- A single weekly-report Markdown file.
- If any "risk" item is present, recommend opening a GitHub issue
  (executed only after user approval).

## Prompts Used

- None. The routine is git/metadata synthesis.
