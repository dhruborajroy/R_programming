library(tidyverse)
library(forcats)


theme_set(theme_bw()+theme(panel.grid.major = element_blank()))


data()

view(msleep)

?geom_segment


msleep %>% 
  group_by(order) %>% 
  summarise(mean_sleep=mean(sleep_total)) %>% 
  mutate(order=fct_reorder(order, mean_sleep)) %>% 
  ggplot(aes(x=order,y=mean_sleep)) +
  geom_point(size=3,color="orange")+
  geom_segment(aes(x=order,
                   y=mean(msleep$sleep_total),
                   xend=order,
                   yend= mean_sleep,
                   color="grey"))+
  geom_hline(yintercept = mean(msleep$sleep_total,
                               color="grey",
                               size=1))+
  theme(axis.text.x = element_text(angle = 90))+
  labs(title="Average sleep time of mamals by order",
       x="",
       y="Hours")
  
