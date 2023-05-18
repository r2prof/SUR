# Chapter 3

## Loads the Statistics Using R library (once per R session)
library(sur)

# Table 3.1
## Table of home language for the NELS dataset
table(NELS$homelang)

# Figure 3.1
## Barplot of NELS region variable
barplot(table(NELS$region))

# Figure 3.2
## Barplot of Spanish Fluency Scores
barplot(table(Figure3_2$fluency), main = "Bar Graph of Spanish Fluency Scores")

# Figure 3.3
## Barplot of a rectangular distribution of scores
barplot(table(Figure3_3$score), main = "Rectangular Distribution of Scores")

## Make a table of NELS ses values
table(NELS$ses)

## Find the mode of NELS ses
the.mode(NELS$ses)

# Example 3.1
## Find the median of NELS ses, first with the median command, and then with the quantile command
median(NELS$ses)
quantile(NELS$ses, c(0.5))

# Example 3.2
## Find the mean of NELS ses
mean(NELS$ses)

## Find the mean of NELS region, although meaningless
mean(as.numeric(NELS$region))

# Example 3.4
## Find the mean of NELS gender
## The first line codes gender as a 0/1 variable, the second line takes the mean
NELS$numeric_gender = as.numeric(NELS$gender) - 1
mean(NELS$numeric_gender)
## Percent table of NELS gender
percent.table(NELS$gender)

# Figure 3.5
## Splits the plotting frame into two
par(mfrow = c(1,2))
## Barplots of Distributions A and B
barplot(table(Figure3_5a$DistnA), xlab = "", main = "", col = "grey")
barplot(table(Figure3_5b$DistnB), xlab = "", main = "", col = "grey")
## Returns the plotting frame to original settings
par(mfrow = c(1,1))

# Figure 3.6
## Negatively skewed histogram
hist(Figure3_6and7$NegSkew, xlab = "", main = "", col = "grey")

# Figure 3.7
## Positively skewed histogram
hist(Figure3_6and7$PosSkew, xlab = "", main = "", col = "grey")

# Example 3.5
## Mean, median and mode of ses for the NELS dataset
mean(NELS$ses)
median(NELS$ses)
the.mode(NELS$ses)
## Mean, median and mode for expinc30, schattrt, and slfcnc08 for the NELS dataset
## Note here that the na.rm option removes missing values from the variable when calculating the mean and median
mean(NELS$expinc30, na.rm = T)
median(NELS$expinc30, na.rm = T)
the.mode(NELS$expinc30)
mean(NELS$schattrt, na.rm = T)
median(NELS$schattrt, na.rm = T)
the.mode(NELS$schattrt)
mean(NELS$slfcnc08)
median(NELS$slfcnc08)
the.mode(NELS$slfcnc08)

# Example 3.6
## Temperature boxplots by city
boxplot(Temp$Temperature~Temp$City)
## Temperature histograms for each city, plotted in one frame
par(mfrow=c(1,2))
hist(Temp$Temperature[Temp$City=="Springfield"],
     main = "Springfield", xlab = "Temperature",
     xlim = c(30,80), ylim = c(0,5), col = "grey")
hist(Temp$Temperature[Temp$City=="SanFrancisco"],
     main = "San Francisco", xlab = "Temperature",
     xlim = c(30,80), ylim = c(0,5), col = "grey")
par(mfrow=c(1,1))
## IQRs by city
IQR(Temp$Temperature[Temp$City == "Springfield"])
IQR(Temp$Temperature[Temp$City == "SanFrancisco"])

# Example 3.7
## Variances by city
var(Temp$Temperature[Temp$City == "Springfield"])
var(Temp$Temperature[Temp$City == "SanFrancisco"])

## Standard deviations by city
sd(Temp$Temperature[Temp$City == "Springfield"])
sd(Temp$Temperature[Temp$City == "SanFrancisco"])

# Example 3.8
## Skew, Standard Error of Skew, and Skew Ratio for San Francisco Temperatures
skew(Temp$Temperature[Temp$City == "SanFrancisco"])
se.skew(Temp$Temperature[Temp$City == "SanFrancisco"])
skew.ratio(Temp$Temperature[Temp$City == "SanFrancisco"])
## Skew, Standard Error of Skew, and Skew Ratio for Springfield Temperatures
skew(Temp$Temperature[Temp$City == "Springfield"])
se.skew(Temp$Temperature[Temp$City == "Springfield"])
skew.ratio(Temp$Temperature[Temp$City == "Springfield"])

## Boxplot of expected income by gender for the NELS dataset
boxplot(NELS$expinc30~NELS$gender)

## Skew, Standard Error of Skew, and Skew Ratio for NELS expected income by gender
skew(NELS$expinc30[NELS$gender == "Male"])
se.skew(NELS$expinc30[NELS$gender == "Male"])
skew.ratio(NELS$expinc30[NELS$gender == "Male"])
skew(NELS$expinc30[NELS$gender == "Female"])
se.skew(NELS$expinc30[NELS$gender == "Female"])
skew.ratio(NELS$expinc30[NELS$gender == "Female"])

## Calculates the Mean and Median of NELS expected income by gender
## Note here that the na.rm option removes missing values from the variable when calculating the mean and median
mean(NELS$expinc30[NELS$gender == "Male"], na.rm = T)
median(NELS$expinc30[NELS$gender == "Male"], na.rm = T)
mean(NELS$expinc30[NELS$gender == "Female"], na.rm = T)
median(NELS$expinc30[NELS$gender == "Female"], na.rm = T)

## Calculates the Variance, Standard Deviation, and IQR of NELS expected income by gender
## na.rm = T removes missing values
var(NELS$expinc30[NELS$gender == "Male"], na.rm = T)
sd(NELS$expinc30[NELS$gender == "Male"], na.rm = T)
IQR(NELS$expinc30[NELS$gender == "Male"], na.rm = T)
var(NELS$expinc30[NELS$gender == "Female"], na.rm = T)
sd(NELS$expinc30[NELS$gender == "Female"], na.rm = T)
IQR(NELS$expinc30[NELS$gender == "Female"], na.rm = T)

## Removes outliers from the Male group for expected income (IDs 102 and 494)
NELS$expinc30[NELS$gender == "Male" & NELS$id != 102 & NELS$id != 494]
## Computes the mean for the Male group with outliers removed
mean(NELS$expinc30[NELS$gender == "Male" & NELS$id != 102 & NELS$id != 494], na.rm = T)
