---
title: "Code Book"
author: "Bhavesh Patel"
date: "4/01/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Code book for GACD Programming assignment.
A brief description of the variables, data and transformations involved in this programming assignment. A 'tidy' data set was created from the original data using the script 'run_analysis.R'.

# Data
The dataset used for analysis is provided in this repo. Originally from UCI HAR. Refer to README in the UCI HAR folder for details of the original data. It is the gyroscopic measurements from smartphones recorded while 30 subjects performed 6 various activities.

# Variables
Variables have been renamed as listed in the r script to make them more understandable:

"Acc" -> "Acceleration"
"^t" -> "Time"
"^f" -> "Frequency"
"BodyBody" -> "Body"
"mean" -> "Mean"
"std" -> "Std"
"Freq" -> "Frequency"
"Mag" -> "Magnitude"