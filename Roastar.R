# Load packages
library(ggplot2)
library(terra)       # replacement for raster
library(geodata)     # replacement for getData
library(tidyr)
library(dplyr)
library(sf)

# Load WorldClim bioclimatic data (res = 2.5 minutes)
climate <- worldclim_global(var = "bio", res = 2.5, path = tempdir())

# Annual precipitation is bio12
raster <- climate[[12]]

# Crop to South America
raster <- crop(raster, ext(-82, -34, -60, 15))

# Load South America boundaries
samerica <- rnaturalearth::ne_countries(continent = "Asia", returnclass = "sf")

# Convert raster to dataframe
rasdf <- as.data.frame(raster, xy = TRUE, na.rm = TRUE)
colnames(rasdf)[3] <- "bio12"

# Plot
ggplot() +
  geom_raster(aes(x = x, y = y, fill = bio12), data = rasdf) +
  geom_sf(fill = "transparent", data = samerica) +
  scale_fill_viridis_c("mm/yr", direction = -1) +
  coord_sf(expand = c(0, 0)) +
  labs(
    x = "Longitude", y = "Latitude",
    title = "South America's climate map",
    subtitle = "Annual precipitation",
    caption = "Source: WorldClim, 2020"
  ) +
  cowplot::theme_cowplot() +
  theme(
    panel.grid.major = element_line(color = gray(.5),
                                    linetype = "dashed",
                                    size = 0.5),
    panel.grid.minor = element_blank(),
    panel.background = element_rect(fill = NA, color = "black"),
    panel.ontop = TRUE
  )
