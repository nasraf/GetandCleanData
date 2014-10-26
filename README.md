                                      README

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

1. The script run_analysis.R must be run inside a directory called UCI HAR Dataset 
2. UCI HAR Dataset contains the following folders and files:
- train folder: contains three files: X_train, Y_train, Subject_train and one Inertial Signals folder
- test folder: contains three files: X_test, Y_test, Subject_test and one Inertial Signals folder
- 'README.txt'
- run_analysis.R: R script to execute the following steps:

    1.	Merges the training and the test sets to create one data set.
    2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
    3.	Uses descriptive activity names to name the activities in the data set
    4.	Appropriately labels the data set with descriptive variable names. 
    5.	From the data set in step 4, creates a second, independent tidy data set with the average of each 
        variable for each activity and each subject.

- In the run_analysis.R script I did not include any download and unzip commands to get/unzip input files. I download the 
  files manually as in the evaluation setting section it was stated that "the Samsung data is in your working directory"  


- -tidydata.txt': output contain the data of step 5 listed-above. It contains the following varibales:

