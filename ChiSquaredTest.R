# Explore
# clean
# manipulate
# describe and summerise
# visualise
# analyse
################
#analyse data#        ChiSquared Test goodness to fit
################      ChiSquared test test of independence



library(tidyverse)
library(patchwork)
library(gapminder)


data()

head(gapminder)



flowers<- iris %>% 
  mutate(size=cut(Sepal.Length,
                  breaks=3,
                  labels=c("Small","Medium", "Large"))) %>% 
  select(Species, size)

table(flowers)

#chi squared goodness of fit
############################
#***
# Question: is there a statistically significant difference in the proportion of flowers that are small, medium and large (alpha =
#
#       HO: The proportion of flowers that are 
#           small, medium sized and large are equal 
#       H1: The proportion of flowers that are
#       small, medium sized and large are not equal


chisq.test(table(flowers$size))

flowers %>% 
  select(size) %>% 
  table() %>% 
  chisq.test()
# p-value = 6.673e-07


table(flowers)
chisq.test(table(flowers))


table(flowers) %>% 
  chisq.test()

flowers %>% 
  table() %>% 
  chisq.test()
