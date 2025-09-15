#1. Create date-time object
#2. Extract date-time objects
#3. Do arrhythmic with date-time objects
#4. Work with timespans
#5. visual datetime objects using ggplot2



#name of the functions

ymd() #perse date time sting in the "YYYY-MM-DD"

dmy() #perse date time sting in the "DD-MM-YYYY"

mdy() #perse date time sting in the "MM-DD-YYYY"

ymd_hms() #perse date time sting in the "YYYY-MM-DD HH:MM:SS" 

hms() #perse date time sting in the "HH:MM:SS"

make_date() #Create a date object

make_datetime() #Create a datetime  object

today() #get todays date

now() #get a current datetime

ymd(now())

mdy()
dmy()


ymd_hms("2025-09-14 20:5:55")

mdy_hm("09/14/2025 20:5")




install.packages("nycflights13")
install.packages("ggh4x")
install.packages("ggforce")
library(nycflights13)

library(tidyverse)
library(nycflights13)
library(ggh4x)
library(ggforce)


glimpse(flights)

flights %>% 
  select(origin, year, month, day, hour, minute ) %>% 
  head(4)

flights <- flights %>% 
  select(carrier, time_hour, arr_delay)

flights %>% 
  mutate(flight_date=ymd_hm(paste(year,month,day, hour, minute))) %>% 
  select(origin, dest, flight_date)


flights %>% 
  mutate(flight_date=make_datetime(year,month,day, hour, minute)) %>% 
  select(origin, dest, flight_date)



flights %>% 
  mutate(flight_date = make_date(year,month, day)) %>% 
  mutate(weekday=wday(flight_date,label=T), 
         month_name=month(flight_date,label=T)) %>% 
  select(origin,flight_date,weekday,month_name) %>% 
  head(3)

#functions

month()
day()
hour()
minute()
second()
wday() #weekday 
mday() #extracts the day of the month from a date-tiime object


qtr()
yday()
leap_year()
decimal_date()




#arithmatic with date

now()+years(30)


flights %>% 
  filter(time_hour>=ymd("2013-09-01") & time_hour<=ymd("2013-10-01")) %>%
  select(origin, month,year) %>% 
  head(3)

#duration in seconds(does not count leap years)
#period() human unit(week, month,date) time(does count leap years)
#interval defined begining and defined date

dseconds(15)

dminutes(15)



#not account into leap year
ymd("2016-09-01")+dyears(1)

#not account into leap year
ymd("2016-09-01")+years(1)


months(3)+days(1)+minute(3)


#interval

start<- ymd_hms("2023-09-08 02:05:55")
end<- ymd_hms("2024-09-08 02:05:55")

interval_1<- interval(start ,end)

interval_1



#%within% 
ymd_hms("2023-10-02 03:05:20") %within% interval_1



library(tidyverse)
library(nycflights13)
library(ggh4x)
library(ggforce)


flights %>% 
  filter(carrier %in% c("9E","US","AA")) %>% 
  mutate(week_date=wday(time_hour,label=T)) %>% 
  ggplot(aes(week_day))+
  geom_bar(fill="steelblue",alpha="0.3")+
  facet_wrap(~carrier)+
  theme_bw()+
  labs(title="Number of flight",
       x="sdk",
       y="4df")
