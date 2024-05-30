#' Render NBA Logos in 'gt' Tables
#'
#' @description Translate team abbreviations into logos and
#'   render these images in html tables with the 'gt' package.
#' @param gt_object A table object that is created using the [gt::gt()] function.
#' @param columns The columns for which the image translation should be applied.
#'   Argument has no effect if `locations` is not `NULL`.
#' @param ... Currently not in use
#' @param height The absolute height (px) of the image in the table cell.
#' @param locations If `NULL` (the default), the function will render
#'   logos in argument `columns`.
#'   Otherwise, the cell or set of cells to be associated with the team name
#'   transformation. Only the [gt::cells_body()], [gt::cells_stub()],
#'   [gt::cells_column_labels()], and [gt::cells_row_groups()] helper functions
#'   can be used here. We can enclose several of these calls within a `list()`
#'   if we wish to make the transformation happen at different locations.
#'
#' @return An object of class `gt_tbl`.
#' @export
#' @section Output of below example:
#' \if{html}{\figure{logo_tbl_nba.png}{options: width=75\%}}
#' @examples
#' \donttest{
#' teams <- nbaplotR::valid_team_names("NBA")
#' df <- data.frame(
#'   team_a = teams[1:6],
#'   logo_a = teams[1:6],
#'   team_b = teams[7:12],
#'   logo_b = teams[7:12],
#'   team_c = teams[13:18],
#'   logo_c = teams[13:18],
#'   team_d = teams[19:24],
#'   logo_d = teams[19:24],
#'   team_e = teams[25:30],
#'   logo_e = teams[25:30]
#' )
#' # create gt table and translate team names to logos
#' table <- df |>
#'   gt::gt() |>
#'   nbaplotR::gt_nba_logos(columns = gt::starts_with("logo")) |>
#'   gt::cols_label(
#'     gt::starts_with("team") ~ "TEAM",
#'     gt::starts_with("logo") ~ "LOGO"
#'   ) |>
#'   gt::tab_style(
#'     style = gt::cell_borders(side = "left"),
#'     locations = list(
#'       gt::cells_body(columns = gt::starts_with("team")),
#'       gt::cells_column_labels(columns = gt::starts_with("team"))
#'     )
#'   )
#' }
gt_nba_logos <- function(gt_object,
                         columns,
                         ...,
                         height = 30,
                         locations = NULL){
  gt_nba_image(
    gt_object = gt_object,
    columns = {{ columns }},
    height = height,
    locations = locations,
    league = "NBA"
  )
}

#' Render WNBA Logos in 'gt' Tables
#' @inherit gt_nba_logos
#' @export
#' @section Output of below example:
#' \if{html}{\figure{logo_tbl_wnba.png}{options: width=75\%}}
#' @examples
#' \donttest{
#' teams <- nbaplotR::valid_team_names("WNBA")
#' df <- data.frame(
#'   team_a = teams[1:6],
#'   logo_a = teams[1:6],
#'   team_b = teams[7:12],
#'   logo_b = teams[7:12]
#' )
#' # create gt table and translate team names to logos
#' table <- df |>
#'   gt::gt() |>
#'   nbaplotR::gt_wnba_logos(columns = gt::starts_with("logo")) |>
#'   gt::cols_label(
#'     gt::starts_with("team") ~ "TEAM",
#'     gt::starts_with("logo") ~ "LOGO"
#'   ) |>
#'   gt::tab_style(
#'     style = gt::cell_borders(side = "left"),
#'     locations = list(
#'       gt::cells_body(columns = "team_b"),
#'       gt::cells_column_labels(columns = "team_b")
#'     )
#'   )
#' }
gt_wnba_logos <- function(gt_object,
                          columns,
                          ...,
                          height = 30,
                          locations = NULL){
  gt_nba_image(
    gt_object = gt_object,
    columns = {{ columns }},
    height = height,
    locations = locations,
    league = "WNBA"
  )
}

#' Render Logos in 'gt' Table Column Labels
#'
#' @description Translate NBA/WNBA team abbreviations into logos and render
#' these images in column labels of 'gt' tables.
#'
#' @inheritParams gt_nba_logos
#' @param ... Currently not in use
#' @param league One of `"NBA"`, `"WNBA"`
#' @return An object of class `gt_tbl`.
#' @seealso The logo rendering functions [gt_nba_logos()] and [gt_wnba_logos()].
#' @section Output of below example:
#' \if{html}{\figure{cols_label.png}{options: width=75\%}}
#' @export
#' @examples
#' \donttest{
#' label_df <- data.frame(
#'   "ATL" = c("ATL", "NBA"),
#'   "CHI" = c("CHI", "NBA"),
#'   "DAL" = c("DAL", "WNBA"),
#'   "IND" = c("IND", "WNBA")
#' )
#' # create gt table and translate player IDs and team abbreviations
#' # into headshots, logos, and wordmarks
#' table <- gt::gt(label_df) |>
#'   nbaplotR::gt_nba_cols_label(columns = c("ATL", "CHI"), league = "NBA") |>
#'   nbaplotR::gt_nba_cols_label(columns = c("DAL", "IND"), league = "WNBA")
#' }
gt_nba_cols_label <- function(gt_object,
                              columns = gt::everything(),
                              ...,
                              height = 30,
                              league = c("NBA", "WNBA")){

  league <- rlang::arg_match(league)

  gt::cols_label_with(
    data = gt_object,
    columns = {{ columns }},
    fn = function(x){
      # x is a scalar becasue gt loops over cols labels!
      team_abbr <- clean_team_abbrs(as.character(x), league = league, keep_non_matches = TRUE)
      img_file <- logo_from_abbr(team_abbr, league = league)
      present <- file.exists(img_file)
      if (!present) return(x)
      out <- gt::local_image(img_file, height = height)
      gt::html(out)
    }
  )
}

gt_nba_image <- function(gt_object,
                         columns,
                         height = 30,
                         locations = NULL,
                         league = c("NBA", "WNBA")){

  league <- match.arg(league)

  if(is.null(locations)){
    locations <- gt::cells_body({{ columns }})
  }

  gt::text_transform(
    data = gt_object,
    locations = locations,
    fn = function(x){
      team_abbr <- clean_team_abbrs(as.character(x), league = league, keep_non_matches = TRUE)
      img_files <- logo_from_abbr(team_abbr, league = league)
      present <- file.exists(img_files)
      out <- lapply(img_files, function(i, height){
        gt::html(gt::local_image(i, height = height))
      }, height = height)
      # If the image file doesn't exist, we will return the
      # actual value to allow the user to call gt::sub_missing()
      out[!present] <- x[!present]
      out
    }
  )
}
