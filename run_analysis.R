library(plyr)
library(dplyr)
library(lessR)

#read in the data
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("row", "variable")) %>% tbl_df()
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity")) %>% tbl_df()
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject") %>% tbl_df()
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$variable) %>% tbl_df()
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code") %>% tbl_df()
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject") %>% tbl_df()
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$variable) %>% tbl_df()
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code") %>% tbl_df()

#create collected dataframes
x_merged <- Merge(x_train, x_test)
y_merged <- Merge(y_train, y_test)
subject <- Merge(subject_train, subject_test)
# 1.merge the training and test sets to create one data set
merged <- cbind(subject, y_merged, x_merged) %>% tbl_df()
# 2. Extract only the measurements on the mean and standard deviation for each measurement
extract <- select(merged, subject, code, contains("mean"), contains("std"))
# 3. Uses descriptive activity names to name the activities in the data set
        
extract$code <- activities[extract$code,2]
extract$code <- extract$code$activity

# 4. Appropriately labels the data set with descriptive variable names.

names(extract) <- gsub("Acc", "Acceleration", names(extract))
names(extract) <- gsub("^t", "Time", names(extract))
names(extract) <- gsub("^f", "Frequency", names(extract))
names(extract) <- gsub("BodyBody", "Body", names(extract))
names(extract) <- gsub("mean", "Mean", names(extract))
names(extract) <- gsub("std", "Std", names(extract))
names(extract) <- gsub("Freq", "Frequency", names(extract))
names(extract) <- gsub("Mag", "Magnitude", names(extract))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidy_data <- extract %>% group_by(subject, code) %>% summarise_all(funs(mean))

# Write the tidy_data to a text file

write.table(tidy_data, "tidy_data.txt", row.names = FALSE)
