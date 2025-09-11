install.packages("msleep")
library(tidyverse)


names(msleep)

msleep %>% 
  drop_na(vore) %>% 
  ggplot( aes(x=vore))+
  geom_bar(fill="#97B3c6")+
  theme_bw()+
  labs(x="df",y="s",title="spee")+
  coord_flip()
  
