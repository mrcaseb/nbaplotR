# nbaplotR

The goal of nbaplotR is to provide functions and geoms that help
visualization of NBA/WNBA related analysis. It provides a ggplot2 geom
that does the heavy lifting of plotting NBA/WNBA logos in high quality,
with correct aspect ratio and possible transparency. All of this is done
by the powerful [ggpath package](https://mrcaseb.github.io/ggpath/).

## Installation

To get a bug fix or to use a feature from the development version, you
can install the development version of nbaplotR either from
[GitHub](https://github.com/mrcaseb/nbaplotR/) with:

``` r
if (!require("pak")) install.packages("pak")
pak::pak("mrcaseb/nbaplotR")
```
