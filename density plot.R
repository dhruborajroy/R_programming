# one categorical variable & one numerical varible 
#density plots are more suitable for fraction data and the histograms are more suitable for full data.

library(tidyverse)


data()

msleep
head(msleep)


msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(x=vore,y=sleep_total))+
  geom_boxplot()+
  theme_bw()+
  labs(title="box plot")+
  coord_flip()+
  facet_wrap(~vore)

msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(sleep_total))+
  geom_boxplot()+
  theme_bw()+
  labs(title="box plot")+
  coord_flip()+
  facet_wrap(~vore)


msleep %>% 
  #filter(vore=="herbi" | vore=="omni") %>% 
  #filter(vore %in% c("carni", "omni")) %>% 
  drop_na(vore) %>% 
  ggplot(aes(sleep_total,color=vore,fill=vore))+
  geom_density(alpha=0.2)
  theme_bw()+
  labs(title="box plot")
  #coord_flip()+
  #facet_wrap(~vore)


#histogram
msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(sleep_total))+
  geom_histogram()+
  theme_bw()+
  labs(title="box plot")
  #coord_flip()+
  #facet_wrap(~vore)


summary(msleep$sleep_total)  
