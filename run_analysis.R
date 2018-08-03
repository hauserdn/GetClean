#run_analysis.R

#This is an R Script written for the Coursera Getting and 
#Cleaning Data Course week 4 peer-graded assignment

#This script assumes that there is a folder called UCI HAR Dataset
#in the working directory. It will not run if the folder is not there.

#Load required packages
library(tidyverse)

#Read in the files from the UCI HAR Dataset directory
dir <- paste(getwd(), "UCI HAR Dataset","",sep = "/")
files <- list.files(dir, full.names = TRUE)
activity_labels <- read_table(files[1], col_names = c("label", "activity"))
features_info <- read_table(files[2])
features <- read.table(files[3], header = FALSE)

#Read in the files from the train directory
traindir <- paste(getwd(), "UCI HAR Dataset/train","",sep = "/")
trainfiles <- list.files(traindir, full.names = TRUE)
subject_train <- read_table(trainfiles[2], col_names = "subject")
X_train <- read_table(trainfiles[3], col_names = as.vector(features[,2]))
y_train <- read_table(trainfiles[4], col_names = "label")

#Read in the files from the test directory
testdir <- paste(getwd(), "UCI HAR Dataset/test","",sep = "/")
testfiles <- list.files(testdir, full.names = TRUE)
subject_test <- read_table(testfiles[2], col_names = "subject")
X_test <- read_table(testfiles[3], col_names = as.vector(features[,2]))
y_test <- read_table(testfiles[4], col_names = "label")

#Make a table with the test data
test <- bind_cols(y_test, subject_test, X_test)

#Make a table with the training data
training <- bind_cols(y_train, subject_train, X_train)

#INSTRUCTIONS STEP 1
#Merge the training and the test sets to create one data set

data <- (
        bind_rows(training, test) %>%

#INSTRUCTIONS STEP 2
#Extract only the measurements on the mean and standard 
#deviation for each measurement

        select(label, subject, contains("mean"), contains("std")) %>%

#INSTRUCTIONS STEP 3
#Use descriptive activity names to name the activities in the dataset
#This step takes the activity names from the activity_labels.txt file
#included with the datset then deletes the label column

        full_join(activity_labels, by = "label") %>%
        select(-label)
)
#INSTRUCTIONS STEP 4
#Appropriately label the data set with descriptive variable names
#This was done when the data was read in

#INSTRUCTIONS STEP 5
#From the data in step 4, create a second, independent
#tidy data set with the average of each variable for each
#activity and each subject

summary <- (
        data %>%
        group_by(subject, activity) %>%
        summarise_all(funs(mean))
)
        
