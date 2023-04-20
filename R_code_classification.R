#classification of remote sensing data via RStoolbox

#Installing devools 
install.packages("devtools")
library(devtools)
#devtools::install_github("bleutner/RStoolbox")
library(RStoolbox)#(fuori dal CRAN--> problem?)



library(raster)
setwd("C:/lab/")
so<-brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

plotRGB(so, 1, 2, 3, stretch="lin")
plotRGB(so, 1, 2, 3, stretch="hist")


# 1. Get all the single values
singlenr <- getValues(so)
singlenr
# set.seed(99)

# 2. Classify
kcluster <- kmeans(singlenr, centers = 3)
kcluster

# 3. Set values to a raster on the basis of so
soclass <- setValues(so[[1]], kcluster$cluster) # assign new values to a raster object
#plot la classificazione
cl <- colorRampPalette(c('yellow','black','red'))(100)
plot(soclass, col=cl)
#class 2(nero): highest energy level
#class 1(giallo): lowest energy level
#class 3 (rosso): medium energy level

frequencies<- freq(soclass)
tot = 2221440
percentages = frequencies * 100 /  tot
percentages
#class 2(nero): highest energy level: 21.21%
#class 1(giallo): lowest energy level:37.33%
#class 3 (rosso): medium energy level:41.45%

#----Gand Canyon exercise
gc<-brick("dolansprings_oli_2013088_canyon_lrg.jpg")
plotRGB(gc, r=1, g=2, b=3, stretch="lin")

#the image is quite big
gcc<- crop(gc, drawExtent())
gcc
plotRGB(gc, r=1, g=2, b=3, stretch="lin")
ncell(gcc)#nummero di pixel

#1. get values
singlenr <- getValues(gcc)
singlenr
# 2. Classify
kcluster <- kmeans(singlenr, centers = 3)
kcluster
# 3. Set values
gcclass <- setValues(gcc[[1]], kcluster$cluster) # assign new values to a raster object
cl <- colorRampPalette(c('yellow','black','red'))(100)
plot(gcclass, col=cl)
#classe1=giallo:sandstone
#classe2=nero:coglomerates
#classe3=red:volcanic rocks

frequencies <- freq(gcclass)
tot = 58076148
total<-ncell(gcclass)
percentages = frequencies * 100 /  tot
