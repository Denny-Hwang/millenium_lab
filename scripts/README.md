# scripts/ — Scaffolding, Validation, and Dashboard Scripts

| Script | Role | Default invocation |
|--------|------|--------------------|
| [`new-attempt.sh`](new-attempt.sh) | Create a new attempt folder | `scripts/new-attempt.sh <problem-id> <model-name>` |
| [`new-candidate.sh`](new-candidate.sh) | Create a new candidate folder | `scripts/new-candidate.sh <attempt-id> [<attempt-id> ...]` |
| [`new-conjecture.sh`](new-conjecture.sh) | Create a new conjecture folder | `scripts/new-conjecture.sh <problem-id>` |
| [`new-bridge.sh`](new-bridge.sh) | Create a new bridge document | `scripts/new-bridge.sh <slug>` |
| [`validate-meta.py`](validate-meta.py) | Validate all `meta.yaml` files | `python scripts/validate-meta.py` |
| [`update-dashboard.py`](update-dashboard.py) | Refresh the README progress table | `python scripts/update-dashboard.py [--check]` |
| [`build-data.py`](build-data.py) | Build CSVs from metadata | `python scripts/build-data.py` |

## Dependencies

- Bash 5+
- Python 3.10+
- PyPI: `pyyaml`, `jsonschema` (used by `validate-meta.py`)

## Friendly-error Policy

All scripts print a `usage` message and return a non-zero exit code on
missing arguments. On schema violations or ID collisions they state, in
English, which file or field is the problem.
