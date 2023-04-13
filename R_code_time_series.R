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

TGr <- stack(import)
TGr
plot(TGr)

plotRGB(TGr, 1, 2, 3, stretch="Lin")
plotRGB(TGr, 2, 3, 4, stretch="Lin")
plotRGB(TGr, 4, 3, 2, stretch="Lin")
#difference:
dift<-TGR[[2]]-TGR[[1]]
plot(dift)
cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
plot(TGr, col=cl)

#-----Exercise 2: European NO2
setwd("C:/lab/EN") 

#importing a file
en_first <- raster("EN_0001.png")

cl <- colorRampPalette(c('red','orange','yellow'))(100) #
plot(en_first, col=cl)

rlist<- list.files(pattern="EN")
rimp <- lapply(rlist, raster)
plot(en, col=cl)

#check
par(mfrow=c(1,2))
plot(en_first, col=cl)
plot(en[[1]], col=cl)
#check 2
difcheck<- en_first-en[[1]]
difcheck
plot(difcheck)

#first and last data
par(mfrow=c(1,2))
plot(en_first, col=cl)
plot(en[[13]], col=cl)

difen=en[[1]]-en[[13]]
cldif <- colorRampPalette(c('blue','white','red'))(100) #
plot(difen, col=cldif)

# plotRGB of three files together
plotRGB(en, r=1, g=7, b=13, stretch="lin")
plotRGB(en, r=1, g=7, b=13, stretch="hist")
