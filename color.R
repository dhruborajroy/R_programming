library(tidyverse)
install.packages("RColorBrewer")
library(RColorBrewer)


display.brewer.all(colorblindFriendly = TRUE)


mpg %>% 
  ggplot(aes(displ,hwy,color=drv))+
  geom_jitter(size=3)+
  scale_color_brewer(palette="Set2")+
  theme_minimal()


msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(x=vore,))+
  geom_bar(aes(fill=vore))+
  scale_fill_brewer(palette="Set3")+
  theme_bw()+
  labs(x="df",y="s",title="spee")
  coord_flip()
