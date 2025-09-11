################
#Cleaning Data##
###############


#what is cleaning data?
#variable type
#select and filter
#find and deal with missing data
#find and deals with duplicate
#Recording values


library(tidyverse)
class(starwars$gender)

unique(starwars$gender)

starwars$gender1 <- as.factor(starwars$gender)
class(starwars$gender1)

starwars$gender<- factor(starwars$gender,levels=c("masciline","faminine"))
class(starwars$gender)


levels(class(starwars$gender1))

head(starwars)

starwars %>% 
select(name, height, hair_color, ends_with("color")) %>% 
  filter(hair_color %in% c("brown", "black") & eye_color %in% c("brown") &   height<180)


#calculate missing values 
mean(starwars$height,na.rm = TRUE)


