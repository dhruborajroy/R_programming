library(tidyverse)

levels(gss_cat$race)


#levels at out prefreed order
gss_cat %>% 
  select(race) %>%
  mutate(race=fct_drop(race)) %>% #not applicable is gone 
  mutate(race=fct_relevel(race, c("White","Black", "Other"))) %>% #here first parameter is the 
                                                                  #variable name, and 2 parameter is level name
  table




#levels are sorting according to value. 
gss_cat %>% 
  mutate(marital=fct_infreq(marital)) %>% #sort according to value
  mutate(marital=fct_rev(marital)) %>% 
  ggplot(aes(marital))+
  geom_bar(fill="steelblue")




#levels are sorting according to value. 
gss_cat %>% 
  group_by(relig) %>% 
  summarise(meantv=mean(tvhours,na.rm=T)) %>%  
  mutate(relig=fct_reorder(relig,meantv)) %>% #first parameter is variable name and 2nd parameter is the by the value of sorting
  ggplot(aes(meantv,relig))+
  geom_point(size=3,color="steelblue")



#other functions 

#fct_recode 
#fct_reorder
#fct_collapse