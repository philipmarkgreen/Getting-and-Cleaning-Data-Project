---
title: "CodeBook - Getting and Cleaning Data Project"
author: "Phil Green"
date: "Sunday, May 24, 2015"
output: html_document
---

This code book describes the manipulations to the data and the resultant data set.

## Merging the training and the test sets to create one data set

The training and test data sets have the same number of variables for each of the three data sets given, namely the subject, actvity type and actual measurement datasets. For this reason we are able to simply use rbind to combine the respective data sets.
 
## Extracting only the measurements on the mean and standard deviation for each measurement

## Using descriptive activity names to name the activities in the data set

## Appropriately labels the data set with descriptive variable names

## Creating second, independent tidy data set with the average of each variable for each activity and each subject