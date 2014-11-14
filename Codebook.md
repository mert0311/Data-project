---
title: "Codebook"
output: html_document
---

This codebook describes the data contained in the file "Coursera_project.txt". The data is a tidy, summarised version of the "Human Activity Recognition Using Smartphones Data Set" available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. The data cleaning was performed using RStudio, running in Windows 7 with R version 3.1.1.

## Data collection 

*This section is closely based on "Data Set Information" from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones (accessed 14 November 2014) and the "features_info.txt" file available at that site.*

The data was collected from experiments carried out with a group of 30 volunteers aged 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity was captured at a constant rate of 50Hz. This data was recorded using variables tAcc-XYZ and tGyro-XYZ respectively, where "t" indicates that they are time domain signals. The experiments were video-recorded to label the data manually. The dataset was randomly partitioned into two sets, where 21 (70%) of the volunteers were selected for generating the training data and 9 (30%) the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. This gave rise to tGravityAcc-XYZ and tBodyAcc-XYZ variables respectively. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag, where "f" indicates frequency domain signals. 

## Data manipulation

The data was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. The ZIP folder has two main data files, X_train and X_test, containing data for the 21 training and 9 test subjects respectively. X_train has 7,352 rows and X_test has 2,947, with each row corresponding to one set of observations. Both files have the same 561 variables. Separate files give the subject numbers for each set of observations (subject_train and subject_test), the activity numbers for each set of observations (Y_train and Y_test), the names of the six activities (activity_labels) and the names of the 561 variables (features).

Additional "Inertial Signals" files are available for both training and test subjects, but their column names are not provided and it is unclear what information these files contain. Therefore these files were not used.

The subject numbers and activity numbers were joined to the rows of X_train and X_test, giving two extra columns in front of the 561 variables. The resulting data sets ("train" and "test") then had 563 columns each, containing the same variables in the same order. This enabled them to be joined together to give a single dataframe ("data") with 563 columns and 10,299 rows. No distinction was made between the training and test subjects in this combined dataframe.

Most of the columns in the "data" dataframe relate to 33 measurements: 

* tBodyAcc-X
* tBodyAcc-Y
* tBodyAcc-Z
* tGravityAcc-X
* tGravityAcc-Y
* tGravityAcc-Z
* tBodyAccJerk-X
* tBodyAccJerk-Y
* tBodyAccJerk-Z
* tBodyGyro-X
* tBodyGyro-Y
* tBodyGyro-Z
* tBodyGyroJerk-X
* tBodyGyroJerk-Y
* tBodyGyroJerk-Z
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-X
* fBodyAcc-Y
* fBodyAcc-Z
* fBodyAccJerk-X
* fBodyAccJerk-Y
* fBodyAccJerk-Z
* fBodyGyro-X
* fBodyGyro-Y
* fBodyGyro-Z
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag 
 
A subset of the data ("data_ms") was created consisting of the 33 columns containing the means of these measurements, the 33 columns containing the standard deviations, and the subject and activity numbers. The mean values  and standard deviations are denoted "mean()" and "std()" respectively, for example "tBodyAcc-mean()-X" and "tBodyAcc-std()-X" for the first measurement above. The columns of "data_ms" were named using the features file and the activity numbers were replaced with their names. The tidy version of "data_ms" corresponds to the end-point of step 4 of the Coursera instructions. (The Coursera instructions were unclear as to whether the meanFreq() and average angle variables should be included in the subset of data. I decided to exclude them.)

Finally, a "summary" dataframe was produced, corresponding to step 5 of the Coursera instructions. This contains 180 average values for each of the 66 variables, namely the averages for each of the 6 activities for each of the 30 subjects. It is in a wide format, with 68 columns (subject, activity, 33 mean variables, 33 standard deviation variables) and 180 rows (the six activities for subject 1, then the six activities for subject 2, and so on). The activities are in alphabetical order for each subject. All 68 columns contain numeric variables, except for "activity" which is a factor variable with six levels.

## List of variables

The "summary" dataframe has the following 68 columns:

1.  subject *(numeric: 1 to 30)*
2.	activity *(factor with 6 levels: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS)* 
3.	tBodyAcc-mean()-X *(numeric)*
4.	tBodyAcc-mean()-Y *(numeric)*
5.	tBodyAcc-mean()-Z *(numeric)*
6.	tGravityAcc-mean()-X *(numeric)*
7.	tGravityAcc-mean()-Y *(numeric)*
8.	tGravityAcc-mean()-Z *(numeric)*
9.	tBodyAccJerk-mean()-X *(numeric)*
10.	tBodyAccJerk-mean()-Y *(numeric)*
11.	tBodyAccJerk-mean()-Z *(numeric)*
12.	tBodyGyro-mean()-X *(numeric)*
13.	tBodyGyro-mean()-Y *(numeric)*
14.	tBodyGyro-mean()-Z *(numeric)*
15.	tBodyGyroJerk-mean()-X *(numeric)*
16.	tBodyGyroJerk-mean()-Y *(numeric)*
17.	tBodyGyroJerk-mean()-Z *(numeric)*
18.	tBodyAccMag-mean() *(numeric)*
19.	tGravityAccMag-mean() *(numeric)*
20.	tBodyAccJerkMag-mean() *(numeric)*
21.	tBodyGyroMag-mean() *(numeric)*
22.	tBodyGyroJerkMag-mean() *(numeric)*
23.	fBodyAcc-mean()-X *(numeric)*
24.	fBodyAcc-mean()-Y *(numeric)*
25.	fBodyAcc-mean()-Z *(numeric)*
26.	fBodyAccJerk-mean()-X *(numeric)*
27.	fBodyAccJerk-mean()-Y *(numeric)*
28.	fBodyAccJerk-mean()-Z *(numeric)*
29.	fBodyGyro-mean()-X *(numeric)*
30.	fBodyGyro-mean()-Y *(numeric)*
31.	fBodyGyro-mean()-Z *(numeric)*
32.	fBodyAccMag-mean() *(numeric)*
33.	fBodyAccJerkMag-mean() *(numeric)*
34.	fBodyGyroMag-mean() *(numeric)*
35.	fBodyGyroJerkMag-mean() *(numeric)*
36.	tBodyAcc-std()-X *(numeric)*
37.	tBodyAcc-std()-Y *(numeric)*
38.	tBodyAcc-std()-Z *(numeric)*
39.	tGravityAcc-std()-X *(numeric)*
40.	tGravityAcc-std()-Y *(numeric)*
41.	tGravityAcc-std()-Z *(numeric)*
42.	tBodyAccJerk-std()-X *(numeric)*
43.	tBodyAccJerk-std()-Y *(numeric)*
44.	tBodyAccJerk-std()-Z *(numeric)*
45.	tBodyGyro-std()-X *(numeric)*
46.	tBodyGyro-std()-Y *(numeric)*
47.	tBodyGyro-std()-Z *(numeric)*
48.	tBodyGyroJerk-std()-X *(numeric)*
49.	tBodyGyroJerk-std()-Y *(numeric)*
50.	tBodyGyroJerk-std()-Z *(numeric)*
51.	tBodyAccMag-std() *(numeric)*
52.	tGravityAccMag-std() *(numeric)*
53.	tBodyAccJerkMag-std() *(numeric)*
54.	tBodyGyroMag-std() *(numeric)*
55.	tBodyGyroJerkMag-std() *(numeric)*
56.	fBodyAcc-std()-X *(numeric)*
57.	fBodyAcc-std()-Y *(numeric)*
58.	fBodyAcc-std()-Z *(numeric)*
59.	fBodyAccJerk-std()-X *(numeric)*
60.	fBodyAccJerk-std()-Y *(numeric)*
61.	fBodyAccJerk-std()-Z *(numeric)*
62.	fBodyGyro-std()-X *(numeric)*
63.	fBodyGyro-std()-Y *(numeric)*
64.	fBodyGyro-std()-Z *(numeric)*
65.	fBodyAccMag-std() *(numeric)*
66.	fBodyAccJerkMag-std() *(numeric)*
67.	fBodyGyroMag-std() *(numeric)*
68.	fBodyGyroJerkMag-std() *(numeric)* 

