# Explore
# clean
# manipulate
# describe and summerise
# visualise
# analyse
################
#analyse data#
################


library(tidyverse)
install.packages("patchwork")
library(patchwork)
library(MASS)

install.packages("gapminder")
library(gapminder)


data()

head(gapminder)



###single sample t-test

gapminder %>% 
  filter(continent == "Africa") %>%   # you can uncomment to restrict
  pull(lifeExp) %>%                    # pull gives a vector instead of a data frame
  t.test(mu = 50)


my_data <-gapminder %>% 
  filter(continent == "Africa") %>%   # you can uncomment to restrict
  pull(lifeExp) %>%                    # pull gives a vector instead of a data frame
  t.test(mu = 50)
attributes(my_data) 
my_data$p.value #access the p.value



gapminder %>% 
  filter(continent=="Africa" | continent=="Europe") %>% 
  #filter(vore %in% c("carni", "omni")) %>% 
  drop_na(continent) %>% 
  ggplot(aes(lifeExp,color=continent,fill=continent,alpha=0.2))+
  geom_density(alpha=0.2)
  theme_bw()+
  labs(title="box plot")
  #coord_flip()+
  #facet_wrap(~continent)
  
  
  
###Two sided test for diffrence of mean sample t-test
  
  
gapminder %>% 
  filter(continent %in% c("Africa","Europe")) %>% 
  t.test(lifeExp~continent, data=., alternative="two.sided") # here ~ means the life expentancy by continent 
