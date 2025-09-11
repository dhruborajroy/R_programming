# Explore
# clean
# manipulate
# describe and summerise
# visualise
# analyse
################
#analyse data#        ANOVA(analysis of variance)
################

 

library(tidyverse)
install.packages("patchwork")
library(patchwork)
library(MASS)

install.packages("gapminder")
library(gapminder)


data()

head(gapminder)



#create dataset
gapdata<- gapminder %>% 
  filter(year==2007 & 
           continent %in% c("Americas","Europe","Asia")) %>% 
  pull(continent, lifeExp)


view(gapdata)


#take a look at the distribution of mean

gapdata <- gapminder %>% 
  group_by(continent) %>% 
  summarise(mean_life=mean(lifeExp)) %>% 
  arrange(mean_life)

view(gapdata)




#research Questions:  Is the life expentancies of the 
#                     in these continents diffrent


#Hypothesis Testing:    H0: Mean life expectancy is same
#                       H1: Mean life expectancy is not same

# Observations:         Difference of mean is observed 
#                       in the sample dataset, but this is statically 
#                       signifant(alpha= 0.05)



#create anova model

gapminder %>% 
  aov(lifeExp ~ continent, data=. ) %>% 
  summary()


gapminder %>% 
  aov(lifeExp ~ continent, data=. ) %>% 
  TukeyHSD() %>%  #combination of two continent
  plot()
