#' Scales for NBA & WNBA Team Colors
#'
#' @description These functions map NBA/WNBA team names to their team colors in
#'   color and fill aesthetics
#' @inheritParams ggplot2::scale_fill_manual
#' @param type One of `"primary"` or `"secondary"` to decide which color type to use.
#' @param values If `NULL` (the default) use the internal team color vectors. Otherwise
#'   a set of aesthetic values to map data values to. The values
#'   will be matched in order (usually alphabetical) with the limits of the
#'   scale, or with `breaks` if provided. If this is a named vector, then the
#'   values will be matched based on the names instead. Data values that don't
#'   match will be given `na.value`.
#' @param guide A function used to create a guide or its name. If `NULL` (the default)
#'   no guide will be plotted for this scale. See [ggplot2::guides()] for more information.
#' @param alpha Factor to modify color transparency via a call to [`scales::alpha()`].
#'   If `NA` (the default) no transparency will be applied. Can also be a vector of
#'   alphas. All alpha levels must be in range `[0,1]`.
#' @name scale_nba
#' @seealso The theme elements [element_nba_logo()] and [element_wnba_logo()] to
#'   replace axis text labels with logos.
#' @aliases NULL
#' @examples
#' \donttest{
#' library(nbaplotR)
#' library(ggplot2)
#'
#' ######## NBA ########
#'
#' team_abbr <- valid_team_names("NBA")
#'
#' df <- data.frame(
#'   random_value = runif(length(team_abbr), 0, 1),
#'   teams = team_abbr
#' )
#' ggplot(df, aes(x = teams, y = random_value)) +
#'   geom_col(aes(color = teams, fill = teams), width = 0.5) +
#'   scale_color_nba(type = "secondary") +
#'   scale_fill_nba(alpha = 0.4) +
#'   theme_minimal() +
#'   theme(axis.text.x = element_text(angle = 45, hjust = 1))
#'
#'
#' ######## WNBA ########
#'
#' team_abbr <- valid_team_names("WNBA")
#'
#' df <- data.frame(
#'   random_value = runif(length(team_abbr), 0, 1),
#'   teams = team_abbr
#' )
#' ggplot(df, aes(x = teams, y = random_value)) +
#'   geom_col(aes(color = teams, fill = teams), width = 0.5) +
#'   scale_color_wnba(type = "secondary") +
#'   scale_fill_wnba(alpha = 0.4) +
#'   theme_minimal() +
#'   theme(axis.text.x = element_text(angle = 45, hjust = 1))
#' }
NULL


# NBA ---------------------------------------------------------------------

#' @rdname scale_nba
#' @export
scale_color_nba <- function(type = c("primary", "secondary"),
                            values = NULL,
                            ...,
                            aesthetics = "colour",
                            breaks = ggplot2::waiver(),
                            na.value = "grey50",
                            guide = NULL,
                            alpha = NA) {

  type <- rlang::arg_match0(type, c("primary", "secondary"))

  if(is.null(values)){
    values <- switch(type,
      "primary"   = nba_primary_colors,
      "secondary" = nba_secondary_colors
    )
  }

  if(!is.na(alpha)) values <- scales::alpha(values, alpha = alpha)

  ggplot2::scale_color_manual(
    ...,
    values = values,
    aesthetics = aesthetics,
    breaks = breaks,
    na.value = na.value,
    guide = guide
  )
}

#' @rdname scale_nba
#' @export
scale_colour_nba <- scale_color_nba


#' @rdname scale_nba
#' @export
scale_fill_nba <- function(type = c("primary", "secondary"),
                           values = NULL,
                           ...,
                           aesthetics = "fill",
                           breaks = ggplot2::waiver(),
                           na.value = "grey50",
                           guide = NULL,
                           alpha = NA) {

  type <- rlang::arg_match0(type, c("primary", "secondary"))

  if(is.null(values)){
    values <- switch(type,
      "primary"   = nba_primary_colors,
      "secondary" = nba_secondary_colors
    )
  }

  if(!is.na(alpha)) values <- scales::alpha(values, alpha = alpha)

  ggplot2::scale_fill_manual(
    ...,
    values = values,
    aesthetics = aesthetics,
    breaks = breaks,
    na.value = na.value,
    guide = guide
  )
}


# WNBA --------------------------------------------------------------------

#' @rdname scale_nba
#' @export
scale_color_wnba <- function(type = c("primary", "secondary"),
                             values = NULL,
                             ...,
                             aesthetics = "colour",
                             breaks = ggplot2::waiver(),
                             na.value = "grey50",
                             guide = NULL,
                             alpha = NA) {

  type <- rlang::arg_match0(type, c("primary", "secondary"))

  if(is.null(values)){
    values <- switch(type,
      "primary"   = wnba_primary_colors,
      "secondary" = wnba_secondary_colors
    )
  }

  if(!is.na(alpha)) values <- scales::alpha(values, alpha = alpha)

  ggplot2::scale_color_manual(
    ...,
    values = values,
    aesthetics = aesthetics,
    breaks = breaks,
    na.value = na.value,
    guide = guide
  )
}

#' @rdname scale_nba
#' @export
scale_colour_wnba <- scale_color_wnba


#' @rdname scale_nba
#' @export
scale_fill_wnba <- function(type = c("primary", "secondary"),
                            values = NULL,
                            ...,
                            aesthetics = "fill",
                            breaks = ggplot2::waiver(),
                            na.value = "grey50",
                            guide = NULL,
                            alpha = NA) {

  type <- rlang::arg_match0(type, c("primary", "secondary"))

  if(is.null(values)){
    values <- switch(type,
      "primary"   = wnba_primary_colors,
      "secondary" = wnba_secondary_colors
    )
  }

  if(!is.na(alpha)) values <- scales::alpha(values, alpha = alpha)

  ggplot2::scale_fill_manual(
    ...,
    values = values,
    aesthetics = aesthetics,
    breaks = breaks,
    na.value = na.value,
    guide = guide
  )
}
