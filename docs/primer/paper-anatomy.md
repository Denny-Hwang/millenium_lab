# Anatomy of a Mathematics Paper

> Section-by-section structure of a refereed mathematics paper, with
> notes on the rhetorical role and conventional length of each part.
> Living document — refine as we read more papers in the relevant
> fields and as our own candidates approach submission.

---

## 1. Title

Short, factual, names the result. Avoid questions and marketing.
Two patterns are dominant:

- **"On [topic]"** — neutral; survey-friendly. Example: "On the
  natural-proofs barrier".
- **Direct statement of the theorem** — for high-confidence
  results. Example: "Every elliptic curve over $\mathbb{Q}$ is
  modular".

Titles like "A new approach to ...", "Toward a proof of ...",
"Progress on ..." are common in partial-result papers and signal
that the paper does not close the question.

## 2. Abstract

One paragraph, typically 100–200 words. States the main result and
the core technique. **Does not state the proof.** The abstract is
read by people deciding whether to read the introduction; it must
be self-contained and free of unexplained internal notation.

Structure that works:

1. One sentence on the topic and the question.
2. One sentence on what was previously known.
3. One sentence on the main result of this paper.
4. One sentence on the key technique or new ingredient.
5. Optionally, one sentence on applications or open questions.

## 3. Introduction

The longest single section of most papers; in major papers, often
2–4 subsections of its own.

- **Background and motivation.** Where does the question come from?
  This is the only section where rhetorical claims about
  *importance* are conventional.
- **Statement of the main result(s).** Usually labeled "Theorem 1.1"
  or "Main Theorem"; stated in full, with all hypotheses, in the
  introduction itself.
- **Proof outline / strategy.** A paragraph or two on the
  intellectual route. Names the key lemmas the body will prove and
  explains why they suffice.
- **Comparison with prior work.** What is new here? What was
  previously available?
- **Organization of the paper.** A paragraph mapping the rest of
  the paper: "§2 sets up notation; §3 proves the main lemma; ...".

The introduction is the *only* place where hedged rhetorical
appeals are acceptable.

## 4. Preliminaries / notation

A self-contained recap of definitions, conventions, and prior
results the reader will need. Long if the paper is technically
intricate; sometimes omitted in favor of in-line citations if every
definition is standard within the target audience.

A "Notation" subsection at the end of the preliminaries is common
and improves readability — a reader who is stuck on a symbol can
flip to one place.

## 5. Main body

The proof of the main theorem(s), usually broken into:

- A sequence of numbered lemmas, propositions, and (sometimes)
  smaller theorems.
- Proofs of each immediately following its statement, in a `proof`
  environment.
- The proof of the main theorem at the end of the body — often the
  most *compact* part, because the heavy lifting was done by the
  lemmas.

A typical pattern: 80% of the body's length is in proving 3–5
load-bearing lemmas; the main-theorem proof is a half-page
composition.

## 6. Applications / corollaries (optional)

Consequences of the main theorem. Usually shorter than the body.
This section is where a paper demonstrates that the main theorem is
not an isolated curiosity.

## 7. Open questions / further directions

A short section, usually at the end. Mathematicians signal
limitations of the present result and natural follow-up questions
here.

This is *not* a "weaknesses" section in the engineering peer-review
sense — it is a flag for *future work*, not for current defects.
Current defects (if the author is aware of them) belong earlier, in
the statement of hypotheses.

## 8. Acknowledgments

Funding sources, helpful conversations, anonymous referees.
Conventionally short.

## 9. References

Numbered or author–year style (see
[`writing-style.md`](writing-style.md) §7). Should be complete and
verifiable — every cited result must be locatable.

Common style: list all references the paper cites, even those
mentioned only in the introduction; do not include uncited
"further reading".

## 10. Appendices (optional)

Technical computations or proofs that would interrupt the narrative
if placed inline. Use sparingly — many journals discourage long
appendices, and a reader expects the load-bearing proofs to be in
the main body, not relegated.

Appendices are appropriate for:

- Routine but lengthy calculations (e.g., explicit Lie-algebra
  bracket tables).
- Background material the author chose not to assume.
- Tables of numerical data referenced by the main text.

---

## Length conventions by venue

Approximate norms (subject to journal-specific updates):

| Venue | Typical length |
|-------|---------------|
| *Annals of Mathematics* | 30–80 pages |
| *JAMS* | 25–60 pages |
| *Inventiones Mathematicae* | 20–60 pages |
| *IMRN* (International Mathematics Research Notices) | 15–40 pages |
| Topical journals (e.g., *Journal of Number Theory*) | 15–35 pages |
| Letters-format (e.g., *C. R. Math. Acad. Sci. Paris*) | 4–8 pages |

This repository's `candidates/PC-###/main-proof.md` should target
the venue norm of the intended submission journal; see
`docs/methodology/proof-pipeline.md` for journal-track conventions
once a candidate reaches that stage.

## Mapping to this repository's artifacts

| Repository artifact | Closest paper-anatomy analog |
|---|---|
| `attempts/**/result.md` | Extended abstract + proof sketch — not yet a paper. |
| `attempts/**/transcript.md` | Frozen primary source on the *thought process*; not for citation. |
| `candidates/PC-###/main-proof.md` | The main body of a refereed paper. |
| `candidates/PC-###/lemmas/L##.md` | Lemma statements + proofs, in the format the body uses. |
| `bridges/B-###-*.md` | Survey-style note connecting two fields; closer to a letters-format paper. |
| `reviews/publication-track/` | The formal-submission artifacts; here paper-anatomy conventions become binding. |

---

## Open questions / TODO

- For each Millennium problem's leading journals, record current
  page-length / appendix / supplementary-material norms once
  candidates begin to target specific venues.
- Document local LaTeX conventions (theorem environments, label
  prefixes, citation style) once they stabilize.
