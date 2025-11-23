## code to prepare `build_internal_data` dataset goes here
teams_colors_logos <- hoopR::espn_nba_teams()

purrr::walk(teams_colors_logos$abbreviation, function(abbr){
  url <- teams_colors_logos$logo[teams_colors_logos$abbreviation == abbr]
  download.file(url, file.path("inst", "NBA", paste0(abbr, ".png")))
})

nba_primary_colors <- paste0("#", teams_colors_logos$color) |>
  rlang::set_names(teams_colors_logos$abbreviation)

nba_secondary_colors <- paste0("#", teams_colors_logos$alternate_color) |>
  rlang::set_names(teams_colors_logos$abbreviation)


# WNBA --------------------------------------------------------------------

wnba_teams <- wehoop::espn_wnba_teams()

purrr::walk(wnba_teams$abbreviation, function(abbr){
  url <- wnba_teams$logo[wnba_teams$abbreviation == abbr]
  # The file .../CON.png caused problems so we manually rename it to CONN here
  abbr <- ifelse(abbr == "CON", "CONN", abbr)
  download.file(url, file.path("inst", "WNBA", paste0(abbr, ".png")))
})

wnba_primary_colors <- paste0("#", wnba_teams$color) |>
  rlang::set_names(wnba_teams$abbreviation)

wnba_secondary_colors <- paste0("#", wnba_teams$alternate_color) |>
  rlang::set_names(wnba_teams$abbreviation)


# Write Data --------------------------------------------------------------

usethis::use_data(
  nba_primary_colors, nba_secondary_colors,
  wnba_primary_colors, wnba_secondary_colors,
  internal = TRUE, overwrite = TRUE
)
