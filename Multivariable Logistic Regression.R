# Load necessary packages
library(tidyverse)      # For data manipulation and visualization
library(carData)        # For TitanicSurvival dataset
library(mgcv)           # For GAM modeling
library(performance)    # For model diagnostics

theme_set(theme_bw())   # Beautifies plots

# Get the data
d <- carData::TitanicSurvival %>% 
  filter(!is.na(age))

glimpse(d)

# Build the GLM model
m <- glm(formula=survived ~ sex + age + passengerClass,
         data = d,
         family = binomial)

# Check non-linearity with GAM
m1 <- gam(survived ~ sex + s(age) + passengerClass,
          data = d,
          family = binomial)

plot(m1)

# Check all model assumptions
check_model(m)
