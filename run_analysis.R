rm(list = ls(all=TRUE))
library(plyr)

#Step 1--Merge the training and test sets to create one data set

xTrain <- read.table("train/X_train.txt")
yTrain <- read.table("train/y_train.txt")
subjectTrain <- read.table("train/subject_train.txt")

xTest <- read.table("test/X_test.txt")
yTest <- read.table("test/y_test.txt")
subjectTest <- read.table("test/subject_test.txt")

# create 'x' data set
xData <- rbind(xTrain, xTest)

# create 'y' data set
yData <- rbind(yTrain, yTest)

# create 'subject' data set
subjectData <- rbind(subjectTrain, subjectTest)

#Step 2--Extract the measurements on the mean and standard deviation

features <- read.table("features.txt")

# get only columns with mean() or std() in their names
features_mean_and_std <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
xData <- xData[, features_mean_and_std]

# correct the column names
names(xData) <- features[features_mean_and_std, 2]

#Step 3--Use descriptive activity names

activities <- read.table("activity_labels.txt")

# update values with correct activity names
yData[, 1] <- activities[yData[, 1], 2]

# correct column name
names(yData) <- "activity"

#Step 4--Appropriately label the data set with descriptive variables

# correct column name
names(subjectData) <- "subject"

# bind all the data in a single data set
allData <- cbind(xData, yData, subjectData)

#Step 5--Create a second, independent tidy data set with the average of each variable for each activity and each subject

# 66 <- 68 columns but last two (activity & subject)
averagesData <- ddply(allData, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(averagesData, "Tidy_Averages_Data.txt", row.name=FALSE)
