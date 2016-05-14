# DEA - EDA 

#### Mapping National Clandestine Laboratory Register Coordinates

_R student work_

- [notes](dea-clanlabs/notes.md) - process and extended thoughts/commmentary on data
- [states](dea-clanlabs/states/) - R scripts for plotting coordinates
- [data](dea-clanlabs/data) - CSVs of lab coordinates by state 
- [sources and resources](https://github.com/mozzarellaV8/dea-clanlabs#sources-and-resources)

#### narrative

I have no idea how I ended up [here](http://www.dea.gov/clan-lab/clan-lab.shtml). 

#### examples 

A few exploratory spatial data anaylsis plots drafted - just for a quick sense of things to do with the the data. Legends and text were quickly added later in InDesign.

![Arizona Coordinates](http://pi.mozzarella.website/DEA-EDA/pages/AZ-H.jpg "Arizona Coordinates")

![AZ-Phoenix Coordinates](http://pi.mozzarella.website/DEA-EDA/pages/AZ-PHX.jpg "Phoenix Coordinates")

Arizona clan-lab coordinates mapped with natural resource and water boundaries. The black solid- and red dashed- lines represent the Delaunay triangulation and Voronoi diagram of the coordinates, respectively. The most dense cluster forms around the greater Phoenix metropolitan area. 

![Metropolitan Florida](http://pi.mozzarella.website/DEA-EDA/pages/FL.jpg)

The Tampa and Orlando metropolitan areas of Florida, mapped on black as a test. The opacity of the points is set to 42% when plotted - a very loose, approximate representation of density of laboratories.

#### sources and resources

- [DEA National Clandestine Laboratory Register](http://www.dea.gov/clan-lab/clan-lab.shtml) - the original PDFs
- [Tabula](http://tabula.technology/) - for extracting csv files from PDFs
- [Flowing Data: shapefile tutorial](http://flowingdata.com/2014/11/20/mapping-data-in-shapefile-format-with-r/)
- [Flowing Data: Voronoi + Delaunay tutorial](http://flowingdata.com/2016/04/12/voronoi-diagram-and-delaunay-triangulation-in-r/) - an incredibly quick one. 
- [Mapping the 1854 London Cholera Outbreak, Dr. John Snow](https://en.wikipedia.org/wiki/John_Snow#/media/File:Snow-cholera-map-1.jpg) - originally encountered in the work of Edward Tufte.

to look deeper into:

- [Publications: Tamara Munzner](http://www.cs.ubc.ca/~tmm/papers.html)
- [Engineering Statistics Handbook](http://www.itl.nist.gov/div898/handbook/eda/section3/eda33.htm) - sections on EDA

reference:

- [rgdal](https://cran.r-project.org/web/packages/rgdal/rgdal.pdf) - OGR, ShapePolys, accuracy
- [Spatial data in R: Using R as a GIS](https://pakillo.github.io/R-GIS-tutorial/) - PROJ.4 and CRS, googleVis, general workflow
- [Spatial Reference](http://www.spatialreference.org/) - reference for PROJ.4, more