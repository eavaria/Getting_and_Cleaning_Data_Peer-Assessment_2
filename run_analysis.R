# Source of data for this project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#setwd("E:\\Coursera\\Getting and Cleaning Data\\Getting_and_Cleaning_Data_Peer-Assessment_2"")
#Script run_analysis.R created according instructions on PeerAssignment 2 of Getting and Cleaning Data, June 2015 cycle.


# 1. Merges the training and the test sets to create one data set.

# merge X data
tmp1 <- read.table("train/X_train.txt")
tmp2 <- read.table("test/X_test.txt")
X <- rbind(tmp1, tmp2)

# merge subject data
tmp1 <- read.table("train/subject_train.txt")
tmp2 <- read.table("test/subject_test.txt")
S <- rbind(tmp1, tmp2)

# merge Y data
tmp1 <- read.table("train/y_train.txt")
tmp2 <- read.table("test/y_test.txt")
Y <- rbind(tmp1, tmp2)

# clean temp variables
rm(tmp1)
rm(tmp2)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

# read features from file
features <- read.table("features.txt")
# identify the ones we care about
indices_of_good_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
# filter the ones we care about
X <- X[, indices_of_good_features]
names(X) <- features[indices_of_good_features, 2]
# format names
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))

# 3. Uses descriptive activity names to name the activities in the data set.

# read activity names from file 
activities <- read.table("activity_labels.txt")
# and format them
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
Y[,1] = activities[Y[,1], 2]
# assign activity names
names(Y) <- "activity"

# 4. Appropriately labels the data set with descriptive activity names.

# assign subject name
names(S) <- "subject"
# create clean_data dataset
clean_data <- cbind(S, Y, X)
# write clean data to disk
write.table(clean_data, "merged_clean_data.txt")

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

# prepare the requested data from clean data
uniqueSubjects = unique(S)[,1]
numSubjects = length(unique(S)[,1])
numActivities = length(activities[,1])
numCols = dim(clean_data)[2]
result = clean_data[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects) {
    for (a in 1:numActivities) {
        result[row, 1] = uniqueSubjects[s]
        result[row, 2] = activities[a, 2]
        tmp <- clean_data[clean_data$subject==s & clean_data$activity==activities[a, 2], ]
        result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
        row = row+1
    }
}
# write final data to disk
write.table(result, "data_set_with_the_averages.txt", row.names=FALSE)