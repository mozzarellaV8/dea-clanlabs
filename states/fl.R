# DEA EDA - Florida
# the National Clandestine Laboratory Register

# load ------------------------------------------------------------------------

library(tidyr)
fl <- read.csv("~/Github/dea-clanlabs/data/FL_GeoLabs.csv", 
               stringsAsFactors = FALSE)
fl <- na.omit(fl)

# plot ------------------------------------------------------------------------

library(maptools)
admin <- readShapeLines("~/GitHub/dea-clanlabs/data-spatial/FL/fl_admin.shp")
coast <- readShapeLines("~/GitHub/dea-clanlabs/data-spatial/FL/fl_coast.shp")
water <- readShapeLines("~/GitHub/dea-clanlabs/data-spatial/FL/fl_water.shp")
natural <- readShapeLines("~/GitHub/dea-clanlabs/data-spatial/FL/fl_natural.shp")

library(rgdal)
fl.CRS <- CRS(projargs = "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs ")
proj4string(admin) <- fl.CRS
proj4string(natural) <- fl.CRS
proj4string(water) <- fl.CRS
summary(admin)

par(mar = c(0, 0, 0, 0), bg = "#000000")
plot(0, 0, asp = 1, type = "n", bty = "n",
     xlim = admin@bbox["x", ],
     ylim = admin@bbox["y", ],
     xlab = "", ylab = "")

lines(admin, lty = 1, lwd = 0.4, col = "#B8B8B865") # grey82
lines(coast, lty = 2, lwd = 0.8, col = "#7AC5CD75") # cadetblue3
lines(natural, lty = 3, lwd = 1.0, col = "#8B4726") # sienna4
lines(water, lty = 3, lwd = 0.8, col = "#009ACD") # deepskyblue3

points(fl$lon, fl$lat, pch = 16, col = "#CD262635", cex = 2.2) # firebrick3
points(fl$lon, fl$lat, pch = 1, col = "#3D3D3D35", cex = 2.2) # grey24

# Voronoi and Delaunay
library(deldir)
flTess <- deldir(fl$lon, fl$lat)
plot(flTess, wlines = "triang", wpoints = "none", number = FALSE, add = TRUE,
     lty = 1, lwd = 0.4, col = "#FFFFFF75")
plot(flTess, wlines = "tess", wpoints = "none", number = FALSE, add = TRUE,
     lty = 2, lwd = 0.6, col = "#FFFFFF85") 

# Orlando-Tampa axis ----------------------------------------------------------
# -83.4412, -80.0629, 27.1031, 29.4683

par(mar = c(0, 0, 0, 0), bg = "#000000")
plot(0, 0, asp = 1, type = "n", bty = "n",
     xlim = c(-83.4412, -80.0629),
     ylim = c(27.1031, 29.4683),
     xlab = "", ylab = "")

lines(admin, lty = 1, lwd = 0.4, col = "#B8B8B8") # grey82
lines(coast, lty = 2, lwd = 0.8, col = "#7AC5CD75") # cadetblue3
lines(natural, lty = 3, lwd = 1.0, col = "#8B4726") # sienna4
lines(water, lty = 3, lwd = 0.8, col = "#009ACD") # deepskyblue3

points(fl$lon, fl$lat, pch = 16, col = "#EE2C2C42", cex = 2.2) # firebrick2
points(fl$lon, fl$lat, pch = 19, col = "#FFFF0035", cex = 0.4) # yellow

plot(flTess, wlines = "triang", wpoints = "none", number = FALSE, add = TRUE,
     lty = 1, lwd = 0.4, col = "#FFFFFF85")
plot(flTess, wlines = "tess", wpoints = "none", number = FALSE, add = TRUE,
     lty = 2, lwd = 0.4, col = "#FFFFFF85") 

# Miami -----------------------------------------------------------------------
# -80.685, -79.9585, 25.3775, 26.2466
par(mar = c(0, 0, 0, 0), bg = "#000000")
plot(0, 0, asp = 1, type = "n", bty = "n",
     xlim = c(-80.685, -79.9585),
     ylim = c(25.3775, 26.2466),
     xlab = "", ylab = "")

lines(admin, lty = 1, lwd = 0.4, col = "#B8B8B8") # grey82
lines(coast, lty = 2, lwd = 0.8, col = "#7AC5CD75") # cadetblue3
lines(natural, lty = 3, lwd = 1.0, col = "#8B4726") # sienna4
lines(water, lty = 3, lwd = 0.8, col = "#009ACD") # deepskyblue3

points(fl$lon, fl$lat, pch = 16, col = "#EE2C2C42", cex = 2.2) # firebrick2
points(fl$lon, fl$lat, pch = 19, col = "#FFFF0035", cex = 0.4) # yellow

plot(flTess, wlines = "triang", wpoints = "none", number = FALSE, add = TRUE,
     lty = 1, lwd = 0.8, col = "#FFFFFF85")
plot(flTess, wlines = "tess", wpoints = "none", number = FALSE, add = TRUE,
     lty = 2, lwd = 0.8, col = "#FFFFFF85") 

# Northern Florida ------------------------------------------------------------