---
title: "README"
author: "Bhavesh Patel"
date: "04/01/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Read me for GACD programming assignment.

This programming assignment was about cleaning up a dataset analysis. The files contained in the UCI HAR dataset were broken into test and training sets, subject data was stored separately and labels for activities were coded in yet another file. The script 'run_analysis.R':
1. merged into one large dataset
2. extracted only those measurements related to means and standard deviations.
3. substituted the activity codes for the actual descriptive activity names
4. renamed some of the columns with more descriptive labels
5. created a new text file called 'tidy_data' which contains this new tidy dataset.
