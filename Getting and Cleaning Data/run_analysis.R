########################################################
#Getting and Cleaning Data Course Project Code
#Submission Date: 08/23/2014
#By: Michael Malin Jr
#File Name: run_analysis.R
########################################################

## Step 1: Read files into Rstudio 
#and Merges the training and the test sets to create one data set
#-----------------------------------------------------#
# Read test data
xtestData <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt", sep = ",", header = TRUE)
ytestData <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt")
subjectTestData <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")

#Read train data
xtrainData <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
ytrainData <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt")
subjectTrainData <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")

#Read feature and activity files
featuresFile <- read.table(".\\UCI HAR Dataset\\features.txt")
activityFile <- read.table(".\\UCI HAR Dataset\\activity_labels.txt")

#Add column names to the data sets
colnames(xtestData) = featuresFile[,2]
colnames(xtrainData) = featuresFile[,2]
colnames(ytestData) = "ActivityID"
colnames(ytrainData) = "ActivityID"
colnames(subjectTestData) = "SubjectID"
colnames(subjectTrainData) = "SubjectID"
colnames(activityFile) = c("ActivityID", "ActivityLabels")

#Merge the test and train data sets
testBind = cbind(subjectTestData, ytestData, xtestData)
trainBind = cbind(subjectTrainData, ytrainData, xtrainData)
bindData = rbind(testBind, trainBind)

##Step 2: Extract only the measurements on the mean 
#and standard deviation for each measurement. 
#-----------------------------------------------------#

# Prepare to extract the columns needed to calculate the mean and standard deviation
colNames = colnames(bindData)

#Pattern matching the column names
extractMeanColumns = (grepl("SubjectID",colNames)  |  grepl("ActivityID",colNames)  | grepl("-mean()",colNames) & !grepl("-meanFreq()",colNames))
extractSTDColumns =  (grepl("-std()",colNames))

#Selecting only the columns that match TRUE to the pattern matching above
meanColumnNames = bindData[extractMeanColumns==TRUE]
stdColumnNames = bindData[extractSTDColumns==TRUE]

#Merging the mean and std data sets with "SubjectID" and "ActivityID" included
bindMeadSTD = cbind(meanColumnNames,stdColumnNames)

##Step 3: Uses descriptive activity names to name the activities in the data set
#-----------------------------------------------------#
#
bindMeadSTD = cbind(meanColumnNames,stdColumnNames)
bindMeadSTD[,2]
bindMeadSTD[,2] = factor(bindMeadSTD[,2],labels = activityFile[,2])
#head(bindMeadSTD,3)


##Step 4: Appropriately labels the data set with descriptive variable names. 
#-----------------------------------------------------#

colNames  = colnames(bindMeadSTD)
for (i in 1:length(colNames)) 
{
        colNames[i] = gsub("\\()","",colNames[i])
        colNames[i] = gsub("-std","-StdDev",colNames[i])
        colNames[i] = gsub("-mean","-Mean",colNames[i])
        colNames[i] = gsub("^(t)","time-",colNames[i])
        colNames[i] = gsub("^(f)","freq-",colNames[i])
        colNames[i] = gsub("([Gg]ravity)","Gravity",colNames[i])
        colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i])
        colNames[i] = gsub("[Aa]cc","Acceleration",colNames[i])
        colNames[i] = gsub("[Gg]yro","Gyroscope",colNames[i])
        colNames[i] = gsub("[Mm]ag","Magnitude",colNames[i])
        colNames[i] = gsub("[Jj]erk","Jerk",colNames[i])
}
colnames(bindMeadSTD) = colNames  

##Step 5: Creates a second, independent tidy data set with the average 
#of each variable for each activity and each subject.
#-----------------------------------------------------#

# Extract IDs to prepare to average the values in the data set 
extractID = bindMeadSTD[,3:68]

# Average the values in extractID
tidyData = colMeans(extractID)

# Export the tidyData set 
write.table(tidyData, './tidyData.txt',row.names=FALSE,sep='\t')















