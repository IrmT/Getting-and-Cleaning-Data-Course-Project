# Description of run_analysis.R

The script run_analysis.R performs the following actions:
*	First, the data is downloaded from the source website and unzipped.
*	Then, test and training data sets are joined (merged) to create 1 data set (“x_data”). Furthermore, the subject and activity coding for each row of test/ training are given in further data sets that are merged to create 1 data set each (activity data set = “y_data”; subject data set = “subject_data”).
*	In the next step, only the columns reporting mean or standard deviations are selected. x_data does not yet have column names--these are stored in the file “features.txt”. First, the grep function is used to create a vector selecting variables based on their labels whether their labels mention means or standard deviations. Then this vector is used to select the appropriate columns in “x_data” and subsequently to apply the correct variable names to “x_data”.
*	The activity data set (activity_labels.txt) provides the key for the word descriptions of the numerically coded activities in y_data. In the y_data data set, the activity_labels.txt is used to replace numerically coded activities with the descriptive labels. The variable in y_data is furthermore given the descriptive label “activity.id”.
*	The subject data set (subject_data) is given a descriptive variable name (“subject”)
*	The data (x_data), and the subject and activity coding (subject_data and y_data, respectively) are merged using cbind into the data set “all_data”.
*	Finally, a new dataset (finaldata.txt) is created using the dplyr package to calculate averages by subject and activity.id. This data set is saved to the working directory using the write.table function and is present in this repository.

Variables
*	x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.
*	x_data, y_data and subject_data are intermediary data sets resulting from the merging of test and training data, activity and subject coding for each measurement, respectively.
*	Features.txt contains the variable labels for x_data. This is used to create a vector labelled mean_std which identifies the variable labels containing means or standard deviations,
*	Activities.txt contains the key to link the numerically coded activity data in y_data with a descriptive name of the activity and is used to replace the numerical activity coding in y_data with descriptions.
*	all_data is the result from merging x_data, y_data and subject_data.
*	Finally, finaldata.txt contains averages for each variable by subject and activity. 

