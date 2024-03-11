---
title: "AYU - Pod Week 1"
format: 
  html: 
    toc: true
editor: visual
---




In this POD assignment, we will use R to work with time series objects. R is the most popular statistical programming language and in each of our POD assignments, we will use R to implement the methods that we cover during the week.

In this first POD assignment, please watch the instruction video to understand how you should do the assignment and submit them to Canvas for grading.

------------------------------------------------------------------------

### Instruction

1.  *Watch this [Video Instruction](https://drive.google.com/file/d/1-iswKjJpGn_fF3XOtyI__taRhEGX4OMw/view). This video will go through the steps in this instruction to show you how to do the assignment and submit it.*

2.  *Install R, Rstudio and the package `rmarkdown` as follows.*

    -   *Download R at [this link](https://cran.r-project.org/bin/windows/base/)*

    -   *Download Rstudio at [this link](https://posit.co/download/rstudio-desktop/)*

    -   *Install R*

    -   *Install Rstudio*

    -   *Open Rstudio, in the console, type: `install.packages('rmarkdown')`*

3.  *Download the submission Rmarkdown file at [this link](ayu_pod_submission.Rmd)*

4.  *Open the submission file using Rstudio and write R codes below each question to answer the question. To insert a code chunk, use Ctrl + Alt + I.*

5.  *Answer the questions to learn about the subject. Question without the asterisk (\*) have the answers given to you. For question that have the answer, you still need to copy the codes and answer them. For question that do not have the answer, you need to create your own codes to answer the question.*

6.  *Once you are done answering all the question, Knit the file (Use: Ctrl + Shift + K or Click to Knit -\> Knit to pdf) to convert the Rmarkdown file into a pdf file.*

7.  *Submit the pdf to Canvas.*

------------------------------------------------------------------------

## Question 1. 

Use the codes given in the slides to

- Generate a white noise of 1000 observations from the standard normal distribution 

- Generate a white noise of 1000 observations from the chi-square distribution.  Use the function `rchisq` to generate random sample from the chi-square distribution


## Question 2. 

The following codes is to read then plot a time series from a CSV file using the `ts` function.


::: {.cell}

```{.r .cell-code}
library(TTR)
# read data
d <- read.csv('https://bryantstats.github.io/math475/data/MedCPISmooth.csv')
t1 = ts(d$PerMEDCPI, start = 1947, frequency = 4)

# plot the time series
plot(t1, main = paste0("Medical Component of the CPI"))
```
:::


Apply the above codes to read then plot the series from [yearly medical expense.](data/yearly_MedCPI.csv)  

## Question 3. 

Use the `acf` function to plot the ACF of the time series in the above question. 

## Question 4

Import a time series data of your own. Plot the series and the auto-correlation function of the series.  Does your time series have a trend or seasonal component?
