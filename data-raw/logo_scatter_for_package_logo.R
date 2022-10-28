library(hexSticker)
library(ggplot2)
library(nbaplotR)

nba_team_abbr <- valid_team_names("NBA")
wnba_team_abbr <- valid_team_names("WNBA")

df <- data.frame(
  a = rep(1:7, 6),
  b = sort(rep(1:6, 7), decreasing = TRUE),
  nba = c(nba_team_abbr, rep(NA, 12)),
  wnba = c(rep(NA, 30), wnba_team_abbr)
)

p <- ggplot(df, aes(x = a, y = b)) +
  geom_nba_logos(aes(team_abbr = nba), width = 0.09, alpha = 0.2) +
  geom_wnba_logos(aes(team_abbr = wnba), width = 0.09, alpha = 0.2) +
  coord_cartesian(xlim = c(0.5,7.5), ylim = c(0.5,6.5)) +
  theme_void() +
  theme_transparent()

sticker(
  p,
  package = "",
  p_family = "Kanit",
  # p_fontface = "regular",
  p_y = 0.6,
  p_size = 20,
  s_x = 1,
  s_y = 1,
  s_width = 1.9,
  s_height = 1.2,
  spotlight = TRUE,
  l_y = 1.75,
  l_alpha = 0.2,
  l_width = 5,
  h_fill = "#222222",
  h_color = "black",
  h_size = 0.8,
  filename = "data-raw/logo_2.svg",
  u_color = "white",
  u_size = 5,
  dpi = 600
)
