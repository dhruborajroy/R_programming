library(dplyr)
library(ggplot2)
library(Kendall)
library(trend)

# Load CSV (replace path with your file)
df <- read.csv(choose.files())

# Quick check
head(df)

#Step 2: Aggregate to Annual Totals per Station
annual_rain <- df %>%
  group_by(Year, Station) %>%
  summarise(AnnualRain = sum(Rainfall, na.rm = TRUE), .groups="drop")

# Step 3: Station-Wise Trend Analysis
trend_results <- annual_rain %>%
  group_by(Station) %>%
  summarise(
    mk = list(MannKendall(AnnualRain)),
    sen = list(sens.slope(AnnualRain)),
    .groups="drop"
  ) %>%
  mutate(
    tau = sapply(mk, function(x) x$tau),
    p_value = sapply(mk, function(x) x$sl),
    slope = sapply(sen, function(x) x$estimates)
  ) %>%
  select(Station, tau, p_value, slope)


# Step 4: Output Table
print(trend_results)

# Step 5: Visualization
ggplot(annual_rain, aes(x=Year, y=AnnualRain, color=Station)) +
  geom_line(linewidth=1) +
  geom_point() +
  geom_smooth(method="lm", se=FALSE, linetype="dashed") +
  theme_bw() +
  labs(title="Annual Rainfall Trends in Southern Bangladesh",
       x="Year", y="Annual Rainfall (mm)")


