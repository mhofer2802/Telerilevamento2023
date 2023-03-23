# MY first code in Git Hub
#let´s install the raster package

install.packages("raster")

library(raster)

#Import data setting the working directory
setwd("C:/lab/") #windows

# import
l2011 <- brick("p224r63_2011_masked.grd")
l2011

# plotting the data in a savage manner
plot(l2011)


cl <- colorRampPalette(c("black", "grey", "light grey")) (100)
plot(l2011, col=cl)

#Exercise
cl <- colorRampPalette(c("cyan", "azure", "darkorchid", "aquamarine")) (100)
plot(l2011, col=c1)
#exercise: plot the NIR band
# b1 = blu=cyan
# b2 = verde=azure
# b3 = rosso
# b4 = NIR #infrarosso vicino 

#view of one band
plot(l2011[[4]], col=cl)
plot(l2011$B4_sre, col=cl)

#dev.off() it close graphs

#Explort graphs in R
pdf("myfirstgraph.pdf")
plot(l2011$B4_sre, col=cl)
dev.off()

#plotting several bands in a multiframe
par(mfrow=c(2,1))
plot(l2011[[3]], col=cl)
plot(l2011[[4]], col=cl)

#plotting the first 4 layers/ bands
par(mfrow=c(2,2))
#blue
clb <- colorRampPalette(c("blue4", "blue2", "light blue")) (100)
plot(l2011[[1]], col=clb)
#green
clg <- colorRampPalette(c("darkolivegreen1", "darkolivegreen4", "chartreuse1")) (100)
plot(l2011[[2]], col=clg)
#rosso
clr <- colorRampPalette(c("brown", "brown4", "darkred")) (100)
plot(l2011[[3]], col=clr)
#infrosso
clinf <- colorRampPalette(c("darkorchid4", "darkorchid1", "darkorchid")) (100)
plot(l2011[[4]], col=clinf)

#Exercise: plot the NIR band
plot(l2011[[4]])
plotRGB(l2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(l2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(l2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(l2011, r=3, g=2, b=4, stretch="Lin")

#Exersice: import the 1988 image
setwd("C:/lab/")
l1988 <- brick("p224r63_1988_masked.grd")
l1988
#Exersice: plot in RGB space (natural colours)
plotRGB(l1988, r=3, g=2, b=1, stretch="Lin")
plotRGB(l1988, r=4, g=3, b=2, stretch="Lin")#falso colori
plotRGB(l1988, 4, 3, 2, stretch="Lin")#uguale come quello sopra

#multiframe
par(mfrow=c(2,1))
plotRGB(l1988, 4, 3, 2, stretch="Lin")
plotRGB(l2011, 4, 3, 2, stretch="Lin")
dev.off()

#histogrammi
plotRGB(l1988, 4, 3, 2, stretch="Hist")
plotRGB(l2011, 4, 3, 2, stretch="Hist")

#exersice multiframe with 4 images
par(mfrow=c(2,2))
plotRGB(l1988, 4, 3, 2, stretch="Lin")
plotRGB(l2011, 4, 3, 2, stretch="Lin")
plotRGB(l1988, 4, 3, 2, stretch="Hist")
plotRGB(l2011, 4, 3, 2, stretch="Hist")

