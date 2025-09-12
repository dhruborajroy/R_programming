library(tidyverse)
#install.packages("ggforce")
library(ggforce)

Orange %>% 
  filter(Tree!="2") %>% 
  ggplot(aes(x = age, y = circumference, color = Tree)) +
  geom_point() +
  geom_smooth(method = lm, se = FALSE) +
  geom_mark_ellipse(
    aes(filter = Tree == "3"),  # choose which group to encircle
    expand = unit(2, "mm"), 
    color = "steelblue", 
    fill = NA, 
    size = 1
  ) +
  theme_bw() +
  labs(title = "Tre", x = "sdf", y = "sdf")


view(starwars)
just_humans<-starwars
  filter(species=="Human")
  view(just_humans)
  
starwars %>% 
  filter(mass<200) %>% 
  drop_na(sex) %>% 
  ggplot(aes(x = height, y = mass, color = sex))+
  geom_point() +
  geom_mark_ellipse(
    data = just_humans,
    aes(height,mass),  # choose which group to encircle
    expand = 0.1, 
    color = "steelblue", 
    fill = "NA", 
    alpha=0.8,
    size = 2
  ) +
  theme_bw()
