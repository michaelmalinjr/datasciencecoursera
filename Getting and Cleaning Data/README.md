

######README for Getting and Cleaning Data Course Project Code <br>
######Version 1.0<br>
######Author: Michael Malin Jr<br>
######Date: 08/23/2014<br><br>


#### Purpose of the course project is to perform the following:<br>
1. Merges the training and the test sets to create one data set.<br>
2. Extracts only the measurements on the mean and standard deviation for each measurement. <br>
3. Uses descriptive activity names to name the activities in the data set<br>
4. Appropriately labels the data set with descriptive variable names.<br> 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. <br>

#### Below is a description of the steps performed in the run_analysis.R script  to answer the questions above.<br>

#### Step 1: Read files into Rstudio and Merges the training and the test sets to create one data set.<br>
- Download the following data to your computer.<br>
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip <br>

- Perform the following code to read the files into R:<br>
######Read test data <br>
xtestData <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt", sep = ",", header = TRUE)<br>
ytestData <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt")<br>
subjectTestData <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")<br>

######Read train data<br>
xtrainData <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt")<br>
ytrainData <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt")<br>
subjectTrainData <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")<br>

######Read feature and activity files<br>
featuresFile <- read.table(".\\UCI HAR Dataset\\features.txt")<br>
activityFile <- read.table(".\\UCI HAR Dataset\\activity_labels.txt")<br>

- Next, add column names to your test/train data sets by using the data stored in your features.txt and activity_labels.txt files.<br>

colnames(xtestData) = featuresFile[,2]<br>
colnames(xtrainData) = featuresFile[,2]<br>
colnames(ytestData) = "ActivityID"<br>
colnames(ytrainData) = "ActivityID"<br>
colnames(subjectTestData) = "SubjectID"<br>
colnames(subjectTrainData) = "SubjectID"<br>
colnames(activityFile) = c("ActivityID", "ActivityLabels") <br>

- Next, combine the columns in your 3 test/train files. Then, merge your test/train files together.<br>
testBind = cbind(subjectTestData, ytestData, xtestData)<br>
trainBind = cbind(subjectTrainData, ytrainData, xtrainData)<br>
bindData = rbind(testBind, trainBind)<br>

#### Step 2: Extract only the measurements on the mean and standard deviation for each measurement. <br>
- Prepare to extract the columns needed to calculate the mean and standard deviation<br>
colNames = colnames(bindData)<br>

- Pattern matching the column names<br>
extractMeanColumns = (grepl("SubjectID",colNames)  |  grepl("ActivityID",colNames)  | grepl("-mean()",colNames) & !grepl("-meanFreq()",colNames))<br>
extractSTDColumns =  (grepl("-std()",colNames))<br>

- Selecting only the columns that match TRUE to the pattern matching above<br>
meanColumnNames = bindData[extractMeanColumns==TRUE]<br>
stdColumnNames = bindData[extractSTDColumns==TRUE]<br>

- Merging the mean and std data sets with "SubjectID" and "ActivityID" included<br>
bindMeadSTD = cbind(meanColumnNames,stdColumnNames)<br>

####Step 3: Uses descriptive activity names to name the activities in the data set.<br>
- The following singles out the ActivityID column and updates the numeric ActivityID variables with it's labels. <br>
bindMeadSTD = cbind(meanColumnNames,stdColumnNames)<br>
bindMeadSTD[,2]<br>
bindMeadSTD[,2] = factor(bindMeadSTD[,2],labels = activityFile[,2])<br>
head(bindMeadSTD,3)<br>

#### Step 4: Appropriately labels the data set with descriptive variable names. <br>
- The following code cleans the Activity column names to make them more descriptive
colNames  = colnames(bindMeadSTD)<br>
for (i in 1:length(colNames)) <br>
{<br>
        colNames[i] = gsub("\\()","",colNames[i])<br>
        colNames[i] = gsub("-std","-StdDev",colNames[i])<br>
        colNames[i] = gsub("-mean","-Mean",colNames[i])<br>
        colNames[i] = gsub("^(t)","time-",colNames[i])<br>
        colNames[i] = gsub("^(f)","freq-",colNames[i])<br>
        colNames[i] = gsub("([Gg]ravity)","Gravity",colNames[i])<br>
        colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i])<br>
        colNames[i] = gsub("[Aa]cc","Acceleration",colNames[i])<br>
        colNames[i] = gsub("[Gg]yro","Gyroscope",colNames[i])<br>
        colNames[i] = gsub("[Mm]ag","Magnitude",colNames[i])<br>
        colNames[i] = gsub("[Jj]erk","Jerk",colNames[i])<br>
}
colnames(bindMeadSTD) = colNames  <br>

#### Step 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject.<br>

- Extract IDs to prepare to average the values in the data set <br>
extractID = bindMeadSTD[,3:68]<br>

- Average the values in extractID<br>
tidyData = colMeans(extractID)<br>

- Export the tidyData set <br>
write.table(tidyData, './tidyData.txt',row.names=FALSE,sep='\t')<br>

















