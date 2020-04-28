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
subject: subject number
        1..30 .number assigned to each person (subject) who volunteered for the measurements.
activities: activity
        activities the subject was doing when measurements were taken.
        WALKING .The subject was walking.
        WALKING_UPSTAIRS .The subject was walking upstairs.
        WALKING_DOWNSTAIRS .The subject was walking downstairs.
        SITTING .The subject was sitting.
        STANDING .The subject was standing.
        LAYING .The subject was laying down.
For other variables in the "tidy data.csv" file:
The other variables come from the accelerometer and gyroscope 3-axial raw signals TimeAccelerometerXYZ and TimeBodyGyroscopeXYZ. These time domain signals (prefix 'time' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (TimeBodyAccelerometer-XYZ and TimeGravityAccelerometer-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (TimeBodyAccelerometerJerk-XYZ and TimeBodyGyroscopeJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (TimeBodyAccelerometerMagnitude, TimeGravityAccelerometerMagnitude, TimeBodyAccelerometerJerkMagnitude, TimeBodyGyroscopeMagnitude, TimeBodyGyroscopeJerkMagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing FrequencyBodyAccelerometer-XYZ, FrequencyBodyAccelerometerJerk-XYZ, FrequencyBodyGyroscope-XYZ, FrequencyBodyAccelerometerMagnitude, FrequencyBodyAccelerometerJerkMagnitude, FrequencyBodyGyroscopeMagnitude, FrequencyBodyGyroscopeJerkMagnitude. (Note the frequency to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'X_axis','Y_axis','Z_axis' are used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are: 
Mean: Mean value
Standard_deviation: Standard deviation

All these other variables were summarized by taking the average values for each subject and each activity this subject did.