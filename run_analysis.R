library(dplyr)
library(data.table)


##load initial data
featureLabels <- read.table("UCI-HAR-Dataset/features.txt")
activityLabels <- read.table("UCI-HAR-Dataset/activity_labels.txt")

featuresTrain<-read.table("UCI-HAR-Dataset/train/X_train.txt", col.names = featureLabels$V2)
activitiesTrain<-read.table("UCI-HAR-Dataset/train/Y_train.txt", col.names = c("activity"))
subjectsTrain<-read.table("UCI-HAR-Dataset/train/subject_train.txt", col.names = c("subject_id"))

featuresTest<-read.table("UCI-HAR-Dataset/test/X_test.txt", col.names = featureLabels$V2)
activitiesTest<-read.table("UCI-HAR-Dataset/test/Y_test.txt", col.names = c("activity"))
subjectsTest<-read.table("UCI-HAR-Dataset/test/subject_test.txt", col.names = c("subject_id"))


#combine train and test data sets
featuresData <- rbind(featuresTrain, featuresTest)
activitiesData <- rbind(activitiesTrain, activitiesTest)
subjectsData <- rbind(subjectsTrain, subjectsTest)

#get only required columns
colIndices <- grep("mean|std", featureLabels$V2)
filteredData <- featuresData[[colIndices]]

#replace activity ids with descriptions
activitiesData[,1] <- activityLabels[match(activitiesData[,1],activityLabels[,1]),2]

#combine all data
tidyData <- cbind(filteredData, activitiesData, subjectsData)

#averages by activity and subject
tidyAverages <- tidyData %>% group_by(activity_id, subject_id) %>% summarize_all(funs(mean))
