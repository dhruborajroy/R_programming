# ------------------------------------------------------
# Full R Script: Generator for Annual Trend Analysis
# ------------------------------------------------------

# 1. Load required packages
# Install these if you haven't already
# install.packages(c("dplyr", "readr", "trend", "tidyr", "Kendall"))

library(dplyr)
library(readr)
library(trend)     # For sens.slope
library(tidyr)
library(Kendall)   # For mk.test
library(zyp)
# ------------------------------------------------------

# 2. Load your rainfall CSV file
rain_data <- read.csv("rainfall.csv")  # Replace with your actual file path

# ------------------------------------------------------

# 3. Define seasons based on months
rain_data <- rain_data %>%
  mutate(Season = case_when(
    Month %in% c(12, 1, 2) ~ "Winter",
    Month %in% c(3, 4, 5) ~ "Pre-monsoon",
    Month %in% c(6, 7, 8, 9) ~ "Monsoon",
    Month %in% c(10, 11) ~ "Postmonsoon"
  ))

# ------------------------------------------------------

# 4. Aggregate rainfall by Station-Year-Season
seasonal_rain <- rain_data %>%
  group_by(Station, Year, Season) %>%
  summarise(SeasonalRainfall = sum(Rainfall, na.rm = TRUE), .groups = 'drop')
seasonal_rain
# 5. Calculate annual rainfall
annual_rain <- rain_data %>%
  filter(Station=="Barisal") %>% 
  group_by(Station, Year) %>%
  summarise(Season = "Annual", SeasonalRainfall = sum(Rainfall, na.rm = TRUE), .groups = 'drop')
table(annual_rain)


write.csv(cbind(annual_rain), "Barishal.csv")

write.csv(annual_rain, "annual_rain_results.csv", row.names = FALSE)
