# DEA - EDA 
###### Mapping National Clandestine Laboratory Register Coordinates

**disclaimer:** R student work

# narrative

I have no idea how I ended up [here](http://www.dea.gov/clan-lab/clan-lab.shtml). 


# methods used and lessons learned (& learning)

After finding the data in PDFs on the DEA's website, I used Tabula to extract them as csvs. For some of the longer PDFs I had to go back to tabula a couple of times because of errant columns.  While this could have been done in `dplyr`, the ease of using Tabula saved time and kept the process consistent for extracting data on each state. Learned not to blindly use automated functions; and that a quick scan of longer PDFs would've saved even more time - rather than going back and re-extracting the same data 2, 3, or more times. 

The data contained fields for County, City, Address, and Date in month/date/year format. Upon importing the data to R, I used `tidyr` to add a 'State' column; then united values for Address, City, and State in to one column called 'Full Address'. From there would only need to call that column to geocode the addresses with `ggmap`. Also separated the month, date, and year into their own columns so that data could be plotted/looked at in finer increments. 

On `geocode()`: 

There may be a conflict with this coordinates in this repository - when I reached my google API limit I'd switch the geocode `source` from 'google' to 'dsk' (the wonderful [Data Science Toolkit](http://www.datasciencetoolkit.org/about), which sources from OpenStreetMap. Looking back, would've preferred to maintain consistency.

Another issue I faced, was that with only two states left to geocode, I realized I probably could have written a function to go through the directory of state .csv files and saved a lot of repeated coding. Well, there's a disclaimer above that says "student work". Also, acquired an API key from google but haven't successfully used it yet. Will circle back when taking on the next geocoding task, which will likely be another [DEA dataset - recently released - on federally licensed 'marihuana' locations across the US](http://birrenbach.com/INSTITUTE/foia/dea/). 

(just as I became curious about a marihuana locations dataset, one magically appeared in my inbox thanks to [Data is Plural](https://tinyletter.com/data-is-plural))

# examples 

Here are a few exploratory spatial data anaylsis plots drafted so far. Not only is the data being explored, but also the tools and techniques within R. 

![Arizona Coordinates](http://pi.mozzarella.website/DEA-EDA/pages/AZ.jpg "Arizona Coordinates")

Arizona clan-lab coordinates mapped with natural resource and water boundaries. Lines represent the Delaunay triangulation and Voronoi diagram of the coordinates. 

# so what about these meth labs? 

Apparently there is an environmental impact from the waste produced in the manufacturing process, which often is dumped illegally in fields or water sources. I've included those in my maps. Highways are being considered, as I imagine it might be possible to get an idea of how these drugs circulate after being produced. Another thought that came to mind was to look at housing price data near these sites - but a cursory search revealed a small industry devoted to this. 

For now, the conclusion might be that my interest is in using this data to learn more about the mathematics behind- and applications of Voronoi tessellations their corresponding Delaunay triangulations. Further, by compiliing and maintaining such data, I'll be able to add it to a growing file on underground cultures and decentralized economies. 

# sources and resources

- [DEA National Clandestine Laboratory Register](http://www.dea.gov/clan-lab/clan-lab.shtml)

- [Tabula](http://tabula.technology/)

- [Flowing Data: shapefile tutorial](http://flowingdata.com/2014/11/20/mapping-data-in-shapefile-format-with-r/)

- [Flowing Data: Voronoi + Delaunay tutorial](http://flowingdata.com/2016/04/12/voronoi-diagram-and-delaunay-triangulation-in-r/) - and it's an incredibly quick one. 

