      #'Main analysis function
      #'
main <- function() {
      library(dplyr)
      library(tidyr)
      library(readr)
      read.and.merge()
      
}

#------------------------------------------------------------------------------

read.and.merge <- function() {
            #'load required packages
      if (!require("dplyr")) { install.packages("dplyr"); require("dplyr") }
      if (!require("readr")) { install.packages("readr"); require("readr") }
      library(dplyr)
      library(readr)
      
            #'--- 1. Read files and merget the training & test data sets ------- 
            #' Identify the files we need
            #' Master data for the activity names & row vector columns
      activity.labels.file <- 'activity_labels.txt'   # Links the activity labels with their activity name.
      features.file <- 'features.txt'                 # Features data set for row vector - vector columns 
            #' Training data set files - the vector data, the activity labels & the subjects           
      training.set.file <- 'train/X_train.txt'        # Training set.
      training.labels.file <- 'train/y_train.txt'     # Training labels.
      training.subject.file <- 'train/subject_train.txt' # training subjects
            #' Test data set files - the vector data, the activity labels & the subjects   
      test.set.file <- 'test/X_test.txt'              # Test set.
      test.labels.file <- 'test/y_test.txt'           # Test labels.
      test.subject.file <- 'test/subject_test.txt' # training subjects   
      
            #' Get the master data sets
      activity.labels.data <- tbl_df(read.table(activity.labels.file, header=FALSE,
                              sep=" ", col.names = c("Activity.No", "Activity.Name"), 
                              stringsAsFactors=FALSE))
      features.data <- tbl_df(read.csv(features.file, header=FALSE, sep=" ",
                              col.names = c("Feature.No", "Feature.Name"),         
                              stringsAsFactors=FALSE)) 
      
            #' get the training data sets
            #' Use read_table as it handles the white spaced file format 
      training.set.data <- tbl_df(read_table(training.set.file, col_names=FALSE))
      training.labels.data <- tbl_df(read.table(training.labels.file, header=FALSE, 
                                                sep=" ", stringsAsFactors=FALSE, col.names = "Activity.No"))   
      training.subject.data <- tbl_df(read.table(training.subject.file, header=FALSE, 
                                    sep=" ", stringsAsFactors=FALSE, col.names = "Subject")) 

            #' get the test data sets      
      test.set.data <- tbl_df(read_table(test.set.file, col_names=FALSE))
      test.labels.data <- tbl_df(read.table(test.labels.file, header=FALSE, 
                                    sep=" ", stringsAsFactors=FALSE, col.names = "Activity.No"))   
      test.subject.data <- tbl_df(read.table(test.subject.file, header=FALSE, 
                                    sep=" ", stringsAsFactors=FALSE, col.names = "Subject")) 
      
            #' combine the two data sets and the label data, then merge them
            #' combing the base data matrices for the test and training dat sets
      activity.data <- rbind(training.set.data,test.set.data )
            #  and give col approproate names from the features list
      colnames(activity.data) <- features.data$Feature.Name
      
            #'-------- 2. extract the means & std deviation data 
            #' Extract on the data that represent means and std deviations
            #' get the mean and std deviation columns we want to retain & merge
      mean.cols.to.keep <- grepl("mean()", features.data$Feature.Name )
      stdd.cols.to.keep <- grepl("std()", features.data$Feature.Name)
      mean.std.data <- cbind(activity.data[, mean.cols.to.keep],
                             activity.data[, stdd.cols.to.keep]) 
      
            #'combine the subject & labels data to append to the measurements
      subject.data <- rbind(training.subject.data,test.subject.data)
      labels.data <- rbind(training.labels.data,test.labels.data)

            #'------- 3. Use descriptive actvity names to name activities      
            #' now bring it all together:
            #' combine the column of activity names with the activity data
      all.data <- cbind(subject.data, labels.data, mean.std.data)
      full.data.set <- left_join( activity.labels.data, all.data, by = "Activity.No")
      
            #'--------4. Column naming has been done along the way 
            #'------- 5. Summarise by Activity and Subject and write data set    
      summ.data.set <- full.data.set %>%
                              group_by(Activity.Name, Subject) %>%
                              summarise_each(funs(mean))
            #'write out the tidy data set
      write.table(summ.data.set, file="summary-data.txt", row.name=FALSE)
      
}