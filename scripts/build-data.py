#!/usr/bin/env python3
"""build-data.py — 모든 attempts 의 meta.yaml 을 모아 data/attempts.csv 생성.

사용:
  python scripts/build-data.py
"""

from __future__ import annotations

import csv
import pathlib
import sys

REPO_ROOT = pathlib.Path(__file__).resolve().parent.parent
DATA_DIR = REPO_ROOT / "data"

try:
    import yaml  # type: ignore
except ImportError:
    print("오류: PyYAML 필요. pip install pyyaml", file=sys.stderr)
    sys.exit(2)


FIELDS = [
    "id",
    "problem",
    "date",
    "model",
    "duration_minutes",
    "outcome",
    "L1",
    "L2",
    "L3",
    "L4",
    "L5",
    "L6",
    "L7",
    "key_insights_count",
    "follow_ups_count",
    "novel_bridges_count",
]


def main() -> int:
    DATA_DIR.mkdir(exist_ok=True)
    out = DATA_DIR / "attempts.csv"
    rows: list[dict] = []
    for path in sorted(REPO_ROOT.glob("attempts/*/A*-*/meta.yaml")):
        if "_TEMPLATE" in path.as_posix():
            continue
        try:
            data = yaml.safe_load(path.read_text(encoding="utf-8")) or {}
        except yaml.YAMLError as e:
            print(f"경고: {path} 파싱 실패: {e}", file=sys.stderr)
            continue
        vstat = data.get("verification_status") or {}
        rows.append({
            "id": data.get("id", ""),
            "problem": data.get("problem", ""),
            "date": data.get("date", ""),
            "model": data.get("model", ""),
            "duration_minutes": data.get("duration_minutes", ""),
            "outcome": data.get("outcome", ""),
            "L1": vstat.get("L1", ""),
            "L2": vstat.get("L2", ""),
            "L3": vstat.get("L3", ""),
            "L4": vstat.get("L4", ""),
            "L5": vstat.get("L5", ""),
            "L6": vstat.get("L6", ""),
            "L7": vstat.get("L7", ""),
            "key_insights_count": len(data.get("key_insights") or []),
            "follow_ups_count": len(data.get("follow_ups") or []),
            "novel_bridges_count": len(data.get("novel_bridges") or []),
        })

    with out.open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=FIELDS)
        writer.writeheader()
        for r in rows:
            writer.writerow(r)
    print(f"OK: {len(rows)} 행을 {out.relative_to(REPO_ROOT)} 에 기록")
    return 0


if __name__ == "__main__":
    sys.exit(main())
