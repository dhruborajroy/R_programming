library(tidyverse)

data()

view(msleep)

glimpse(msleep)

#descibe the minimum and maximum, Quartile Data, Centrality

min(msleep$awake)
max(msleep$awake)
range(msleep$awake)
IQR(msleep$awake)
mean(msleep$awake)
median(msleep$awake)
var(msleep$awake)


#summarize the variable

summary(msleep$awake)
summary(msleep$sleep_total)



msleep %>% 
  select(sleep_total,brainwt) %>% 
  summary(sleep_total)


#create summary of tables
#for each category of vore
# show min, max, difference
# and average "sleep_total"
# arrange data by average


msleep %>% 
  drop_na(vore) %>% 
  group_by(vore) %>% 
  summarize(lower= min(sleep_total),
            Average=mean(sleep_total),
            Upper=max(sleep_total),
            difference=max(sleep_total)-min(sleep_total)) %>% 
  arrange(Average) %>% 
  view()



#creating beautiful UI table

library(MASS)

attach(Cars93)

glimpse(Cars93)


table(Origin) #origin is a column of cars93 dataset

table(AirBags, Origin)

addmargins(table(AirBags, Origin),1) # if the second data =1 then sum in row, 2=sum is column, if nothing then both


prop.table(table(AirBags, Origin))*100 #in percent 

round((prop.table(table(AirBags, Origin))*100),2) #in round


Cars93 %>% 
  group_by(Origin, AirBags) %>% 
  summarise(number=n()) %>% 
  pivot_wider(names_from = Origin, values_from = number)  #names from that the column names are comming from 
                                                          #origin and the value is comming from number column
 
