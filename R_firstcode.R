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

