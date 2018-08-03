# GetClean
##This is a readme file for the peer graded project of week 4 of the Coursera Getting and Cleaning Data class

## The repository contains three files:
1. README.md : This readme file
2. run_analysis.R : An R script for performing a tidy analysis of the Samsung data in the user's working directory
3. codebook.md : A codebook that explains the variables of the tidy dataset the script creates

## Description of how run_analysis.R works:

The script makes use of functions found in the tidyverse group of packages.

1. The relevant directories and files are found and loaded using the read_table() function. Step 4 of the Coursera Instructions (Appropriately labels the data set with descriptive variable names.) is performed when the X_train and X_test tables are read by making use of the col_names argument of the read_table() function.

2. A table of the test data is created by binding the y_test, subject_test, and X_test tables together.
3. A table of the train data is created by binding the y_train, subject_train, and X_train tables together.

4. Instructions steps 1-3 are performed using dplyr piping to create a tidy data table named data. Data contains the subject id#, the activity name (from the activity_labels.txt), and each variable that has a name containing "mean" or "sd".

5. Finally, a summary file is created by grouping data by subject and activity, then using the summarize_all() function to calculate the mean of each variable for each subject and activity.

## How to read the summary.txt file uploaded to the Coursera site

summary <- read.table("summary.txt", header = TRUE)


## Description of the codebook.md file:
