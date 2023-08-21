# Packages ####
library(ncdf4)
library(raster)
library(ggplot2)
library(viridis)
library(ggpubr)

setwd("C:/Telerilevamento/")
# get data from: https://land.copernicus.vgt.vito.be/PDF/portal/Application.html#Home

#Dry matter productivity 2010-19####
## load data ####
DMP_2010 <- raster("2010.nc")
DMP_2011 <- raster("2011.nc")
DMP_2012 <- raster("2012.nc")
DMP_2013 <- raster("2013.nc")
DMP_2014 <- raster("2014.nc")
DMP_2015 <- raster("2015.nc")
DMP_2016 <- raster("2016.nc")
DMP_2017 <- raster("2017.nc")
DMP_2018 <- raster("2018.nc")
DMP_2019 <- raster("2019.nc")

##cropping images and creating dataframes####
ext <- c(9.5, 13, 45.5, 47.5)  #coordinates for Trentino-Alto Adige

###2010 ####
DMP_AA_10 <- crop(DMP_2010, ext)
AA_10_df <- as.data.frame(DMP_AA_10, xy = T)
colnames(AA_10_df)

###2011 ####
DMP_AA_11 <- crop(DMP_2011, ext)
AA_11_df <- as.data.frame(DMP_AA_11, xy = T)
colnames(AA_11_df)

###2012 ####
DMP_AA_12 <- crop(DMP_2012, ext)
AA_12_df <- as.data.frame(DMP_AA_12, xy = T)
colnames(AA_12_df)

###2013 ####
DMP_AA_13 <- crop(DMP_2013, ext)
AA_13_df <- as.data.frame(DMP_AA_13, xy = T)
colnames(AA_13_df)

###2014 ####
DMP_AA_14 <- crop(DMP_2014, ext)
AA_14_df <- as.data.frame(DMP_AA_14, xy = T)
colnames(AA_14_df)

###2015 ####
DMP_AA_15 <- crop(DMP_2015, ext)
AA_15_df <- as.data.frame(DMP_AA_15, xy = T)
colnames(AA_15_df)

###2016 ####
DMP_AA_16 <- crop(DMP_2016, ext)
AA_16_df <- as.data.frame(DMP_AA_16, xy = T)
colnames(AA_16_df)

###2017 ####
DMP_AA_17 <- crop(DMP_2017, ext)
AA_17_df <- as.data.frame(DMP_AA_17, xy = T)
colnames(AA_17_df)

###2018 ####
DMP_AA_18 <- crop(DMP_2018, ext)
AA_18_df <- as.data.frame(DMP_AA_18, xy = T)
colnames(AA_18_df)

###2019 ####
DMP_AA_19 <- crop(DMP_2019, ext)
AA_19_df <- as.data.frame(DMP_AA_19, xy = T)
colnames(AA_19_df)

##plotting ####

p10 <- ggplot() +
  geom_raster(AA_10_df,
              mapping = aes(x = x, y = y,
                            fill = Dry.matter.productivity.1KM))+
  theme_classic()+
  scale_fill_gradient(low="whitesmoke", high="green4", limits=c(0, 175))+
  labs(fill="Dry matter productivity (1 km)")+
  ylab("")+
  xlab("")+
  ggtitle("2010")

p11 <- ggplot() +
  geom_raster(AA_11_df,
              mapping = aes(x = x, y = y,
                            fill = Dry.matter.productivity.1KM))+
  theme_classic()+
  scale_fill_gradient(low="whitesmoke", high="green4", limits=c(0, 175))+
  labs(fill="Dry matter productivity (1 km)")+
  ylab("")+
  xlab("")+
  ggtitle("2011")

p12 <- ggplot() +
  geom_raster(AA_12_df,
              mapping = aes(x = x, y = y,
                            fill = Dry.matter.productivity.1KM))+
  theme_classic()+
  scale_fill_gradient(low="whitesmoke", high="green4", limits=c(0, 175))+
  labs(fill="Dry matter productivity (1 km)")+
  ylab("")+
  xlab("")+
  ggtitle("2012")

p13 <- ggplot() +
  geom_raster(AA_13_df,
              mapping = aes(x = x, y = y,
                            fill = Dry.matter.productivity.1KM))+
  theme_classic()+
  scale_fill_gradient(low="whitesmoke", high="green4", limits=c(0, 175))+
  labs(fill="Dry matter productivity (1 km)")+
  ylab("")+
  xlab("")+
  ggtitle("2013")

p14 <- ggplot() +
  geom_raster(AA_14_df,
              mapping = aes(x = x, y = y,
                            fill = Dry.matter.productivity.1KM))+
  theme_classic()+
  scale_fill_gradient(low="whitesmoke", high="green4", limits=c(0, 175))+
  labs(fill="Dry matter productivity (1 km)")+
  ylab("")+
  xlab("")+
  ggtitle("2014")

p15 <- ggplot() +
  geom_raster(AA_15_df,
              mapping = aes(x = x, y = y,
                            fill = Dry.matter.productivity.1KM))+
  theme_classic()+
  scale_fill_gradient(low="whitesmoke", high="green4", limits=c(0, 175))+
  labs(fill="Dry matter productivity (1 km)")+
  ylab("")+
  xlab("")+
  ggtitle("2015")

p16 <- ggplot() +
  geom_raster(AA_16_df,
              mapping = aes(x = x, y = y,
                            fill = Dry.matter.productivity.1KM))+
  theme_classic()+
  scale_fill_gradient(low="whitesmoke", high="green4", limits=c(0, 175))+
  labs(fill="Dry matter productivity (1 km)")+
  ylab("")+
  xlab("")+
  ggtitle("2016")

p17 <- ggplot() +
  geom_raster(AA_17_df,
              mapping = aes(x = x, y = y,
                            fill = Dry.matter.productivity.1KM))+
  theme_classic()+
  scale_fill_gradient(low="whitesmoke", high="green4", limits=c(0, 175))+
  labs(fill="Dry matter productivity (1 km)")+
  ylab("")+
  xlab("")+
  ggtitle("2017")

p18 <- ggplot() +
  geom_raster(AA_18_df,
              mapping = aes(x = x, y = y,
                            fill = Dry.matter.productivity.1KM))+
  theme_classic()+
  scale_fill_gradient(low="whitesmoke", high="green4", limits=c(0, 175))+
  labs(fill="Dry matter productivity (1 km)")+
  ylab("")+
  xlab("")+
  ggtitle("2018")

p19 <- ggplot() +
  geom_raster(AA_19_df,
              mapping = aes(x = x, y = y,
                            fill = Dry.matter.productivity.1KM))+
  theme_classic()+
  scale_fill_gradient(low="whitesmoke", high="green4", limits=c(0, 175))+
  labs(fill="Dry matter productivity (1 km)")+
  ylab("")+
  xlab("")+
  ggtitle("2019")

###plot 10-14 ####
ggarrange(p10, p11, p12, p13, p14, common.legend = TRUE, ncol=5, nrow = 1)

###plot 15-19 ####
ggarrange( p15, p16, p17, p18, p19, common.legend = TRUE, ncol=5, nrow = 1)

##saving plots singularly####
ggsave("2010_DMP.png", plot = p10, width = 2000, height = 1333, units = "px")
ggsave("2011_DMP.png", plot = p11, width = 2000, height = 1333, units = "px")
ggsave("2012_DMP.png", plot = p12, width = 2000, height = 1333, units = "px")
ggsave("2013_DMP.png", plot = p13, width = 2000, height = 1333, units = "px")
ggsave("2014_DMP.png", plot = p14, width = 2000, height = 1333, units = "px")
ggsave("2015_DMP.png", plot = p15, width = 2000, height = 1333, units = "px")
ggsave("2016_DMP.png", plot = p16, width = 2000, height = 1333, units = "px")
ggsave("2017_DMP.png", plot = p17, width = 2000, height = 1333, units = "px")
ggsave("2018_DMP.png", plot = p18, width = 2000, height = 1333, units = "px")
ggsave("2019_DMP.png", plot = p19, width = 2000, height = 1333, units = "px")

#vaia: a closer look####
##load data ####

before_vaia <- raster("vaia_before.nc")
after_vaia <- raster("vaia_after.nc")

#cropping
ndvi_before_vaia <- crop(before_vaia, ext)
ndvi_before_vaia_df <- as.data.frame(ndvi_before_vaia, xy = T)
colnames(ndvi_before_vaia_df)

ndvi_after_vaia <- crop(after_vaia, ext)
ndvi_after_vaia_df <- as.data.frame(ndvi_after_vaia, xy = T)
colnames(ndvi_after_vaia_df)

bv <- ggplot() +
  geom_raster(ndvi_before_vaia_df,
              mapping = aes(x = x, y = y,
                            fill = Normalized.Difference.Vegetation.Index.1km))+
  theme_classic()+
  scale_fill_viridis()+
  labs(fill="NDVI (1 km)")+
  ylab("")+
  xlab("")+
  ggtitle("Before Vaia")

av <- ggplot() +
  geom_raster(ndvi_after_vaia_df,
              mapping = aes(x = x, y = y,
                            fill = Normalized.Difference.Vegetation.Index.1km))+
  theme_classic()+
  scale_fill_viridis()+
  labs(fill="NDVI (1 km)")+
  ylab("")+
  xlab("")+
  ggtitle("After Vaia")

ggsave("bv.png", plot = bv, width = 2000, height = 1333, units = "px")
ggsave("av.png", plot = av, width = 2000, height = 1333, units = "px")


