# Standardize NBA/WNBA Team Abbreviations

This function standardizes NBA/WNBA team abbreviations to ESPN defaults.

## Usage

``` r
clean_team_abbrs(abbr, league = c("NBA", "WNBA"), keep_non_matches = TRUE)
```

## Arguments

- abbr:

  a character vector of abbreviations

- league:

  One of `"NBA"` or `"WNBA"`

- keep_non_matches:

  If `TRUE` (the default) an element of `abbr` that can't be matched to
  any of the internal mapping vectors will be kept as is. Otherwise it
  will be replaced with `NA`.

## Value

A character vector with the length of `abbr` and cleaned team
abbreviations if they are included in
[`nba_team_abbr_mapping`](https://mrcaseb.github.io/nbaplotR/reference/nba_team_abbr_mapping.md)
or
[`wnba_team_abbr_mapping`](https://mrcaseb.github.io/nbaplotR/reference/wnba_team_abbr_mapping.md)
(depending on the value of `league`). Non matches may be replaced with
`NA` (depending on the value of `keep_non_matches`).

## Examples

``` r
## NBA EXAMPLES ##
a <- c("ALT", "BKN", "BRK", "BROK", "UTAH", "UTA", "UTAA")

# keep non matches
nbaplotR::clean_team_abbrs(a)
#> [1] "ALT"  "BKN"  "BKN"  "BROK" "UTAH" "UTAH" "UTAA"

# replace non matches
nbaplotR::clean_team_abbrs(a, keep_non_matches = FALSE)
#> [1] NA     "BKN"  "BKN"  NA     "UTAH" "UTAH" NA    

## WNBA EXAMPLES ##
b <- c("ALT", "CHI", "DAL", "DALL", "PHX", "SEA")

# keep non matches
nbaplotR::clean_team_abbrs(b, league = "WNBA")
#> [1] "ALT"  "CHI"  "DAL"  "DALL" "PHX"  "SEA" 

# replace non matches
nbaplotR::clean_team_abbrs(b, league = "WNBA", keep_non_matches = FALSE)
#> [1] NA    "CHI" "DAL" NA    "PHX" "SEA"
```
