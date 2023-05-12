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
