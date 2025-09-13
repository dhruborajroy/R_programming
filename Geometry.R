library(tidyverse)


faithfuld %>% 
  ggplot(aes(x=waiting,
              y=eruptions,
              fill=density))+
  geom_raster()+ #creates raster. 
  labs(title="Old faithful greyser",x="Waiting time between erruption")

ggplot(mpg,aes(x=displ))+ # ignored dedicating y axis intentionally
  geom_area(aes(y=hwy,fill = "Highway"))+
  geom_area(aes(y=cty, fill="City"))+
  labs(title="Highway Vs. City Driving",
       x="Engine Displacement(L)",
       y="Miles Per gallon",
       fill="")+
  theme_bw()
