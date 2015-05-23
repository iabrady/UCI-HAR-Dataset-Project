---
title: "Codebook for UCI HAR Dataset Tidy Data Output"
author: "Ingrid Brady"
date: "Friday, May 22, 2015"
output: html_document
---

CodeBook for UCI HAR Tidy Dataset Creation

The CodeBook  describes the the output file, summary-tidy-data.txt, including its contents, and how it was created. 

The data can be read and viewed by using code such as:
```{r echo=TRUE, eval=FALSE}
summary.data <- readcsv("summary-tidy-data.txt", sep = " ")
```



The dataset information was scattered between many files and difficult to analyse without bringing together. The files provided for analysis were as follows:

      ====== Master data for the activity names & row vector columns measurement variable names
      'activity_labels.txt' - human readable names for the activities
                              Col 1, Activity no, Col 2 Activity Name
                              Links the activity label numbers in train/y_train.txt & test/y_test.txt 
      'features.txt'          Features data set - which are the variables names for the data created and will be the 
                              the column names of the collected measurement data 
                              
      ====== Training data set files - the measurement vector data, the activity labels & the subjects
      They are in individual files and need to be joined together for analysis of the dataset
      'train/X_train.txt'      Training set - holds the values of the measurement variables
      'train/y_train.txt'      Holds the label numbers of the activities, one for each record in X_train.txt
      'train/subject_train.txt' Holds the subject numbers (1-30), one for each record in X_train.txt
            
      ====== Test data set files - the measurement vector data, the activity labels & the subjects   
      'test/X_test.txt'        Test set - holds the values of the measurement variables
      'test/y_test.txt'        Holds the label numbers of the activities, one for each record in X_train.txt
      'test/subject_test.txt' Holds the subject numbers (1-30), one for each record in X_train.txt
 
    See the Codebook associated with this project for more information about the data structure


tidy_data <- data.table("tidy_data.txt")
The script creates a tidy, condensed version of the University of California Irvine's (UCI's) dataset for Human Activity Recognition (HAR) using smartphones that can be used for further research and analysis. The original UCI HAR Dataset is a public domain dataset built from the recordings of subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensor (see http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

As noted in the above referenced document, the original data comes from experiments that were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (walking, walking_upstairs, walking_downstairs, sitting, standing, and laying) wearing a Samsung Galaxy S II smartphone on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The experiments were video-recorded to label the data manually.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force was assumed to have only low frequency components, so a filter with a 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The script generates a combined subset of the original data by extracting the mean and standard deviation features for each of the 33 processed signals, for a total of 66 features (out of the 561 available features from the original feature vector). This combined subset contains 10299 observations of 68 variables, with activity and subject appended to the 66 features.

The combined subset is further reduced by calculating the mean of the observations by activity and subject pair to generate 180 observations (6 activities * 30 subjects) of the same 68 variables. This dataset is tidied to generate a narrow and lean dataset containing 11880 observations with 4 variables each and is saved as a text file in the current working directory with the name tidy_data.txt

Variable name cleanup

As part of the tidying process the variable names are cleaned up using the following transformations.



Description of the UCI HAR variables

The Tidy dataset consists of 11880 observations summarized by activity (6 categories) and subject (30 volunteers) pairs. For each observation (row) in the Tidy dataset, the following 4 columns are provided:

subject
activity
measurement
mean
subject

A numeric identifier (1-30) of the subject who carried out the experiment.

activity

The activity name with the following possible values.

'laying',
'sitting',
'standing',
'walking',
'walking_downstairs'
'walking_upstairs'
measurement

The name of the measurement for which the mean is calculated. This variable can contain one of the following 66 variables. Please refer the codebook with the original dataset for the explanation of these different variables.

body-acceleration-jerk-magnitude-mean-frequency
body-acceleration-jerk-magnitude-mean-time
body-acceleration-jerk-magnitude-std-frequency
body-acceleration-jerk-magnitude-std-time
body-acceleration-jerk-mean-x-frequency
body-acceleration-jerk-mean-x-time
body-acceleration-jerk-mean-y-frequency
body-acceleration-jerk-mean-y-time
body-acceleration-jerk-mean-z-frequency
body-acceleration-jerk-mean-z-time
body-acceleration-jerk-std-x-frequency
body-acceleration-jerk-std-x-time
body-acceleration-jerk-std-y-frequency
body-acceleration-jerk-std-y-time
body-acceleration-jerk-std-z-frequency
body-acceleration-jerk-std-z-time
body-acceleration-magnitude-mean-frequency
body-acceleration-magnitude-mean-time
body-acceleration-magnitude-std-frequency
body-acceleration-magnitude-std-time
body-acceleration-mean-x-frequency
body-acceleration-mean-x-time
body-acceleration-mean-y-frequency
body-acceleration-mean-y-time
body-acceleration-mean-z-frequency
body-acceleration-mean-z-time
body-acceleration-std-x-frequency
body-acceleration-std-x-time
body-acceleration-std-y-frequency
body-acceleration-std-y-time
body-acceleration-std-z-frequency
body-acceleration-std-z-time
body-gyro-jerk-magnitude-mean-frequency
body-gyro-jerk-magnitude-mean-time
body-gyro-jerk-magnitude-std-frequency
body-gyro-jerk-magnitude-std-time
body-gyro-jerk-mean-x-time
body-gyro-jerk-mean-y-time
body-gyro-jerk-mean-z-time
body-gyro-jerk-std-x-time
body-gyro-jerk-std-y-time
body-gyro-jerk-std-z-time
body-gyro-magnitude-mean-frequency
body-gyro-magnitude-mean-time
body-gyro-magnitude-std-frequency
body-gyro-magnitude-std-time
body-gyro-mean-x-frequency
body-gyro-mean-x-time
body-gyro-mean-y-frequency
body-gyro-mean-y-time
body-gyro-mean-z-frequency
body-gyro-mean-z-time
body-gyro-std-x-frequency
body-gyro-std-x-time
body-gyro-std-y-frequency
body-gyro-std-y-time
body-gyro-std-z-frequency
body-gyro-std-z-time
gravity-acceleration-magnitude-mean-time
gravity-acceleration-magnitude-std-time
gravity-acceleration-mean-x-time
gravity-acceleration-mean-y-time
gravity-acceleration-mean-z-time
gravity-acceleration-std-x-time
gravity-acceleration-std-y-time
gravity-acceleration-std-z-time
mean

The mean of the measurements.
