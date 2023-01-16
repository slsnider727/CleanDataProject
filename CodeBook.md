#run_analysis.R CodeBook

featureLabels : column names for data set
activityLabels : id/description key for activity types

featuresTrain, featuresTest : measurements data for each measured feature
activitiesTrain, activitiesTest : activity category for each measurement
subjectsTrain, subjectsTest : subject id for each measurement

featuresData : combined feature rows from Train and Test sets
activitiesData : combined activity rows from Train and Test sets
subjectsData : combined subject rows from Train and Test sets

colIndices : indices of columns in featuresData that pertain to mean or standard deviation
filteredData : a new table built from featuresData that contains only the columns in colIndices

tidyData : filteredData with the addition of descriptive activity and subject columns from activitiesData and subjectsData

tidyAverages : table of averages of all measurements in tidyData, grouped by activity type and subject id