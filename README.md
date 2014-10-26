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
  -  train folder: contains three files: X_train, Y_train, Subject_train and one Inertial Signals folder
  - test folder: contains three files: X_test, Y_test, Subject_test and one Inertial Signals folder
  - 'README.txt'
  - 'features.txt'
  - 'actvity_label.txt'
  - run_analysis.R: R script to execute the following steps:

    1.	Merges the training and the test sets to create one data set.
    2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
    3.	Uses descriptive activity names to name the activities in the data set
    4.	Appropriately labels the data set with descriptive variable names. 
    5.	From the data set in step 4, creates a second, independent tidy data set with the average of each 
        variable for each activity and each subject.

- In the run_analysis.R script, I did not include any download and unzip commands to get/unzip input files. I download the 
  files manually as in the evaluation setting section, it was stated that, "the Samsung data is in your working directory"  
- run_analysis contains the following execution tasks:
   - require(reshape2) to call the library since we will be using melt and dcast command to group and summarize the data
   - read training data set and store it in a variable called train_data
   - read test data set and store it in a variable called test_data
   - read Subject train data set and store it in a variable called Subject_train
   - read Subjet test data set and store it in a variable called Subject_test
   - read test label data set and store it in a varibale called test_label
   - read train label data set and store it in a variable called train_label
   - read features.text data set and store it in a variable called features
   - combine training data with train labels and subject train data and store it in a variable called
     train_data_label_subject
   - combine test data with test labels and subject test data and store it in a variable called
     test_data_label_subject
   - Extract only features ending with mean() and std() and store it in variable called meanstd_data
   - Usee descriptive activity names to name the activities in the data set by factoring the variables and using levels:1:6

- -tidydata.txt': output contain the data of step 5 listed-above. It contains the following descriptive varibales:
- 


