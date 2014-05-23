CODE BOOK
========================================================

Explanation of Data
========================================================
- test_x: data set containing data from X_test.txt, the test set
- test_y: data set containing data from y_test.txt, the test labels
- test_subject: data set containing data from subject_test.txt, indicates the subject who performed each activity from the test data
- train_x: data set containing data from X_train.txt, the training set
- train_y: data set containing data from y_train.txt, the training labels
- train_subject: data set containing data from subject_train.txt, indicates the subject who performed each activity from the training data
- features: lists all features, which is extracted from features.txt
- merged_x: a vertical merge of test_x and tain_x
- merged_y: a vertical merge of test_y and train_y
- merged_subject: a vertical merge of test_subject and train_subject
- merged_total: a horizontal merge of merged_x, merged_y, and merged_subject
- lengthen_dataset: the lengthened version of merged total aggregated by "Subject" and "Activity"
- horizontal_dataset: the widened version of lengthened_dataset aggregated by the mean of "Subject" and "Activity"
- tidy_dataset: the lengthened version of horizontal_dataset

Desciption of Variables
========================================================
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- "tbodyaccxyz"      
- "tgravityaccxyz"   
- "tbodyaccjerkxyz"  
- "tbodygyroxyz"     
- "tbodygyrojerkxyz"
- "tbodyaccmag"      
- "tgravityaccmag"   
- "tbodyaccjerkmag"  
- "tbodygyromag"     
- "tbodygyrojerkmag"
- "fbodyaccxyz"      
- "fbodyaccjerkxyz"  
- "fbodygyroxyz"     
- "fbodyaccmag"      
- "fbodyaccjerkmag" 
- "fbodygyromag"     
- "fbodygyrojerkmag"

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation

There were also two more variables, the subject and activity:
- "Subject": each row identifies the subject who performed the activity for each window sample                
- "Activity": identifies the activity performed for that row of data

Variable Selection Method
========================================================
I decided to select the mean value and standard deviation for all variables. This means that I decided to exclude meanFreq(), the weighted average of the frequency components to obtain a mean frequency.

Naming Strategy
========================================================
To name the variables, I decided to remove all punctuation and make all the variable names lower case.

Activity Labels
========================================================
The "Activity" column had the following transformation from numbers to activity name:
- 1 --> "walking"
- 2 --> "walking_upstairs"
- 3 --> "walking_downstairs"
- 4 --> "sitting"
- 5 --> "standing"
- 6 --> "laying"


Transformations
========================================================
The following transformations were performed in order to merge the taining and test sets to create one data set:
- test_x and train_x were vertically merged to create merged_x
- test_y and train_y were vertically merged to create merged_y
- test_subject and train_subject were vertically merged to create merged_subject
- merged_x, merged_y, and merged_subject were then horizontally merged to created a single dataset called merged_total

The following transformations were performed to create a second independent tidy data set with the average of each variable for each activity and each subject:
- merged_total was lengthened and then aggregated by "Subject" and "Activity" to create lengthen_dataset using the function melt from the package "reshape2"
- lengthen_dataset was then widened and aggregated by mean to create horizontal_dataset using the function dcast also from the package "reshape2"
- finally horizontal_dataset was lengthened using the function melt to create the finalized data


