# MY first code in Git Hub
#let´s install the raster package

install.packages("raster")

library(raster)

#Import data setting the working directory
setwd("C:/lab/") #windows

# import
l2011 <- brick("p224r63_2011_masked.grd")
l2011

# plot
plot(l2011)
