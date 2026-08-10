#!/usr/bin/env python3
"""gen-ledger.py — project the repository's metadata into the Lean ledger.

The YAML metadata under `attempts/`, `conjectures/`, `bridges/`,
`candidates/` and `docs/problems/` is the source of truth for *facts*;
`formalization/ledger/` is where those facts become values the Lean kernel
checks against the charter's rules. This script is the projection between
them, so the two can never disagree: it regenerates
`formalization/ledger/Ledger/Generated/*.lean` from the metadata, and
`--check` fails if the committed files are stale.

Usage:
  python scripts/gen-ledger.py            # regenerate
  python scripts/gen-ledger.py --check    # exit 1 if regeneration would change anything

Exit codes:
  0  generated files are up to date (or were written)
  1  files are stale (--check), or the metadata cannot be projected
  2  environment problem (missing dependency)
"""

from __future__ import annotations

import pathlib
import re
import sys

REPO_ROOT = pathlib.Path(__file__).resolve().parent.parent
GEN_DIR = REPO_ROOT / "formalization" / "ledger" / "Ledger" / "Generated"
PLAN_FILE = REPO_ROOT / "formalization" / "ledger" / "Ledger" / "Plan.lean"

try:
    import yaml  # type: ignore
except ImportError:  # pragma: no cover - environment guard
    print("error: PyYAML is required. Install with `pip install pyyaml`.", file=sys.stderr)
    sys.exit(2)


HEADER = """\
/-
  {title}

  GENERATED FILE — do not edit by hand.
  Regenerate with `python scripts/gen-ledger.py` after changing the
  metadata it is projected from ({source}).
-/
import Ledger.Core

namespace Ledger.Generated.{ns}

"""

PROBLEM_CTOR = {
    "01-poincare": "poincare",
    "02-riemann": "riemann",
    "03-p-vs-np": "pVsNP",
    "04-yang-mills": "yangMills",
    "05-navier-stokes": "navierStokes",
    "06-hodge": "hodge",
    "07-bsd": "bsd",
}

PROBLEM_STATUS_CTOR = {
    "not-started": "notStarted",
    "active": "active",
    "dormant": "dormant",
    "solved-2003": "solvedExternally",
    "solved-externally": "solvedExternally",
}

OUTCOME_CTOR = {
    "no-progress": "noProgress",
    "survey": "survey",
    "flawed-attempt": "flawedAttempt",
    "partial-insight": "partialInsight",
    "novel-approach": "novelApproach",
    "claimed-solution": "claimedSolution",
    "peer-reviewable": "peerReviewable",
}

CHECK_CTOR = {
    "n/a": "na",
    "pending": "pending",
    "pass": "pass",
    "fail": "fail",
}

CLAIM_KIND_CTOR = {
    "finding": "finding",
    "proposition": "proposition",
    "cited-theorem": "citedTheorem",
    "refutation": "refutation",
    "conjecture": "conjecture",
    "definition": "definition",
    "methodological": "methodological",
    "open-question": "openQuestion",
}

CLAIM_STATUS_CTOR = {
    "unformalized": "unformalized",
    "shape-formalized": "shapeFormalized",
    "stated": "stated",
    "proved": "proved",
    "refuted": "refuted",
    "retracted": "retracted",
}

FORMALIZABILITY_CTOR = {
    "mathlib-ready": "mathlibReady",
    "needs-infrastructure": "needsInfrastructure",
    "shape-only": "shapeOnly",
    "not-mathematical": "notMathematical",
}

EVIDENCE_CTOR = {
    "none": "none",
    # `partial` is a Lean keyword, so the constructors spell it out.
    "partial": "partialEvidence",
    "strong": "strong",
    "contradicted": "contradicted",
}

LEAN_STATUS_CTOR = {
    "none": "none",
    "partial": "partialProgress",
    "complete": "complete",
}

MATURITY_CTOR = {
    "established": "established",
    "emerging": "emerging",
    "speculative": "speculative",
    "ai-discovered": "aiDiscovered",
}

BRIDGE_STATUS_CTOR = {
    "active": "active",
    "dormant": "dormant",
    "retracted": "retracted",
}

CANDIDATE_STATUS_CTOR = {
    "active": "active",
    "abandoned": "abandoned",
    "published": "published",
}


class ProjectionError(Exception):
    """The metadata cannot be projected into the ledger."""


def ctor(table: dict[str, str], value, where: str) -> str:
    key = str(value).strip()
    if key not in table:
        raise ProjectionError(f"{where}: unknown value {key!r} (expected one of {sorted(table)})")
    return "." + table[key]


def lean_string(s: str) -> str:
    """Render a Python string as a single-line Lean string literal."""
    flat = " ".join(str(s).split())
    escaped = flat.replace("\\", "\\\\").replace('"', '\\"')
    return f'"{escaped}"'


def lean_option_string(s) -> str:
    if s is None or str(s).strip() == "":
        return "none"
    return f"some {lean_string(s)}"


def lean_nat_list(xs) -> str:
    return "[" + ", ".join(str(int(x)) for x in xs) + "]"


def lean_string_list(xs) -> str:
    return "[" + ", ".join(lean_string(x) for x in xs) + "]"


def render_list(entries: list[str]) -> str:
    """Render a Lean list literal; empty lists stay on one line."""
    if not entries:
        return "[]"
    return "[\n" + ",\n".join(entries) + "\n]"


def load_yaml(path: pathlib.Path):
    return yaml.safe_load(path.read_text(encoding="utf-8"))


def front_matter(path: pathlib.Path) -> dict:
    text = path.read_text(encoding="utf-8")
    m = re.match(r"^---\n(.*?)\n---\n", text, re.DOTALL)
    if not m:
        raise ProjectionError(f"{path}: missing YAML front matter")
    data = yaml.safe_load(m.group(1))
    if not isinstance(data, dict):
        raise ProjectionError(f"{path}: front matter is not a mapping")
    return data


def num_of(identifier: str, prefix: str, where: str) -> int:
    m = re.fullmatch(re.escape(prefix) + r"(\d{3})", str(identifier).strip())
    if not m:
        raise ProjectionError(f"{where}: identifier {identifier!r} does not match {prefix}###")
    return int(m.group(1))


def verification(data: dict, where: str) -> str:
    v = data.get("verification_status") or {}
    fields = []
    for level in ("L1", "L2", "L3", "L4", "L5", "L6", "L7"):
        fields.append(
            f"l{level[1]} := " + ctor(CHECK_CTOR, v.get(level, "n/a"), f"{where}.{level}")
        )
    return "{ " + ", ".join(fields) + " }"


# --------------------------------------------------------------------------
# Projections
# --------------------------------------------------------------------------


def gen_problems() -> str:
    entries = []
    for slug in sorted(PROBLEM_CTOR):
        path = REPO_ROOT / "docs" / "problems" / slug / "status.md"
        if not path.exists():
            raise ProjectionError(f"missing {path}")
        data = front_matter(path)
        where = str(path.relative_to(REPO_ROOT))
        problem = ctor(PROBLEM_CTOR, slug, where)
        status = ctor(PROBLEM_STATUS_CTOR, data.get("status"), where)
        updated = lean_string(data.get("last_updated", ""))
        entries.append(
            f"  {{ problem := {problem}, status := {status},\n"
            f"    lastUpdated := {updated} }}"
        )
    body = HEADER.format(
        title="Ledger.Generated.Problems - the seven problems' recorded status.",
        source="docs/problems/*/status.md front matter",
        ns="Problems",
    )
    body += "/-- One row per problem, in repository order. -/\n"
    body += "def all : List ProblemRecord := [\n"
    body += ",\n".join(entries)
    body += "\n]\n\nend Ledger.Generated.Problems\n"
    return body


def claim_lean(claim: dict, where: str) -> str:
    for key in ("id", "kind", "status", "formalizability", "statement"):
        if key not in claim:
            raise ProjectionError(f"{where}: claim is missing required key {key!r}")
    cid = lean_string(claim["id"])
    kind = ctor(CLAIM_KIND_CTOR, claim["kind"], where)
    status = ctor(CLAIM_STATUS_CTOR, claim["status"], where)
    formalizability = ctor(FORMALIZABILITY_CTOR, claim["formalizability"], where)
    statement = lean_string(claim["statement"])
    target = lean_option_string(claim.get("formal_target"))
    return (
        f"      {{ id := {cid}, kind := {kind}, status := {status},\n"
        f"        formalizability := {formalizability},\n"
        f"        statement := {statement},\n"
        f"        formalTarget := {target} }}"
    )


def gen_attempts() -> str:
    entries = []
    for path in sorted(REPO_ROOT.glob("attempts/*/A*-*/meta.yaml")):
        if "_TEMPLATE" in path.as_posix():
            continue
        data = load_yaml(path)
        where = path.relative_to(REPO_ROOT).as_posix()
        claims = data.get("claims") or []
        if not claims:
            raise ProjectionError(
                f"{where}: no claims recorded. Every attempt states at least one claim "
                f"(AGENTS.md section 11); see docs/methodology/lean-ledger.md."
            )
        problem = ctor(PROBLEM_CTOR, data["problem"], where)
        num = num_of(data["id"], "A", where)
        date = lean_string(data["date"])
        model = lean_string(data["model"])
        outcome = ctor(OUTCOME_CTOR, data["outcome"], where)
        verif = verification(data, where)
        bridges = lean_nat_list(num_of(b, "B-", where) for b in (data.get("novel_bridges") or []))
        claim_bodies = ",\n".join(claim_lean(c, where) for c in claims)
        entries.append(
            f"  {{ problem := {problem}, num := {num},\n"
            f"    date := {date}, model := {model},\n"
            f"    outcome := {outcome},\n"
            f"    verification := {verif},\n"
            f"    novelBridges := {bridges},\n"
            f"    claims := [\n{claim_bodies} ] }}"
        )
    body = HEADER.format(
        title="Ledger.Generated.Attempts - every merged attempt and the claims it made.",
        source="attempts/*/A*/meta.yaml",
        ns="Attempts",
    )
    body += "/-- Every attempt in the repository, ordered by problem then id. -/\n"
    body += "def all : List Attempt := [\n"
    body += ",\n".join(entries)
    body += "\n]\n\nend Ledger.Generated.Attempts\n"
    return body


def gen_conjectures() -> str:
    entries = []
    for path in sorted(REPO_ROOT.glob("conjectures/C-*-*/meta.yaml")):
        if "_TEMPLATE" in path.as_posix():
            continue
        data = load_yaml(path)
        where = path.relative_to(REPO_ROOT).as_posix()
        num = num_of(data["id"], "C-", where)
        parent = ctor(PROBLEM_CTOR, data["parent_problem"], where)
        parent_attempt = num_of(data["parent_attempt"], "A", where)
        evidence = ctor(EVIDENCE_CTOR, data["numerical_evidence_status"], where)
        lean_status = ctor(LEAN_STATUS_CTOR, data["lean_status"], where)
        statement = lean_string(data["statement"])
        target = lean_option_string(data.get("lean_statement"))
        entries.append(
            f"  {{ num := {num}, parent := {parent}, parentAttempt := {parent_attempt},\n"
            f"    evidence := {evidence}, leanStatus := {lean_status},\n"
            f"    statement := {statement},\n"
            f"    formalTarget := {target} }}"
        )
    body = HEADER.format(
        title="Ledger.Generated.Conjectures - byproduct conjectures.",
        source="conjectures/C-*/meta.yaml",
        ns="Conjectures",
    )
    body += "def all : List Conjecture := " + render_list(entries)
    body += "\n\nend Ledger.Generated.Conjectures\n"
    return body


def gen_bridges() -> str:
    entries = []
    for path in sorted(REPO_ROOT.glob("bridges/B-*.md")):
        data = front_matter(path)
        where = path.relative_to(REPO_ROOT).as_posix()
        num = num_of(data["id"], "B-", where)
        domains = lean_string_list(data.get("domains") or [])
        problems = ", ".join(ctor(PROBLEM_CTOR, p, where) for p in (data.get("problems") or []))
        maturity = ctor(MATURITY_CTOR, data["maturity"], where)
        status = ctor(BRIDGE_STATUS_CTOR, data["status"], where)
        entries.append(
            f"  {{ num := {num}, domains := {domains},\n"
            f"    problems := [{problems}],\n"
            f"    maturity := {maturity}, status := {status} }}"
        )
    body = HEADER.format(
        title="Ledger.Generated.Bridges - inter-field bridges.",
        source="bridges/B-*.md front matter",
        ns="Bridges",
    )
    body += "def all : List Bridge := " + render_list(entries)
    body += "\n\nend Ledger.Generated.Bridges\n"
    return body


def gen_candidates() -> str:
    entries = []
    for path in sorted(REPO_ROOT.glob("candidates/PC-*-*/meta.yaml")):
        if "_TEMPLATE" in path.as_posix():
            continue
        data = load_yaml(path)
        where = path.relative_to(REPO_ROOT).as_posix()
        num = num_of(data["id"], "PC-", where)
        problem = ctor(PROBLEM_CTOR, data["problem"], where)
        status = ctor(CANDIDATE_STATUS_CTOR, data["status"], where)
        lemma_count = int(data.get("lemma_count", 0))
        progress = int(data.get("formalization_progress", 0))
        origins = lean_nat_list(num_of(a, "A", where) for a in (data.get("origin_attempts") or []))
        cited = lean_nat_list(num_of(b, "B-", where) for b in (data.get("cited_bridges") or []))
        verif = verification(data, where)
        entries.append(
            f"  {{ num := {num}, problem := {problem}, status := {status},\n"
            f"    lemmaCount := {lemma_count}, formalizationProgress := {progress},\n"
            f"    originAttempts := {origins},\n"
            f"    citedBridges := {cited},\n"
            f"    verification := {verif} }}"
        )
    body = HEADER.format(
        title="Ledger.Generated.Candidates - proof candidates.",
        source="candidates/PC-*/meta.yaml",
        ns="Candidates",
    )
    body += "def all : List Candidate := " + render_list(entries)
    body += "\n\nend Ledger.Generated.Candidates\n"
    return body


# --------------------------------------------------------------------------
# Cross-checks that belong to text rather than to the kernel
# --------------------------------------------------------------------------


def check_claim_ids() -> list[str]:
    """Claim ids are `<attempt-id>-K<n>`, numbered from 1 without gaps."""
    errors: list[str] = []
    for path in sorted(REPO_ROOT.glob("attempts/*/A*-*/meta.yaml")):
        if "_TEMPLATE" in path.as_posix():
            continue
        data = load_yaml(path) or {}
        where = path.relative_to(REPO_ROOT).as_posix()
        attempt_id = str(data.get("id", "")).strip()
        for i, claim in enumerate(data.get("claims") or [], start=1):
            expected = f"{attempt_id}-K{i}"
            if str(claim.get("id", "")) != expected:
                errors.append(f"{where}: claim {i} has id {claim.get('id')!r}, expected {expected!r}")
    return errors


def check_plans_exist() -> list[str]:
    """Every problem that is `active` or `dormant` has a plan in Plan.lean."""
    errors: list[str] = []
    if not PLAN_FILE.exists():
        return [f"missing {PLAN_FILE.relative_to(REPO_ROOT)}"]
    plan_text = PLAN_FILE.read_text(encoding="utf-8")
    planned = set(re.findall(r"problem\s*:=\s*\.(\w+)", plan_text))
    for slug, lean_ctor in PROBLEM_CTOR.items():
        path = REPO_ROOT / "docs" / "problems" / slug / "status.md"
        if not path.exists():
            continue
        status = str(front_matter(path).get("status", "")).strip()
        if status in ("active", "dormant") and lean_ctor not in planned:
            errors.append(
                f"docs/problems/{slug}/status.md is `{status}` but "
                f"formalization/ledger/Ledger/Plan.lean has no plan for it"
            )
    return errors


def ledger_declarations() -> set[str]:
    """Fully-qualified names declared anywhere in the ledger package."""
    root = REPO_ROOT / "formalization" / "ledger" / "Ledger"
    declared: set[str] = set()
    decl_re = re.compile(r"^(?:def|theorem|structure|inductive|abbrev)\s+([A-Za-z_][A-Za-z0-9_'.]*)")
    for path in sorted(root.rglob("*.lean")):
        stack: list[str] = []
        for line in path.read_text(encoding="utf-8").splitlines():
            ns = re.match(r"^namespace\s+([A-Za-z_][A-Za-z0-9_'.]*)", line)
            if ns:
                stack.append(ns.group(1))
                continue
            if re.match(r"^end\s+", line) and stack:
                stack.pop()
                continue
            m = decl_re.match(line)
            if m:
                prefix = ".".join(stack)
                declared.add(f"{prefix}.{m.group(1)}" if prefix else m.group(1))
    return declared


def check_formal_targets() -> list[str]:
    """Every `formal_target` names a declaration that exists in the ledger."""
    errors: list[str] = []
    declared = ledger_declarations()

    def check(target, where: str) -> None:
        if target is None or str(target).strip() == "":
            return
        if str(target).strip() not in declared:
            errors.append(
                f"{where}: formal_target {target!r} is not a declaration in "
                f"formalization/ledger/"
            )

    for path in sorted(REPO_ROOT.glob("attempts/*/A*-*/meta.yaml")):
        if "_TEMPLATE" in path.as_posix():
            continue
        data = load_yaml(path) or {}
        where = path.relative_to(REPO_ROOT).as_posix()
        for claim in data.get("claims") or []:
            check(claim.get("formal_target"), where)
    for path in sorted(REPO_ROOT.glob("conjectures/C-*-*/meta.yaml")):
        if "_TEMPLATE" in path.as_posix():
            continue
        data = load_yaml(path) or {}
        check(data.get("lean_statement"), path.relative_to(REPO_ROOT).as_posix())
    if PLAN_FILE.exists():
        text = PLAN_FILE.read_text(encoding="utf-8")
        for m in re.finditer(r'formalTarget\s*:=\s*some\s+"([^"]+)"', text):
            check(m.group(1), "formalization/ledger/Ledger/Plan.lean")
    return errors


TARGETS = {
    "Problems.lean": gen_problems,
    "Attempts.lean": gen_attempts,
    "Conjectures.lean": gen_conjectures,
    "Bridges.lean": gen_bridges,
    "Candidates.lean": gen_candidates,
}


def main(argv: list[str]) -> int:
    check_only = "--check" in argv

    try:
        rendered = {name: fn() for name, fn in TARGETS.items()}
    except ProjectionError as e:
        print(f"error: {e}", file=sys.stderr)
        return 1
    except KeyError as e:
        print(f"error: metadata is missing required key {e}", file=sys.stderr)
        return 1

    errors: list[str] = []
    try:
        errors += check_claim_ids()
        errors += check_plans_exist()
        errors += check_formal_targets()
    except ProjectionError as e:
        errors.append(str(e))

    stale: list[str] = []
    GEN_DIR.mkdir(parents=True, exist_ok=True)
    for name, text in rendered.items():
        path = GEN_DIR / name
        current = path.read_text(encoding="utf-8") if path.exists() else None
        if current == text:
            continue
        if check_only:
            stale.append(path.relative_to(REPO_ROOT).as_posix())
        else:
            path.write_text(text, encoding="utf-8")
            print(f"wrote: {path.relative_to(REPO_ROOT).as_posix()}")

    for e in errors:
        print(f"error: {e}", file=sys.stderr)
    if stale:
        print("error: generated ledger is stale; run `python scripts/gen-ledger.py`:", file=sys.stderr)
        for s in stale:
            print(f"  {s}", file=sys.stderr)
    if errors or stale:
        return 1

    print("OK: ledger is consistent with the metadata")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
