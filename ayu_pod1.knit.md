---
title: "AYU - Pod Week 1"
format: 
  html: 
    toc: true
editor: visual
---




In this R assignment, we will use R to work with time series objects. R is the most popular statistical programming language and in each of our POD assignments, we will use R to implement the methods that we cover during the week.

In this first R assignment, please watch the instruction video to understand how you should do the assignment and submit them to Canvas for grading.

------------------------------------------------------------------------

### Instruction

1.  *Watch this [Video Instruction](https://drive.google.com/file/d/1-iswKjJpGn_fF3XOtyI__taRhEGX4OMw/view). This video will go through the steps in this instruction to show you how to do the assignment and submit it.*

2.  *Install R, Rstudio and the package `rmarkdown` as follows.*

    -   *Download R at [this link](https://cran.r-project.org/bin/windows/base/)*

    -   *Download Rstudio at [this link](https://posit.co/download/rstudio-desktop/)*

    -   *Install R*

    -   *Install Rstudio*

    -   *Open Rstudio, in the console, type: `install.packages('rmarkdown')`*

3.  *Download the submission Rmarkdown file at [this link](R_submission.Rmd)*

4.  *Open the submission file using Rstudio and write R codes below each question to answer the question. To insert a code chunk, use Ctrl + Alt + I.*

5.  *Answer the questions to learn about the subject. Question without the asterisk (\*) have the answers given to you. For question that have the answer, you still need to copy the codes and answer them. For question that do not have the answer, you need to create your own codes to answer the question.*

6.  *Once you are done answering all the question, Knit the file (Use: Ctrl + Shift + K or Click to Knit -\> Knit to pdf) to convert the Rmarkdown file into a pdf file.*

7.  *Submit the pdf to Canvas.*

------------------------------------------------------------------------

## 1. Import a Time Series

The following codes is to read then plot a time series from a CSV file using the `ts` function.

[Dataset](https://bryantstats.github.io/time_series/data/MedCPISmooth.csv)


::: {.cell}

```{.r .cell-code}
library(TTR)

# import/read the data
d <- read.csv('https://bryantstats.github.io/time_series/data/MedCPISmooth.csv')

# make sure that the data has no missing values
d = na.omit(d)

# frequency = 4 for quarterly data, 
# frequency = 12 for monthly data, 
# frequency = 1 for yearly data, by default frequency = 1

t1 = ts(d$PerMEDCPI, start = c(1947, 2), frequency = 4)

# plot the time series
plot(t1, main = paste0("Medical Component of the CPI"))
```
:::

We observe that the series is not stationary because the mean does change over time.

Notice that 

- The dataset has multiple columns, but we only use the column `PerMEDCPI` as our time series.  

- The series is a quarterly dataset. Thus, we use the `frequency = 4` in the `ts` function. 

- The series start from month 6 of 1947, which is the second quarter so we set `start = c(1947, 2)`

## 2. Ploting the ACF

To plot the ACF of the series, we use the `acf` function. We can control the number of lags in the ACF by the parameter `lag.max`


::: {.cell}

```{.r .cell-code}
acf(t1, lag.max = 100)
```
:::


We can see that the ACF does not die out to zeroes (going out of the strip). This indicates that the series is not stationary. 

## 3. Questions

1. Rerun all the given codes to reproduce the results. 

2. Import and plot the series from [yearly medical expense.](data/yearly_MedCPI.csv)

3. Use the `acf` function to plot the ACF of the time series in the above question. Base on the plot of the series and the ACF, do you think the series is stationary?

4. Import a time series data of your own. Plot the series and the auto-correlation function of the series.  Does your time series have a trend or seasonal component? Is your series stationary?
