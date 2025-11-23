
# NBA ---------------------------------------------------------------------

nba_teams_colors_logos <- hoopR::espn_nba_teams()

nba_team_abbr_mapping <-
  tibble::tibble(
    alt = nba_teams_colors_logos$abbreviation,
    team = nba_teams_colors_logos$abbreviation
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

usethis::use_data(nba_team_abbr_mapping, overwrite = TRUE)


# WNBA --------------------------------------------------------------------

wnba_teams_colors_logos <- wehoop::espn_wnba_teams()

wnba_team_abbr_mapping <-
  tibble::tibble(
    alt = wnba_teams_colors_logos$abbreviation,
    team = wnba_teams_colors_logos$abbreviation
  ) |>
  dplyr::bind_rows(
    tibble::tribble(
      ~team, ~alt,
      "CON", "CONN"
    )
  ) |>
  dplyr::arrange(team) |>
  tibble::deframe()

usethis::use_data(wnba_team_abbr_mapping, overwrite = TRUE)
