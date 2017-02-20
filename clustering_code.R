##############################################
# ISM-WW Technology Workshop                 #
# Classification Example                     #
# Kellen Betts  |  kellen.betts@gmail.com    #
# Date: 9/29/16                              #
##############################################


## Example based on: Foreman, J.W. (2014). Data Smart. Indianopolis, IN: Wiley.


# Install packages
#install.packages("skmeans",dependencies=TRUE)
library(skmeans)


# Import and inspect data
winedata <- read.csv("clustering_data.csv")
dim(winedata)
ncol(winedata)
nrow(winedata)
head(winedata[,1:10])
tail(winedata[,1:10])


# Changing NAs to 0s
winedata[is.na(winedata)] <- 0
head(winedata[,1:10])
winedata[1:10,8:17]
summary(winedata$Adams)


# Tranposing the purchase vectors
winedata.transposed <- t(winedata[,8:length(winedata)])
winedata.transposed[1:10,1:10]


# Clusters
winedata.clusters <- skmeans(winedata.transposed, 5, method="genetic")
winedata.clusters
str(winedata.clusters)


# Inspecting the results
winedata.clusters$cluster[4]
winedata.clusters$cluster[which(row.names(winedata.transposed)=="Wright")]


# Aggregating the data and appending it into the original event details
winedata.clustercounts <- t(aggregate(winedata.transposed,by=list(winedata.clusters$cluster),sum)[,2:33])
winedata.clustercounts[1:5,]
winedata.desc.plus.counts <- cbind(winedata[,1:7],winedata.clustercounts)
winedata.desc.plus.counts[1:5,]
colnames(winedata.desc.plus.counts)[8:12] <- c("Clust1","Clust2","Clust3","Clust4","Clust5")


# Inspecting the results
head(winedata.desc.plus.counts[order(-winedata.desc.plus.counts[,8]),]) # sorting by Cluster 1
head(winedata.desc.plus.counts[order(-winedata.desc.plus.counts[,9]),]) # sorting by Cluster 2


# Aggregating clusters by Varietal
winedata.clustersums <- aggregate("1" ~ Varietal, winedata.desc.plus.counts, sum) 
colnames(winedata.clustersums)[2:6] <- c("Clust1","Clust2","Clust3","Clust4","Clust5")
winedata.clustersums
winedata.clustersums <- cbind(winedata.clustersums,aggregate(Clust2 ~ Varietal, winedata.desc.plus.counts, sum)[,2])
winedata.clustersums <- cbind(winedata.clustersums,aggregate(Clust3 ~ Varietal, winedata.desc.plus.counts, sum)[,2])
winedata.clustersums <- cbind(winedata.clustersums,aggregate(Clust4 ~ Varietal, winedata.desc.plus.counts, sum)[,2])
winedata.clustersums <- cbind(winedata.clustersums,aggregate(Clust5 ~ Varietal, winedata.desc.plus.counts, sum)[,2])
colnames(winedata.clustersums)[2:6] <- c("Clust1","Clust2","Clust3","Clust4","Clust5")
winedata.clustersums


# Plotting the clusters by Varietal
barplot(winedata.clustersums$Clust1, main="Cluster 1", xlab="Varietal", names.arg=winedata.clustersums$Varietal, col="lightblue")
barplot(winedata.clustersums$Clust2, main="Cluster 2", xlab="Varietal", names.arg=winedata.clustersums$Varietal, col="lightblue")
barplot(winedata.clustersums$Clust3, main="Cluster 3", xlab="Varietal", names.arg=winedata.clustersums$Varietal, col="lightblue")
barplot(winedata.clustersums$Clust4, main="Cluster 4", xlab="Varietal", names.arg=winedata.clustersums$Varietal, col="lightblue")
barplot(winedata.clustersums$Clust5, main="Cluster 5", xlab="Varietal", names.arg=winedata.clustersums$Varietal, col="lightblue")


# Exporting the results
write.csv(winedata.desc.plus.counts, file="clustering_results.csv")
