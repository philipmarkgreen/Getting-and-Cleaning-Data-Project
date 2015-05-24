# Let's make sure were are where we want to be
# setwd("C:/Users/Phil/Google Drive/Coursera/Data Science/Getting and Cleaning Data/Project")

# You can get more info on the dataset here
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

# Download  the data file and unzip it
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","dataset.zip")
unzip("dataset.zip")

# Load tidyr and dplyr, we are going to want these
library(plyr)
library(dplyr)
library(tidyr)

# 1.a. Merges the training and the test sets to create one data set

# Load the features, we will need these
activities <- read.csv("./UCI HAR Dataset/activity_labels.txt", header = FALSE, sep=" ", stringsAsFactors = FALSE)
activities <- select(activities, id = V1, description = V2)

features <- read.csv("./UCI HAR Dataset/features.txt", header = FALSE, sep=" ", stringsAsFactors = FALSE)
features <- select(features, feature = V2)
features$feature <- make.names(features$feature, unique=TRUE, allow_ = TRUE)
features$feature <- gsub("\\.\\.\\.", "\\.",features$feature)
features$feature <- gsub("\\.\\.", "",features$feature)

# Load the training data
training_data <- read.csv("./UCI HAR Dataset/train/X_train.txt", header = FALSE, sep="", stringsAsFactors = FALSE)
training_activity <- read.csv("./UCI HAR Dataset/train/y_train.txt", header = FALSE, sep="", stringsAsFactors = FALSE)
training_subject <- read.csv("./UCI HAR Dataset/train/subject_train.txt", header = FALSE, sep="", stringsAsFactors = FALSE)

# Load the test data
test_data <- read.csv("./UCI HAR Dataset/test/X_test.txt", header = FALSE, sep="", stringsAsFactors = FALSE)
test_activity <- read.csv("./UCI HAR Dataset/test/y_test.txt", header = FALSE, sep="", stringsAsFactors = FALSE)
test_subject <- read.csv("./UCI HAR Dataset/test/subject_test.txt", header = FALSE, sep="", stringsAsFactors = FALSE)

# Bind the training and test data sets
merged_data <- rbind(training_data, test_data)
merged_activity <- rbind(training_activity, test_activity)
merged_subject <- rbind(training_subject, test_subject)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
meanStdColumns <- grep("Mean|mean|std", features$feature, value = FALSE)
meanStdColumnNames <- grep("Mean|mean|std", features$feature, value = TRUE)
merged_data_reduced <- select(merged_data, meanStdColumns)

# 1.b. Merges in in the activity and subject columns.

# Name the activity and subject columns so we don't get mixed up when adding columns
merged_activity <- select(merged_activity, activity = V1)
merged_subject <- select(merged_subject, subject = V1)

# Add in activity and subject columns
merged_master <- cbind(activity = merged_activity$activity, merged_data_reduced)
merged_master <- cbind(subject = merged_subject$subject, merged_master)

# 3. Uses descriptive activity names to name the activities in the data set
merged_master[,2] <- plyr::mapvalues(merged_master[,2], activities$id, activities$description)

# 4. Appropriately labels the data set with descriptive variable names. 
colnames(merged_master)[3:88] <- unlist(meanStdColumnNames)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
merged_tbl <- dplyr::tbl_df(merged_master)
merged_tbl_grouped <- dplyr::group_by(merged_tbl,subject,activity)
summary_tbl <- dplyr::summarise_each(merged_tbl_grouped, funs(mean))
names(summary_tbl)[3:81] <- paste("Mean", names(summary_tbl)[3:81], sep = "_")
subject_activity_averages <- summary_tbl

# Print out the final result
print(subject_activity_averages)
View(subject_activity_averages)

# For submission purposes
# Write out final result to file
# write.table(subject_activity_averages,file="subject_activity_averages.txt", row.name=FALSE) 

# Load the result to test it
# result <- read.table("subject_activity_averages.txt", header=TRUE)