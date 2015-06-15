Course Project Code Book
========================

Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The attached R script (run_analysis.R) performs the following to clean up the data:

* First, merges the training and the test sets to create one data set by importing all the available files into tables and using rbind function on them.

* Then, only the required columns are kept, using the information available on file features.txt to properly name the columns, and then filter out anything not containing "-mean" or "-std" as part of the name.

* Once we have the required columns, we format the names a bit to make them more reader friendly.


* Using info on activity_labels.txt, data is interpreted and descriptive values are assigned to each activity:

        walking
        
        walkingupstairs
        
        walkingdownstairs
        
        sitting
        
        standing
        
        laying


* Then, all the data is compiled into a single table (clean_data), that is written to disk into merged_clean_data.txt.

* Finally, using the clean data, we perform the final request, creating an independent tidy data set with the average of each variable for each activity and each subject, which is finally written to disk as data_set_with_the_averages.txt.
