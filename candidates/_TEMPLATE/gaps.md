# Gaps — Known Gaps

This file registers every gap the candidate is aware of. **Do not hide
them.** Hidden gaps destroy trust at adversarial verification and
external review.

---

## Gap List

| ID | Location | Severity | Summary | Status |
|----|----------|----------|---------|--------|
| G001 | TODO | minor/major/lethal | TODO | open/closed |

> Severity definitions:
> - **minor** — does not affect the conclusion (e.g., an auxiliary
>   lemma's formalization is incomplete).
> - **major** — a workaround is needed for some cases of the
>   conclusion.
> - **lethal** — could falsify the conclusion. Route immediately to
>   adversarial verification.

## Closing Procedure

1. When opening a PR that closes a gap, update its "Status" to
   `closed` in this table.
2. Cite the closure reason in `attacks.md` or in a new lemma.
3. If a lethal gap cannot be closed, transition the candidate's status
   to `abandoned`.
