install.packages("car")
library(car)
library(tidyverse)


theme_set(theme_bw()+theme(title=element_text(color = "steelblue",face="bold")))


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



theme_set(theme_bw()+theme(title=element_text(color = "steelblue"),face="bold"))


Salaries %>% 
  mutate(discipline=factor(discipline,
                          levels=c("A","B"),
                          labels=c("Agriculture","Biology"))) %>%
  ggplot(aes(yrs.since.phd,salary))+
  geom_point(aes(color=rank), alpha=0.5)+
  geom_smooth()+
  facet_grid(sex~discipline)+ #names of ordinates, here sex is row and discpline is column
  labs(title="Salary vs. Years since PhD",
       x="Years since PhD",
       y="Salary")




mpg %>% 
  mutate(drv=factor(drv,levels=c("4","f","r"),
                        labels=c("4 Wheel","Front","Rare"))) %>%
  ggplot(aes(x=cty,fill=drv)) + 
  geom_density(alpha=0.3) +
  theme_bw()+labs(fill="Wheel type")

ggsave("mpg plot.png",
       width = 10, height = 7, units = "cm",dpi = 1200)





mtcars %>% 
  ggplot(aes(x=wt,y=mpg,color=factor(gear)))+
  geom_point(size=3,alpha=0.2)+
  labs(title="sdf",x="sd",y="dfsf")+
  theme_bw()+
  theme(plot.title = element_text(size=18,face = "bold", color="steelblue",hjust = 0.5),
        axis.text = element_text(size=18,face = "bold", color="grey"),
        axis.title = element_text(size=18,face = "bold", color="red"),
        legend.position = c(0.9,0.8))+
  annotate("text",x=4,y=30,
          label="Notice the difference \n between cars with ",
          color="black",
          size=4)+
  geom_segment(x=4.5,y=27,xend=5,yend=17, arrow=arrow(length = unit(0.5,"cm")),
               color="darkred",size=1.5)+
  geom_segment(x=4.5,y=27,xend=2,yend=27, arrow=arrow(length = unit(0.5,"cm")),
               color="darkred",size=1.5)


    
