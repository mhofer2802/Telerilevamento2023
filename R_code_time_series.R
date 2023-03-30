#R code for importing and analysing several images
library(raster)
setwd("C:/lab/greenland") # Windows

lst_2000<-raster("lst_2000.tif")
plot(lst_2000)

#exercise: import all the data
lst_2005 <- raster("lst_2005.tif")
lst_2010 <- raster("lst_2010.tif")
lst_2015 <- raster("lst_2015.tif")

ls()#se sono scaricate tutto

# list f files (la lista di tutte le immagine):
rlist <- list.files(pattern="lst")
rlist
import <- lapply(rlist,raster)
import
