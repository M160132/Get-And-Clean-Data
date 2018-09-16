 This code book is to describe the variables, the data, and any transformations or work that I have done to clean up the data
 
 The raw data is from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 If you want to know more about this project, please have a look at the full description here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
 
 The first step is to compile the data together. Then extract our wished measurement. After that, clean the names of the data frame
 The last thing to do is to decorate our data and output


The variables in the script are described below
1. subject_test : subject IDs for test
2. subject_train : subject IDs for train
3. X_test : values of variables in test
4. X_train : values of variables in train
5. y_test : activity ID in test
6. y_train : activity ID in train
7. activity_labels : Description of activity IDs in y_test and y_train
8. features : description(label) of each variables in X_test and X_train
9. dataSet : bind of X_train and X_test
