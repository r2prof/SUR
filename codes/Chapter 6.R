# Chapter 6

## Loads the Statistics Using R library (once per R session)
library(sur)

# Figure 6.1
## Plots calories against fat for the Hamburger dataset with three possible lines of best fit. Which one fits best?
par(mfrow = c(1,3))
plot(Hamburger$calories~Hamburger$fat, xlab = "Fat", ylab = "Calories", pch = 16)
abline(lm(Hamburger$calories~Hamburger$fat))

plot(Hamburger$calories~Hamburger$fat, xlab = "Fat", ylab = "Calories", pch = 16)
abline(136.25, 13.125)

plot(Hamburger$calories~Hamburger$fat, xlab = "Fat", ylab = "Calories", pch = 16)
abline(110, 15)
# return plotting parameters to default setting
par(mfrow = c(1,1))

# Example 6.1, part 1
## Descriptive statistics for the Hamburger dataset
mean(Hamburger$calories)
sd(Hamburger$calories)
mean(Hamburger$fat)
sd(Hamburger$fat)
## Correlation between calories and fat for the Hamburger dataset
cor(Hamburger$calories, Hamburger$fat)
cor.test(Hamburger$calories, Hamburger$fat)

# Example 6.1, part 2
## Regression line for calories on fat for the Hamburger dataset
model = lm(Hamburger$calories~Hamburger$fat)
summary(model)
## Standardized regression for calories on fat for the Hamburger dataset
model2 = lm(scale(Hamburger$calories)~scale(Hamburger$fat))
summary(model2)

# Example 6.1, part 4
## Plots hamburger calories against fat, with the line of best fit.
plot(Hamburger$calories~Hamburger$fat, xlab = "Fat", ylab = "Calories", pch = 16)
abline(lm(Hamburger$calories~Hamburger$fat))

## or
plot(Hamburger$calories~Hamburger$fat, xlab = "Fat", ylab = "Calories", pch = 16)
abline(model)

# Example 6.2, part 1
## Fits the regression line, calculates and prints predicted values from the regressino line
model = lm(Hamburger$calories~Hamburger$fat)
yhat = predict(model)
yhat

## Calculate the model residuals in two different ways, prints those values.
YminusYhat = model$res
YminusYhat = model$residuals
YminusYhat

# Example 6.2, part 2
## Correlation between calories and fat, and then calories and predicted values from the regression model
cor(Hamburger$calories, Hamburger$fat)
cor(Hamburger$calories, yhat)

# Example 6.2, part 3
## Plots calories against predicted values, and then plots predicted values against fat.
plot(Hamburger$calories ~ yhat, ylab = "Calories")
plot(yhat~Hamburger$fat, xlab = "Fat")

# Example 6.3
## Plots critical reading scores against percent taking the SAT with the regression line
plot(States$satcr~States$pertak, xlab = "Percent taking SAT", ylab = "SAT critical reading score")
abline(lm(States$satcr~States$pertak))

## Fits the regression line of critical reading scores on percent taking the SATs and prints out a summary of the model
model = lm(States$satcr~States$pertak)
summary(model)

#Estimated satcr for states with pertak = 25
578.976 -1.163*25

## Calculates the predicted values from the model
yhat = predict(model)
## Plots critical reading scores against predicted values
plot(States$satcr~yhat, ylab = "SAT critical reading score")

## Correlation between critical reading scores and percent taking the SATs
cor(States$satcr, States$pertak)

# Example 6.4
## Creates a variable for whether a hamburger contains cheese or not
Hamburger$cheese = c(0,1,0,1,1)
## Fits and prints out a summary for a regression model of calories on cheese
model = lm(Hamburger$calories~Hamburger$cheese)
summary(model)

## Calculates and prints out a standardized regression odel
model2 = lm(scale(Hamburger$calories)~scale(Hamburger$cheese))
summary(model2)

## Mean number of calories for a burger with cheese
mean(Hamburger$calories[Hamburger$cheese == 1])

## The estimated number of calories of a burger with cheese is equal to:
350 + 110*1

mean(Hamburger$calories[Hamburger$cheese == 0])

## The estimated number of calories of a burger without cheese is equal to:
350 + 110*0

# Anscombe Data Set

# Mean and Standard Deviation of each variable in the Anscombe Data Set
mean(Anscombe$y1)
sd(Anscombe$y1)
mean(Anscombe$x1)
sd(Anscombe$x1)
mean(Anscombe$y2)
sd(Anscombe$y2)
mean(Anscombe$x2)
sd(Anscombe$x2)
mean(Anscombe$y3)
sd(Anscombe$y3)
mean(Anscombe$x3)
sd(Anscombe$x3)
mean(Anscombe$y4)
sd(Anscombe$y4)
mean(Anscombe$x4)
sd(Anscombe$x4)

# Correlations for each of the Anscombed dataset pairs
cor(Anscombe$x1, Anscombe$y1)
cor(Anscombe$x2, Anscombe$y2)
cor(Anscombe$x3, Anscombe$y3)
cor(Anscombe$x4, Anscombe$y4)

# Regression equations for each set of variables and a summary of the regression models
model1 = lm(Anscombe$y1~Anscombe$x1)
summary(model1)
model2 = lm(Anscombe$y2~Anscombe$x2)
summary(model2)
model3 = lm(Anscombe$y3~Anscombe$x3)
summary(model3)
model4 = lm(Anscombe$y4~Anscombe$x4)
summary(model4)



# Figures 6.6 (a) - (d)
## Plots the Anscombe dataset
plot(Anscombe$y1 ~ Anscombe$x1, xlab = "x1", ylab = "y1")
plot(Anscombe$y2 ~ Anscombe$x2, xlab = "x2", ylab = "y2")
plot(Anscombe$y3 ~ Anscombe$x3, xlab = "x3", ylab = "y3")
plot(Anscombe$y4 ~ Anscombe$x4, xlab = "x4", ylab = "y4")

