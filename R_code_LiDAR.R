#3D in R
setwd("C:/lab/dati/")
library(raster) #"Geographic Data Analysis and Modeling"
library(rgdal) #"Geospatial Data Abstraction Library"
library(viridis)
library(ggplot2)

dsm_2013<- raster("2013Elevation_DigitalElevationModel-0.5m.tif")
               
dsm_2013d<-as.data.frame((dsm_2013,xy=T))
dsm_2013d

ggplot() +
  geom_raster(dsm_2013d, mapping =aes(x=x, y=y, fill=layer)) +
  scale_fill_viridis() +
  ggtitle("dsm_2013")

dtm_2013<-raster("2013Elevation_DigitalTerrainModel-0.5m.tif")                  

drm_2013d<-as.data.frame((dtm_2013,xy=T))
dtm_2013d

ggplot() +
  geom_raster(dtm_2013d, mapping =aes(x=x, y=y, fill=2013Elevation_DigitalTerrainModel-0.5m)) +
  scale_fill_viridis(option="magma") +
  ggtitle("dtm_2013")#modello del terreno


