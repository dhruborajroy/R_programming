library(tidyverse)

data()


mpg %>% 
  filter(hwy < 35) %>% 
  
  
ggplot(mpg, aes(x = displ, y = hwy , color=drv)) + 
  geom_point(aes(color=drv))+
  geom_smooth(method=lm,se=F)+
  labs(title = "Engine")+
  theme_minimal()
ggsave("engine.png")

