require("R.utils")


# run_analysis() - This function takes the test and train data from the UCI HAR dataset and merges them.
# From these datasets, it calculates the average per subject and activity of each measure, and builds a new, clean,
# much shorter dataset (which is written to a file called Clean_UCI_HAR_Averages.txt in the working directory)
# The function assumes that the working directory is the "UCI HAR Dataset" folder containing its README, 
# and two folders with the data (test/ and train/)
run_analysis <- function(){
  # We check that the directories with the data files, and the data files themselves, exist
  if(!file.exists("activity_labels.txt") || !file.exists("features.txt") || 
       !checkDataFilesExist("test") || !checkDataFilesExist("train")){
    #stop("Missing directories or data files")
    
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="dataset.zip", method="curl")
    unzip("dataset.zip")
    setwd("./UCI HAR Dataset")
  }

  # We read the features from the features.txt file
  features <- read.table("features.txt")
  numFeatures <- length(features$V1)
  
  # We read the train dataset, the activity values (y) and the subject values, and add them as columns to the dataset
  # As apparently the number of spaces is not consistent, we use our own customized reading file function... but it is quite slow!
  traindata <- readAndJoinDataFiles("train",features)
  
  # We read the test dataset, the activity values (y) and the subject values, and add them as columns to the dataset
  testdata <- readAndJoinDataFiles("test",features)
   
  # We join both datasets, modifying the row names so that rbind works
  #row.names(testdata) <- as.character(max(as.numeric(row.names(traindata)))+as.numeric(row.names(testdata)))
  data <- rbind(traindata,testdata)
  
  # We get only the mean and standard deviation measures (columns), plus the subject and activity (y), from the whole feature set 
  selectedFeatures <- rbind(features[grepl("mean()",features$V2,fixed=TRUE),],features[grepl("std()",features$V2,fixed=TRUE),])
  selectedData <- data[,c(selectedFeatures$V1,numFeatures+1,numFeatures+2)]
  
  # We read the activity names from the activities.txt file, and convert the activities values to a factor variable with adequate labels
  activities <- read.table("activity_labels.txt")
  selectedData$Activity <- factor(selectedData$Activity,levels=as.numeric(activities$V1),labels=activities$V2)
  
  newData <- data.frame()
  
  # We create a new dataset with the averages per subject and activity of the variables
  for(i in 1:length(selectedFeatures$V1)){
    varname <- names(selectedData)[[i]]
    # We calculate the averages, putting it into a data frame with columns for activity, subject and value
    averages <- as.data.frame(as.table(tapply(selectedData[[varname]],list(selectedData$Activity,selectedData$Subject),mean,na.rm=TRUE)))
    names(averages) <- c("Activity","Subject",varname)
    if(length(newData)==0){
      newData <- averages
    }
    else{
      newData <- merge(newData,averages,all=T)
    }
  }
  
  
  # We write the new dataset to a text file
  write.table(newData,"Clean_UCI_HAR_Averages.txt",row.names=F)
}

# readAndJoinDataFiles - This functions reads all the files related to one dataset (features, activities and subjects),
# and joins their data into a single data frame, which is returned
readAndJoinDataFiles <- function(strDir,features){
  # We read the file into a data frame, stripping the spaces
  data <- readStrippingSpaces(paste(strDir,"/X_",strDir,".txt",sep=""),dim(features)[[1]])
  # ...and we change the variable names with more descriptive ones
  names(data) <- features$V2
  data$Activity <- (read.table(paste(strDir,"/y_",strDir,".txt",sep="")))[[1]]
  data$Subject <- (read.table(paste(strDir,"/subject_",strDir,".txt",sep="")))[[1]]
  data
}


# Simple method that checks whether a certain directory (represented by the parameter strDir) exists in the working directory, 
# as well as a set of data files including that same string: X_strDir.txt, y_strDir.txt, subject_strDir 
# (this is the file structure of the UCI HAR dataset)
checkDataFilesExist <- function(strDir){
  if(!file.exists(strDir)) return(FALSE)
  if(!file.exists(paste(strDir,"/X_",strDir,".txt",sep=""))) return(FALSE)
  if(!file.exists(paste(strDir,"/y_",strDir,".txt",sep=""))) return(FALSE)
  if(!file.exists(paste(strDir,"/subject_",strDir,".txt",sep=""))) return(FALSE)
  else return(TRUE)
}

readStrippingSpaces <- function(datafile,numCols){
  
  # We count the number of lines to preallocate the data structure we are going to read
  numLines <- countLines(datafile)
  
  con  <- file(datafile, open = "r")
  
  # Create the numerical matrix structure to hold the values
  dataMatrix <- matrix(nrow=numLines,ncol=numCols)
  
  # We read each line of values, strip their spaces and convert them to numeric, and add them to the matrix
  for(i in 1:numLines){
    oneLine <- readLines(con, n = 1, warn = FALSE)
    myVector <- as.numeric(unlist(strsplit(oneLine,split="\\s+")))
    myVector <- myVector[!is.na(myVector)]

    if(length(myVector)!=numCols){
      stop(paste("Error! some row did not have",numCols,"columns:",length(myVector)))
    }
    
    dataMatrix[i,] <- myVector
  }
  
  close(con)
  
  # We convert the matrix to a data frame
  df <- data.frame(dataMatrix)
  df 
}