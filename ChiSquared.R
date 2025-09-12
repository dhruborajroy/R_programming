library(tidyverse)
library(forcats)

gss_cat


my_data<-gss_cat %>% 
  select(marital) %>% 
  filter(marital %in% c("Married","Never married", "Divorced")) %>% 
  mutate(marital=fct_drop(marital))


my_table<-table(my_data)



#use chisquare test 

chisq.test(my_table)

#p-value < 2.2e-16 Reject H0 hypothesis


my_data %>% 
  table() %>% 
  chisq.test()
 