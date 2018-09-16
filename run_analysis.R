#1. Download the file, unzip it and put it under working directory

#2. Load the data
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

features <- read.table("UCI HAR Dataset/features.txt")  
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

# 3. Merge the data sets and rename them.
dataSet <- rbind(X_train,X_test)
subject <- rbind(subject_train, subject_test)
activity <- rbind(y_train, y_test)
names(subject) <- 'subject'
names(activity) <- 'activity'

# 4. Extracts the wished measurements (mean, std) 
measurement <- grep("mean()|std()", features[, 2]) 
dataSet <- dataSet[,measurement]

# 5. Clean the feature names and then put everything together
FeatureNames <- sapply(features[, 2], function(x) {gsub("[()]", "",x)})
names(dataSet) <- FeatureNames[measurement]
dataSet <- cbind(subject,activity, dataSet)

# 6. Uses descriptive activity names to name the activities in the data set
act_group <- factor(dataSet$activity)
levels(act_group) <- activity_labels[,2]
dataSet$activity <- act_group

# 7. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
secondDataSet <- dcast(melt(dataSet,(id.vars=c("subject","activity"))), subject + activity ~ variable, mean)
names(secondDataSet)[-c(1:2)] <- paste("[mean of]" , names(secondDataSet)[-c(1:2)] )
write.table(secondDataSet, "tidy_data.txt", sep = ",")
