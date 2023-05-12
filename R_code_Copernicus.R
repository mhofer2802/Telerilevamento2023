#R code for downloading and visualizing Copernicus data

#install.packages("ncdf4")
library(ncdf4)
library(raster)

setwd("C:/lab/") #Windows

#register and downloaad
#https://land.copernicus.vgt.vito.be/PDF/portal/Application.html

#dataset: c_gls_SSM1km_202305090000_CEURO_S1CSAR_V1.2.1.nc

ssoil <- raster("c_gls_SSM1km_202305090000_CEURO_S1CSAR_V1.2.1.nc")#un solo strato

ssoil
plot(ssoil)

scd<-as.data.frame(ssoil,xy=T)
head(scd)

ggplot() + 
  geom_raster(scd, mapping=aes(x=x, y=y, fill=Surface.Soil.Moisture)) +
  ggtitle("Soil Moisture from Copernicus")


#Cropping an image
ext<- c(23,30,62,68)
sc.crop<-crop(ssoil, ext)#nome del datum e estenzione che e ext
sc.crop
plot(sc.crop)
sc.cropdatafram<-as.data.frame(sc.crop,xy=T)
head(sc.cropdatafram)
ggplot() +
  geom_raster(sc.cropdatafram, mapping=aes(x=x, y=y, fill=Surface.Soil.Moisture))
# with viridis
ggplot() +
  geom_raster(sc.cropdatafram, mapping=aes(x=x, y=y, fill=Surface.Soil.Moisture)) +
  scale_fill_viridis(option= "cividis")

  
  
