# CLAUDE.MD -- CiC Continuous Treatment: Academic Research Workflow

**Project:** Changes-in-Changes with Time-Varying Continuous Treatment (JMP / Dissertation Chapter)
**Institution:** UNC-Chapel Hill
**Branch:** main

---

## Core Principles

- **Plan first** -- enter plan mode before non-trivial tasks; save plans to `quality_reports/plans/`
- **Verify after** -- compile/render and confirm output at the end of every task
- **Single source of truth** -- paper draft (`Paper/`) is authoritative; slides and figures derive from it
- **Quality gates** -- nothing ships below 80/100
- **[LEARN] tags** -- when corrected, save `[LEARN:category] wrong → right` to MEMORY.md

---

## Folder Structure

```
my-project/
├── CLAUDE.md                    # This file
├── .claude/                     # Rules, agents, hooks, skills
├── Bibliography_base.bib        # Centralized bibliography
├── Figures/                     # Figures and images (auto-generated from scripts/R/)
├── Preambles/header.tex         # LaTeX headers
├── Paper/                       # Manuscript (.tex source + compiled .pdf)
├── Slides/                      # Job talk / seminar Beamer slides (.tex)
├── Quarto/                      # RevealJS version of slides (.qmd) + theme
├── docs/                        # GitHub Pages (auto-generated)
├── scripts/R/                   # Monte Carlo simulations + estimation code
├── quality_reports/             # Plans, session logs, specs, replication reports
├── explorations/                # Identification experiments (60/100 threshold)
├── templates/                   # Session log, quality report templates
└── master_supporting_docs/      # Reference papers and existing slides
```

---

## Commands

```bash
# Compile paper (3-pass, XeLaTeX)
cd Paper && TEXINPUTS=../Preambles:$TEXINPUTS xelatex -interaction=nonstopmode main.tex
BIBINPUTS=..:$BIBINPUTS bibtex main
TEXINPUTS=../Preambles:$TEXINPUTS xelatex -interaction=nonstopmode main.tex
TEXINPUTS=../Preambles:$TEXINPUTS xelatex -interaction=nonstopmode main.tex

# Compile presentation slides (3-pass, XeLaTeX)
cd Slides && TEXINPUTS=../Preambles:$TEXINPUTS xelatex -interaction=nonstopmode file.tex
BIBINPUTS=..:$BIBINPUTS bibtex file
TEXINPUTS=../Preambles:$TEXINPUTS xelatex -interaction=nonstopmode file.tex
TEXINPUTS=../Preambles:$TEXINPUTS xelatex -interaction=nonstopmode file.tex

# Deploy Quarto slides to GitHub Pages
./scripts/sync_to_docs.sh SlideName

# Quality score
python scripts/quality_score.py Paper/main.tex
```

---

## Quality Thresholds

| Score | Gate | Meaning |
|-------|------|---------|
| 80 | Commit | Good enough to save |
| 90 | PR | Ready for deployment |
| 95 | Excellence | Aspirational |

---

## Skills Quick Reference

| Command | What It Does |
|---------|-------------|
| `/compile-latex [file]` | 3-pass XeLaTeX + bibtex |
| `/deploy [SlideName]` | Render Quarto + sync to docs/ |
| `/extract-tikz [SlideName]` | TikZ → PDF → SVG |
| `/proofread [file]` | Grammar/typo/overflow review |
| `/visual-audit [file]` | Slide layout audit |
| `/review-r [file]` | R code quality review |
| `/qa-quarto [SlideName]` | Adversarial Quarto vs Beamer QA |
| `/translate-to-quarto [file]` | Beamer → Quarto translation |
| `/validate-bib` | Cross-reference citations |
| `/review-paper [file]` | Manuscript review (argument, spec, referee objections) |
| `/teach-paper [file]` | Read a paper and teach it section by section with plain-language explanations |
| `/data-analysis [dataset]` | End-to-end R analysis |
| `/lit-review [topic]` | Literature search + synthesis |
| `/research-ideation [topic]` | Research questions + strategies |
| `/interview-me [topic]` | Interactive research interview |
| `/commit [msg]` | Stage, commit, PR, merge |
| `/learn [skill-name]` | Extract discovery into persistent skill |
| `/context-status` | Show session health + context usage |
| `/deep-audit` | Repository-wide consistency audit |
| `/slide-excellence [file]` | Multi-agent slide review (visual, pedagogy, proofreading) — for lecture slides |
| `/slide-research-excellence [file]` | Multi-agent review for research presentations (job talk, seminar, conference) |

---

## Paper LaTeX Environments

| Environment | Effect | Use Case |
|-------------|--------|----------|
| `theorem` | Numbered theorem block | Main identification results |
| `proposition` | Numbered proposition block | Supporting identification results |
| `lemma` | Numbered lemma block | Technical lemmas |
| `corollary` | Numbered corollary block | Direct consequences |
| `definition` | Definition block | Formal object definitions |
| `assumption` | Numbered assumption block | Identification assumptions |
| `remark` | Remark block | Clarifications, connections, scope |
| `example` | Example block | Illustrative examples |

## Beamer Custom Environments (Presentation Slides)

| Environment | Effect | Use Case |
|-------------|--------|----------|
| `[your-env]` | [Description] | [When to use] |

## Quarto CSS Classes (RevealJS Slides)

| Class | Effect | Use Case |
|-------|--------|----------|
| `[.your-class]` | [Description] | [When to use] |

---

## Current Paper State

| Section | File | Status | Notes |
|---------|------|--------|-------|
| Introduction | `Paper/main.tex` | PENDING | Motivation: continuous treatment gap in CiC |
| Setup & Model | `Paper/main.tex` | PENDING | Potential outcomes, panel setup, ASF/QSF objects |
| Identification | `Paper/main.tex` | PENDING | Main theorem: copula structure → point ID |
| Estimation | `Paper/main.tex` | PENDING | Nonparametric/semiparametric estimator |
| Inference | `Paper/main.tex` | PENDING | Bootstrap / asymptotic theory |
| Simulations | `scripts/R/` | PENDING | MC: coverage, bias, RMSE under DGPs |
| Application | `Paper/main.tex` | PENDING | Empirical illustration |
