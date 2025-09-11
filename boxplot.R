#one categorical and one numerical 
# the standard practice to plot a box plot that the categorical
# variables should in y axis and the numerical variables are in x axis. 
#beacuse if the variables are in large in size it is easier to learn the y axis text.
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
  drop_na(vore) %>% 
  ggplot(aes(sleep_total))+
  geom_density()+
  theme_bw()+
  labs(title="box plot")+
  #coord_flip()+
  facet_wrap(~vore)


#histogram
msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(sleep_total))+
  geom_histogram()+
  theme_bw()+
  labs(title="box plot")+
  #coord_flip()+
  facet_wrap(~vore)


summary(msleep$sleep_total)  
