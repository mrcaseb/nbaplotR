
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nbaplotR <a href='https://mrcaseb.github.io/nbaplotR/'><img src='man/figures/logo.png' align="right" width="25%" min-width="120px" /></a>

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/nbaplotR)](https://CRAN.R-project.org/package=nbaplotR)
[![R-CMD-check](https://github.com/mrcaseb/nbaplotR/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mrcaseb/nbaplotR/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of nbaplotR is to provide functions and geoms that help
visualization of NBA/WNBA related analysis. It provides a ggplot2 geom
that does the heavy lifting of plotting NBA/WNBA logos in high quality,
with correct aspect ratio and possible transparency. All of this is done
by the powerful [ggpath package](https://mrcaseb.github.io/ggpath/).

## Installation

<!-- The easiest way to get nbaplotR is to install it from [CRAN](https://cran.r-project.org/package=nbaplotR) with: -->
<!-- ``` r -->
<!-- install.packages("nbaplotR") -->
<!-- ``` -->

To get a bug fix or to use a feature from the development version, you
can install the development version of nbaplotR either from
[GitHub](https://github.com/mrcaseb/nbaplotR/) with:

``` r
if (!require("pak")) install.packages("pak")
pak::pak("mrcaseb/nbaplotR")
```
