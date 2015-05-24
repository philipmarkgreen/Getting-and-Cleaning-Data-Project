---
title: "README - Getting and Cleaning Data Course Project"
author: "Phil Green"
date: "Sunday, May 24, 2015"
output: html_document
---

This README document describes what files to use and how.

### File: run_analysis.R

*run_analysis.R* will download the required data and run the desired 
manipulations. The script will print out the recordset at the end and if you are
in RStudio it will View the resultant dataset for you. It links to the dataset
using relative paths to *UCI HAR Dataset*

### File: dataset.zip

*dataset.zip* file that run_analysis.R will download. It will then be unzipped
into the following directory *UCI HAR Dataset*

### UCI HAR Dataset

*UCI HAR Dataset* is the directory containt all the data that is required. This
needs to be in the working directory of run_analysis.R if you decide to move
things around or download the dataset yourself.