# Getting-and-Cleaning-Data-Course-Project

This repo contains R code and documentation for the course project for the coursera Data Science course "Getting and 

Cleaning data". The goal of this project is to produce a tidy data set from an online source (Human Activity 

Recognition Using Smartphones data set). The source of the data set is here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The task in more detail was to:

Create one R script called run_analysis.R that does the following.

    * Merges the training and the test sets to create one data set.
    * Extracts only the measurements on the mean and standard deviation for each measurement.
    * Uses descriptive activity names to name the activities in the data set
    * Appropriately labels the data set with descriptive variable names.
    * From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The code also includes the script for downloading the data from the online source.

Files contained in this repo are:
	* run_analysis.R : R code to execute the processes described above
	* finaldata.txt : The newly created tidy data set with means/SDs of the data by subject and activity
	* CodeBook.md : A code book which gives detailed information about the variables, the data, and any transformations or work that was performed to clean up the data.

