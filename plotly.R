install.packages("plotly")

library(tidyverse)
library(plotly)


#interactive plot on mouse hover
p<-starwars %>% 
  drop_na(height,mass,eye_color) %>% 
  filter(mass<250) %>% 
  filter(eye_color %in% c("blue",
                          "brown",
                          "black",
                          "pink",
                          "red",
                          "orange")) %>% 
  ggplot(aes(x=height,y=mass, color=eye_color))+
  geom_jitter(size=6,alpha=0.5)+
  scale_color_manual(values=c("blue"="blue",
                              "brown"="brown",
                              "black"="black",
                              "pink"="pink",
                              "red"="red",
                              "orange"="orange"))+
  theme_bw()+
  theme(legend.position = c(0.05,0.98),legend.justification=c("left","top"))+
  labs(title="height, mass and eye color",
       x="Height",
       y="Mass",
       color="Eye Color")



#interactive plot on mouse hover
ggplotly(p) 


#3d plot interactive
trees %>% 
  plot_ly(x=~Girth,
           y=~Height,
           z=~Volume)


#surface plot
plot_ly(z=volcano,type="surface")
