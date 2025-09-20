library(dplyr)
library(tidyr)
library(trend)
library(Kendall)
library(zyp)

rain_data <- read.csv("organized_data.csv") 

# 2. Pivot the seasonal columns into long format
rain_long <- rain_data %>%
  pivot_longer(
    cols = c("Annual", "post_monsoon", "winter", "pre_monsoon", "monsoon"),
    names_to = "Season",
    values_to = "SeasonalRainfall"
  )

analyze_trend <- function(df) {
  if (nrow(df) < 10 || length(unique(df$SeasonalRainfall)) < 2) return(NULL)
  df <- df[order(df$Year), ]
  mk <- Kendall::MannKendall(df$SeasonalRainfall)
  sen <- tryCatch({
    ss <- zyp::zyp.sen(SeasonalRainfall ~ Year, data = df)
    slope <- round(ss$coefficients["Year"], 2)
    slope
  }, error = function(e) { NA })
  data.frame(
    Kendall_tau = round(mk$tau[1], 3),
    Kendall_S = round(mk$S[1], 2),
    p_value = round(mk$sl[1], 3),
    Sens_slope = sen
  )
}



# 2. Pivot the seasonal columns into long format
rain_long <- rain_data %>%
  pivot_longer(
    cols = c("pre_monsoon"),
    names_to = "Season",
    values_to = "SeasonalRainfall"
  )


trend_results <- rain_long %>%
  group_by(Station, Season) %>%
  arrange(Year) %>%
  group_modify(~analyze_trend(.x)) %>%
  ungroup()

print(trend_results)
write.csv(trend_results, "pre_monsoon.csv", row.names = FALSE)
