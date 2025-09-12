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
  
  
  
  
  library(forcats)
  library(patchwork)
  
  
  #AGE and proption graph but not a standard practice
  gss_cat %>% 
    filter(!is.na(age)) %>% 
    filter(marital %in% c("Never married","Married","Widowed")) %>% 
    count(age, marital) %>% 
    group_by(age) %>% 
    mutate(prop=n/sum(n)) %>%  
    ggplot(aes(x=age, y= prop,color=marital))+
    geom_line(size=2,na.rm = TRUE)
  geom_point(size=5,alpha=0.5)+
    theme_bw()
  
  
  
  #AGE and proption graph but not a standard practice
  gss_cat %>% 
    filter(!is.na(age)) %>% 
    filter(marital %in% c("Never married","Married","Widowed")) %>% 
    count(age, marital) %>% 
    group_by(age) %>% 
    mutate(prop=n/sum(n)) %>%  
    mutate(marital=fct_reorder2(marital,age, prop)) %>% 
    mutate(marital=fct_rev(marital)) %>% 
    ggplot(aes(x=age, y= prop,color=marital))+
    geom_line(size=2,na.rm = TRUE)
  geom_point(size=5,alpha=0.5)+
    theme_bw()
  
  
  

  
