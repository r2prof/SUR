# Chapter 15

## Loads the Statistics Using R library (once per R session)
library(sur)

# Figure 15.1
## Creates a plot of y on x.
plot(Figure15_1$y ~ Figure15_1$x, xlab = "", ylab = "", pch = 16)

# Figure 15.2
## Changes the size of the points to be the number of data points with that value.
plot(Figure15_1$y ~ Figure15_1$x, xlab = "", ylab = "", pch = 16, cex = Figure15_1$f)

# Figure 15.5
## Plots bars sold on temperature, and adds line of best fit (regression line)
plot(IceCream$barsold ~ IceCream$temp, pch = 16, xlab = "Temperature", ylab = "Bars Sold")
abline(lm(IceCream$barsold~IceCream$temp))

## Calculates and tests (one-sided, greater alternative) the correlation between temperature and bars sold
cor.test(IceCream$temp, IceCream$barsold, alternative = "greater")
## Calculates the p-value by hand
pt(10.20, 28, lower.tail = F)

# Example 15.1
## Calculates and tests (two-sided) the correlation between math and reading achievement
cor.test(NELS$achmat12, NELS$achrdg12)

# Example 15.2
## Fits the regression line of bars sold on temperature, and stores the model in an object named results
results = lm(IceCream$barsold ~ IceCream$temp)
## Displays the output of the linear regression
summary(results)
## Provides confidence intervals for the coefficients
confint(results)
## Provides the F statistic for the linear regression model
anova(results)

# Anscombe Data
## Fits four regression lines, outputting the results of each model for the Anscombe data
results1 = lm(Anscombe$y1 ~ Anscombe$x1)
summary(results1)
results2 = lm(Anscombe$y2 ~ Anscombe$x2)
summary(results2)
results3 = lm(Anscombe$y3 ~ Anscombe$x3)
summary(results3)
results4 = lm(Anscombe$y4 ~ Anscombe$x4)
summary(results4)

# Figure 15.8
## Residual versus Fitted plots for each of the Anscombe datasets
plot(results1, which = 1)
plot(results2, which = 1)
plot(results3, which = 1)
plot(results4, which = 1)

# Figure 15.9
## Plots y on x and adds regression line to the plot
plot(Figure15_9$y~Figure15_9$x, xlab = "", ylab = "")
abline(lm(Figure15_9$y~Figure15_9$x))

# Figure 15.10
## Plots the residuals of the regression model against x, and plots the regression line
plot(Figure15_9$res ~ Figure15_9$x, xlab = "", ylab = "")
abline(lm(Figure15_9$res ~ Figure15_9$x))

# Figure 15.11
## Plots the log of y against x and adds the regression line
plot(Figure15_9$log_y~Figure15_9$x, xlab = "", ylab = "")
abline(lm(Figure15_9$log_y~Figure15_9$x))

# Figure 15.12
## Plots y against x and adds the regression line
plot(Figure15_12$y~Figure15_12$x, xlab = "x", ylab = "y", pch = 16)
abline(lm(Figure15_12$y~Figure15_12$x))

# Figure 15.13
## Plots ypr against xpr and adds the regression line
plot(Figure15_12$ypr~Figure15_12$xpr, xlab = "x", ylab = "y", pch = 16)
abline(lm(Figure15_12$ypr~Figure15_12$xpr))

# Figure 15.14
## Creates a new variable named newY that stores the variable ypr
newY = Figure15_12$ypr
## Changes the 9th value in newY to newY + 2
newY[9] = newY[9]+2
## Plots our new variable against xpr
plot(newY~Figure15_12$xpr, xlab = "x", ylab = "y", pch = 16)
## Adds the regression line to the plot
results = lm(newY~Figure15_12$xpr)
abline(results)

# Table 15.2
## Calculates the regression line of newY on xpr and stores the output in an object named results
results = lm(newY~Figure15_12$xpr)
## Calculates the leverage of each point
leverage(results)

# Table 15.3
## Calculates the regression line of y on x
results = lm(Figure15_12$y ~ Figure15_12$x)
## Calculates the studentized residuals for the regression model
rstudent(results)

# Table 15.4
## Calculates the regression line for newY on xpr and stores the ouput in an object named results
results = lm(newY~Figure15_12$xpr)
## Calculates the Cook's Distance for each point
cooks.distance(results)

# Figure 15.15
## Creates a blank plot with x and y limits to match temperature and bars sold
plot(c(0), type = "n", xlim = range(IceCream$temp), ylim = range(IceCream$barsold), ylab= "", xlab = "")
## Adds points to the plot where each point is the ID number for that data point
text(IceCream$barsold ~ IceCream$temp, labels = IceCream$id, pch = 0)

# Figure 15.16
## Calculates the regression line for bars sold on temperature
results = lm(IceCream$barsold ~ IceCream$temp)
## Plots the residuals versus fitted values for that regression line
plot(results, which = 1)

# Figure 15.17
## Boxplot of studentized residuals
boxplot(rstudent(results))

# Figure 15.18
## Boxplot of the leverage values
boxplot(leverage(results))

# Figure 15.19
## Boxplot of the Cook's Distance values
boxplot(cooks.distance(results))

## Calculates the regression line between bars sold on temperature without point 29
results = lm(IceCream$barsold ~ IceCream$temp, subset = IceCream$id != 29)
## Outputs the summary of the regression model
summary(results)

## Calculates the regression line of bars sold on temperature for the Ice Cream data
results = lm(barsold ~ temp, data = IceCream)
## Calculates the predicted value and 95% prediction interval for a temperature of 78
predict(results, newdata = data.frame(temp = 78), interval = "predict")

## Calculates a t-test of unit math for males and females in the south for the NELS dataset
t.test(NELS$unitmath[NELS$region == "South" & NELS$gender == "Male"], NELS$unitmath[NELS$region == "South" & NELS$gender == "Female"], var.equal = T)
## Calculates the regression line for unit math on gender for people in the south
results = lm(NELS$unitmath[NELS$region == "South"] ~ NELS$gender[NELS$region == "South"])
## Outputs a summary of the regression line
summary(results)
## Calculates the correlation between unit math and gender for people in the south
cor.test(NELS$unitmath[NELS$region == "South"], as.numeric(NELS$gender[NELS$region == "South"]))

# Example 15.3
## Installs the power library (once per machine)
install.packages("pwr")
## Loads the power library (once per R session)
library(pwr)
## Calculates power for a correlation of 0.3 for a one-sided (greater) alternative
pwr.r.test(r = 0.3, sig.level = 0.05, power = 0.8, alternative = "greater")

# Example 15.4
## Calculates power for a correlation of 0.3 for a two-sided alternative
pwr.r.test(r = 0.3, sig.level = 0.05, power = 0.8, alternative = "two.sided")

# Example 15.5
## Calculates power for a regression line with one predictor and a medium effect size for a two-sided alternative
pwr.f2.test(u = 1, f2 = 0.15, sig.level = 0.05, power = 0.8)

