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

The result of executing the script is a plain text file written to disk (Clean_UCI_HAR_Averages.txt), created with write.table() using row.names=FALSE, i.e., formatted as follows:

"Activity" "Subject" "tBodyAcc-mean()-X" "tBodyAcc-mean()-Y" ... (up to 68 variables)
"LAYING" "1" 0.22159824394 -0.0405139534294 ... (up to 68 values)
... 
(up to 180 lines of data, plus one line of headers)

