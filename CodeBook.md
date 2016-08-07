This code book will provide further details on all of the steps followed to get our tidy data.

## Data set information obtained from the README document of the Human Activity Recognition Using Smartphones Dataset

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we 
captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments 
have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two 
sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled 
in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, 
which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body 
acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a 
filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating 
variables from the time and frequency domain. See 'features_info.txt' for more details. 

## Files used

1. test/subject_test.txt
2. train/subject_train.txt
3. test/X_test.txt
4. train/X_train.txt
5. test/y_test.txt
6. train/y_train.txt
7. features.txt
8. activity_labels.txt

## Variables (this changes of name were made during step 4)
1. t = time
2. Body = related to body movement
3. Gravity = acceleration of gravity
4. Acc = accelerometer measurement
5. Gyro = gyroscopic measurements
6. Jerk = sudden movement acceleration
7. Mag = magnitude of movement
8. f = frequency

Step 1. All of the files needed were read, column names were assigned in order for us to merge one data set.
Step 2. Use a logical vector to extract only the mean and standard deviation from the data set.
Step 3. Include activity names by merging the activity_labels.txt information with the data set created.
Step 4. Use gsub() to change the names and obtain more understandable variable names.
Step 5. Create a text file by using the write.table() to summarize al of the changes made to the data provided.
