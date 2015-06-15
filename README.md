# Getting_and_Cleaning_Data_Peer-Assessment_2
This repository contains the files for the Week3 Peer Assessment on the Getting and Cleaning Data course. The main files for review are:

* run_analysis.R
* CodeBook.md

About the raw data
------------------

Raw data contains 561 unlabeled features on files X_test.txt and X_train.txt. Unlabeled activities can be found on the Y_test.txt and Y_train.txt datasets, while files subject_test.txt and subject_train.txt files contains the identificator of the subjects who performed each activity.

About the script and the tidy dataset
-------------------------------------
The script run_analysis.R  will first merge the test and training sets together from folders test/ and train/

After merging testing and training, columns that doesn't have to do with mean and standard deviation are discarded, and the remaining ones will be labeled accordingly using the supplied metadata.

Finally, the script will create a tidy data set containing the means of all the columns per test subject and per activity.
This tidy dataset will be written to a space-delimited csv file called data_set_with_the_averages.txt.
