if (!require("tidyverse")) {
  install.packages("tidyverse")
}

if (!require("reshape2")) {
  install.packages("reshape2")
}

library(tidyverse)
library(reshape2)

activityNames<-read.table("activity_labels.txt")[,2]
activityNumberToName <- function(activityNumber){
  activityNames[activityNumber]
}
features<-read.table("features.txt")[,2]
testSet<-read.table("test/X_test.txt", col.names = features)
trainSet<-read.table("train/X_train.txt", col.names = features)
testLabels<-read.table("test/Y_test.txt", col.names = c("Activity"))
trainLabels<-read.table("train/Y_train.txt", col.names = c("Activity"))
testLabels[]<-lapply(testLabels, activityNumberToName)
trainLabels[]<-lapply(trainLabels, activityNumberToName)
testSubject<-read.table("test/subject_test.txt", col.names = c("Subject"))
trainSubject<-read.table("train/subject_train.txt", col.names = c("Subject"))
testSet<-cbind(testSubject,testLabels,testSet)
trainSet<-cbind(trainSubject,trainLabels,trainSet)
allData<-rbind(testSet,trainSet)
allData<- allData %>% select(contains("Subject") | contains("Activity") | contains("mean") | contains("std"))
idLabels   <- c("Subject", "Activity")
dataLabels <- setdiff(colnames(allData),idLabels)
allDataMelted<- melt(allData, id = idLabels, measure.vars = dataLabels)
dataAverages<- dcast(allDataMelted, Subject + Activity ~ variable, mean)
write.table(dataAverages, file = "./tidyData.txt")
