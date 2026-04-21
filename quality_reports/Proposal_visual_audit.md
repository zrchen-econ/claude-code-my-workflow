# Visual Audit: Slides/dissertation/Proposal.tex
**Date:** 2026-04-13
**Agent:** slide-auditor

---

## Summary

| Severity | Count |
|----------|-------|
| Critical | 1 |
| Medium | 5 |
| Low | 4 |

---

## Critical Issues

### C1 — `\pause` / `\only` overlay commands used (rule violation)
**Location:** Lines 695–727 (Total Effects frame), 740–765 (Direct Effects frame), 799–817 (Direct Effects frame), 1091–1118 (Appendix RC frame)
**Rule:** `no-pause-beamer.md` prohibits `\pause`, `\only`, `\onslide`, `\uncover`, `\overlay`
**Detail:** Lines 695 (`\only<1>`), 713 (`\only<2>`), 740 (`\only<1>`), 752 (`\pause`), 754 (`\only<2>`), 799 (`\pause`), 801 (`\only<2>`... commented but \pause is live), 1091 (`\only<1>`), 1108 (`\only<2>`)
**Fix:** Replace each overlay split with two separate frames. The `\only<2>` frames showing simulation figures (lines 714–728, 754–765) should become standalone frames immediately after.

---

## Medium Issues

### M1 — Overfull `\vbox` warnings (layout overflow)
**Location:** Log lines 1232 (22.14pt too high) and 1266 (1.82pt too high)
**Detail:** Two frames exceed the slide height. The 22pt overflow at log line 1232 is significant and will clip content on the bottom.
**Fix:** Reduce spacing (`\vspace{}`), smaller font, or split the frame.

### M2 — Inconsistent author name spelling: D'Haultfoeuille vs D'Haultfœuille
**Location:** Line 109 (`D'Haultfoeuille`) vs Lines 161 (`D'Haultfœuille`, with oe ligature)
**Fix:** Choose one spelling consistently throughout. Academic convention is the ligature form `D'Haultfœuille`.

### M3 — Untitled appendix frame
**Location:** Line 1068: `\begin{frame}` (no title argument)
**Detail:** The "Appendix" title slide uses `\Huge Appendix` inside but no frame title. This creates an inconsistency in the navigation bar and PDF bookmarks.
**Fix:** `\begin{frame}[plain]{}` or give it a title `\begin{frame}{Appendix}`.

### M4 — Broken figure caption reference
**Location:** Lines 717–720 and 757–761: `\captionof{figure}{TWFE estimator for the direct effect}` is used for *both* the total effects figure (line 720) and the direct effects figure (line 761)
**Detail:** Both captions read "TWFE estimator for the direct effect" but the first one (line 720) should read "TWFE estimator for the total effect" to match its figure (`theta_total_sim_new.pdf`).
**Fix:** Line 720: change caption to "TWFE estimator for the total effect".

### M5 — `\only<2>` in Appendix RC frame creates implicit slide pagination issue
**Location:** Lines 1090–1118 in Appendix (Assumption 7 frame)
**Detail:** The appendix frame uses `\only<1>` / `\only<2>` with `\overlayarea`. While this is in the appendix (less critical), it still violates the no-pause rule and the appendix slide numbering with `appendixnumberbeamer` may be inconsistent.
**Fix:** Split into two appendix frames.

---

## Low Issues

### L1 — Inconsistent spacing between bullet items
**Location:** Section 1 frames use `\vspace{0.02cm}` (negligibly small), Section 2 uses `\vspace{0.1cm}` and `\vspace{0.3cm}`. No consistent system.
**Fix:** Standardize to `\vspace{0.15cm}` or `\smallskip` throughout all bullet lists.

### L2 — `\linespread{1.35}` may cause spacing issues on dense frames
**Location:** Preamble, line 5
**Detail:** Line spread of 1.35 is wide for a presentation and may contribute to vbox overflow on frames with many equations.
**Fix:** Consider `\linespread{1.2}` or removing it and using `\setlength{\itemsep}` for selective spacing control.

### L3 — `text margin right = 5mm` vs `text margin left = 0.8cm` asymmetry
**Location:** Line 43: `\setbeamersize{text margin left=0.8cm, text margin right = 5mm}`
**Detail:** This creates visually unbalanced margins (left 8mm, right 5mm). May not be intentional.
**Fix:** Use symmetric margins, e.g., `0.8cm` on both sides, unless right asymmetry is deliberate.

### L4 — Graph subfigure widths could be tighter
**Location:** Lines 1094–1104: Two subfigures at 0.42\textwidth each with 0.05\textwidth gap
**Detail:** Total = 0.89\textwidth, which leaves 0.11\textwidth unused. Figures appear smaller than necessary.
**Fix:** Increase to 0.45\textwidth each.
