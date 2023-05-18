# Chapter 2

## Loads the Statistics Using R library (once per R session)
library(sur)

# Table 2.1
## Creates a frequency table for NELS region variable
table(NELS$region)

# Table 2.2
## Creates a percent table for NELS region variable
percent.table(NELS$region)

# Figure 2.1
## Creates a frequency barplot of the NELS region variable.
barplot(table(NELS$region), ylab = "Frequency")

# Figure 2.2
## Creates a percent barplot of the NELS region variable.
barplot(percent.table(NELS$region), ylab = "Percent")

## Creates a horizontal frequency barplot of the NELS region variable
barplot(table(NELS$region), xlab = "Frequency", horiz = T)

# Figure 2.3
## Creates a pie chart of the NELS region variable
pie(table(NELS$region), col = grey(1:4/4))

# Figure 2.4
## Creates a pie chart of the causes of death in NYC
pie(table(Figure2_4$causes), main = "Annual Number of Deaths, NYC", col = grey(1:4/4))

# Table 2.3
## Creates a table of the ses values from the NELS dataset
table(NELS$ses)

# Table 2.4
## Creates a new variable named categories.ses as part of the NELS dataset that categorizes the original ses variable into blocks of 5.
NELS$categories.ses = cut(NELS$ses, breaks = c(0,5,10,15,20,25,30,35,40))
## Outputs a table of the new categorized variable.
table(NELS$categories.ses)

# Table 2.5
## Creates a percent table of the categorized ses variable
percent.table(NELS$categories.ses)

# Table 2.6
## Creates a stem and leaf plot of the of the pertak variable in the States dataset
stem(States$pertak)

# Table 2.7
## Creates a stem and leaf plot of the satm variable in the States dataset
stem(States$satm, scale = 2)

# Figure 2.5
## Plots a histogram of the ses variable in the NELS dataset
hist(NELS$ses, main = "Histogram", xlab = "Socio-economic Status")

# Figure 2.6
## Changes the number of bins to 5 for the histogram plotted above
hist(NELS$ses, breaks = seq(min(NELS$ses), max(NELS$ses), length.out = 6), main = "Histogram with 5 bins", xlab = "Socio-economic Status")

# Figure 2.7
## Changes the number of bins to 30 for the histogram plotted above
hist(NELS$ses, breaks = seq(min(NELS$ses), max(NELS$ses), length.out = 31), main = "Histogram with 30 bins", xlab = "Socio-economic Status")

# Figure 2.8
## Creates a density histogram of the ses variable in the NELS dataset
hist(NELS$ses, freq = F, xlab = "Socio-economic Status", main = "Histogram")

# Figure 2.9
## Creates a line graph of the ses variable in the NELS dataset
line.graph(NELS$ses, main = "Line Graph", xlab = "Socio-economic Status", ylab = "Density")

# Figure 2.10
## Creates a density graph of the ses variable in the NELS dataset with the default bandwidth setting
plot(density(NELS$ses), main = "Density Graph", xlab = "Socio-economic Status")

# Figure 2.11
## Changes the bandwidth in the density graph plotted above
plot(density(NELS$ses, bw = 0.75), main = "Density Graph", xlab = "Socio-economic Status")

# Figure 2.12
## Creates a line graph of Marijuana Use by Year
plot(Marijuana$MarijuanaUse~Marijuana$Year, type = "l", xlab = "Year", ylab = "Marijuana Use")

## Changes the line in the graph to be thicker, blue, and dashed.
plot(Marijuana$MarijuanaUse~Marijuana$Year, type = "l", xlab = "Year", ylab = "Marijuana Use", col = "blue", lwd = 2, lty = 2)

# Figure 2.14
## Creates a histogram of the slfcnc12 variable in the NELS dataset
hist(NELS$slfcnc12, main = "Histogram of Self Concept in 12th Grade", xlab = "Self Concept", breaks = 20)

# Figure 2.15
## Disables scientific notation
options(scipen = 999)
## Plots a histogram of the expinc30 variable in the NELS dataset
hist(NELS$expinc30, main = "Histogram of Expected Income at 30", xlab = "Expected Income", breaks = 20)

# Table 2.8
## Creates a cumulative table of the categorized ses values in the NELS dataset
cumulative.table(NELS$categories.ses)

# Table 2.9
## Creates a cumulative table of the original ses values in the NELS dataset
cumulative.table(NELS$ses)

# Example 2.3
## Calculates the quartiles of the ses variable in the NELS dataset
quantile(NELS$ses, c(0.25, 0.5, 0.75))

# Table 2.10
## Outputs a summary of the NELS ses variable, including the minimum and maximum values, quartiles, and mean
summary(NELS$ses)

# Figure 2.16
## Creates a boxplot of the NELS ses variable
boxplot(NELS$ses)

# Figure 2.17
## Creates a boxplot of the NELS slfcnc12 variable
boxplot(NELS$slfcnc12)

# Figure 2.18
## Disables scientific notation
options(scipen = 999)
## Creates a boxplot of the NELS expinc30 variable
boxplot(NELS$expinc30)

# Figure 2.19
## Creates a boxplot of the educexpe variable in the States dataset
boxplot(States$educexpe)

# Example 2.4 (Figure 2.20)
## Creates side-by-side boxplots of the educexpe variable in the States dataset, split by region
boxplot(States$educexpe~States$region)
