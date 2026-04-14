---
name: slide-research-excellence
description: Multi-agent review for research presentation slides (job talk, seminar, conference). Checks visual layout, proofreading, econometric substance, and research argument structure. Use instead of /slide-excellence for research talks.
argument-hint: "[TEX or QMD filename in Slides/ or Quarto/]"
allowed-tools: ["Read", "Grep", "Glob", "Write", "Task"]
context: fork
---

# Research Slide Excellence Review

Comprehensive review of research presentation slides for **expert audiences** (job talk, seminar, conference). Drops pedagogy review; adds research argument review.

## Steps

### 1. Identify the File

Parse `$ARGUMENTS` for the filename. Resolve path in `Quarto/` or `Slides/`. If not found, ask.

### 2. Run Review Agents in Parallel

**Agent 1: Visual Audit** (slide-auditor)
- Overflow, font consistency, box fatigue, spacing, figure paths
- Save: `quality_reports/[FILE]_visual_audit.md`

**Agent 2: Proofreading** (proofreader)
- Grammar, typos, notation consistency, citation format, academic quality
- Save: `quality_reports/[FILE]_report.md`

**Agent 3: Econometric Substance** (domain-reviewer)
- Identification assumptions, derivation correctness, claim precision, citation fidelity
- Save: `quality_reports/[FILE]_substance_review.md`

**Agent 4: TikZ Review** (tikz-reviewer) — only if file contains TikZ
- Label positions, overlaps, visual consistency, geometric accuracy
- Save: `quality_reports/[FILE]_tikz_review.md`

### 3. Research Argument Review (inline — you perform this)

After parallel agents complete, read the full slide file and evaluate across 5 dimensions:

**3.1 Motivation and Problem Statement**
- Is there a clear, specific research question early (slides 2–5)?
- Is the literature gap stated precisely — not just "little work" but *what specifically is missing*?
- Does the motivation connect to something an economist would care about?

**3.2 Contribution Clarity**
- Is the main contribution stated in 1–3 bullets, early in the talk?
- Are contributions distinguished from prior work ("we differ from X because...")?
- Are there overclaiming statements that should be softened?

**3.3 Argument Flow and Narrative Arc**
- Does the talk follow: motivation → setup → main result → evidence → implications?
- Are there signpost slides (road map, section headers) at major transitions?
- Is the main result presented *before* excessive technical machinery?
- Are there slides that could be cut without losing the argument?

**3.4 Claim Precision and Caveats**
- Are main results stated with the assumptions under which they hold?
- Is the boundary between "what we prove" and "what we conjecture" clear?
- Are robustness or extensions addressed before the audience asks?
- Are empirical findings stated with appropriate uncertainty?

**3.5 Seminar Audience Navigation**
- Is there a road map slide that matches the actual structure?
- Is there a clear "punchline" slide a distracted audience member can follow?
- Does the conclusion say *what you found*, not just *what you did*?
- Are any slides better placed in an appendix?

Save to: `quality_reports/[FILE]_argument_review.md`

### 4. Synthesize Combined Report

```markdown
# Research Slide Excellence Review: [Filename]
**Date:** [YYYY-MM-DD]

## Overall Quality Score: [EXCELLENT / GOOD / NEEDS WORK / POOR]

| Dimension             | Critical | Medium | Low |
|-----------------------|----------|--------|-----|
| Visual / Layout       |          |        |     |
| Proofreading          |          |        |     |
| Econometric Substance |          |        |     |
| Research Argument     |          |        |     |

## Critical Issues (Fix Before Presenting)
## Medium Issues (Fix Before Next Major Venue)
## Low Issues (Polish When Time Allows)
## Recommended Next Steps
```

## Quality Score Rubric

| Score | Critical | Medium | Meaning |
|-------|----------|--------|---------|
| Excellent | 0–2 | 0–5 | Ready to present at top seminar |
| Good | 3–5 | 6–15 | Strong talk, minor refinements needed |
| Needs Work | 6–10 | 16–30 | Argument or substance issues require revision |
| Poor | 11+ | 31+ | Significant restructuring required |
