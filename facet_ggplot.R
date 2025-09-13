library(gapminder)

gapminder %>% 
  filter(gdpPercap<40000 & 
           continent!= "Oceania") %>% 
  ggplot(mapping=(aes(x=gdpPercap,y=lifeExp,color=continent)))+
  geom_point(shape="square",alpha=0.4,size=2)+
  labs(title="Life expectancy as a function of wealth",
       x="GDP per capita",
       y="Life expencancy",
       color="Region")+theme_bw()



gapminder %>% 
  filter(gdpPercap<40000 & 
           continent!= "Oceania") %>% 
  ggplot(mapping=(aes(x=gdpPercap,y=lifeExp,color=continent)))+
  geom_point(shape="square",alpha=0.4,size=2)+
  geom_smooth()+
  facet_wrap(~continent)+
  labs(title="Life expectancy as a function of wealth",
       x="GDP per capita",
       y="Life expencancy",
       color="Region")+theme_bw()



gapminder %>% 
  filter(gdpPercap<40000 & 
           continent!= "Oceania") %>% 
  ggplot(mapping=(aes(x=gdpPercap,y=lifeExp,color=year)))+
  geom_point(shape="square",alpha=0.4,size=2)+
  geom_smooth()+
  facet_wrap(~continent,
             nrow=2,
             ncol=2,
             strip.position="bottom")+
  labs(title="Life expectancy as a function of wealth",
       x="GDP per capita",
       y="Life expencancy",
       color="Region")+theme_bw()



gapminder %>% 
  filter(gdpPercap<40000 & 
           continent!= "Oceania") %>% 
  ggplot(mapping=(aes(x=gdpPercap,y=lifeExp,color=year)))+
  geom_density(alpha=0.4,show.legend = F)+
  facet_grid(gdpPercap~lifeExp)+
  facet_wrap(~continent,
             nrow=2,
             ncol=2,
             strip.position="bottom")+
  labs(title="Life expectancy as a function of wealth",
       x="GDP per capita",
       y="Life expencancy",
       color="Region")+theme_bw()
