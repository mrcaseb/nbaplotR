#' Output Valid NAB Team Abbreviations
#'
#' @description The abbreviations used in this function are extracted from ESPN
#'
#' @export
#' @return A vector of type `"character"`.
#' @examples
#' # List valid team abbreviations
#' valid_team_names()
valid_team_names <- function(){
  n <- sort(unique(nbaplotR::team_abbr_mapping))
  n
}


# Extracted from nflreadr and slightly modified

#' Standardize NBA Team Abbreviations
#'
#' This function standardizes NBA team abbreviations to ESPN defaults.
#'
#' @param abbr a character vector of abbreviations
#' @param keep_non_matches If `TRUE` (the default) an element of `abbr` that can't
#'   be matched to any of the internal mapping vectors will be kept as is. Otherwise
#'   it will be replaced with `NA`.
#'
#' @return A character vector with the length of `abbr` and cleaned team abbreviations
#'   if they are included in [`team_abbr_mapping`]. Non matches may be replaced
#'   with `NA` (depending on the value of `keep_non_matches`).
#' @export
#' @examples
#' x <- c("ALT", "BKN", "BRK", "BROK", "UTAH", "UTA", "UTAA")
#'
#' # keep non matches
#' nbaplotR::clean_team_abbrs(x)
#'
#' # replace non matches
#' nbaplotR::clean_team_abbrs(x, keep_non_matches = FALSE)
clean_team_abbrs <- function(abbr, keep_non_matches = TRUE) {
  stopifnot(is.character(abbr))

  m <- nbaplotR::team_abbr_mapping

  a <- unname(m[toupper(abbr)])

  if (any(is.na(a)) && getOption("nbaplotR.verbose", default = interactive())) {
    cli::cli_warn("Abbreviations not found in {.code nbaplotR::team_abbr_mapping}: {utils::head(abbr[is.na(a)], 10)}")
  }

  if (isTRUE(keep_non_matches)) a <- ifelse(!is.na(a), a, abbr)

  a
}
