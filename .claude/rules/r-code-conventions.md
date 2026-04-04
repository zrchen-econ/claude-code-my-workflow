---
paths:
  - "**/*.R"
  - "Figures/**/*.R"
  - "scripts/**/*.R"
---

# R Code Standards

**Standard:** Senior Principal Data Engineer + PhD researcher quality

---

## 1. Reproducibility

- `set.seed()` called ONCE at top (YYYYMMDD format); document the seed value in a comment
- For parallel computation: `RNGkind("L'Ecuyer-CMRG")` before `set.seed()` to ensure reproducible parallel streams
- All packages loaded at top via `library()` (not `require()`)
- All paths relative to repository root via `here::here()`
- `dir.create(..., recursive = TRUE)` for output directories

## 2. Function Design

- `snake_case` naming, verb-noun pattern
- Roxygen-style documentation
- Default parameters, no magic numbers
- Named return values (lists or tibbles)

## 3. Domain Correctness

**CiC / distributional methods pitfalls:**
- Verify estimator implementations match paper formulas exactly (CDF composition, quantile inversion)
- `quantile(x, type=7)` (R default) uses interpolation — inconsistent with empirical CDF $F^{-1}$; use `type=1` or `type=2` depending on convention; document choice
- `ecdf()` returns a left-continuous function; if right-continuity is assumed, handle separately
- Enforce monotonicity of estimated CDFs after smoothing: apply `isoreg()` or rearrangement
- Distribution functions at boundary ($\tau = 0$ or $\tau = 1$): guard against numerical overflow in quantile inversion
- Bandwidth sensitivity: always report estimates under 2–3 bandwidth choices; flag if results change materially

## 4. Visual Identity

```r
# --- Academic palette (colorblind-safe, publication-ready) ---
col_primary   <- "#2C3E7A"   # Deep navy blue
col_secondary <- "#B5482A"   # Muted terra cotta / brick red
col_tertiary  <- "#4A7C59"   # Muted forest green
col_gray      <- "#6B6B6B"   # Medium gray for secondary elements
col_light     <- "#D0D0D0"   # Light gray for CI bands / fills
col_highlight <- "#E8A020"   # Amber for highlights (use sparingly)
```

### Publication-Ready Theme
```r
theme_paper <- function(base_size = 12) {
  theme_minimal(base_size = base_size) +
    theme(
      plot.title    = element_text(face = "bold", size = base_size),
      axis.title    = element_text(size = base_size - 1),
      axis.text     = element_text(size = base_size - 2),
      legend.position = "bottom",
      legend.title  = element_blank(),
      panel.grid.minor = element_blank(),
      panel.border  = element_rect(color = "black", fill = NA, linewidth = 0.4),
      strip.background = element_blank(),
      strip.text    = element_text(face = "bold")
    )
}
```

### Figure Dimensions
```r
# For paper figures (LaTeX single column ≈ 3.5 in, double column ≈ 7 in)
ggsave(filepath, width = 6.5, height = 4, bg = "transparent", dpi = 300)

# For wider figures (two-panel or simulation summary)
ggsave(filepath, width = 9,   height = 4, bg = "transparent", dpi = 300)
```

## 5. Monte Carlo Structure

**The pattern:** DGP function → simulation loop → save RDS → load for plotting/tables.

**Never** re-run the MC loop inside a plotting or table script.

```r
# --- 1. Define DGP ---
dgp_cic <- function(n, copula_type = "gaussian", rho = 0.5, seed = NULL) {
  if (!is.null(seed)) set.seed(seed)
  # ... generate (Y, D, group, time) per paper assumptions
  tibble(y = ..., d = ..., g = ..., t = ...)
}

# --- 2. Run simulation ---
RNGkind("L'Ecuyer-CMRG")
set.seed(20260101)  # YYYYMMDD

results <- parallel::mclapply(seq_len(B), function(b) {
  dat  <- dgp_cic(n = 500)
  est  <- estimate_asf(dat)
  list(b = b, asf_hat = est$asf, se = est$se)
}, mc.cores = parallel::detectCores() - 1)

saveRDS(results, here::here("quality_reports", "mc_results_B5000.rds"))

# --- 3. Load and summarize (in separate script) ---
results <- readRDS(here::here("quality_reports", "mc_results_B5000.rds"))
# ... compute coverage, bias, RMSE
```

## 6. RDS Data Pattern

**Heavy computations saved as RDS; all downstream scripts load pre-computed data.**

```r
saveRDS(result, here::here("quality_reports", "descriptive_name.rds"))
```

## 7. Common Pitfalls

| Pitfall | Impact | Prevention |
|---------|--------|------------|
| `quantile(type=7)` default | Theory-code mismatch | Use `type=1` or `type=2`; document |
| Non-monotone estimated CDF | Invalid quantile inversion | Apply `isoreg()` after smoothing |
| `ecdf()` left-continuity | Convention mismatch | Document; handle boundaries explicitly |
| Missing `bg = "transparent"` | White boxes on slides | Always include in `ggsave()` |
| Hardcoded paths | Breaks on other machines | Use `here::here()` throughout |
| `set.seed()` without `RNGkind` | Non-reproducible parallel MC | Always set `RNGkind("L'Ecuyer-CMRG")` first |
| Re-running MC in plotting script | Stale figure if MC output changed | Strict separation: MC → RDS → plot |
| `Inf`/`NaN` at quantile boundaries | Silent errors in ASF integral | Guard $\tau \in [\epsilon, 1-\epsilon]$ with small $\epsilon$ |

## 8. Line Length & Mathematical Exceptions

**Standard:** Keep lines <= 100 characters.

**Exception: Mathematical Formulas** — lines may exceed 100 chars **if and only if:**

1. Breaking the line would harm readability of the math (quantile transformations, CDF compositions, influence functions, formula implementations matching paper equations)
2. An inline comment explains the mathematical operation:
   ```r
   # CiC counterfactual CDF: F_{Y11(d)} = F_{Y10}( F_{Y00(d)}^{-1}( F_{Y00}(y) ) )
   f_cf <- f_y10(quantile_fn(f_y00_d_inv, f_y00(y)))
   ```
3. The line is in a numerically intensive section (simulation loops, estimation routines, inference)

## 9. Code Quality Checklist

```
[ ] Packages at top via library()
[ ] RNGkind("L'Ecuyer-CMRG") + set.seed(YYYYMMDD) at top
[ ] All paths via here::here()
[ ] Functions documented (Roxygen)
[ ] Figures: transparent bg, explicit dimensions, theme_paper()
[ ] RDS: every heavy computation saved; loading scripts separate from estimation
[ ] quantile() type documented
[ ] Monotonicity enforced on estimated CDFs
[ ] Boundary guards on quantile inversion
[ ] Comments explain WHY not WHAT
```
