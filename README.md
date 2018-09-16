# Get-And-Clean-Data

Aouncement: the raw data are from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

In this repository, there are 3 documents: README.md, the codebook and the main script run_analysis.R.

The basic objective of this project is to clean the raw data and organize it for later analysis.

The steps are listed below:
1. Merges the training and the test sets to create one data set.

			dataSet <- rbind(X_train,X_test)
			subject <- rbind(subject_train, subject_test)
			activity <- rbind(y_train, y_test)
			names(subject) <- 'subject'
			names(activity) <- 'activity'
			
2. Extracts only the measurements on the mean and standard deviation for each measurement.

			measurement <- grep("mean()|std()", features[, 2]) 
			dataSet <- dataSet[,measurement]

3. Uses descriptive activity names to name the activities in the data set

			act_group <- factor(dataSet$activity)
			levels(act_group) <- activity_labels[,2]
			dataSet$activity <- act_group

4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

*[The Steps are from Professor Leek]*
