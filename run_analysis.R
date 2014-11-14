## This code assumes that the raw data is already saved in the working directory and 
# has been unzipped without any amendment to the file structure. In other words, the
# data is contained within a subfolder of the working directory called "UCI HAR 
# Dataset" which in turn has subfolders "train" and "test".

## Create training dataset by reading the main data file (X_train), the activity labels
# (Y_train) and the subject labels (subject_train), and joining them together.
X_train <- read.table("./UCI HAR dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR dataset/train/Y_train.txt", col.names=c("activity"), 
                      colClasses="factor")
subject_train <- read.table("./UCI HAR dataset/train/subject_train.txt", 
                            col.names=c("subject"),colClasses="numeric")
train <- cbind(subject_train, Y_train, X_train)

## Create test dataset in the same way.
X_test <- read.table("./UCI HAR dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR dataset/test/Y_test.txt", col.names=c("activity"), 
                     colClasses="factor")
subject_test <- read.table("./UCI HAR dataset/test/subject_test.txt", 
                           col.names=c("subject"),colClasses="numeric")
test <- cbind(subject_test, Y_test, X_test)

## Combine the two datasets
data <- rbind(train, test)

## Extract the measurement names from the second column of the features file. (The  
# first column just numbers them. Use this column as row.names.) 
cols <- read.table("./UCI HAR dataset/features.txt", row.names=1) 

## Identify the measurements we want (mean and std). This code returns a vector 
# containing the column numbers of X_train and X_test that we want to keep.
g <- c(grep("mean()", cols$V2, fixed=TRUE),grep("std()", cols$V2, fixed=TRUE))

## Select these columns from "data", along with subject and activity
# (Need to add 2 to g since the measurements start in column 3.)
library(dplyr)
data_ms <- select(data,c(1,2,g+2)) 

## Use descriptive activity names in column 2 of data_ms (taken from the second 
# column of activity_labels)
activities <- read.table("./UCI HAR dataset/activity_labels.txt", row.names=1) 
levels(data_ms$activity) <- activities$V2

## Add descriptive variable names to columns 3 to 68 of data_ms
g_names <- c(grep("mean()", cols$V2, value=TRUE, fixed=TRUE),
             grep("std()", cols$V2, value=TRUE, fixed=TRUE))
colnames(data_ms) <- c("subject","activity",g_names)
# This completes the first 4 steps of the Coursera instructions.

## Create a new variable that combines subject and activity, then group by this:
data_ms <- mutate(data_ms, subject_activity = paste(subject, activity))
s <- split(data_ms, data_ms$subject_activity)

## Summarize the data by calculating the mean of each measurement for each subject/
# activity combination. Transpose the result using t() so that the average measurements
# form the columns of the summary dataset rather than its rows.
summary <- t(sapply(s, function(x) colMeans(x[,3:68]))) 

## Subject_activity is now used as the row names. We need to reinstate this as two
# separate variables. First, create a 2 column dataframe containing subject and activity.
rows <- as.data.frame(row.names(summary))
colnames(rows) <- c("subject_activity")
library(tidyr)
subject_activity <- separate(rows, subject_activity, into=c("subject", "activity"), 
                             sep = " ")
subject_activity$subject <- as.numeric(subject_activity$subject)
subject_activity$activity <- as.factor(subject_activity$activity)

## Re-attach the subject and activity variables to "summary". Remove the row names
# and sort by subject then activity.
summary <- cbind(subject_activity, summary)
row.names(summary) <- NULL
summary <- arrange(summary, subject, activity)

## Create the output file to upload to Coursera website
write.table(summary, file = "./Coursera_project.txt", row.names=FALSE)

## Output can be read back into R using the following code:
    # output <- read.table(file = "./Coursera_project.txt", header = TRUE)
    # View(output)