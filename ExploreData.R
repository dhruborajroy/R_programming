#functions of R

library(tidyverse)

data()

starwars

dim(starwars)
str(starwars)

glimpse(starwars)

attach(starwars)

names(starwars)

length(starwars)

view(starwars)


unique(starwars)

view(sort(table(hair_color), descending=True,decreasing = TRUE))

barplot(sort(table(eye_color), decreasing = TRUE))

starwars %>% 
  select(hair_color) %>% 
  count(hair_color) %>%  
  arrange(desc(n)) %>% 
  View()

View(starwars[is.na(hair_color),]) # look at the row hair_color if exist then select.


summary(height)

boxplot(height)+coord_flip()
