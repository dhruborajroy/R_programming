#install.packages("msleep")
library(tidyverse)


names(msleep)
#suitable for single categorical variable or single numerical

msleep %>% 
  drop_na(vore) %>% 
  ggplot( aes(x=vore))+
  geom_bar(fill="#97B3c6")+
  theme_bw()+
  labs(x="df",y="s",title="spee")+
  coord_flip()

msleep %>% 
  ggplot(aes(x=awake))+
  geom_histogram(binwidth=5,fill="#97b3C6")+
  theme_bw()+
  coord_flip()
