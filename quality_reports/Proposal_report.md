# Proofreading Report: Slides/dissertation/Proposal.tex
**Date:** 2026-04-13
**Agent:** proofreader

---

## Summary

| Category | Count |
|----------|-------|
| Grammar/syntax | 3 |
| Typos | 2 |
| Consistency | 4 |
| Academic writing | 3 |
| Missing content | 2 |

---

## Grammar / Syntax

### G1 — "Unit are drawn..."
**Location:** Line 193
**Current:** `\item Unit are drawn from an infinite superpopulation`
**Proposed:** `\item Units are drawn from an infinite superpopulation`
**Category:** Grammar (subject-verb agreement — "Unit" is plural noun, needs plural verb form but should be "Units")

### G2 — "TWFE regression again not works"
**Location:** Line 628
**Current:** `\textbf{This paper}: TWFE regression again not works in the presence of \textit{``bad controls''}`
**Proposed:** `\textbf{This paper}: TWFE regression also fails in the presence of \textit{``bad controls''}`
**Category:** Grammar (ungrammatical construction; "again not works" is incorrect English; "also fails" is concise and parallel to earlier use of "fails" in Caetano and Callaway bullet above)

### G3 — "we identify bounds... that take the form"
**Location:** Line 1043
**Current:** `\item We derive bounds on the ATT that take the form of intersection-union bounds`
**Proposed:** `\item We derive bounds on the ATT in the form of intersection-union bounds`
**Category:** Grammar (redundant: "bounds ... that take the form of bounds")

---

## Typos

### T1 — "stritly" (misspelling)
**Location:** Line 297
**Current:** `$F_{\tilde{Y}_{t}\mid \Delta D=0}$ is continuous and stritly increasing.`
**Proposed:** `$F_{\tilde{Y}_{t}\mid \Delta D=0}$ is continuous and strictly increasing.`
**Category:** Typo

### T2 — "sober worker" (informal/incomplete)
**Location:** Line 860
**Current:** `\item[-] Direct: More sober worker, ...`
**Proposed:** `\item[-] Direct: more sober workers, fewer accidents, ...`
**Category:** Typo/academic register (missing plural; "..." is acceptable in slides but at least fix the singular)

---

## Consistency

### C1 — D'Haultfoeuille vs D'Haultfœuille (ligature inconsistency)
**Location:** Line 109 (`D'Haultfoeuille`) vs Line 161 (`D'Haultfœuille`)
**Current (line 109):** `D'Haultfoeuille, Hoderlein, and Sasaki (2023)`
**Proposed:** `D'Haultfœuille, Hoderlein, and Sasaki (2023)` — use the oe-ligature consistently
**Category:** Consistency (author name spelling)

### C2 — QSF argument order inconsistency
**Location:** Lines 231 vs 234
**Line 231:** `QSF_{t}(d,\tau)` — argument order (d, tau)
**Line 234:** `QSF_{t}(d,\tau)` — same, consistent here
**Note:** Knowledge base specifies `QSF(\tau, d)` as the canonical order (tau first). Slides use `(d, \tau)`. This diverges from the paper's knowledge base convention. Flag for alignment with Paper/main.tex.
**Category:** Consistency with project notation registry

### C3 — "Assumption 1 and 2" (missing article)
**Location:** Lines 704, 742, 828
**Current:** `Under Assumption 1 and 2,`
**Proposed:** `Under Assumptions 1 and 2,`
**Category:** Grammar/consistency (plural "Assumptions" needed when referencing two)

### C4 — Missing `\bibliography{}` command
**Location:** No `\bibliography{...}` command anywhere in the file (only `\bibliographystyle{apalike}` on line 29, no `\bibliography{../Bibliography_base}`)
**Detail:** All citations are inline (e.g., "(Athey and Imbens, 2006)") — no `\cite` commands are used, so a bibliography section is not rendered. This is acceptable for this slide style, but the `\bibliographystyle` declaration on line 29 is orphaned and unnecessary unless a references slide is planned.
**Proposed:** Either remove line 29 or add a references frame.
**Category:** Consistency / dead code

---

## Academic Writing Quality

### A1 — "Bad controls" quotation style
**Location:** Lines 617–618, 628
**Current:** `\textit{``bad controls''}` (italics + quotes)
**Proposed:** ```bad controls''` (quotes only, or cite Pearl directly inline)
**Category:** Academic register — the current style double-marks the quotation (italics AND quotes), which is redundant. Choose one convention.

### A2 — "To Do List" frame visible in main deck
**Location:** Lines 497–503
**Detail:** A "To Do List" frame with only two items ("Estimation and Inference", "Empirical Application") appears in the main section of the CiC chapter. For a dissertation proposal, this is appropriate — it signals work in progress. However, it reads as a placeholder note rather than a structured "Future Work" slide. Consider renaming to "Future Work" or "Research Agenda" and adding brief descriptions.
**Category:** Academic writing (register appropriate for proposal context)

### A3 — Ellipsis in Assumption 4 frame — truncated sentence
**Location:** Line 608
**Current:** `\item[-] Monotonicity, Homogeneous mediator effects across types, ...`
**Detail:** The ellipsis suggests a list of assumptions that is not fully stated. For a dissertation proposal presentation, committee members will probe these. Complete the list or note "among others."
**Category:** Academic completeness
