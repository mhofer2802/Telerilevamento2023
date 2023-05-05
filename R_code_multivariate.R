library(raster)
library(ggplot2)
library(viridis)
library (patchwork)
#setwd("~/lab/") # Linux
setwd("C:/lab/") # Windows
# setwd("/Users/name/Desktop/lab/") # Mac

sen <- brick("sentinel.png")
sen
plot(sen)

sen2 <- stack(sen[[1]], sen[[2]], sen[[3]])
plot(sen2)

pairs(sen2)

# PCA (Principal Component Analysis)
sample <- sampleRandom(sen2, 10000)
sample

pca <- prcomp(sample)
# variance explained
summary(pca)
plot(pca)#to look at explained variabilities

# pc map
pci<-predict(sen2, pca, index=c(1:3)
pcs<- predict(sen2, pca, index=c(1:2))

# ggplot
pcid <- as.data.frame(pci[[1]], xy=T) #list of banda1

ggplot() +
geom_raster(pcid, mapping = aes(x=x, y=y, fill=PC1)) +
scale_fill_viridis()

#exerciese
pcid3 <- as.data.frame(pci[[3]], xy=T) #list of banda3

ggplot() +
geom_raster(pcid3, mapping = aes(x=x, y=y, fill=PC3)) +
scale_fill_viridis()

#patchwork: multiframe
pci1<- as.data.frame(pci[[1]], xy=T)
pci3<- as.data.frame(pci[[3]], xy=T)

plot1<- ggplot() +
  geom_raster(pci1, mapping = aes(x=x, y=y, fill=PC1)) +
  scale_fill_viridis() +
  ggtitle("principal Component1")
plot3<- ggplot() +
  geom_raster(pci3, mapping = aes(x=x, y=y, fill=PC3)) +
  scale_fill_viridis() +
  ggtitle("principal Component3")
plot1+plot3


#calcolating the standard deviation of PC1
sd3 <- focal(pci[[1]], matrix(1/9, 3, 3), fun=sd)

#patchwork of PC1 and its standard deviation
sd3d <- as.data.frame(sd3, xy=T)
sd3d
sd3
names(sd3d)#per sapere il fill
plotsd<-ggplot() +
  geom_raster(sd3d, mapping =aes(x=x, y=y, fill=layer)) +
  scale_fill_viridis() +
  ggtitle("Standard deviation of PC1 (3x3)")
plot1+plotsd

#exercise: change viridis scale ramp
plot1v<- ggplot() +
  geom_raster(pci1, mapping = aes(x=x, y=y, fill=PC1)) +
  scale_fill_viridis() +
  ggtitle("principal Component1")
plotsdv<-ggplot() +
  geom_raster(sd3d, mapping =aes(x=x, y=y, fill=layer)) +
  scale_fill_viridis() +
  ggtitle("Standard deviation of PC1 (3x3)")
plot1v+plotsdv


