# DEA - EDA 

#### Mapping National Clandestine Laboratory Register Coordinates

_R student work_

#### narrative

I have no idea how I ended up [here](http://www.dea.gov/clan-lab/clan-lab.shtml). 

#### plot example

![Metropolitan Florida](http://pi.mozzarella.website/DEA-EDA/pages/FL.jpg)

Metropolitan subsection of Florida, going from Tampa to Orlando. The opacity of the points is set to 42% when plotted - a very loose, approximate representation of density of laboratories. The choice of black for background was to experiment with color as there will be more plots to come. Excluded city names and other information commonly found on maps as an abstraction - to see if there might be something to be learned from the spatial points and their arrangements. Was loosely thinking of trying to approach the information from a different point of view - in hopes that biases would be reduced. 

#### so, what about these meth labs? 

Apparently there is an environmental impact from the waste produced in the manufacturing process, which often is dumped illegally in fields or water sources. I've included those in my maps. Highways are being considered, as I imagine it might be possible to get an idea of how these drugs circulate after being produced. Another thought that came to mind was to look at housing price data near these sites - but a cursory search revealed a small industry devoted to this...

The most interesting of these to me so far is [Meth Lab Homes](http://methlabhomes.com/), which features news and resources but also receives comments from those affected by or addicted to methamphetamine. 

For now, the conclusion might be that my interest is in using this data to learn more about the mathematics behind- and applications of- Voronoi tessellations and their corresponding Delaunay triangulations. Thinking of Dr. John Snow's cholera map, it might be interesting to map the sphere of influence of these labs using Voronoi. This might follow the idea that views drug production and addiction as illness rather than crime. But there are many shades of gray to the 'addiction as disease' argument - these will need to be addressed. 

Another thought that comes to mind is the active presence of law enforcement and how that varies from state to state. Again, there are many shades of grey when thinking of the relationship between citizens and the law.

Further, by compiliing and maintaining such data, I'll be able to add it to a growing file on underground cultures and decentralized economies. 

#### methods used and lessons learning

After finding the data in PDFs on the DEA's website, I used Tabula to extract them as CSVs. For some of the longer PDFs I had to go back to Tabula a couple of times because of errant columns.  While this could have been done in `dplyr`, the ease of using Tabula saved time and kept the process consistent for extracting data on each state. Learned not to blindly use automated functions; and that a quick scan of longer PDFs would've saved even more time - rather than going back and re-extracting the same data 2, 3, or more times. 

The data contained fields for County, City, Address, and Date in month/date/year format. Used `tidyr` to add a 'State' column; then united values for `Address`, `City`, and `State` in to one column called 'Full Address'. From there would only need to call that column to geocode the addresses with `ggmap`. Also separated the month, date, and year into their own columns so that data could be examined at in finer increments. 

#### on geocoding

`geocode()`: There may be a conflict with this coordinates in this repository - when I reached my google API limit I'd switch the geocode `source` from 'google' to 'dsk' (the wonderful [Data Science Toolkit](http://www.datasciencetoolkit.org/about)), which sources from OpenStreetMap. Looking back, would've preferred to maintain consistency.

Another issue I faced - was that with only two states left to geocode, I realized I probably could have written a function to go through the directory of state .csv files and saved a lot of repeated coding. Well, there's a disclaimer above that says "student work". Also, acquired an API key from google but haven't successfully used it yet. Will circle back when taking on the next geocoding task, which will likely be another DEA dataset - recently released - on [federally licensed 'marihuana' locations across the US](http://birrenbach.com/INSTITUTE/foia/dea/). 

#### coincidentally

On 05.11.2016: just as I became curious about a marihuana locations dataset, one magically appeared in my inbox thanks to [Data is Plural](https://tinyletter.com/data-is-plural). So I started cleaning the set a bit here: [DEA list of organizations licensed to handle marijuana](https://github.com/mozzarellaV8/dea-mj). 


#### sources and resources

- [DEA National Clandestine Laboratory Register](http://www.dea.gov/clan-lab/clan-lab.shtml) - PDFs themselves
- [Tabula](http://tabula.technology/) - for extracting csv files from PDFs
- [Flowing Data: shapefile tutorial](http://flowingdata.com/2014/11/20/mapping-data-in-shapefile-format-with-r/)
- [Flowing Data: Voronoi + Delaunay tutorial](http://flowingdata.com/2016/04/12/voronoi-diagram-and-delaunay-triangulation-in-r/) - and it's an incredibly quick one. 
- [Mapping the 1854 London Cholera Outbreak, Dr. John Snow](https://en.wikipedia.org/wiki/John_Snow#/media/File:Snow-cholera-map-1.jpg) - originally encountered in the work of Edward Tufte.

to look deeper into:

- [Publications: Tamara Munzner](http://www.cs.ubc.ca/~tmm/papers.html)
- [Engineering Statistics Handbook](http://www.itl.nist.gov/div898/handbook/eda/section3/eda33.htm) - sections on EDA

reference:

- [rgdal](https://cran.r-project.org/web/packages/rgdal/rgdal.pdf) - OGR, ShapePolys, accuracy
- [Spatial data in R: Using R as a GIS](https://pakillo.github.io/R-GIS-tutorial/) - PROJ.4 and CRS, googleVis, general workflow
- [Spatial Reference](http://www.spatialreference.org/) - reference for PROJ.4, more