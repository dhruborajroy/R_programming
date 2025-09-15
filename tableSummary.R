install.packages("gtExtras")
install.packages("svglite")
library(gtExtras)
library(tidyverse)

#create summary table
iris %>% 
  gt_plt_summary()


#insert icon and graphics on the table 

mtcars %>% 
  group_by(cyl) %>% 
  summarise(Median=round(median(mpg),2),
            Mean=round(mean(mpg),2),
            Distribution=list(mpg),
            Bar=list(cyl),
            Name="s") %>%              #add column like this
  gt() %>% 
  gt_plt_dist(Distribution) %>%       #make the distribution graph
  gt_plt_dist(Bar) %>%       #make the Bar Chart graph
  gt_theme_guardian() %>% 
  tab_header(title="Miles per gallon stat")
  
  