#aesthetic bar chart 


library(tidyverse)

starwars %>% 
  filter(hair_color=="brown" | hair_color=="black") %>% 
  drop_na(sex) %>% 
  ggplot(aes(hair_color,fill=sex))+
  geom_bar(position = "dodge",alpha=0.2)+
  theme_bw()+
  theme(panel.grid.major = element_blank(), #removes grid from background
        panel.grid.minor = element_blank())+
  labs(title="Hair color for male and female ",x="Count", y="Hair Color")+
  coord_flip()

library(ggplot2)
library(dplyr)
library(tidyr)

starwars %>% 
  filter(hair_color %in% c("brown", "black")) %>% 
  drop_na(sex) %>% 
  ggplot(aes(hair_color, fill = sex)) +
  geom_bar(position = "fill", alpha = 0.2) +
  geom_text(stat = "count", 
            aes(label = ..count..), 
            position = position_dodge(width = 0.9), 
            vjust = 0.5, size = 3) +
  theme_bw() +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank()) +
  labs(title = "Hair color for male and female", 
       x = "Hair Color", y = "Count") 
  #coord_flip()



library(ggplot2)
library(dplyr)
library(tidyr)

starwars %>% 
  filter(hair_color %in% c("brown", "black")) %>% 
  drop_na(sex) %>% 
  ggplot(aes(hair_color, fill = sex)) +
  geom_bar(position = "dodge", alpha = 0.6) +
  geom_text(stat = "count", 
            aes(label = ..count..), 
            position = position_dodge(width = 0.9), 
            vjust = 0.5, color = "black", size = 3) +
  theme_bw() +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank()) +
  labs(title = "Hair color for male and female", 
       x = "Hair Color", y = "Count") +
  coord_flip()


library(ggplot2)
library(dplyr)
library(tidyr)

starwars %>% 
  filter(hair_color %in% c("brown", "black")) %>% 
  drop_na(sex) %>% 
  ggplot(aes(hair_color, fill = sex)) +
  geom_bar(position = "dodge") +
  geom_text(stat = "count",
            aes(label = ..count..),
            position = position_dodge(width = 0.9),
            vjust = 2.5,       # vertical center
            hjust = .5,       # horizontal center (for coord_flip)
            color = "black",   # better contrast inside bars
            size = 4) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()) +
  labs(title = "Hair color for male and female",
       x = "Hair Color", y = "Count") 
