library(tidyverse)

women %>% 
  formula<-lm(formula=weight~height,data=women) %>% 

  summarise(formula)