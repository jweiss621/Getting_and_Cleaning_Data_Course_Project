## Course Project

# Load test datasets
#setwd("~/Data Science/Getting and Cleaning Data/UCI HAR Dataset/test")
test_x <- read.table("X_test.txt")
test_y <- read.table("y_test.txt")
test_subject <- read.table("subject_test.txt")

# Load training datasets
#setwd("~/Data Science/Getting and Cleaning Data/UCI HAR Dataset/train")
train_x <- read.table("X_train.txt")
train_y <- read.table("y_train.txt")
train_subject <- read.table("subject_train.txt")

# Load features
#setwd("~/Data Science/Getting and Cleaning Data/UCI HAR Dataset/")
features <- read.table("features.txt")
feature_names <- as.character(features[,2])

# Find the indices to extract only the measurements on the mean and standard deviation 
# for each measurement 
mean_indices <- grep("mean()",feature_names)
std_indices <- grep("std()", feature_names)
Freq_indices <- grep("Freq",feature_names)
combined_indices <- sort(c(mean_indices,std_indices))
combined_indices <- combined_indices[! combined_indices %in% Freq_indices]

# Remove punctuation from feature names and have the column names all in lower case
install.packages("stringr")
library(stringr)
for (i in 1:length(feature_names)) {
  feature_names[i] <- tolower(gsub("[[:punct:]]", "", feature_names[i])) }
    

# Merge test and training datasets
merged_x <- rbind(test_x,train_x)
merged_y <- rbind(test_y,train_y)
merged_subject <- rbind(test_subject,train_subject)

# Name the x dataset with the features vector that has no punctuation
names(merged_x) <- feature_names

# Subset the merged x dataset to only contain measurements on the mean and standard deviation
merged_x <- merged_x[,combined_indices]

# use descriptive activity names to name the activities in the data set
for (i in 1:nrow(merged_y)){
  if (merged_y[i,1] == 1) {
    merged_y[i,1] <- "walking" }
  if (merged_y[i,1] == 2) {
    merged_y[i,1] <- "walking_upstairs" }
  if (merged_y[i,1] == 3) {
    merged_y[i,1] <- "walking_downstairs" }
  if (merged_y[i,1] == 4) {
    merged_y[i,1] <- "sitting" }
  if (merged_y[i,1] == 5) {
    merged_y[i,1] <- "standing" }
  if (merged_y[i,1] == 6) {
    merged_y[i,1] <- "laying" }
}

# name the y column and the subject column
names(merged_y) <- "Activity"
names(merged_subject) <- "Subject"

# Merge the x, y, and subject merged datasets
merged_total <- cbind(merged_x,merged_subject,merged_y)

# Create a second, independent tidy data set with the average of each variable for each
# activity and each subject
install.packages("reshape2")
library(reshape2)
lengthen_dataset <- melt(merged_total,id.vars = c("Subject","Activity"))
horizontal_dataset <- dcast(lengthen_dataset, Subject + Activity ~ variable,fun.aggregate = mean)
tidy_dataset <- melt(horizontal_dataset,id.vars = c("Subject","Activity"))
tidy_dataset