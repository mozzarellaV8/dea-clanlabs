# dea-clanlabs EDA - Colorado
# the National Clandestine Laboratory Register

# load ------------------------------------------------------------------------

library(tidyr)
co <- read.csv("~/GitHub/dea-clanlabs/data/CO_GeoLabs.csv",
               stringsAsFactors = FALSE)
co <- na.omit(co)

# plot ------------------------------------------------------------------------
# Colorado - -109.0603, -102.0409, 36.9924, 41.0034

library(maptools)
admin <- readShapeLines("~/GitHub/dea-clanlabs/data-spatial/CO/co_admin.shp")
natural <- readShapeLines("~/GitHub/dea-clanlabs/data-spatial/CO/co_natural.shp")
water <- readShapeLines("~/GitHub/dea-clanlabs/data-spatial/CO/co_water.shp")

library(rgdal)
co.CRS <- CRS(projargs = "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs ")
proj4string(admin) <- co.CRS
proj4string(natural) <- co.CRS
proj4string(water) <- co.CRS
summary(admin)

library(mapproj)
co.proj <- mapproject(co$lon, co$lat, projection = "mercator")

par(mar = c(0, 0, 0, 0), bg = "grey23")
plot(0, 0, asp = 1, type = "n", bty = "n",
     xlim = c(-109.0603, -102.0409),
     ylim = c(36.9924, 41.0034),
     xlab = "", ylab = "")

lines(admin, lty = 1, lwd = 0.330, col = "#B8B8B830") # grey82
lines(natural, lty = 1, lwd = 1.0, col = "peachpuff") # sienna
lines(water, lty = 1, lwd = 1.0, col = "#00688B") # deepskyblue4

points(co$lon, co$lat, pch = 16, col = "#CD262640", cex = 2.8) # firebrick3
points(co$lon, co$lat, pch = 1, col = "#00000035", cex = 2.8) # grey24

# Voronoi and Delaunay
library(deldir)
coTess <- deldir(co$lon, co$lat)
# white lines for del

plot(coTess, wlines = "triang", wpoints = "none", number = FALSE, add = TRUE,
     lty = 1, lwd = 0.6, col = "#FFFFFF")
plot(coTess, wlines = "tess", wpoints = "none", number = FALSE, add = TRUE,
     lty = 2, lwd = 0.8, col = "burlywood")

# metropolitan cluster --------------------------------------------------------
# -105.109927, -104.600296, 39.614431, 39.914247

par(mar = c(0, 0, 0, 0), bg = "grey90")
plot(0, 0, asp = 1, type = "n", bty = "n",
     xlim = c(-105.109927, -104.600296),
     ylim = c(39.614431, 39.914247),
     xlab = "", ylab = "")

lines(admin, lty = 1, lwd = 0.330, col = "#B8B8B8") # grey82
lines(natural, lty = 1, lwd = 1.0, col = "peachpuff4") # sienna
lines(water, lty = 1, lwd = 1.0, col = "#00688B") # deepskyblue4

points(co$lon, co$lat, pch = 16, col = "#CD262680", cex = 2.8) # firebrick3
points(co$lon, co$lat, pch = 1, col = "#00000070", cex = 2.8) # grey24

# -105.762634, -104.092712, 39.294454, 40.254901 ------------------------------
par(mar = c(0, 0, 0, 0), bg = "grey90")
plot(0, 0, asp = 1, type = "n", bty = "n",
     xlim = c(-105.762634, -104.092712),
     ylim = c(39.294454, 40.204901),
     xlab = "", ylab = "")

lines(admin, lty = 1, lwd = 0.330, col = "#B8B8B8") # grey82
lines(natural, lty = 1, lwd = 1.0, col = "peachpuff4")
lines(water, lty = 1, lwd = 1.0, col = "#00688B") # deepskyblue4

points(co$lon, co$lat, pch = 16, col = "#CD262680", cex = 2.8) # firebrick3
points(co$lon, co$lat, pch = 1, col = "#00000070", cex = 2.8) # grey24

# plot 3 times
plot(coTess, wlines = "triang", wpoints = "none", number = FALSE, add = TRUE,
     lty = 1, lwd = 0.6, col = "#FFFFFF")
plot(coTess, wlines = "tess", wpoints = "none", number = FALSE, add = TRUE,
     lty = 2, lwd = 0.8, col = "burlywood")



