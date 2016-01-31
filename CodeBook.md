### Code Book

This code book will describe the data used in this project, as well as the processing required to create the resulting tidy data set.

## Overview

This is an assignment that analyses data from the dataset "Human Activity Recognition Using Smartphones" from the UCI Machine Learning Repository

- Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

It uses R to analyse and summarise the raw data into a "Tidy data" format.

## Data Set Information (from original description of dataset):

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Data files

`UCI HAR Dataset/train/X_train.txt`
`UCI HAR Dataset/train/y_train.txt`
`UCI HAR Dataset/train/subject_train.txt`

`UCI HAR Dataset/test/X_test.txt`
`UCI HAR Dataset/test/y_test.txt`
`UCI HAR Dataset/test/subject_test.txt`

`UCI HAR Dataset/features.txt`
`UCI HAR Dataset/activity_labels.txt`
