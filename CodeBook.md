This is the CodeBook for the data analysis for the course project in the "Gettign and cleaning data" course on coursera.

The raw data comes from this weblink: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A description of the raw data is here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The "run_analysis.R" file is the R code to download the raw data, process the raw data and generate the tidy data. The steps taken to process the raw data include:
1. Read the train and test data and the labels and subjects into dataframes.
2. Merge the train and test data set through column binding to generate one single dataframe named "merged_data".
3. Assign the features as the variable names of "merged_data".
4. Extracts only the measurements on the mean and standard deviation for each measurement to generate the dataframe called "merged_mean_std_data".
5. Add the variable "subject" and "activities" to the "merged_mean_std_data" to generate the dataframe named "data_with_activity_and_subject", which include the subject number and the activity name for each measurement.
6. Change value of "activities" into the acutall activity names instead of integers.
7. Use descriptive names to name the different measurements (variables).
8. Create a second, independent tidy data set called "tidy_data" with the average of each measurement for each subject and each activity done by that subject.
9. Write the "tidy_data" into the "tidy data.csv" file.

Explanation of the variables in the "tidy data.csv" file.
