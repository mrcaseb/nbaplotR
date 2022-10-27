## code to prepare `build_internal_data` dataset goes here
teams_colors_logos <- hoopR::espn_nba_teams()

purrr::walk(teams_colors_logos$abbreviation, function(abbr){
  url <- teams_colors_logos$logo[teams_colors_logos$abbreviation == abbr]
  download.file(url, file.path("inst", paste0(abbr, ".png")))
})

primary_colors <- teams_colors_logos$color |>
  rlang::set_names(teams_colors_logos$abbreviation)

secondary_colors <- teams_colors_logos$alternate_color |>
  rlang::set_names(teams_colors_logos$abbreviation)

usethis::use_data(
  primary_colors, secondary_colors,
  internal = TRUE, overwrite = TRUE
)