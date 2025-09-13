library(tidyverse)
install.packages("gganimate")
install.packages("gifski")
install.packages("av")
library(gganimate)
install.packages("babynames")
library(babynames)
install.packages("gapminder")
library(gapminder)
install.packages("viridis")
library(viridis)
library(RColorBrewer)

#keep only 3 names
babynames %>% 
  filter(name %in% c("James","Paul","Andrew", "John")) %>% 
  filter(sex=="M") %>% 
  ggplot(aes(x=year,y=n,group = name,color=name))+
  geom_line(linewidth = 1.5)+
  theme_bw()+
  scale_color_viridis(discrete = TRUE)+
  labs(title="Popularity of names",
       x="",y="", Color="Names")+
  theme(plot.title = element_text(size=10,color = "steelblue"))+
  transition_reveal(year)


anim_save("ffplg.gif") #saved to my documents

library(gapminder)

ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = country)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  facet_wrap(~continent) +
  # Here comes the gganimate specific bits
  labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
  transition_time(year) +
  ease_aes('linear')



library(ggplot2)
library(gganimate)

ggplot(mtcars, aes(factor(cyl), mpg)) +
  geom_boxplot() +
  # Here comes the gganimate code
  transition_states(
    gear,
    transition_length = 2,
    state_length = 1
  ) +
  enter_fade() +
  exit_shrink() +
  ease_aes('sine-in-out')


library(gganimate)

# We'll start with a static plot
p <- ggplot(iris, aes(x = Petal.Width, y = Petal.Length)) +
  geom_point()

plot(p)
anim <- p +
  transition_states(Species,
                    transition_length = 2,
                    state_length = 1)

anim
