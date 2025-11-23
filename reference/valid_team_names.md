# Output Valid NBA or WNBA Team Abbreviations

The abbreviations used in this function are extracted from ESPN

## Usage

``` r
valid_team_names(league = c("NBA", "WNBA"))
```

## Arguments

- league:

  One of `"NBA"` or `"WNBA"`

## Value

A vector of type `"character"`.

## Examples

``` r
# List valid NBA team abbreviations
valid_team_names("NBA")
#>  [1] "ATL"  "BKN"  "BOS"  "CHA"  "CHI"  "CLE"  "DAL"  "DEN"  "DET"  "GS"  
#> [11] "HOU"  "IND"  "LAC"  "LAL"  "MEM"  "MIA"  "MIL"  "MIN"  "NO"   "NY"  
#> [21] "OKC"  "ORL"  "PHI"  "PHX"  "POR"  "SA"   "SAC"  "TOR"  "UTAH" "WSH" 

# List valid WNBA team abbreviations
valid_team_names("WNBA")
#>  [1] "ATL" "CHI" "CON" "DAL" "GS"  "IND" "LA"  "LV"  "MIN" "NY"  "PHX" "SEA"
#> [13] "WSH"
```
