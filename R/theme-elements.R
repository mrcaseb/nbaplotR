#' Theme Elements for Image Grobs
#'
#' @description
#' In conjunction with the [ggplot2::theme] system, the following `element_`
#' functions enable images in non-data components of the plot, e.g. axis text.
#'
#'   - `element_nba_logo()`: draws NBA team logos instead of their abbreviations.
#'   - `element_wnba_logo()`: draws WNBA team logos instead of their abbreviations.
#'
#' @details The elements translate NBA/WNBA team abbreviations into logo images.
#' @inheritParams ggpath::element_path
#'
#' @seealso [geom_nba_logos()], [geom_wnba_logos()], and [ggpath::element_path()]
#'   for more information on valid team abbreviations, and other parameters.
#' @return An S3 object of class `element`.
#' @examples
#' \donttest{
#' library(nbaplotR)
#' library(ggplot2)
#'
#' ######## NBA Examples ########
#'
#' team_abbr <- valid_team_names("NBA")
#'
#' df <- data.frame(
#'   random_value = runif(length(team_abbr), 0, 1),
#'   team = team_abbr
#' )
#'
#' # use logos for x-axis
#' ggplot(df, aes(x = team, y = random_value)) +
#'   geom_col(aes(color = team, fill = team), width = 0.5) +
#'   scale_color_nba(type = "secondary") +
#'   scale_fill_nba(alpha = 0.4) +
#'   theme_minimal() +
#'   theme(axis.text.x = element_nba_logo())
#'
#' # use logos for y-axis
#' ggplot(df, aes(y = team, x = random_value)) +
#'   geom_col(aes(color = team, fill = team), width = 0.5) +
#'   scale_color_nba(type = "secondary") +
#'   scale_fill_nba(alpha = 0.4) +
#'   theme_minimal() +
#'   theme(axis.text.y = element_nba_logo())
#'
#' ######## WNBA Examples ########
#'
#' team_abbr <- valid_team_names("WNBA")
#'
#' df <- data.frame(
#'   random_value = runif(length(team_abbr), 0, 1),
#'   team = team_abbr
#' )
#'
#' # use logos for x-axis
#' ggplot(df, aes(x = team, y = random_value)) +
#'   geom_col(aes(color = team, fill = team), width = 0.5) +
#'   scale_color_wnba(type = "secondary") +
#'   scale_fill_wnba(alpha = 0.4) +
#'   theme_minimal() +
#'   theme(axis.text.x = element_wnba_logo())
#'
#' # use logos for y-axis
#' ggplot(df, aes(y = team, x = random_value)) +
#'   geom_col(aes(color = team, fill = team), width = 0.5) +
#'   scale_color_wnba(type = "secondary") +
#'   scale_fill_wnba(alpha = 0.4) +
#'   theme_minimal() +
#'   theme(axis.text.y = element_wnba_logo())
#' }
#' @name element
#' @aliases NULL
NULL


# Elements ----------------------------------------------------------------

#' @export
#' @rdname element
element_nba_logo <- function(alpha = NULL, colour = NA, hjust = NULL, vjust = NULL,
                             color = NULL, size = 0.5) {
  if (!is.null(color))  colour <- color
  structure(
    list(alpha = alpha, colour = colour, hjust = hjust, vjust = vjust, size = size),
    class = c("element_nba_logo", "element_text", "element")
  )
}

#' @export
#' @rdname element
element_wnba_logo <- function(alpha = NULL, colour = NA, hjust = NULL, vjust = NULL,
                              color = NULL, size = 0.5) {
  if (!is.null(color))  colour <- color
  structure(
    list(alpha = alpha, colour = colour, hjust = hjust, vjust = vjust, size = size),
    class = c("element_wnba_logo", "element_text", "element")
  )
}


# Methods -----------------------------------------------------------------

# This S3 method is just a wrapper of the ggpath theme element method.
# It translates the labels (which are team abbreviations) to local paths
# and passes those paths to ggpath
#' @export
element_grob.element_nba_logo <- function(element, label = "", x = NULL, y = NULL,
                                          alpha = NULL, colour = NULL,
                                          hjust = 0.5, vjust = 0.5,
                                          size = NULL, ...) {

  if (is.null(label)) return(ggplot2::zeroGrob())

  # Standardize team abbreviations and translate them to local paths
  team_abbr <- clean_team_abbrs(label, league = "NBA", keep_non_matches = FALSE)
  label <- logo_from_abbr(team_abbr, league = "NBA")

  # We want ggpath to do the actual work, so we change the class here to make
  # ggplot2 call the S3 method of ggpath
  class(element) <- c("element_path", "element_text", "element")

  ggplot2::element_grob(
    element = element,
    label = label,
    x = x,
    y = y,
    alpha = alpha,
    colour = colour,
    hjust = hjust,
    vjust = vjust,
    size = size,
    ...
  )
}

# This S3 method is just a wrapper of the ggpath theme element method.
# It translates the labels (which are team abbreviations) to local paths
# and passes those paths to ggpath
#' @export
element_grob.element_wnba_logo <- function(element, label = "", x = NULL, y = NULL,
                                           alpha = NULL, colour = NULL,
                                           hjust = 0.5, vjust = 0.5,
                                           size = NULL, ...) {

  if (is.null(label)) return(ggplot2::zeroGrob())

  # Standardize team abbreviations and translate them to local paths
  team_abbr <- clean_team_abbrs(label, league = "WNBA", keep_non_matches = FALSE)
  label <- logo_from_abbr(team_abbr, league = "WNBA")

  # We want ggpath to do the actual work, so we change the class here to make
  # ggplot2 call the S3 method of ggpath
  class(element) <- c("element_path", "element_text", "element")

  ggplot2::element_grob(
    element = element,
    label = label,
    x = x,
    y = y,
    alpha = alpha,
    colour = colour,
    hjust = hjust,
    vjust = vjust,
    size = size,
    ...
  )
}
