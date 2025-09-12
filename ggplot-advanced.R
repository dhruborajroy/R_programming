install.packages("car")
library(car)
library(tidyverse)


theme_set(theme_bw())


head(Salaries)

Salaries %>% 
  ggplot(aes(x= yrs.since.phd,
             y=salary,color=rank))+
  geom_point()

#make shape = discipline
# change geom_point to geom_jitter
# add linear model by sex
# facet by sex
# add axis and legend labels


Salaries %>% 
  ggplot(aes(x= yrs.since.phd,
             y=salary))+
  geom_jitter(aes(color=rank, shape=discipline))+
  geom_smooth(method=lm)+
  facet_wrap(~sex)+
  labs(title="Salary vs. Years since PhD",
       x="Years since PhD",
       y="Income",
       color="position",
       shape="Research area")
 



#boxplot

Salaries %>% 
  filter(salary<150000) %>% 
  ggplot(aes(x=rank,y=salary, fill=sex))+
  geom_boxplot()+
  labs(
    title="Faculty salary by rank and gender",
    x=rank,
    y="",
    fill="Gender",
    )

#boxplot with tic and tics lebels

Salaries %>% 
  filter(salary<150000) %>% 
  ggplot(aes(x=rank,y=salary, fill=sex))+
  geom_boxplot(alpha=0.4)+
  scale_x_discrete(breaks=c("AsstProf","AssocProf","Prof"),labels=c("Asistant\nProfessor","Associate\nProfessor","Professor"))+
  scale_y_continuous(breaks=c(50000,100000,150000,200000),labels=c("$50000","$100000","$150000","$200000"))+
  labs(
    title="Faculty salary by rank and gender",
    x=rank,
    y="",
    fill="Gender",
  )+
  theme(legend.position = c(0.11,0.78))
