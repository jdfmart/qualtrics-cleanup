# Data Cleaning Script for Qualtrics Exports

This repository contains an R script to clean and preprocess .csv data
exported from Qualtrics surveys. The script removes unnecessary columns,
formats the data, and exports a cleaned version to an Excel file.

Also available as a [web app](https://jdmart.shinyapps.io/qualtrics_cleanup/)!


The script was created for my own research purposes, but I hope it can
be useful to others as well. If you have any suggestions or
improvements, please feel free to contribute.


## Introduction

When exporting survey data from Qualtrics, the dataset often includes
many unnecessary columns that aren't needed for analysis. This script
helps streamline the process of cleaning such datasets by:

-   Removing default columns (e.g., location, Language, StartDate,
    EndDate, etc.)

-   Eliminating usually uneeded timing variables (e.g., First Click,
    Last Click, etc.)

-   Adding a unique participant ID as a first column (useful for merging
    datasets later on)

-   Exporting the cleaned data into a new csv file.

## Installation

To use this script, you need to have R installed on your computer. You
can download R from the [Comprehensive R Archive Network
(CRAN)](https://cran.r-project.org/). You can run it directly or through
an IDE, such as RStudio (which you can get at [RStudio's
website](https://posit.co/downloads/)). All needed packages are
installed and loaded at the beginning of the script.

## Usage

The script expects the dataset to be called "data.csv" and to be in the
project's working directory. Change the name of your data file and move
it, or change the script accordingly.

## Shiny App

I have also created a Shiny app that allows you to upload your Qualtrics
data and clean it without having to run the script in R. You can find
the app [here](https://jdmart.shinyapps.io/qualtrics_cleanup/)
