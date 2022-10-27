#' Alternate Team Abbreviation Mappings
#'
#' A named character vector mapping common alternate team abbreviations.
#'
#' You can suggest additions to this table by
#' [opening an issue in nbaplotR](https://github.com/mrcaseb/nbaplotR/issues/new/choose).
#'
#' @examples
#' \donttest{
#' team_abbr_mapping[c("BRK", "GSW", "PHO")]
#' }
#'
#' @format A named character vector
#' \describe{
#'   \item{name attribute}{The "alternate" name.}
#'   \item{value attribute}{The "correct" name.}
#' }
"team_abbr_mapping"
