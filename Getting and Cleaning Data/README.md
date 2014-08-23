
--README for Getting and Cleaning Data Course Project Code <br>
--Version 1.0<br>
--Author: Michael Malin Jr<br>
--Date: 08/23/2014<br><br>


-Purpose of the course project is to perform the following:<br>
1. Merges the training and the test sets to create one data set.<br>
2. Extracts only the measurements on the mean and standard deviation for each measurement. <br>
3. Uses descriptive activity names to name the activities in the data set<br>
4. Appropriately labels the data set with descriptive variable names.<br> 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. <br>

-Below is a description of the steps performed in the run_analysis.R script  to answer the questions above.<br>

--Step 1: <br>
-Download the following data to your computer.<br>

-Data located at: <br>
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip <br>

Perform the following code to read the files into R:<br>
-Read test data <br>
xtestData <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt", sep = ",", header = TRUE)<br>
ytestData <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt")<br>
subjectTestData <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")<br>

-Read train data<br>
xtrainData <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt")<br>
ytrainData <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt")<br>
subjectTrainData <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")<br>

-Read feature and activity files<br>
featuresFile <- read.table(".\\UCI HAR Dataset\\features.txt")<br>
activityFile <- read.table(".\\UCI HAR Dataset\\activity_labels.txt")<br>

-Next, add column names to your test/train data sets by using the data stored in your features.txt and activity_labels.txt files.<br>

colnames(xtestData) = featuresFile[,2]<br>
colnames(xtrainData) = featuresFile[,2]<br>
colnames(ytestData) = "ActivityID"<br>
colnames(ytrainData) = "ActivityID"<br>
colnames(subjectTestData) = "SubjectID"<br>
colnames(subjectTrainData) = "SubjectID"<br>
colnames(activityFile) = c("ActivityID", "ActivityLabels")<br>



















