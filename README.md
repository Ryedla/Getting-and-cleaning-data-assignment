# Introduction

The project starts with taking the different text files and collating them into a single file. This file is inturn used in the analysis. The source of the data is the below:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]

## Files

The code takes for granted all the data is present in the same folder, un-compressed and without names altered.

CodeBook.md describes the variables, the data, and any transformations or work that was performed to clean up the data.

run_analysis.R contains all the code to perform the analyses described in the 5 steps. They can be launched in RStudio by just importing the file.

The output of the 5th step is called tidy_averages_data.txt, and uploaded in the course project's form.

## Steps
Sequence of Steps executed by run_analysis.R: 

1 - Read feature names, these are the column lables from file features.txt
2-  determine which columns are needed and store the index of these columns in needed_cols
3 - Read subject, activity and Data Test set Dataframes, merge them into one Dataframe,  
4 - Read subject, activity and Data Training set Dataframes, merge them into one Dataframe, 
5 - Merge the Test and Traning Data 
6 - Combine train Data with test data into one dataframe
7 - generate grouped summaries  - not required by the project, but helps with data analysis
