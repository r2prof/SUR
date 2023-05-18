# Chapter 16

## Loads the Statistics Using R library (once per R session)
library(sur)

# Example 16.1
## Runs a linear regression of bars sold on temperature and relative humidity and stores the output in an object named results
results = lm(IceCream$barsold ~ IceCream$temp + IceCream$relhumid)
## Outputs the summary of the regression model
summary(results)
## Outputs confidence intervals for each of the regression coefficients
confint(results)

## Pair-wise correlations for bars sold, temperature, and relative humidity.
cor.test(IceCream$barsold, IceCream$temp)
cor.test(IceCream$barsold, IceCream$relhumid)
cor.test(IceCream$temp, IceCream$relhumid)

## Runs the same regression, but this time outputs standardized regression coefficients
results = lm(scale(IceCream$barsold) ~ scale(IceCream$temp) + scale(IceCream$relhumid) -1)
summary(results)

## Installs the ppcor package (once per computer)
install.packages("ppcor")
## Loads the ppcor package (once per R session)
library(ppcor)
## Calculates the semi-partial correlations for temperature and relative humidity with bars sold
spcor.test(IceCream$barsold, IceCream$temp, IceCream$relhumid)
spcor.test(IceCream$barsold, IceCream$relhumid, IceCream$temp)

## Runs two regressions, one for bars sold on temperature, and the other for bars sold on temperature and relative humidity, and stores the output in results1 and results2, respectively.
results1 = lm(IceCream$barsold ~ IceCream$temp)
results2 = lm(IceCream$barsold ~ IceCream$temp + IceCream$relhumid)
## Calculates the F statistic for the difference between the two models
anova(results1, results2)

# Example 16.2
## Runs a regression for temperature on relative humidity
results3 = lm(IceCream$temp ~ IceCream$relhumid)
## Outputs the residuals of this model
results3$resid

## Runs a regression of bars sold on the residuals of the previous model
results4 = lm(IceCream$barsold~results3$resid)
## Outputs a summary of the regression model
summary(results4)

# Example 16.3
## Pairwise correlations for slfcnc12, slfcnc08, and gender from the NELS dataset
cor.test(NELS$slfcnc12, NELS$slfcnc08)
cor.test(NELS$slfcnc12, as.numeric(NELS$gender))
cor.test(NELS$slfcnc08, as.numeric(NELS$gender))

## Runs a regression of slfcnc12 on slfcnc08 and gender
results = lm(NELS$slfcnc12 ~ NELS$slfcnc08 + NELS$gender)
## Outputs the results of the regression
summary(results)

# Example 16.4
## Calculates summary statistics (mean and standard deviation) for points and weight for the Basketball dataset
mean(Basketball$points)
sd(Basketball$points)
mean(Basketball$weightlb)
sd(Basketball$weightlb)
## Calculates the correlation between points and weight
cor.test(Basketball$points, Basketball$weightlb)
## Runs a regression of points on weight, and stores the model in an variable named results
results = lm(Basketball$points ~ Basketball$weightlb)
## Outputs a summary of the regression results
summary(results)

## Plots points against weight
plot(Basketball$points~Basketball$weightlb, xlab = "Weight", ylab = "Points", pch = 16)
## Adds in the regression line to the plot
abline(lm(Basketball$points ~ Basketball$weightlb))

## Colors the points based on gender
plot(Basketball$points~Basketball$weightlb, xlab = "Weight", ylab = "Points", pch = 16, col = Basketball$gender)
## Adds in a regression line for points on weight for men only
abline(lm(Basketball$points[Basketball$gender == "Male"] ~ Basketball$weightlb[Basketball$gender == "Male"]))
## Adds in a regression line for points on weight for women only
abline(lm(Basketball$points[Basketball$gender == "Female"] ~ Basketball$weightlb[Basketball$gender == "Female"]), col = "red")
## Adds a legend to the plot
legend("topleft", c("Male", "Female"), pch = 16, col = c(1,2))

## Runs a regression of points on weight and gender, and stores the model in a variable named results
results = lm(Basketball$points ~ Basketball$weightlb + Basketball$gender)
## Outputs a summary of the regression model
summary(results)

# Statistical Control
## Plots strength against gym, coloring the points by gender
plot(UpperBodyStrength$strength ~ UpperBodyStrength$gym, pch = 16, col = UpperBodyStrength$gender, xlab = "Gym", ylab = "Strength")
## Adds in the regression line for men only
abline(lm(UpperBodyStrength$strength[UpperBodyStrength$gender == "male"]~UpperBodyStrength$gym[UpperBodyStrength$gender == "male"]))
## Adds in the regression line for women only
abline(lm(UpperBodyStrength$strength[UpperBodyStrength$gender == "female"]~UpperBodyStrength$gym[UpperBodyStrength$gender == "female"]), col = "red")
## Adds a legend to the plot
legend("topright", c("Male", "Female"), pch = 16, col = c(1,2))

## Calculates the regression line, omitting gender
results = lm(UpperBodyStrength$strength ~ UpperBodyStrength$gym)
## Prints out a summary of the regression line
summary(results)

## Runs a regression analysis for men only
results_male = lm(UpperBodyStrength$strength[UpperBodyStrength$gender == "male"]~UpperBodyStrength$gym[UpperBodyStrength$gender == "male"])
## Runs a regression analysis for women only
results_female = lm(UpperBodyStrength$strength[UpperBodyStrength$gender == "female"]~UpperBodyStrength$gym[UpperBodyStrength$gender == "female"])

## Runs a regression analysis of strength on gym hours and gender
results_both = lm(UpperBodyStrength$strength ~ UpperBodyStrength$gym + UpperBodyStrength$gender)
## Outputs the results of that regression line
summary(results_both)

# Example 16.5
## Runs a power analysis for a regression model with two predictors, a medium effect size, an alpha of 0.05, and power of 0.8
pwr.f2.test(u = 2, f2 = 0.15, sig.level = 0.05, power = 0.8)
