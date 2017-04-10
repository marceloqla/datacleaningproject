# datacleaningproject
# Coursera Getting and Cleaning Data Course Project
### Scripts on this folder:
* _run_analysis.R_: A script that does the following actions:
1. From the UCI HAR Dataset folder, opens and read the needed data sets and description for the variables.
2. Datasets are read and filtered for only the measurements on the mean and standard deviation for each measurement.
3. The descriptive activity names are used to name the activities in the data set
4. Data is labelled with the descriptive variable names for the data set.
5. The training and test data sets are merged, and a new tidy data set with the average of each variable for each activity and each subject is generated and saved to the file "tidy.txt"

### A code book that describes the variables, the data, and any transformations or work performed to clean up the data is in the archive CodeBook.md.
