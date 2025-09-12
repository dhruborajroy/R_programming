# Explore
# clean
# manipulate
# describe and summerise
# visualise
# analyse
################
#analyse data#       Linear Regrasion model
################      



library(tidyverse)
library(patchwork)
library(gapminder)


cars


cars %>% 
  lm(dist~speed, data=.,) %>% 
  summary()


cars_obj<- lm(dist~speed, data=cars) 

summary(cars_obj)

attributes(cars_obj)

hist((cars_obj$residuals))



# make numeric vector
new_speed <- c(10, 15, 20)

# put inside a data frame with the same variable name used in the model
new_data <- data.frame(speed = new_speed)

# predict
predict(cars_obj, new_data) %>% round(1)


cars
cars %>% 
lm(dist~speed ,data=.) %>% 
  predict(data.frame(speed=c(10,15,20))) %>% 
  round()
