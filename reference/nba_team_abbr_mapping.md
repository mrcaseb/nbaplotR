# Alternate NBA Team Abbreviation Mapping

A named character vector mapping common alternate team abbreviations.

## Usage

``` r
nba_team_abbr_mapping
```

## Format

A named character vector

- name attribute:

  The "alternate" name.

- value attribute:

  The "correct" name.

## Details

You can suggest additions to this table by [opening an issue in
nbaplotR](https://github.com/mrcaseb/nbaplotR/issues/new/choose).

## Examples

``` r
# \donttest{
nba_team_abbr_mapping[c("BRK", "GSW", "PHO")]
#>   BRK   GSW   PHO 
#> "BKN"  "GS" "PHX" 
# }
```
