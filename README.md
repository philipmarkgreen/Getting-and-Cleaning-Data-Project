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

### File: dataset.zip (magically appears)

*dataset.zip* file that run_analysis.R will download. It will then be unzipped
into the following directory *UCI HAR Dataset*

### Direcotry: UCI HAR Dataset  (magically appears)

*UCI HAR Dataset* is the directory that contains all the data that is required. 
It is generated from the unzipping of *dataset.zip* in *run_analysis.R*. This
needs to be in the working directory of run_analysis.R if you decide to move
things around or download the dataset yourself.

### File: CodeBook.md

*CodeBook.md* describes the data that we start with. The manipulations that are
applied to that data and finally the data that we end with.

### File: README.md

*README.md* is this file and just let's you know where everything is and what it 
does
