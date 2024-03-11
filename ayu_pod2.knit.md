---
title: "AYU - Pod Week 2"
format: 
  html: 
    toc: true
editor: visual
---


### Instruction

1.  *Download the Rmarkdown file at [this link](ayu_pod_submission.Rmd)*

2.  *Open the submission file using Rstudio and write R codes below each question to answer the question. To insert a code chunk, use Ctrl + Alt + I.*

3.  *Once you are done answering all the question, Knit the file (Use: Ctrl + Shift + K or Click to Knit -\> Knit to pdf) to convert the Rmarkdown file into a pdf file.*

4.  *Submit the pdf/Word to Canvas.*

[Video Instruction](https://drive.google.com/file/d/1-iswKjJpGn_fF3XOtyI__taRhEGX4OMw/view). 

------------------------------------------------------------------------

**Question 1** 

Use the following code to plot a time series and a moving average series. 


::: {.cell}

```{.r .cell-code}
install.packages('TTR') # install TTR package

library(TTR)
# read data
d <- read.csv('https://bryantstats.github.io/math475/data/MedCPISmooth.csv')
t1 = ts(d$PerMEDCPI, start = 1947, frequency = 4)

# plot the time series
plot(t1, main = paste0("Medical Component of the CPI"))

# create a moving average series
k = 16  # set the moving average 
t1_sma = SMA(t1, n = k)

# plot the moving average series
lines(t1_sma, col = "red")
```
:::

::: {.cell}

:::



**Question 2.** *Trend Revealing by Visualization*

In this question, we will use R to plot a time series, create an MA series and plot the MA series.

-   Open Rstudio and use the following code to plot a time series.


::: {.cell}

```{.r .cell-code}
library(TTR)
# read data
d <- read.csv('https://bryantstats.github.io/math475/data/MedCPISmooth.csv')

# frequency = 4 for quarterly data, 
# frequency = 12 for monthly data, 
# frequency = 1 for yearly data, by default frequency = 1

t1 = ts(d$PerMEDCPI, start = 1947, frequency = 4)

# plot the time series
plot(t1, main = paste0("Medical Component of the CPI"))
```
:::


-   Use the below codes to add an exponential smoothing series


::: {.cell}

```{.r .cell-code}
# In exponential smoothing, a higher ratio will weight more on the recent observation, 
# ratio close to 1 will have a 100% weight on the most recent observation
w = .1

t1_ema = EMA(t1, ratio = 1-w)

plot(t1,  main = paste0("Exponential Smoothing with w = ", w))
lines(t1_ema, col = "red")
```
:::


-   Increase the value of $w$ to see the effect this parameter on the smoothing series. You can copy and paste the given codes and change the value of $w$.

**Question 3.** *Trend Revealing by Visualization*

In this assignment we will study the dataset about the economy of Algeria. The dataset can be download at [this link](data/algeria_economy.csv).

Use the sample codes in Question 3 to do the follows. Ask the instructor for any help.

-   Plot the time series of Algeria's Exports

-   Plot an exponential smoothing series for the above time series. What is your choice for $w$?


::: {.cell}

:::
