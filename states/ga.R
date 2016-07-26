# Georgia - DEA 
# National Clandestine Laboratory Register

# load data -------------------------------------------------------------------

ga <- read.csv("data/GA_GeoLabs.csv")
str(ga)
summary(ga)

# exploratory summaries -------------------------------------------------------

library(ggplot2)
library(RColorBrewer)

# by Year counts, fill by Month
summary(as.factor(ga$Year))

seasonCols <- c("#A50026", "#D73027", "#F46D43", "#FDAE61",
                "#FEE090", "#FFFFBF", "#E0F3F8", "#ABD9E9", 
                "#74ADD1", "#4575B4", "#313695", "#8B0A50" )
  
gaYear <- ggplot(ga, aes(x = Year, fill = as.factor(Month))) +
  geom_bar(stat = "count", position = "dodge") +
  scale_fill_manual(values = seasonCols) +
  scale_x_continuous(limits = c(2004, 2015), breaks = 2004:2015) +
  theme_minimal(base_size = 12, base_family = "HersheySans") +
  theme(plot.margin = unit(c(2, 2, 2, 2), "cm")) +
  labs(title = "Georgia - DEA Clandestine Labs by Year", x = "",
       fill = "month")

gaYear

# by County
# should be interactive
gaCounty <- ggplot(ga, aes(x = as.factor(COUNTY), 
                           fill = as.factor(Month))) +
  geom_bar(stat = "count", position = "dodge") +
  scale_fill_manual(values = seasonCols) +
  theme_minimal(base_size = 12, base_family = "HersheySans") +
  theme(axis.text.x = element_text(size = 8, angle = 45, hjust = 1)) +
  theme(plot.margin = unit(c(2, 2, 2, 2), "cm")) +
  labs(title = "Georgia - DEA Clandestine Labs by County",
       x = "", y = "", fill = "month")

gaCounty

# map coordinates -------------------------------------------------------------

library(rgdal)
library(maptools)
library(mapproj)
library(maps)
library(sp)


# shape lines
admin <- readShapeLines("~/GitHub/dea-clanlabs/data-spatial/GA/ga_admin.shp")
# natural is large - 201 MB
natural <- readShapeLines("~/GitHub/dea-clanlabs/data-spatial/GA/ga_natural.shp")
water <- readShapeLines("~/GitHub/dea-clanlabs/data-spatial/GA/ga_water.shp")

# library(rgdal)
ga.CRS <- CRS(projargs = "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs")
ga.CRS02 <- CRS(projargs = "+proj=aea +lat_1=30 +lat_2=50 +lat_0=40 +lon_0=-125 +x_0=0 +y_0=0 +ellps=WGS84 +datum=WGS84 +units=m +no_defs")

admin02 <- spTransform(admin, ga.CRS02)
water02 <- spTransform(water, ga.CRS02)

# Mercator projection of the WGS84
ga.proj02 <- mapproject(ga$lon, ga$lat, projection = "albers", parameters = c(39, 45))

# plot a map
# GA bounding box coords:
# -85.6051,-80.7514,30.3558, 35.0008
par(mar = c(0, 0, 0, 0), bg = "#FFFFFF")
plot(0, 0, asp = 1, type = "n", bty = "n",
     xlim = c(-85.6051,-80.7514),
     ylim = c(30.3558, 35.0008),
     xlab = "", ylab = "")

lines(admin02, lty = 1, lwd = 0.330, col = "#B8B8B835") # grey82
lines(water02, lty = 1, lwd = 1.0, col = "#00688B35") # deepskyblue4

points(ga.proj02$lon, ga.proj02$lat, pch = 16, col = "#CD262640", cex = 2.8) # firebrick3
points(ga.proj02$lon, ga.proj02$lat, pch = 1, col = "#00000035", cex = 2.8) # grey24


points(ga$lon, ga$lat, pch = 16, col = "#CD262640", cex = 2.8)
points(ga$lon, ga$lat, pch = 1, col = "#00000035", cex = 2.8)




