## This is the Run_ analysis script

# Download and unzip the files

filesPath <- "C:/Users/Lily Carolina/Downloads/Data science/Getting and Cleaning Data/UCI HAR Dataset”
setwd(filesPath)
if(!file.exists("./data")){dir.create("./data")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip”) 
unzip(zipfile="./data/Dataset.zip",exdir="./data")

# Don't forget you have to download and load the packages that will be needed for cleaning data, 
# the packages used for this project were: dplyr, tidyr, data.table

# 1.Merges the training and the test sets to create one data set.
# This step will also rename variables "subject" and "activityNum"

alldataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
setnames(alldataSubject, "V1", "subject")
alldataActivity<- rbind(dataActivityTrain, dataActivityTest)
setnames(alldataActivity, "V1", "activityNum")
dataTable <- rbind(dataTrain, dataTest)
dataFeatures <- tbl_df(read.table(file.path(filesPath, "features.txt")))
setnames(dataFeatures, names(dataFeatures), c("featureNum", "featureName"))
colnames(dataTable) <- dataFeatures$featureName
activityLabels<- tbl_df(read.table(file.path(filesPath, "activity_labels.txt")))
setnames(activityLabels, names(activityLabels), c("activityNum","activityName"))

# Merge columns

alldataSubjAct<- cbind(alldataSubject, alldataActivity)
dataTable <- cbind(alldataSubjAct, dataTable)

# 2.Extracts only the measurements on the mean and standard deviation for each measurement.

dataFeaturesMeanStd <- union(c("subject","activityNum"), dataFeaturesMeanStd)
dataTable<- subset(dataTable,select=dataFeaturesMeanStd) 

# 3.Uses descriptive activity names to name the activities in the data set.

dataTable <- merge(activityLabels, dataTable , by="activityNum", all.x=TRUE)
dataTable$activityName <- as.character(dataTable$activityName)
dataTable$activityName <- as.character(dataTable$activityName)
dataAggr<- aggregate(. ~ subject - activityName, data = dataTable, mean) 
dataTable<- tbl_df(arrange(dataAggr,subject,activityName))

# 4.Appropriately labels the data set with descriptive variable names.

# You can use this function to see what the names look like right now, this is optional.
head(str(dataTable),2)

# Here is where we change all of the variable names to more readable ones.
names(dataTable)<-gsub("std()", "SD", names(dataTable))
names(dataTable)<-gsub("mean()", "MEAN", names(dataTable))
names(dataTable)<-gsub("^t", "time", names(dataTable))
names(dataTable)<-gsub("^f", "frequency", names(dataTable))
names(dataTable)<-gsub("Acc", "Accelerometer", names(dataTable))
names(dataTable)<-gsub("Gyro", "Gyroscope", names(dataTable))
names(dataTable)<-gsub("Mag", "Magnitude", names(dataprintTable))
names(dataTable)<-gsub("BodyBody", "Body", names(dataTable))

# You can check the results by doing this
names(dataTable)

# 5.From the data set in step 4, creates a second, independent tidy data set with the average 
# of each variable for each activity and each subject.

write.table(dataTable, "TidyData.txt", row.name=FALSE)
