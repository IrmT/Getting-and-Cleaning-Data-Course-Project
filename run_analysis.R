########### Preparation########### 

rm(list = ls()) # remove all objects from workspace

# download the data set into working directory and unzip
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile="HAR.zip")
unzip("HAR.zip")

###############################################################################
# Step 1: Merge the training and test sets to create one data set
###############################################################################

x_train <- read.table("train/X_train.txt") # load training data set.
y_train <- read.table("train/y_train.txt") # load activity labels (numerically coded)
subject_train <- read.table("train/subject_train.txt") # Each row identifies a subject 

x_test <- read.table("test/X_test.txt") # load test data set.
y_test <- read.table("test/y_test.txt") # load activity labels (numeyrically coded).
subject_test <- read.table("test/subject_test.txt") # Each row identifies a subject 

# Combine training and test data sets into x_data
x_data <- rbind(x_train, x_test)

# create y_data with labels
y_data <- rbind(y_train, y_test)

# create data set with subjects
subject_data <- rbind(subject_train, subject_test)


###############################################################################
# Step 2: extract columns reporting only mean or standard deviation data
###############################################################################


features <- read.table("features.txt") # load the features data with data column names

# select only the  columns with mean() or std() in their names (number vector)
mean_std <- grep("(mean|std)", features[, 2])

# subset the desired columns
x_data <- x_data[, mean_std] # selects only for columns in the vector created above

# apply the correct column names
names(x_data) <- features[mean_std, 2]

###############################################################################
# Step 3: incorporate activity names into the data set
###############################################################################

activities <- read.table("activity_labels.txt") # load the activity_labels data with names of activities

# replace values with activity names
y_data[, 1] <- activities[y_data[, 1], 2]

# add descriptive column name "activity.id"
names(y_data) <- "activity.id"

###############################################################################
# Step 4: Add proper variable names to  the data set
###############################################################################

# add descriptive column name "subject"
names(subject_data) <- "subject"


# bind all the data into one data set
all_data <- cbind(x_data, y_data, subject_data)

###############################################################################
# Step 5: Create new tidy data set with average and standard deviation data (by subject and activity)
###############################################################################

library('dplyr') # load the dplyr package

# average by subject and activity.id

finaldata <- all_data %>%
  group_by(subject,activity.id) %>%
  summarise_each(funs(mean))


# write new final, tidy data set to file
write.table(finaldata, "finaldata.txt", row.name=FALSE) #write final tidy data to file

