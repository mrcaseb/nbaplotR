% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{clean_team_abbrs}
\alias{clean_team_abbrs}
\title{Standardize NBA/WNBA Team Abbreviations}
\usage{
clean_team_abbrs(abbr, league = c("NBA", "WNBA"), keep_non_matches = TRUE)
}
\arguments{
\item{abbr}{a character vector of abbreviations}

\item{league}{One of \code{"NBA"} or \code{"WNBA"}}

\item{keep_non_matches}{If \code{TRUE} (the default) an element of \code{abbr} that can't
be matched to any of the internal mapping vectors will be kept as is. Otherwise
it will be replaced with \code{NA}.}
}
\value{
A character vector with the length of \code{abbr} and cleaned team abbreviations
if they are included in \code{\link{nba_team_abbr_mapping}} or \code{\link{wnba_team_abbr_mapping}}
(depending on the value of \code{league}). Non matches may be replaced
with \code{NA} (depending on the value of \code{keep_non_matches}).
}
\description{
This function standardizes NBA/WNBA team abbreviations to ESPN defaults.
}
\examples{
## NBA EXAMPLES ##
a <- c("ALT", "BKN", "BRK", "BROK", "UTAH", "UTA", "UTAA")

# keep non matches
nbaplotR::clean_team_abbrs(a)

# replace non matches
nbaplotR::clean_team_abbrs(a, keep_non_matches = FALSE)

## WNBA EXAMPLES ##
b <- c("ALT", "CHI", "DAL", "DALL", "PHX", "SEA")

# keep non matches
nbaplotR::clean_team_abbrs(b, league = "WNBA")

# replace non matches
nbaplotR::clean_team_abbrs(b, league = "WNBA", keep_non_matches = FALSE)
}
