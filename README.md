Data-project
============

Created for the project component of Coursera's "Getting and Cleaning Data" course.

This repo contains three files (plus this README) which form my project submission for the Coursera Getting and Cleaning Data course:

### Codebook.md
This sets out how the data was collected and the steps taken to summarise it. It also lists the variables contained within the tidy dataset.

### run_analysis.R
This provides the code for processing the raw data to obtain the tidy dataset. It assumes that the raw data (available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) has already been unzipped to the working directory, without any amendment to the file structure. In other words, the data is contained within a subfolder of the working directory called "UCI HAR Dataset" which in turn has subfolders "train" and "test".

### Coursera_project.txt
This is a textfile containing the tidy dataset produced by run_analysis.R. It can be read into R using the following code:

    output <- read.table(file = "./Coursera_project.txt", header = TRUE)
    View(output)
