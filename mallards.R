library(tidyverse)
lubridate::ymd_hms

mallards <- read_csv("data/mallards.csv") |>
  mutate(
    timestamp = ymd_hms(timestamp),
    month = month(timestamp, label = TRUE),
    month_num = month(timestamp),
    year = year(timestamp),
    season = case_when(
      month_num %in% 3:5 ~ "Spring",
      month_num %in% 6:8 ~ "Summer",
      month_num %in% 9:11 ~ "Autumn",
      month_num %in% c(12, 1, 2) ~ "Winter"
    ),
    season = factor(season, levels = c("Spring", "Summer", "Autumn", "Winter"), ordered = TRUE)
  )

saveRDS(mallards, "data/mallards.rds")
