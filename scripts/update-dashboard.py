#!/usr/bin/env python3
"""update-dashboard.py — refresh the progress tables in README and _INDEX.md.

Usage:
  python scripts/update-dashboard.py            # update
  python scripts/update-dashboard.py --check    # exit 1 if updates are needed
"""

from __future__ import annotations

import sys
import pathlib
import re
from collections import defaultdict
from typing import Optional

REPO_ROOT = pathlib.Path(__file__).resolve().parent.parent

PROBLEMS = [
    ("01", "01-poincare", "Poincaré Conjecture"),
    ("02", "02-riemann", "Riemann Hypothesis"),
    ("03", "03-p-vs-np", "P vs NP"),
    ("04", "04-yang-mills", "Yang–Mills Existence and Mass Gap"),
    ("05", "05-navier-stokes", "Navier–Stokes Existence and Smoothness"),
    ("06", "06-hodge", "Hodge Conjecture"),
    ("07", "07-bsd", "Birch and Swinnerton-Dyer Conjecture"),
]

try:
    import yaml  # type: ignore
except ImportError:
    yaml = None  # lightweight fallback


def load_yaml(path: pathlib.Path) -> Optional[dict]:
    if not path.exists():
        return None
    text = path.read_text(encoding="utf-8")
    if yaml is None:
        # Very simple yaml: parse one level of `key: value` pairs only.
        result: dict = {}
        for line in text.splitlines():
            m = re.match(r"^([A-Za-z_][A-Za-z0-9_]*):\s*(.*)$", line)
            if m:
                result[m.group(1)] = m.group(2).strip()
        return result
    try:
        return yaml.safe_load(text)
    except Exception:
        return None


def read_problem_status(slug: str) -> str:
    s = load_yaml(REPO_ROOT / "docs" / "problems" / slug / "status.md")
    if not s:
        # status.md uses `---\n...\n---\n` front matter; fall back to a regex.
        text = (REPO_ROOT / "docs" / "problems" / slug / "status.md").read_text(encoding="utf-8")
        m = re.search(r"^status:\s*(\S+)", text, re.MULTILINE)
        return m.group(1) if m else "unknown"
    return str(s.get("status", "unknown"))


def count_active_candidates() -> dict[str, int]:
    counts: dict[str, int] = defaultdict(int)
    for meta in REPO_ROOT.glob("candidates/PC-*-*/meta.yaml"):
        data = load_yaml(meta) or {}
        if str(data.get("status", "")).strip() == "active":
            prob = str(data.get("problem", "")).strip()
            counts[prob] += 1
    return counts


def latest_attempt(slug: str) -> str:
    base = REPO_ROOT / "attempts" / slug
    if not base.exists():
        return "—"
    best: tuple[str, str] | None = None  # (date, id)
    for d in base.iterdir():
        if not d.is_dir():
            continue
        m = re.match(r"^(A\d{3})-(\d{4}-\d{2}-\d{2})-(.+)$", d.name)
        if not m:
            continue
        key = (m.group(2), m.group(1))  # date first, then ID — both lex-comparable
        if best is None or key > best:
            best = key
    if best is None:
        return "—"
    return f"{best[1]} ({best[0]})"


def render_dashboard_table() -> str:
    cand_counts = count_active_candidates()
    rows = [
        "| ID | Problem | Status | Active candidates | Latest attempt |",
        "|----|---------|--------|-------------------|-----------------|",
    ]
    for num, slug, title in PROBLEMS:
        status = read_problem_status(slug)
        cand = cand_counts.get(slug, 0)
        cand_s = "—" if cand == 0 else str(cand)
        rows.append(f"| {num} | {title} | {status} | {cand_s} | {latest_attempt(slug)} |")
    return "\n".join(rows)


def render_problems_table() -> str:
    cand_counts = count_active_candidates()
    rows = [
        "| ID | Directory | Problem | Status | Active candidates | Latest attempt |",
        "|----|-----------|---------|--------|-------------------|-----------------|",
    ]
    for num, slug, title in PROBLEMS:
        status = read_problem_status(slug)
        cand = cand_counts.get(slug, 0)
        rows.append(
            f"| {num} | [{slug}]({slug}/) | {title} | {status} | {cand} | {latest_attempt(slug)} |"
        )
    return "\n".join(rows)


def replace_block(text: str, begin: str, end: str, new_body: str) -> str:
    pattern = re.compile(
        re.escape(begin) + r".*?" + re.escape(end),
        re.DOTALL,
    )
    return pattern.sub(begin + "\n\n" + new_body + "\n\n" + end, text, count=1)


def update_file(path: pathlib.Path, begin: str, end: str, body: str) -> bool:
    if not path.exists():
        return False
    old = path.read_text(encoding="utf-8")
    new = replace_block(old, begin, end, body)
    if new != old:
        path.write_text(new, encoding="utf-8")
        return True
    return False


def main(argv: list[str]) -> int:
    check = "--check" in argv
    changes = []

    dash_body = render_dashboard_table()
    problems_body = render_problems_table()

    targets = [
        (REPO_ROOT / "README.md", "<!-- DASHBOARD:BEGIN -->", "<!-- DASHBOARD:END -->", dash_body),
        (
            REPO_ROOT / "docs" / "problems" / "_INDEX.md",
            "<!-- PROBLEMS:BEGIN -->",
            "<!-- PROBLEMS:END -->",
            problems_body,
        ),
    ]

    for path, begin, end, body in targets:
        if check:
            if not path.exists():
                continue
            old = path.read_text(encoding="utf-8")
            new = replace_block(old, begin, end, body)
            if new != old:
                changes.append(path)
        else:
            if update_file(path, begin, end, body):
                changes.append(path)

    if check and changes:
        print("Updates needed:", file=sys.stderr)
        for c in changes:
            print(f"  {c.relative_to(REPO_ROOT)}", file=sys.stderr)
        return 1

    if changes:
        for c in changes:
            print(f"updated: {c.relative_to(REPO_ROOT)}")
    else:
        print("no changes")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
