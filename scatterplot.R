library(tidyverse)

data()


mpg %>% 
  filter(hwy < 35) %>% 
  
# two numerical variable 
  
  
ggplot(mpg, aes(x = displ, y = hwy , color=drv)) + 
  geom_point(aes(color=drv))+
  geom_smooth(method=lm,se=F)+
  labs(title = "Engine")+
  theme_minimal()
ggsave("engine.png")


names(msleep)


msleep %>% 
    filter(bodywt<2) %>% 
    ggplot(aes(bodywt,brainwt))+
    geom_point(aes(color=sleep_total,size=awake))+
    geom_smooth(method = lm, se=F)+
    theme_bw()+
    facet_wrap(~conservation)
  
  
  
  