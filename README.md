#run_analysis.R 

This script manipulates data in /UCI HAR Dataset. Data was found originally at

https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

and has been unzipped and included in this repo to ensure data isn't corrupted over time. See documentation in /UCI HAR Dataset for more information on original data.

This script:
1. Merges train and test data sets
2. Extracts only the columns that pertain to mean and standard deviation for each measurement
3. Applies descriptive activity names to the data set
4. Creates a tidy data set of the average of each variable for each activity/subject grouping, called tidyAverages.