# Chapter 8

## Loads the Statistics Using R library (once per R session)
library(sur)

# Figure 8.1
## Create a vector of probabilities for each possible number of successes in 3 trials with 0.816 probability of success
probs = dbinom(c(0, 1, 2, 3), 3, 0.816)
## Plot probabilities as bars for each possible number of successes
barplot(probs, names.arg = c(0,1,2,3), xlab = "Number who never smoked marijuana (k)")

# Example 8.1
## Calculate the probability of exactly 2 successes in 3 trials with 81.6% chance of success by setting x = 2, size = 3, and prob = 0.816
dbinom(2,3,0.816)

# Example 8.5
## Calculate the probability of exactly 5 successes using dbinom() command
dbinom(5, 10, .30)
## using the binomial probability formula
((1*2*3*4*5*6*7*8*9*10) / (1*2*3*4*5*1*2*3*4*5))* (.30^5)*(.70^5)
## using the choose() command to count the combinations of taking 10 things 5 at a time
choose(10, 5)*(.30^5)*(.70^5)

# Example 8.6
## Calculate the probability of exactly 4 successes using dbinom() command
dbinom(4,10,.25)
## using the binomial probability formula with the choose() command
choose(10,4)*(.25^4)*(.75^6)

# Example 8.7
## Calculate the probability of exactly 25 successes using dbinom() command
dbinom(25,50,.40)
## using the binomial probability formula with the choose() command
choose(50, 25)*(0.4^25)*(0.6^25)

# Example 8.8
## Calculate the probability of obtaining up to 15 successes, inclusive, in 50 trials with 40% chance of success by setting q = 15, size = 50, and prob = 0.40
pbinom(15, 50, .40)
## Calculate the probability of obtaining 20 to 50 successes, inclusive, in 50 trials with 40% chance of success by setting q = 20 - 1, size = 50, prob = 0.40, and lower.tail = FALSE
pbinom(19, 50, .40, lower.tail = F)

# Figure 8.2
## Generate 100 x values from -4 to 4
x = seq(-4, 4, length=100)
## Obtain the height of the normal curve at each x value given a mean of 0 and a standard deviation of 1
hx = dnorm(x, 0, 1)
## Plot the heights against the x values as a line
plot(hx ~ x, type="l", xlab="z scores",
     ylab="Density", main="Standard Normal Distribution")

# Figure 8.3
## Generate 100 x values from the minimum ses of 0 to the maximum ses of 35
x = seq(0, 35, length = 100)
## Obtain the height of the normal curve at each x value given a mean ses of 18.434 and a standard deviation of 6.925
hx = dnorm(x, 18.434, 6.925)
## Plot a density histogram of ses scoresand overlay the normal curve with the lines() command
hist(NELS$ses, freq = F, xlab = "Socio-economic status", main = "")
lines(hx~x)

# Example 8.9
## Find the proportion of scores up to and including 26 given the mean and standard deviation of ses with a normal distribution
pnorm(26, mean = 18.40, sd = 6.92)
## by converting 26 to a z score and using the standard normal distribution
pnorm((26-18.40)/6.92, mean = 0, sd = 1)

# Figure 8.4
## Generate 100 x values from the minimum ses of 0 to the maximum ses of 35
x = seq(0, 35, length = 100)
## Obtain the height of the normal curve at each x value
hx = dnorm(x, 18.434, 6.925)
## Plot a density histogram of ses scoresand overlay the normal curve with the lines() command
hist(NELS$ses, freq = F, xlab = "Socio-economic status", main = "")
lines(hx~x)
## Generate 100 x values from 0 to 26, the maximum score of interest, using seq()
## Put these values in a vector, starting with an extra 0 and ending with an extra 26
cord.x = c(0, seq(0,26,length = 100), 26)
## Obtain the height of the normal curve at each x value from the sequence
## Put these values in a vector that starts and ends with a 0
cord.y = c(0, dnorm(seq(0,26,length = 100), 18.434, 6.925), 0)
## Draw a grey polygon of the area under the normal curve onto the histogram, with the first and last coordinates anchoring the polygon to the x-axis at 0 and 26
polygon(cord.x, cord.y , col="grey")

# Example 8.10
## Calculate the area under the standard normal curve to the left of a z-score of 2
pnorm(2, 0, 1)
## Apply the complement rule: subtract the previous result from 1 to get the area to the right of 2
1 - .977
## using lower.tail = F to specify the area to the right of 2
pnorm(2, 0, 1, lower.tail = F)

# Figure 8.5
## Draw a standard normal curve over the interval [-4, 4]
curve(dnorm, c(-4, 4), xlim = c(-4,4), main = "Area under the curve to the right of a z-score of 2", ylab = "Density", xlab = "z")
## Generate 100 x values from 2 to 4 using seq()
## Put these values in a vector, starting with an extra 2 and ending with an extra 4
cord.x = c(2, seq(2, 4, length = 100), 4)
## Obtain the height of the normal curve at each x value from the sequence
## Put these values in a vector that starts and ends with a 0
cord.y = c(0, dnorm(seq(2, 4, length = 100), 0, 1), 0)
## Draw a grey polygon of the area under the normal curve onto the histogram, with the first and last coordinates anchoring the polygon to the x-axis at 2 and 4
polygon(cord.x, cord.y ,col="grey")

# Example 8.11
## Calculate z-score with 0.025 to its right, which is equivalent to 0.975 to its left
qnorm(0.975, 0, 1)
## using lower.tail = F argument
qnorm(0.025, 0, 1, lower.tail = F)

# Example 8.12
## Calculate the proportion of the area under a standard normal curve to the left of -2
pnorm(-2.45, 0, 1)
