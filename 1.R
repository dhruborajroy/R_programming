install.packages(mtcars) #package install

library(mtcars) #package include

mtcars

mean(mtcars$hp) #mean

median(mtcars$hp) # median

hist(mtcars$cyl) #histogram

plot(mtcars$cyl~ mtcars$hp) # plot graph x-y plane

cor.test(mtcars$cyl, mtcars$hp) #t-test, p value, confidence level



my_obj <- read.csv("data.csv") #add csv to the 

head(my_obj) #first 6 rows

tail(my_obj) #last 6 rows

view(my_obj) #view objects

my_obj[1,3] #view data of any specific column and row. here 1 is row & 3 is column

my_obj[,3] #view data of any specific column and row. here all row & 3 is column





my_cars <- mtcars

mtcars
my_cars %>% 
  select(cyl,mpg,hp,qsec)  %>% 
    filter(cyl > 4 & hp>180)
  

require(readxl)
install.packages("readxl")
my_data <- read_excel("~desktop/ij.xlsx",
                      sheet="sheet1",
                      range = "A1:G14",
                      na="**")




install.packages("tideverse")

library(tidyverse)


data()
view(starwars)

starwars %>% 
  select(gender,mass,height,species) %>% 
    filter(species=="Human") %>% 
    na.omit() %>% 
    mutate(height=height/100) %>% 
    mutate(bmi=mass/height^2) %>% 
    group_by(gender) %>% 
    summarise(avg_BMI=mean(bmi))
#str
str(starwars$height)

starwars$height <- as.integer(starwars$height)


sw <- starwars
head(sw)
sw <- sw %>% 
  select(name,hair_color,eye_color) %>% 
  rename(h_color= hair_color)
sw
