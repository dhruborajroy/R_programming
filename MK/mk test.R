# Load required libraries
library(dplyr)
library(zyp)       # For Sen's slope
library(trend)     # For Mann-Kendall test

# Read the data
rainfall <- read.csv("rainfall.csv")

# Quick check
head(rainfall)


# Annual rainfall per station
annual_rainfall <- rainfall %>%
  group_by(Station, Year) %>%
  summarise(AnnualRain = sum(Rainfall, na.rm = TRUE))

rainfall <- rainfall %>%
  mutate(Season = case_when(
    Month %in% c(12, 1, 2) ~ "Winter",
    Month %in% c(3, 4, 5) ~ "Pre-Monsoon",
    Month %in% c(6, 7, 8, 9) ~ "Monsoon",
    Month %in% c(10, 11) ~ "Post-Monsoon"
  ))

seasonal_rainfall <- rainfall %>%
  group_by(Station, Year, Season) %>%
  summarise(SeasonRain = sum(Rainfall, na.rm = TRUE))

stations <- unique(rainfall$Station)

results_list <- list()

for (st in stations) {
  st_data <- annual_rainfall %>% filter(Station == st)
  mk_test <- mk.test(st_data$AnnualRain)          # Mann-Kendall test
  sen_slope <- zyp.sen(AnnualRain ~ Year, data = st_data)  # Sen's slope
  
  results_list[[st]] <- list(
    Station = st,
    mk_tau = mk_test$estimates[["tau"]],
    mk_pvalue = mk_test$p.value,
    sen_slope = sen_slope$coefficients[2]
  )
}

# Convert to dataframe
results_df <- do.call(rbind, lapply(results_list, as.data.frame))
results_df

# Export dataframe to CSV
write.csv(results_df, file = "sen-slope.csv", row.names = FALSE)

################################## plot######################
library(ggplot2)

annual_rainfall %>% 
  filter(Station=="Barisal") %>% 
  ggplot( aes(x = Year, y = AnnualRain, color = Station)) +
  geom_line(size = 1) +
  geom_smooth(method = "lm", se = FALSE) +
  theme_bw() +
  labs(title = "Annual Rainfall Trends in station",
       x = "Year", y = "Annual Rainfall (mm)")




################################# Sequential Mann-Kendal test (SQ-MK)

library(trendchange)



barishal_annual_rainfall<- annual_rainfall %>% 
  filter(Station=="CoxsBazar") 
  
attach(barishal_annual_rainfall)

barishal_annual_rainfall  

sqmk(AnnualRain,1970)

sqmk(barishal_annual_rainfall$AnnualRain, barishal_annual_rainfall$Year)
unique(annual_rainfall$Station)

####################ggplot##########
library(ggplot2)

ggplot(barishal_annual_rainfall, aes(x = Year, y = AnnualRain)) +
  geom_col(fill = "steelblue") +
  theme_minimal() +
  labs(title = "Annual Rainfall at Chandpur",
       x = "Year",
       y = "Annual Rainfall (mm)")


################################# End Sequential Mann-Kendal test (SQ-MK)

library(ggplot2)

# Example data (replace with your real MK Tau/Z values)
mk_data <- data.frame(
  Month = results_df$Station,
  MK_Z = results_df$mk_tau)  
)
head(mk_data)
mk_data

# Bar chart like your image
ggplot(mk_data, aes(x = Month, y = MK_Z)) +
  geom_bar(stat = "identity", fill = "orange") +
  theme_minimal() +
  labs(title = "Mann-Kendall Trends",
       x = "",
       y = "Mann-Kendall (Z)") +
  theme(text = element_text(size=12))
