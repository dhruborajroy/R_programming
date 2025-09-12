library(tidyverse)
library(forcats)
library(patchwork)



view(gss_cat) #with more categical variables

gss_cat %>% 
  pull(race) %>% 
  unique()


count(gss_cat,race,sort = TRUE) %>% #dataframe, sort_variable, sort(T,F)
  table()

gss_cat %>% 
  mutate(race=fct_drop(race)) %>% 
  pull(race) %>% 
  levels()


#geom_point
gss_cat %>% 
  drop_na(tvhours) %>% 
  group_by(relig) %>% 
  summarise(mean_tv=mean(tvhours)) %>% 
  ggplot(aes(mean_tv,relig))+
  geom_point(size=4)


#mutate 

gss_cat %>% 
  drop_na(tvhours) %>% 
  group_by(relig) %>% 
  summarise(mean_tv=mean(tvhours)) %>%
  mutate(relig=fct_reorder(relig,mean_tv)) %>% 
  ggplot(aes(mean_tv,relig))+
  geom_point(size=4)


#mutate reverse

gss_cat %>% 
  drop_na(tvhours) %>% 
  group_by(relig) %>% 
  summarise(mean_tv=mean(tvhours)) %>%
  mutate(relig=fct_rev(relig)) %>% 
  ggplot(aes(mean_tv,relig))+
  geom_point(size=4)


gss_cat %>% 
  mutate(marital=fct_infreq(marital)) %>% 
  mutate(marital=fct_rev(marital)) %>% 
  count()



gss_cat %>% 
  mutate(marital=fct_infreq(marital)) %>% 
  mutate(marital=fct_rev(marital)) %>% 
  ggplot(aes(marital)) +
  geom_bar(fill="steelblue",alpha = 0.5)+
  theme_bw()


gss_cat %>% 
  filter(!is.na(age)) %>% 
  mutate(marital=fct_infreq(marital)) %>% 
  mutate(marital=fct_rev(marital)) %>% 
  ggplot(aes(x=age, y= marital,color=marital))+
  geom_line()+
  geom_point(size=5,alpha=0.5)+
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


