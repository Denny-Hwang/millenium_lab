#!/usr/bin/env python3
"""validate-meta.py — validate every meta.yaml against schemas/.

Usage:
  python scripts/validate-meta.py
Exit codes:
  0  every metadata file passes
  1  one or more failures
  2  environment problem (missing dependency, etc.)
"""

from __future__ import annotations

import sys
import pathlib
import re

REPO_ROOT = pathlib.Path(__file__).resolve().parent.parent
SCHEMAS_DIR = REPO_ROOT / "schemas"


def _die(msg: str, code: int = 2) -> None:
    print(f"error: {msg}", file=sys.stderr)
    sys.exit(code)


try:
    import yaml  # type: ignore
except ImportError:
    _die("PyYAML is required. Install with `pip install pyyaml`.")

try:
    import jsonschema  # type: ignore
except ImportError:
    _die("jsonschema is required. Install with `pip install jsonschema`.")


def load_schema(name: str) -> dict:
    path = SCHEMAS_DIR / name
    if not path.exists():
        _die(f"schema file not found: {path}")
    with path.open(encoding="utf-8") as f:
        return yaml.safe_load(f)


def collect(meta_glob: str) -> list[pathlib.Path]:
    return sorted(REPO_ROOT.glob(meta_glob))


def validate_one(path: pathlib.Path, schema: dict) -> list[str]:
    errors: list[str] = []
    try:
        with path.open(encoding="utf-8") as f:
            data = yaml.safe_load(f)
    except yaml.YAMLError as e:
        return [f"{path}: YAML parse failed: {e}"]
    if data is None:
        return [f"{path}: empty"]
    # _TEMPLATE placeholders are not validated (they hold TODO tokens).
    rel = path.relative_to(REPO_ROOT).as_posix()
    if "_TEMPLATE" in rel:
        return []
    validator = jsonschema.Draft202012Validator(schema)
    for err in validator.iter_errors(data):
        loc = "/".join(str(p) for p in err.absolute_path) or "<root>"
        errors.append(f"{rel} :: {loc} :: {err.message}")
    return errors


def validate_bridges(schema: dict) -> list[str]:
    errors: list[str] = []
    bridges_dir = REPO_ROOT / "bridges"
    if not bridges_dir.exists():
        return errors
    for path in sorted(bridges_dir.glob("B-*.md")):
        text = path.read_text(encoding="utf-8")
        m = re.match(r"^---\n(.*?)\n---\n", text, re.DOTALL)
        if not m:
            errors.append(f"{path}: missing front matter (--- block)")
            continue
        try:
            data = yaml.safe_load(m.group(1))
        except yaml.YAMLError as e:
            errors.append(f"{path}: front matter parse failed: {e}")
            continue
        if data is None:
            errors.append(f"{path}: front matter is empty")
            continue
        validator = jsonschema.Draft202012Validator(schema)
        rel = path.relative_to(REPO_ROOT).as_posix()
        for err in validator.iter_errors(data):
            loc = "/".join(str(p) for p in err.absolute_path) or "<root>"
            errors.append(f"{rel} :: {loc} :: {err.message}")
    return errors


def main() -> int:
    all_errors: list[str] = []

    attempt_schema = load_schema("attempt-meta.schema.yaml")
    for p in collect("attempts/*/A*-*/meta.yaml"):
        all_errors.extend(validate_one(p, attempt_schema))

    candidate_schema = load_schema("candidate-meta.schema.yaml")
    for p in collect("candidates/PC-*-*/meta.yaml"):
        all_errors.extend(validate_one(p, candidate_schema))

    conjecture_schema = load_schema("conjecture-meta.schema.yaml")
    for p in collect("conjectures/C-*-*/meta.yaml"):
        all_errors.extend(validate_one(p, conjecture_schema))

    bridge_schema = load_schema("bridge-meta.schema.yaml")
    all_errors.extend(validate_bridges(bridge_schema))

    if all_errors:
        for e in all_errors:
            print(e, file=sys.stderr)
        print(f"\n{len(all_errors)} metadata validation failure(s)", file=sys.stderr)
        return 1
    print("OK: every metadata file passes its schema")
    return 0


if __name__ == "__main__":
    sys.exit(main())
