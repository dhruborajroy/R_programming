install.packages("rnaturalearth")
install.packages("terra")
install.packages("rnaturalearthdata")
library(rnaturalearth)
library(tidyverse)

world<-ne_countries(scale="medium",returnclass = "sf") #sf=simple feature

view(world)


#ploting the dataset

world %>% 
  ggplot(aes(fill=income_grp))+
  geom_sf()+
  scale_fill_viridis_d()+
  theme(legend.position = "right",
        legend.title=element_text(face="bold"),
        plot.title = element_text(size=20,
        color = "steelblue"),
        hjust=0.5,face="bold")+
  labs(title = "Income Group Countries", fill="Income Group")


#africa data
world %>% 
  filter(region_un=="Africa") %>%  
  ggplot(aes(fill=income_grp))+
  geom_sf()+
  scale_fill_viridis_d()+
  theme(legend.position = "right",
        legend.title=element_text(face="bold"),
        plot.title = element_text(size=20,
                                  color = "steelblue"),
        hjust=0.5,face="bold")+
  labs(title = "Income Group Countries", fill="Income Group")

head(world)


#africa data
world %>% 
  filter(region_un=="Africa") %>%  
  ggplot()+
  geom_sf(aes(fill=pop_est/1e6),color="white",lwd=0.3)+
  theme(legend.position = "right",
        legend.title=element_text(face="bold"),
        plot.title = element_text(size=20,
                                  color = "steelblue"),
        hjust=0.5,face="bold")+
  labs(title = "Population Data(Africa)", fill="Population\n(millions)")


#asia data
world %>% 
  filter(region_un=="Asia") %>%  
  ggplot()+
  geom_sf(aes(fill=pop_est/1e6),color="white",lwd=0.3)+
  theme(legend.position = "right",
        legend.title=element_text(face="bold"),
        plot.title = element_text(size=20,
                                  color = "steelblue"),
        hjust=0.5,face="bold")+
  labs(title = "Population Data(Asia)", fill="Population\n(millions)")


atlas <- read_rds("https://github.com/viniciusoike/restateinsight/raw/main/static/data/atlas_sp_hdi.rds")


ggplot(atlas) +
  geom_sf(aes(fill = HDI),
          lwd = 0.05,
          color = "white") +
  scale_fill_fermenter(
    name = "HDI scores",
    breaks = seq(0.65, 0.95, 0.05),
    direction = 1,
    palette = "YlGnBu") +
  labs(title = "HDI in Sao Paulo, BR (2010)") +
  theme(# Legend
    legend.position = "bottom",
    legend.key.width = unit(1.7, "cm"),
    legend.text = element_text(size = 11),
    # Increase size and horizontal alignment of the both the title and subtitle
    plot.title = element_text(size = 20,
                              hjust = 0.5,
                              face = "bold"),
    plot.subtitle = element_text(hjust = 0.5))

