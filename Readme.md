---
title: "ReadMe for UCI HAR Dataset Analysis "
author: "Ingrid Brady"
date: "Friday, May 22, 2015"
output: html_document
---

### Purpose of the Analysis
The dataset being examined is the Human Activity Recognition Using Smartphones Dataset.
This dataset data consists of data collected in an experiement where 30 volunteers wore a Samsung smartphone on their waist and their movement, both acceleration and gyroscopic information and performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

Using its embedded accelerometer and gyroscope, they captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.  

The purpose of the project is to take the disparate data sets provided and merge into a tidy, summarised and categorised data set that includes the means of any mean and std variation variables.

#### Information about the data for the project:
The data and descriptive information are available the following links
 
  A full description is available at the site where the data was obtained:
 http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project: 
 http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
 
#### For each record the following information was provided for analysis:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

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

**The objective of the run_analysis.R program**
 
Thw R script called run_analysis.R created for this project does the following.
 
1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

The final output of the program is a summarised, categorised tidy data set showing means of mean & std deviation data that was provided, organised so that all the data is in one data set, that there is one variable per column, that the column (i.e. Variable) names are understandable and that the names of activities are included to make further analysis easier and more stand alone.




      