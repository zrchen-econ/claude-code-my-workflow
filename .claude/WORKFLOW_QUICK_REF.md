# Workflow Quick Reference

**Model:** Contractor (you direct, Claude orchestrates)

---

## The Loop

```
Your instruction
    ↓
[PLAN] (if multi-file or unclear) → Show plan → Your approval
    ↓
[EXECUTE] Implement, verify, done
    ↓
[REPORT] Summary + what's ready
    ↓
Repeat
```

---

## I Ask You When

- **Design forks:** "Option A (fast) vs. Option B (robust). Which?"
- **Identification ambiguity:** "Spec unclear on assumption direction. Assume Y?"
- **Notation conflict:** "New symbol overlaps existing one. Resolve?"
- **Scope question:** "Also refactor Y while here, or focus on X?"
- **MC near-miss:** "Coverage is 0.933 vs target 0.95. Investigate or proceed?"

---

## I Just Execute When

- Code fix is obvious (bug, pattern application)
- Verification (tolerance checks, compilation, coverage checks)
- Documentation (logs, commits, bib entries)
- Plotting (per established figure standards)
- Deployment (after you approve, I ship automatically)

---

## Quality Gates (No Exceptions)

| Score | Action |
|-------|--------|
| >= 80 | Ready to commit |
| < 80  | Fix blocking issues |

---

## Non-Negotiables

- **Path convention:** `here::here()` for all R scripts; relative paths for LaTeX
- **Seed convention:** `set.seed(YYYYMMDD)` once at top of each script; document seed value in comment
- **Figure standards:** Transparent background; minimum 6×4 inches; publication-ready minimal theme; no ggplot default colors or grids
- **Color palette:** Muted academic palette — colorblind-safe (see `r-code-conventions.md`); never bright defaults
- **MC tolerance thresholds:** Point estimates ≤1e-6; SE (analytical) ≤1e-6; SE (bootstrap) ≤1e-4; coverage rates ±0.01 (B=5000)
- **No inline heavy computation:** All MC outputs and estimated objects saved as `.rds`; plotting scripts load pre-computed data only
- **Notation lock:** Symbol choices from `.claude/rules/knowledge-base-template.md` are frozen; ask before introducing any new notation symbol

---

## Preferences

**Visual:** Publication-ready minimal ggplot theme; math-mode axis labels; no chart junk; no redundant legends
**Reporting:** Concise bullets first; details on request; always flag MC near-misses explicitly
**Session logs:** Always (post-plan, incremental, end-of-session)
**Replication:** Replicate original CiC results to 1e-6 before extending; document any discrepancy even if unresolved

---

## Exploration Mode

For experimental work (testing identification strategies, new estimators), use the **Fast-Track** workflow:
- Work in `explorations/` folder
- 60/100 quality threshold (vs. 80/100 for production)
- No plan needed — just a research value check (2 min)
- See `.claude/rules/exploration-fast-track.md`

---

## Next Step

You provide task → I plan (if needed) → Your approval → Execute → Done.
