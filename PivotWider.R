#pivot_wider
# convert rows to column
# changing long data into wide data using pivot_wider()


library(tidyverse)
?pivot_wider
?Orange
view(Orange)
names(Orange)


orange2<- Orange %>%  
  pivot_wider(names_from = "age",
              values_from = "circumference") %>%  
  view  

#view orange2 then column 2:8 should be converted to age
orange2 %>% 
  pivot_longer(cols = 2:8,
               names_to="AGE",  #new variable
               values_to = "CIRC") #new variable
