<<<<<<< HEAD
# data visualisation


#data
# mapping(aesthetics)
# geometric representation
# statistics
# facet
# coordinate space
# labeles
# theme


install.packages("tydiverse")
data()


#part 1 
BOD
ggplot(data=BOD,
      mapping= aes(x= Time,
                   y=demand))+geom_point(size=5)+  #adds point   
  geom_line(color="Red") #adds line 




#part 2 using function 
ggplot(BOD,aes(Time,demand))+geom_point(size=2)+geom_line(color="red")


#part3 using CO2
head(CO2)
CO2 %>% 
  ggplot(aes(conc,uptake, color= Treatment))+
  geom_point(size=3, alpha=0.54)+
  geom_smooth(method=lm, se=F)+
  facet_wrap(~Type)+
  labs(title = "Concentration of CO2")+
  theme_bw()


CO2 %>% 
  ggplot(aes(Treatment,uptake, color= Treatment))+
  geom_boxplot()+
  facet_wrap(~Type,nrow=1)+
  geom_point(alpha=0.5,aes(size=conc))+
  geom_smooth(method=lm)+
  coord_flip()+
  theme_bw()+
  labs(title="CHilled non chilled", x= "Treatment",y="Uptake",)


install.packages("tidyverse")
library(tidyverse)
install.packages("rmarkdown")
library(rmarkdown)
install.packages("readxl")
library(readxl)
install.packages("dplyr")
library(dplyr)
install.packages("tidyr")
library(tidyr)
install.packages("lubridate")
library(lubridate)
install.packages("reshape2")
library(reshape2)
install.packages("ggthemes")
library (ggthemes)
install.packages("ggpubr")
library(ggpubr)
install.packages("plotrix")
library(plotrix)
install.packages("scales")
library(scales)

#printing dataframe
print(gapl151618_wetCS)

gapl151618_wetCS <- data.frame(stringsAsFactors=FALSE,
                               N_ug_m2_h = c(0.59172415, 0.79847845, -2.02633456, 2.038778, -1.19586851,
                                             0.00776147, 6.995, 7.97983333, 2.98933333, -1.65866667,
                                             5.52157486, 5.05983333, 7.28733333, 3.82466667, 0.3075, -0.09014181),
                               se_graph = c(1.1529715, 0.5764257, -1.8041389, 2.2450879, -1.9191906,
                                            0.5356943, 2.252432, 2.6705785, 2.3721254, -1.1795099,
                                            1.4964004, 3.2670861, 1.5233716, 3.5809984, 1.4447466, -3.8432439),
                               Date = as.Date(c("2018-06-15", "2018-07-01", "2018-09-19", "2018-06-15",
                                                "2018-07-01", "2018-09-19", "2016-07-07", "2016-07-18",
                                                "2016-08-01", "2016-08-15", "2015-08-06", "2016-07-07", "2016-07-18",
                                                "2016-08-01", "2016-08-15", "2015-08-06")),
                               Trt = c("C", "C", "C", "S", "S", "S", "C", "C", "C", "C", "C", "S",
                                       "S", "S", "S", "S"),
                               Year = c(2018, 2018, 2018, 2018, 2018, 2018, 2016, 2016, 2016, 2016,
                                        2015, 2016, 2016, 2016, 2016, 2015)
)


#creating plot
ggplot(gapl151618_wetCS, aes(x=Date , y=N_ug_m2_h, fill=Trt))+
  geom_hline (yintercept=0, color = "black", linetype = 3 ) +
  facet_wrap(~Year, scales = "free_x") +
  geom_bar(position = position_dodge2 (width = 1), stat = "identity", colour="black", size=.3) +
  geom_errorbar(aes(ymin=N_ug_m2_h, ymax=N_ug_m2_h+se_graph, group = Trt), position = position_dodge2 ()) +
  ylab(expression(~mu~g~N[2]*O-N~~m^{-2}~h^{-1})) +
  xlab("Date") +
  ggtitle(expression(N[2]*O~fluxes~wet~tundra~2015~","~2016~and~2018))


ggplot(gapl151618_wetCS, aes(x= as.factor(Date), y=N_ug_m2_h, fill=Trt))+
  geom_hline (yintercept=0, color = "black", linetype = 3 ) +
  facet_grid(~Year, scales="free", space = "free") +
  geom_bar(position = position_dodge2 (width = 1), stat = "identity", colour="black", size=.3) +
  geom_errorbar(aes(ymin=N_ug_m2_h, ymax=N_ug_m2_h+se_graph, group = Trt), position = position_dodge2 ()) +
  ylab(expression(~mu~g~N[2]*O-N~~m^{-2}~h^{-1})) +
  xlab("Date") +
  ggtitle(expression(N[2]*O~fluxes~wet~tundra~2015~","~2016~and~2018))
=======
# data visualisation


#data
# mapping(aesthetics)
# geometric representation
# statistics
# facet
# coordinate space
# labeles
# theme


install.packages("tydiverse")
data()


#part 1 
BOD
ggplot(data=BOD,
      mapping= aes(x= Time,
                   y=demand))+geom_point(size=5)+  #adds point   
  geom_line(color="Red") #adds line 




#part 2 using function 
ggplot(BOD,aes(Time,demand))+geom_point(size=2)+geom_line(color="red")


#part3 using CO2
head(CO2)
CO2 %>% 
  ggplot(aes(conc,uptake, color= Treatment))+
  geom_point(size=3, alpha=0.54)+
  geom_smooth(method=lm, se=F)+
  facet_wrap(~Type)+
  labs(title = "Concentration of CO2")+
  theme_bw()


CO2 %>% 
  ggplot(aes(Treatment,uptake, color= Treatment))+
  geom_boxplot()+
  facet_wrap(~Type,nrow=1)+
  geom_point(alpha=0.5,aes(size=conc))+
  geom_smooth(method=lm)+
  coord_flip()+
  theme_bw()+
  labs(title="CHilled non chilled", x= "Treatment",y="Uptake",)




# another data 
###############################################################################
# Load required libraries
library(readxl)
library(dplyr)
library(ggplot2)
library(plotly)
library(scales)
################################################################################
# Read Beveridge Wheat Price data from the original source
url <- "https://www.ime.usp.br/~pam/beveridge.xls"
tmp_file <- tempfile(fileext = ".xls")
download.file(url, destfile = tmp_file, mode = "wb")
df <- read_excel(tmp_file, col_names = FALSE)

# Read the data from your computer
df <- read_excel("beveridge.xls")
################################################################################
# Prepare data
colnames(df) <- c("Year", "Wheat_Price")
df <- df %>%
  mutate(
    Year = as.integer(Year),
    Wheat_Price = as.numeric(Wheat_Price)  # 🔁 This is essential
  ) %>%
  filter(!is.na(Year), !is.na(Wheat_Price)) %>%
  mutate(
    Period = cut(
      Year,
      breaks = c(1499, 1600, 1700, 1800, 1870),
      labels = c("1500–1600", "1601–1700", "1701–1800", "1801–1869")
    )
  )


################################################################################
# Build the ggplot object
g <- ggplot(df, aes(x = Year, y = Wheat_Price, color = Period)) +
  geom_point(alpha = 0.7, size = 2) +
  geom_smooth(method = "lm", se = FALSE, size = 1.2, linetype = "solid") +
  scale_color_brewer(palette = "Dark2") +
  scale_y_continuous(labels = comma) +
  labs(
    title = "Beveridge Wheat Price Index (1500–1869)",
    subtitle = "With Linear Trend Lines by Historical Period",
    x = "Year",
    y = "Wheat Price Index",
    color = "Period"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", size = 20),
    plot.subtitle = element_text(size = 16),
    axis.title = element_text(size = 16),
    axis.text = element_text(size = 14),
    legend.title = element_text(size = 15),
    legend.text = element_text(size = 13)
  )


################################################################################
# Plot the figure
plot(g)


################################################################################
# Save the figure as PNG file
ggsave("Time-Series_Interactive_500dpi.png", 
       plot = g, dpi = 500, width = 18, height = 10, bg = "white")  # Save the plot with 500 DPI and dark black labels


