library(tidyverse)



# 2. Load your rainfall CSV file
rain_data <- read.csv("rainfall1_old.csv")  # Replace with your actual file path
head(rain_data)

library(openxlsx)

years_by_station <- rain_data %>%
  group_by(Station) %>%
  summarise(years = paste(sort(unique(Year)), collapse = ", "), .groups = "drop")

write.csv(years_by_station, "years_by_station.csv")

