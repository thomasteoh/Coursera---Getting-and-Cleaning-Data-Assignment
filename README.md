# (Coursera) Getting and Cleaning Data Assignment

This repo contains a data science assignment run through John Hopkins University and Coursera. More information can be found here: https://www.coursera.org/learn/exploratory-data-analysis

This assignment uses data from the dataset "Human Activity Recognition Using Smartphones"

- Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Contents

- `Readme.md` - This file
- `run_analysis.R` - Analysis file with R code
- `run_analysis_averages.txt` - Output file of run_analysis.R with averages of combined data as required by the assignment
- `getdata-projectfiles-UCI HAR Dataset.zip` - Source data

## Explanation of analysis file (run_analysis.R)

Please read in conjunction with the associated R file. Note that there are comments for each section within the file `(1)` to `(7)`, which I will refer to within this document.

### (1) Setup

This section has some of the setup requirements for running the script (on my local machine). Setting the working directory using `setwd`, and loading the `dplyr` library as we will be using some of its capabilities.

### (2) Loading data

This section involves loading the data into R to be analysed. It needs to unzip because it is stored as a `zip` file.

### (3) Combining data

The data is split amongst a number of files, so we need to lump each of the training and testing data sets together within a dataframe, and combine the whole lot into `activity.data` using `rbind`. 

### (4) Column names

This can be found within the features file, so we need to load it and pop it into the column name area using `colnames`. We also need to make them syntactically correct, which we can do by running them through `make.names`.

### (5) Selecting columns

We're only interested in the measurements looking at mean and standard deviation, so use `select` (from `dplyr`) to pick out the right ones. 

### (6) Matching activity label names

These correspond to a factor in a column in our data. So match them up accordingly and replace them with descriptive text. 

### (7) Calculate averages and write to a file

As specified in the instructions, we want the means of our measurements. Then its reordered so that the measurements for each subject are grouped together and written to our output file `run_analysis_averages.txt`