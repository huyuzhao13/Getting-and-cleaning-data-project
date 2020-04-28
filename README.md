This repository is for the course project of the "Getting and cleaning data" course on coursera.

This repository includes the following files:
1. ".gitigore", ".Rproj.user" and "Getting-and-cleaning-data-project.Rproj": these two files are middle step files for the version control of my R studio, these files can be ignored.
2. "README.md": this is an explanation of the content of this repository and how the scripts in this repository works and how they are connected to each other.
3. "run_analysis.R": this is the script file to download data, process data and to generate the tidy data set.
4. "tidydata.txt": this is the tidy data set generated in the end. If you run the code in "run_analysis.R" in R console or R Studio, you will get this tidy data set.
5. "CodeBook.md": this is the code book that explains what the raw data is, what steps were taken to transform the raw data into the tidy data, and the variable names and units in the tidy data set.

How the scripts in this repository works:

If you run "run_analysis.R" in R, it will automatically download the raw data to your working directory, unzip the data, go through several steps to process the data, generate a tidy data set and write the "tidydata.txt" into your current working directory. The "CodeBook.md" explains how the "run_analysis.R" works and the variable names and units in the "tidyddata.txt".