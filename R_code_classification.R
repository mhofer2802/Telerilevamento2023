#classification of remote sensing data via RStoolbox

#Installing devools (fuori dal CRAN)
install.packages("devtools")
library(devtools)
#devtools::install_github("bleutner/RStoolbox")
library(RStoolbox)



library(raster)
setwd("C:/lab/")
so<-brick(Solar_Orbiter_s_first_views_of_the_Sun_pillars)

plotRGB(so, 1, 2, 3, stretch="lin")
plotRGB(so, 1, 2, 3, stretch="hist")
