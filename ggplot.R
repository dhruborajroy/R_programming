# data visualisation


#data
# mapping(aesthetics)
# geometric representation
# statistics
# facet
# coordinate space
# labeles
# theme


install.packages("tydiverse")
data()


#part 1 
BOD
ggplot(data=BOD,
      mapping= aes(x= Time,
                   y=demand))+geom_point(size=5)+  #adds point   
  geom_line(color="Red") #adds line 




#part 2 using function 
ggplot(BOD,aes(Time,demand))+geom_point(size=2)+geom_line(color="red")


#part3 using CO2
head(CO2)
CO2 %>% 
  ggplot(aes(conc,uptake, color= Treatment))+
  geom_point(size=3, alpha=0.54)+
  geom_smooth(method=lm, se=F)+
  facet_wrap(~Type)+
  labs(title = "Concentration of CO2")+
  theme_bw()


CO2 %>% 
  ggplot(aes(Treatment,uptake, color= Treatment))+
  geom_boxplot()+
  facet_wrap(~Type,nrow=1)+
  geom_point(alpha=0.5,aes(size=conc))+
  geom_smooth(method=lm)+
  coord_flip()+
  theme_bw()+
  labs(title="CHilled non chilled", x= "Treatment",y="Uptake",)


library(tidyverse)
library(rmarkdown)
library(readxl)
library(dplyr)
library(tidyr)
library(lubridate)
install.packages("reshape2")
library(reshape2)
install.packages("ggthemes")
library (ggthemes)
install.packages("ggpubr")
library(ggpubr)
install.packages("plotrix")
library(plotrix)
install.packages("scales")
library(scales)

#printing dataframe
print(gapl151618_wetCS)

#creating plot
ggplot(gapl151618_wetCS, aes(x=Date , y=N_ug_m2_h, fill=Trt))+
  geom_hline (yintercept=0, color = "black", linetype = 3 ) +
  facet_wrap(~Year, scales = "free_x") +
  geom_bar(position = position_dodge2 (width = 1), stat = "identity", colour="black", size=.3) +
  geom_errorbar(aes(ymin=N_ug_m2_h, ymax=N_ug_m2_h+se_graph, group = Trt), position = position_dodge2 ()) +
  ylab(expression(~mu~g~N[2]*O-N~~m^{-2}~h^{-1})) +
  xlab("Date") +
  ggtitle(expression(N[2]*O~fluxes~wet~tundra~2015~","~2016~and~2018))

