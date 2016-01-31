# (1) Setup
setwd("/media/sf_Dropbox/Technology/R/coursera/3 Getting and Cleaning Data/Coursera-Getting-and-Cleaning-Data-Assignment/")
library(dplyr)

# (2) Load training and testing data
training <- read.csv(unz("getdata-projectfiles-UCI HAR Dataset.zip", "UCI HAR Dataset/train/X_train.txt"), sep="", header=FALSE)
training.act <- read.csv(unz("getdata-projectfiles-UCI HAR Dataset.zip", "UCI HAR Dataset/train/y_train.txt"), header=FALSE)
training.sub <- read.csv(unz("getdata-projectfiles-UCI HAR Dataset.zip", "UCI HAR Dataset/train/subject_train.txt"), header=FALSE)

testing <- read.csv(unz("getdata-projectfiles-UCI HAR Dataset.zip", "UCI HAR Dataset/test/X_test.txt"), sep="", header=FALSE)
testing.act <- read.csv(unz("getdata-projectfiles-UCI HAR Dataset.zip", "UCI HAR Dataset/test/y_test.txt"), header=FALSE)
testing.sub <- read.csv(unz("getdata-projectfiles-UCI HAR Dataset.zip", "UCI HAR Dataset/test/subject_test.txt"), header=FALSE)

# (3) Putting them into data frames and combining them
training.1 <- data.frame(training.sub, training.act, training)
testing.1 <- data.frame(testing.sub, testing.act, testing)
activity.data <- rbind(training.1, testing.1)

# (4) Adding Features information as column names, and converting them to valid characters for dplyr
features <- read.table(unz("getdata-projectfiles-UCI HAR Dataset.zip", "UCI HAR Dataset/features.txt"))
colnames(activity.data) <- c("subject.id", "activity.labels", as.vector(features[, 2]))
names(activity.data) <- make.names(names=names(activity.data), unique=TRUE, allow_ = TRUE)

# (5) Selecting which columns have relevant information (subject, label, mean, std) and don't contain other information (freq, angle)
activity.data <- select(activity.data, contains("subject"), contains("label"), contains("mean"), contains("std"), -contains("freq"), -contains("angle"))

# (6) Matching activity label names
labels <- read.table(unz("getdata-projectfiles-UCI HAR Dataset.zip", "UCI HAR Dataset/activity_labels.txt"))
activity.data$activity.labels <- as.character(labels[match(activity.data$activity.labels, labels$V1), 'V2'])

# (7) Calculate averages and write to a new file
averages <- aggregate(. ~subject.id + activity.labels, activity.data, mean)
averages <- averages[order(averages$subject.id),]
write.table(averages, file = "run_analysis_averages.txt", row.names = FALSE)

# Generate Codebook
library(memisc)
capture.output(codebook(as.data.frame(averages)), file = 'Codebook_tmp.md')
