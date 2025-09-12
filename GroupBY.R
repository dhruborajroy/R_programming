library(tidyverse)
library(forcats)

view(msleep)

msleep %>% 
  drop_na(sleep_rem,vore) %>% 
  group_by(vore) %>%  
  summarise("Average total sleep"=mean(sleep_total),"Minumum rem sleep"=max(sleep_rem)) %>% 
  view()
  
