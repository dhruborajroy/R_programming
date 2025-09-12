library(tidyverse)

view(ToothGrowth)

theme_set(theme_bw()+theme(panel.grid.major=element_blank()))


ToothGrowth %>% 
  filter(supp=="VC") %>% 
  mutate(dose=as.factor(dose)) %>%
  group_by(dose) %>% 
  summarise(mean_len=mean(len),
            sd_len=sd(len)) %>%
  ggplot(aes(dose,mean_len))+
  geom_point(size=3,color="blue")+
  geom_errorbar(aes(x=dose,
                    ymin=mean_len-sd_len,
                    ymax=mean_len+sd_len,
                    width=0.05))+
  labs(x="Dose",y="Average Tooth Growth",title="Average tooth growth for VC Sump")




ToothGrowth %>% 
  filter(supp=="VC") %>% 
  mutate(dose=as.factor(dose)) %>%
  group_by(dose) %>% 
  summarise(mean_len=mean(len),
            sd_len=sd(len)) %>%
  ggplot(aes(dose,mean_len))+
  geom_bar(stat="identity",fill="Skyblue",alpha=0.7)+
  geom_errorbar(aes(x=dose,
                    ymin=mean_len-sd_len,
                    ymax=mean_len+sd_len,
                    width=0.05))+
  labs(x="Dose",y="Average Tooth Growth",title="Average tooth growth for VC Sump")
