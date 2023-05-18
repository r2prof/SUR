# Chapter 9

## Loads the Statistics Using R library (once per R session)
library(sur)

# Taking a simple random sample of 50 numbers between 1 and 5000 without replacement.
x = sample(1:5000, 50, replace = F)
## print out the sample
x

# Example 9.2
## Enter in data and save it as an object named x.
x = c(0, 0.5, 1.5, 1.5, 2.5, 3.5, 3.5, 3.5, 4, 5, 1.5, 2, 3, 3, 4, 5, 5, 5, 5.5, 6.5, 2.5, 3, 4, 4, 5, 6, 6, 6, 6.5, 7.5, 3.5, 4, 5, 5, 6, 7, 7, 7, 7.5, 8.5, 4, 4.5, 5.5, 5.5, 6.5, 7.5, 7.5, 7.5, 8, 9, 0.5, 1, 2, 2, 3, 4, 4, 4, 4.5, 5.5, 1.5, 2, 3, 3, 4, 5, 5, 5, 5.5, 6.5, 3.5, 4, 5, 5, 6, 7, 7, 7, 7.5, 8.5, 3.5, 4, 5, 5, 6, 7, 7, 7, 7.5, 8.5, 5, 5.5, 6.5, 6.5, 7.5, 8.5, 8.5, 8.5, 10)

# Figure 9.1
## Draw a histogram of the data
hist(x, xlab = "means", main = "")

# Example 9.3
set.seed(1234)
## Enter in data and save it as an object named y
y = c(0, 1, 3, 3, 5, 7, 7, 7, 8, 10)
## Bootstrap 8 numbers from our dataset, calculate their mean, and repeat 10,000 times
b.mean = boot.mean(y, B = 10000, n = 8)$bootstrap.samples
## Draw a histogram of our bootstrapped means
hist(b.mean, xlab = "means", main = "")

# Example 9.4 part 2
## Calculate the probability of falling between 13 and 17 on a Normal distribution with mean 15 and standard deviation 0.75
pnorm((17 - 15)/.75) - pnorm((13 - 15)/.75)

# Figure 9.3
## Generate 5000 numbers from a Normal distribution with mean equal to 15 and standard deviation equal to 3. Save these numbers in an object named x.
x = rnorm(5000, 15, 3)
## Plot a histogram of our data
hist(x, xlab = "parent distribution", main = "")

# Figure 9.4
## Bootstrap 16 numbers from our dataset, calculate their mean, and repeat 1,000 times
y = boot.mean(x, B = 1000, n = 16)$bootstrap.samples
## Plot a histogram of our bootstrapped means (the sampling distribution)
hist(y, xlab = "sampling distribution", main = "", xlim = c(4.3, 25.1))

# Figure 9.5
## Generate 1000 values from a positively skewed parent distribution and save them in an object named x.
x = rchisq(1000, 8)
## Plot a histogram of our data
hist(x, xlab = "positively skewed parent distribution", main = "")

# Figure 9.6
## Bootstrap 100 numbers from our positively skewed parent distribution, calculate their mean, and repeat this process 10,000 times. Save these means in an object named y.
y = boot.mean(x, B = 10000, n = 100)$bootstrap.samples
## Plot a histogram of our bootstrapped means (sampling distribution)
hist(y, xlab = "sampling distribution", main = "", xlim = c(0, 27.1))

# Example 9.5
## Generate 10,000 datapoints from a Normal distribution with a mean equal to 8 and a standard deviation equal to 0.4.
sampling_distribution = rnorm(10000, 8, 0.4)
hist(sampling_distribution)
