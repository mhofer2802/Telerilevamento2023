#R code for species distribution modelling
# Species Distribution Modelling

#install.packages("sdm")
# install.packages("rgdal", dependencies=T)

library(sdm)
library(raster) # predictors
library(rgdal) # species


file <- system.file("external/species.shp", package="sdm")
species <- shapefile(file)

# looking at the set
species

# plot
plot(species)

# looking at the occurrences
species$Occurrence

presencees<-species[species$Occurrence == 1,]#solo le presenze 
presencees#94 presenze
plot(presencees, col="blue", pch=19)

absences<-species[species$Occurrence == 0,]#solo le absenze 
absences#106assenze
plot(absences, col="red", pch=19)
#plots together pres and abs
plot(presencees, col="blue", pch=19)
points(absences,col="red", pch=19)


# predictors: look at the path
path <- system.file("external", package="sdm")

# list the predictors
lst <- list.files(path=path,pattern='asc$',full.names = T) #
lst

# stack
preds <- stack(lst)
plot(preds)

# plot preds
cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl)
#plot presences
plot(preds$elevation, col=cl)
points(presencees, pch=19)

plot(preds$temperature, col=cl)
points(presencees, pch=19)

plot(preds$precipitation, col=cl)
points(presencees, pch=19)

plot(preds$vegetation, col=cl)
points(presencees, pch=19)

# model

# set the data for the sdm
datasdm <- sdmData(train=species, predictors=preds)

# model
m1 <- sdm(Occurrence ~ elevation + precipitation + temperature + vegetation, data=datasdm, methods = "glm")

# make the raster output layer
p1 <- predict(m1, newdata=preds)

# plot the output
plot(p1, col=cl)
points(species[species$Occurrence == 1,], pch=16)

# add to the stack
s1 <- stack(preds,p1)
plot(s1, col=cl)

# Do you want to change names in the plot of the stack?
# Here your are!:
# choose a vector of names for the stack, looking at the previous graph, qhich are:
names(s1) <- c('elevation', 'precipitation', 'temperature', 'vegetation', 'model')
# and then replot!:
plot(s1, col=cl)
# you are done, with one line of code (as usual!)
