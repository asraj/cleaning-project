Below are the steps in the run_analysis.R script and it follows a different order than the steps mentioned in the assignment


Step 1: The run_analysis.R first reads the required data files in R using the read.table() function

Step 2: Assign variable names. Variable names are assigned to all the data loaded from files.
For the train and test data set, the variable names are assigned from the features.txt file

Step 3: For the train and test data sets, the subject and activity data

Step 4: Combine train and test data sets

Step 5: Filter the data set with mean and standard deviation

Step 6: Provide activity names to the activity numbers by merging data with activity_label.txt data

Step 7: Reshape the data for easy summarizing with 5 columns, activity_id, subject, activity, variable and value

Step 8: Calculate the mean for each subject, activity and variable

Step 9: Write the summary as text file