# Getting-and-Cleaning-Data-Project

Create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
Create a second, independent tidy data set with the average of each variable for each activity and each subject.

1 read the train data
2 read the test data
3 read the respective subject and activity info and col bind to the train and test data
4 combine the train and test data sets
5 get the sensor parameters
6 name the cols
7 get rid of unwanted cols that are not mean or std readings
8 summarise activity for each person
9 tidy data
10 save data to file

