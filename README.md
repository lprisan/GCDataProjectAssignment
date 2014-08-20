GCDataProjectAssignment
=======================

A small R script to clean some data, see https://class.coursera.org/getdata-006/human_grading/

The main function, run_analysis(), checks for the availability of the data files activity_labels.txt, features.txt and several other files in the train/ and test/ folders (all of them available from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )

The script the performs the following operations:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 