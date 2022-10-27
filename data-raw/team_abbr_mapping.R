teams_colors_logos <- hoopR::espn_nba_teams()

team_abbr_mapping <-
  tibble::tibble(
    alt = teams_colors_logos$abbreviation,
    team = teams_colors_logos$abbreviation
  ) |>
  dplyr::bind_rows(
    # abbreviations as used by basketball reference
    # thanks to Ethan Peterson
    tibble::tribble(
      ~team, ~alt,
      "BKN", "BRK",
      "CHA", "CHO",
      "GS", "GSW",
      "NO", "NOP",
      "NY", "NYK",
      "PHX", "PHO",
      "SA", "SAS",
      "UTAH", "UTA",
      "WSH", "WAS"
    )
  ) |>
  dplyr::arrange(team) |>
  tibble::deframe()

usethis::use_data(team_abbr_mapping, overwrite = TRUE)
