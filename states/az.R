# DEA EDA - Arizona
# the National Clandestine Laboratory Register

# load and tidy ---------------------------------------------------------------
library(tidyr)

az <- read.csv("~/GitHub/dea-clanlabs/data/AZ_GeoLabs.csv",
               stringsAsFactors = FALSE)
az <- separate(az, "DATE", into=c("MONTH", "DATE", "YEAR"))

# plot and tess ---------------------------------------------------------------
# -114.82, 31.33, -109.05, 37.0
# http://boundingbox.klokantech.com/

library(maptools)
admin <- readShapeLines("~/GitHub/dea-clanlabs/data-spatial/AZ/az_admin.shp")
water <- readShapeLines("~/GitHub/dea-clanlabs/data-spatial/AZ/az_water.shp")
natural <- readShapeLines("~/GitHub/dea-clanlabs/data-spatial/AZ/az_natural.shp")

library(rgdal)
az.CRS <- CRS(projargs = "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs ")
proj4string(admin) <- az.CRS
proj4string(water) <- az.CRS
proj4string(natural) <- az.CRS
summary(natural)

par(mar = c(0, 0, 0, 0))
plot(0, 0, type = "n", bty = "n", asp = 1,
     xlim = c(-114.82, -109.05), ylim = c(31.33, 37.0),
     xlab = "", ylab = "")

lines(admin, lty = 1, lwd = 0.375, col = "#B8B8B8") # grey82
lines(natural, lty = 1, lwd = 0.6, col = "#A0522D90") # sienna
lines(water, lty = 1, lwd = 0.8, col = "#009ACD") # deepskyblue3

points(az$LONG, az$LAT, pch = 16, col = "#CD262665", cex = 2.0) # firebrick3
points(az$LONG, az$LAT, pch = 1, col = "#00000040", cex = 2.0) 
points(az$LONG, az$LAT, pch = 16, col = "#00000075", cex = 0.375)

# Voronoi and Delaunay

library(deldir)
azTess <- deldir(az$LONG, az$LAT)
plot(azTess, wlines = "triang", wpoints = "none", number = FALSE, add = TRUE,
     col = "#00000090", lty = 1, lwd = 0.8)
plot(azTess, wlines = "tess", wpoints = "none", number = FALSE, add = TRUE,
     col = "#CD0000", lty = 2, lwd = 0.6)

# Metropolitan Macro ----------------------------------------------------------
# -113.3926, -110.9976, 32.6024, 34.2004 - Phoenix Metro

par(mar = c(0, 0, 0, 0))
plot(0, 0, type = "n", bty = "n", asp = 1,
     xlim = c(-113.3926, -110.9976), 
     ylim = c(32.6024, 34.2004),
     xlab = "", ylab = "")

lines(admin, lty = 1, lwd = 0.4, col = "#B8B8B8") # grey82
lines(natural, lty = 1, lwd = 1.0, col = "#A0522D") # sienna
lines(water, lty = 1, lwd = 0.6, col = "#009ACD") # deepskyblue3

points(az$LONG, az$LAT, pch = 16, col = "#CD262665", cex = 2.0) # firebrick3
points(az$LONG, az$LAT, pch = 1, col = "#00000075", cex = 2.0) 

plot(azTess, wlines = "triang", wpoints = "none", number = FALSE, add = TRUE,
     col = "#00000090", lty = 1, lwd = 1.0)
plot(azTess, wlines = "tess", wpoints = "none", number = FALSE, add = TRUE,
     col = "#CD0000", lty = 2, lwd = 0.6)

# -112.2885, -111.6513, 33.2731, 33.6924 --------------------------------------

par(mar = c(0, 0, 0, 0))
plot(0, 0, type = "n", bty = "n", asp = 1,
     xlim = c(-112.2885, -111.6513), 
     ylim = c(33.2731, 33.6924),
     xlab = "", ylab = "")

lines(admin, lty = 1, lwd = 0.4, col = "#B8B8B8") # grey82
lines(natural, lty = 1, lwd = 1.0, col = "#A0522D") # sienna
lines(water, lty = 1, lwd = 0.6, col = "#009ACD") # deepskyblue3

points(az$LONG, az$LAT, pch = 16, col = "#CD262665", cex = 2.0) # firebrick3
points(az$LONG, az$LAT, pch = 1, col = "#00000075", cex = 2.0) 

plot(azTess, wlines = "triang", wpoints = "none", number = FALSE, add = TRUE,
     col = "#00000090", lty = 1, lwd = 1.0)
plot(azTess, wlines = "tess", wpoints = "none", number = FALSE, add = TRUE,
     col = "#CD0000", lty = 2, lwd = 0.6)

# true Phoenix: -112.324056, -111.926046, 33.29026, 33.92057 ------------------

plot(0, 0, type = "n", bty = "n", asp = 1,
     xlim = c(-112.324056, -111.926046), 
     ylim = c(33.29026, 33.92057),
     xlab = "", ylab = "")

lines(admin, lty = 1, lwd = 0.4, col = "#B8B8B8") # grey82
lines(natural, lty = 1, lwd = 1.0, col = "#A0522D") # sienna
lines(water, lty = 1, lwd = 0.6, col = "#009ACD") # deepskyblue3

points(az$LONG, az$LAT, pch = 16, col = "#CD262665", cex = 2.0) # firebrick3

plot(azTess, wlines = "triang", wpoints = "none", number = FALSE, add = TRUE,
     col = "#00000090", lty = 1, lwd = 1.0)
plot(azTess, wlines = "tess", wpoints = "none", number = FALSE, add = TRUE,
     col = "#CD0000", lty = 2, lwd = 0.6)