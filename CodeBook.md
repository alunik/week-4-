Here is a description of the script run_analysis.R.
The script reads data containing device measurements for 30 individuals doing different activities. 
- The variable activityNames stores the names of the activities.
The data is divided in multiple data sets, one for train and one for test. The labels are also provided separately.
- testSet and trainSet store the main data, while testLabels, trainLabels, testSubjects and trainSubjects store the information for which activity was performed and who performed it, respectively. 
- furthermore the variable features stores the column names for the data set.
- We add two columns to both the train and the test data sets; one for the activity name and one for the subject.
-We then join the two data sets into the variable allData, while removing all the columns that do not contain the name mean or std.
-We then prepare a melted data set, stored in the variable allDataMelted, which we use to create a new tidy data set containing the averages for each measurement for each activity and subject.
- This new data set is saved to a file called tidyData.txt.