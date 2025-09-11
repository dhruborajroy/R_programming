library(tidyverse)

data()

view(Orange)
head(Orange)

#two numeric and one categorical variable,x axis independent & y axis is dependent

Orange %>% 
  filter(Tree!="2") %>% 
  ggplot(aes(x=age, y= circumference,color=Tree))+
  geom_point()+
  geom_smooth(method = lm,se=F)+
  facet_wrap(~Tree)+
  theme_bw()+
  labs(title="Tre",x="sdf",y="sdf")
  


Orange %>% 
  filter(Tree!="2" & 
            Tree!="1") %>% 
  ggplot(aes(x=age, y= circumference,color=Tree))+
  geom_line()+
  geom_point(size=5,alpha=0.5)
  theme_bw()

  
