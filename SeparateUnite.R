library(tidyverse)
library(gapminder)

# load libraries
library(dplyr)
library(tidyr)

gapminder %>% 
  separate(col = year, 
           into = c("century", "Year"), 
           sep = 2) %>% 
  View()

gapminder1 <- gapminder

library(gapminder)
library(dplyr)
library(tidyr)

# Step 1: create century column
gapminder1 <- gapminder %>% 
  mutate(
    century = year %/% 100,              # integer division, e.g. 1952 -> 19
    year_in_century = year %% 100        # remainder, e.g. 1952 -> 52
  )

# Step 2: unite century + year_in_century
gapminder1 %>% 
  unite(col = date, century, year_in_century, sep = "")
