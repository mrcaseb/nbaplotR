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
  n <- sort(names(primary_colors))
  n
}
