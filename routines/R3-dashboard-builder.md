# R3 — Dashboard Builder

## Invocation

```
user: R3
```

Or auto-run by GitHub Actions
(`.github/workflows/update-dashboard.yml`).

## Input

None. The routine scans the entire repository.

## Steps

1. Run `python scripts/build-data.py` → produces `data/attempts.csv`
   and friends.
2. Run `python scripts/update-dashboard.py`:
   - Refresh the table in `README.md` between
     `<!-- DASHBOARD:BEGIN -->` and `<!-- DASHBOARD:END -->` with the
     seven problems' status, active candidate counts, and latest
     attempts.
   - Refresh the table in `docs/problems/_INDEX.md` between
     `<!-- PROBLEMS:BEGIN -->` and its end.
   - Refresh `attempts/_INDEX.md`, `candidates/_INDEX.md`,
     `conjectures/_INDEX.md`, `bridges/_INDEX.md` similarly.
3. In `--check` mode, exit code 1 if any change is needed, else 0.
4. If changes exist, commit with message: `chore(infra): refresh dashboard`.

## Output

- Updated README and INDEX files.
- (CI mode) Auto PR or direct commit to main.

## Notes

- Files under `analysis/` are not refreshed by this routine. A separate
  analysis routine handles them.
