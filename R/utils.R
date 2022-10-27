#' Output Valid NBA or WNBA Team Abbreviations
#'
#' @description The abbreviations used in this function are extracted from ESPN
#'
#' @param league One of `"NBA"` or `"WNBA"`
#' @export
#' @return A vector of type `"character"`.
#' @examples
#' # List valid NBA team abbreviations
#' valid_team_names("NBA")
#'
#' # List valid WNBA team abbreviations
#' valid_team_names("WNBA")
valid_team_names <- function(league = c("NBA", "WNBA")){
  league <- rlang::arg_match0(league, c("NBA", "WNBA"))
  map <- switch (league,
    "NBA" = nbaplotR::nba_team_abbr_mapping,
    "WNBA" = nbaplotR::wnba_team_abbr_mapping
  )
  n <- sort(unique(map))
  n
}


# Extracted from nflreadr and slightly modified

#' Standardize NBA/WNBA Team Abbreviations
#'
#' This function standardizes NBA/WNBA team abbreviations to ESPN defaults.
#'
#' @param abbr a character vector of abbreviations
#' @param league One of `"NBA"` or `"WNBA"`
#' @param keep_non_matches If `TRUE` (the default) an element of `abbr` that can't
#'   be matched to any of the internal mapping vectors will be kept as is. Otherwise
#'   it will be replaced with `NA`.
#'
#' @return A character vector with the length of `abbr` and cleaned team abbreviations
#'   if they are included in [`nba_team_abbr_mapping`] or [`wnba_team_abbr_mapping`]
#'   (depending on the value of `league`). Non matches may be replaced
#'   with `NA` (depending on the value of `keep_non_matches`).
#' @export
#' @examples
#' ## NBA EXAMPLES ##
#' a <- c("ALT", "BKN", "BRK", "BROK", "UTAH", "UTA", "UTAA")
#'
#' # keep non matches
#' nbaplotR::clean_team_abbrs(a)
#'
#' # replace non matches
#' nbaplotR::clean_team_abbrs(a, keep_non_matches = FALSE)
#'
#' ## WNBA EXAMPLES ##
#' b <- c("ALT", "CHI", "DAL", "DALL", "PHX", "SEA")
#'
#' # keep non matches
#' nbaplotR::clean_team_abbrs(b, league = "WNBA")
#'
#' # replace non matches
#' nbaplotR::clean_team_abbrs(b, league = "WNBA", keep_non_matches = FALSE)
clean_team_abbrs <- function(abbr,
                             league = c("NBA", "WNBA"),
                             keep_non_matches = TRUE) {
  stopifnot(is.character(abbr))
  league <- rlang::arg_match0(league, c("NBA", "WNBA"))

  m <- switch (league,
               "NBA" = nbaplotR::nba_team_abbr_mapping,
               "WNBA" = nbaplotR::wnba_team_abbr_mapping
  )

  a <- unname(m[toupper(abbr)])

  if (any(is.na(a)) && getOption("nbaplotR.verbose", default = interactive())) {
    map <- switch (league,
                   "NBA" = "nbaplotR::nba_team_abbr_mapping",
                   "WNBA" = "nbaplotR::wnba_team_abbr_mapping"
    )
    cli::cli_warn("Abbreviations not found in {.code {map}}: {utils::head(abbr[is.na(a)], 10)}")
  }

  if (isTRUE(keep_non_matches)) a <- ifelse(!is.na(a), a, abbr)

  a
}
