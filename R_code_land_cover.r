library(raster)
# install.packages("ggplot2")
library(ggplot2)
# install.packages("patchwork")
library(patchwork) # for multiframe ggplot plotting

# setwd("~/lab/") # Linux
setwd("C:/lab/") # Windows
# setwd("/Users/name/Desktop/lab/") # Mac

# NIR 1, RED 2, GREEN 3

defor1 <- brick("defor1_.png")
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")

defor2 <- brick("defor2_.png")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

par(mfrow=c(1,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")


# unsupervised classification

# defor1
# 1. Get all the single values
singlenr1 <- getValues(defor1)
singlenr1
#
# set.seed(99)

# 2. Classify
kcluster1 <- kmeans(singlenr1, centers = 3)
kcluster1

# 3. Set values to a raster on the basis of so
defor1class <- setValues(defor1[[1]], kcluster1$cluster) # assign new values to a raster object

cl <- colorRampPalette(c('yellow','black','red'))(100)
plot(defor1class, col=cl)
# class 1: forest
# class 2: agriculture

# set.seed() would allow you to attain the same results ...

# defor2
# 1. Get all the single values
singlenr2 <- getValues(defor2)
singlenr2
#
# set.seed(99)

# 2. Classify
kcluster2 <- kmeans(singlenr2, centers = 3)
kcluster2
