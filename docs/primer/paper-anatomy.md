# Anatomy of a Mathematics Paper

> Section-by-section structure of a refereed mathematics paper, with
> notes on the rhetorical role and conventional length of each part.
> Living document — refine as we read more papers in the relevant
> fields and as our own candidates approach submission.

---

## 1. Title

TODO: Short, factual, names the result. Avoid questions and
marketing. "On" + topic, or a direct statement of the theorem, are
both common.

## 2. Abstract

TODO: One paragraph, ~150 words. States the main result and the
core technique; does not state the proof. The abstract reader
decides whether to read the introduction.

## 3. Introduction

TODO: Multi-part section, usually with its own subsections:

- **Background and motivation**: where does this question come
  from?
- **Statement of the main result**: usually labeled as such, often
  numbered ("Theorem 1.1").
- **Proof outline / strategy**: a paragraph or two on the
  intellectual route of the proof.
- **Comparison with prior work**: what is new here?
- **Organization of the paper**: a paragraph mapping the rest of
  the paper.

The introduction is the only place in the paper where rhetorical
hedging about *importance* is acceptable.

## 4. Preliminaries / notation

TODO: Self-contained recap of definitions and prior results the
reader will need. Long if the paper is technically intricate; sometimes
omitted in favor of in-line citations if every definition is standard.

## 5. Main body

TODO: The proof of the main theorem(s), usually broken into:

- A sequence of lemmas, each numbered and stated formally.
- Proofs of each lemma immediately following its statement.
- The proof of the main theorem at the end, often appearing as the
  most compact section because the heavy lifting was done by the
  lemmas.

## 6. Applications / corollaries (optional)

TODO: Consequences of the main theorem. Often shorter than the
main proof.

## 7. Open questions / further directions

TODO: A short section, usually at the end. Mathematicians signal
limitations here; this is *not* a weakness section in the
engineering sense, but a flag for follow-up work.

## 8. Acknowledgments

TODO: Funding, helpful conversations, anonymous referees.

## 9. References

TODO: Numbered or author–year (see
[`writing-style.md`](writing-style.md) §7). Should be complete and
verifiable.

## 10. Appendices (optional)

TODO: Technical computations or proofs that would interrupt the
narrative if placed inline. Use sparingly; many journals
discourage long appendices.

---

## Length conventions by venue

TODO: Number ranges (in pages) for different journal styles.
Annals, JAMS, IMRN, IJM, etc. — each has its own norms. Fill in
as we research specific submission targets.

## Mapping to this repository's artifacts

TODO: Cross-reference table.

- `attempts/**/result.md` — closest to an *extended abstract +
  proof sketch*; not yet a paper.
- `candidates/PC-###/main-proof.md` — the closest analog to the
  main body of a refereed paper.
- `reviews/publication-track/` — the formal-submission artifacts;
  this is where paper-anatomy conventions become binding.

---

## Open questions / TODO

- For each Millennium problem's leading journals, record current
  page-length / appendix / supplementary-material norms.
