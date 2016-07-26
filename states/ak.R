# DEA - EDA
# the National Clandestine Laboratory Register
# Alaska

library(tidyr)
alaska <- read.csv("~/Github/dea-clanlabs/data/AK-GeoLabs.csv",
                   stringsAsFactors = FALSE)
AK <- separate(alaska, DATE, into=c("Month", "Day", "Year"), sep="/")

library(dplyr)
AK <- select(AK, COUNTY, ADDRESS, Month, Day, Year, LAT, LONG)

# Points without boundaries ---------------------------------------------------
library(maptools)

par(mar=c(0, 0, 0, 0))
plot(AK$LONG, AK$LAT, type="n", bty="n", 
     asp=1, axes=FALSE, xlab="", ylab="")
points(AK$LONG, AK$LAT, pch=16, col="#CD262685", cex = 1.2)

# Shapefiles and Plot ---------------------------------------------------------
# -179.91,50.01,-128.23,71.77
admin <- readShapeLines("~/Github/dea-clanlabs/data-spatial/AK/ak_admin.shp")
coast <- readShapeLines("~/Github/dea-clanlabs/data-spatial/AK/ak_coast.shp")
natural <- readShapeLines("~/Github/dea-clanlabs/data-spatial/AK/ak_natural.shp")

library(rgdal)
ak.CRS <- CRS(projargs = "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs ")
proj4string(admin) <- ak.CRS
summary(admin)

par(mar=c(0, 0, 0, 0))
plot(0, 0, asp = 1,
     type="n", bty = "n", 
     xlim= admin@bbox["x", ], 
     ylim= admin@bbox["y", ],
     xlab=NA, ylab=NA)

lines(admin, lwd = 1, col = "#B8B8B8")
lines(natural, lwd = 0.6, col = "#CDAF95")
lines(coast, lwd = 0.8, col = "#4682B440")

points(AK$LONG, AK$LAT, pch=16, col="#CD262645", cex = 2.2)
points(AK$LONG, AK$LAT, pch=1, col="#00000030", cex = 2.2)

# Voronoi and Delaunay
library(deldir)
akDel <- deldir(AK$LONG, AK$LAT)
plot(akDel, wlines = "tess", wpoints = "none", number = FALSE, add = TRUE, 
     lty = 2, col = "#104E8B")
plot(akDel, wlines = "triang", wpoints = "none", number = FALSE, add = TRUE, 
     lty = 1, col = "#B22222")

# Metropolitan Area Macro------------------------------------------------------
# -152.276, 60.1852, -146.7719, 62.3802 - Anchorage-Wasilla-Palmer
# via boundingbox.klokantech.com

par(mar=c(0, 0, 0, 0))
plot(0, 0, type="n", axes=FALSE, 
     xlim=c(-152.276, -147.1719), 
     ylim=c(60.1852, 62.3802),
     xlab=NA, ylab=NA)

lines(admin, lwd = 0.4, col = "#B8B8B8")
lines(natural, lwd = 0.6, col = "#CDAF95")
lines(coast, lwd = 0.8, col = "#4682B475")

points(AK$LONG, AK$LAT, pch=16, col="#CD262665", cex = 2.2)
points(AK$LONG, AK$LAT, pch=1, col="#00000080", cex = 2.2)

# Voronoi and Delaunay

plot(akDel, wlines = "tess", wpoints = "none", number = FALSE, add = TRUE, 
     lty = 2, col = "#0000EE")
plot(akDel, wlines = "triang", wpoints = "none", number = FALSE, add = TRUE, 
     lty = 1, col = "#CD0000")
