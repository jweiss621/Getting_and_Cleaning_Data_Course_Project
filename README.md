README
========================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

Purpose of the script:
=======================================================
- 1) Merge the training and test sets to create one data set
- 2) Extract only measurements on the mean and standard deviation
- 3) Use descriptive activity names to name the activities in the data set
- 4) Appropriately label the data set with desciptive activity names
- 5) Create a second independent tidy data set with the average of each variable and each subject

The dataset includes the following files:
=======================================================
- 'features.txt': List of all features.
- 'X_train.txt': Training set.
- 'y_train.txt': Training labels.
- 'X_test.txt': Test set.
- 'y_test.txt': Test labels.
- 'subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
- 'subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

Description of the script in detail:
======================================================
The script first loads all the informaiton from the datasets; the training data, the test data, and the list of all the features.

Then the script finds the columns that correspond to the features that are used to measure the mean and standard deviation.

The feature names are then tidied up by removing all punctation and making them all lower case.

The test and training datasets are then merged vertically so the x test set and the x training set are merged, the y test set and the y training set are merged, and the subject test set and the subject training set are merged.

The x dataset is then named using the tidied feature names vector. The measurements of mean and standard deviation are then extracted from the x dataset using the necessary indices that were previously calulated in the script.

The numbers from the y vectors are then changed to contain the activity that they correspond to

The y and subject vector are then named to be "Activities" and "Subject" respectively

The x, y, and subject datasets are then merged horizontally to create a single dataset called merged_total

A second independent tidy data set is then created with the average of each variable and each subject. In order to do this, the reshape2 package with the functions melt and dcast were used. The function melt lengthens datasets and the function dcast takes long-format data and turns it into wide-format data. The dcast function is also capable of aggregating by mean. Therefore, in order to create the final independent data set, the single data set merged_total was first melted by "Subject" and "Activitiy". The function dcast was then used and was aggregated by the mean of "Subject" and "Activity". Then finally, the data set was lengthened so each row corresponded to the mean of one "Subject", "Activity" combination.

Notes: 
======
- Features are normalized and bounded within [-1,1].

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
