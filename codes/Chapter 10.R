# Chapter 10

## Loads the Statistics Using R library (once per R session)
library(sur)

# Figure 10.1
## The next four lines draw a Standard Normal Density curve
curve(dnorm, c(-4, 4), xlim = c(-4,4), main = "Critical Values for the Standard Normal Distribution", ylab = "Density", xlab = "", axes = F)
box()
axis(2)
axis(1, at = c(-1.96, 0, 1.96), labels = c(expression(paste(mu,"-1.96",sigma[xbar])), expression(mu), expression(paste(mu,"+1.96",sigma[xbar]))))
## The next six lines color in the two tails of the distribution.
cord.x = c(1.96,seq(1.96,4,length = 100),4)
cord.y = c(0,dnorm(seq(1.96,4,length = 100), 0, 1),0)
polygon(cord.x, cord.y ,col="grey")
cord.x2 = c(-4,seq(-4,-1.96,length = 100),-1.96)
cord.y2 = c(0,dnorm(seq(-4,-1.96,length = 100), 0, 1),0)
polygon(cord.x2, cord.y2 ,col="grey")

# Figure 10.4
## Draws a Normal curve with mean equal to 500 and a standard deviation of 2.5
curve(dnorm(x, mean = 500, sd = 2.5), c(490, 510), xlim = c(490,510), main = "Area under the curve to the right of a mean of 505", ylab = "Density", xlab = "")
## The next three lines fill in the right tail of the distribution starting at 505
cord.x = c(505,seq(505,510,length = 100),510)
cord.y = c(0,dnorm(seq(505,510,length = 100), 500, 2.5),0)
polygon(cord.x, cord.y ,col="grey")

# Figure 10.5
## Draws a Normal curve with mean equal to 500 and a standard deviation of 2.5
curve(dnorm(x, mean = 500, sd = 2.5), c(490, 510), xlim = c(490,510), main = "Area under the curve to the right of a mean of 502", ylab = "Density", xlab = "")
## The next three lines fill in the right tail of the distribution, starting at 502.
cord.x = c(502,seq(502,510,length = 100),510)
cord.y = c(0,dnorm(seq(502,510,length = 100), 500, 2.5),0)
polygon(cord.x, cord.y ,col="grey")

## (upper-tail) p-value for value of 505, first by setting the mean and standard deviation within the pnorm command, and next by calculating the z-score first.
pnorm(505, mean = 500, sd = 2.5, lower.tail = F)
pnorm(2.0, mean = 0, sd = 1, lower.tail = F)

# (upper-tail) p-value for value of 502 from a Normal distribution with mean 500 and standard deviation 2.5
pnorm(502, mean = 500, sd = 2.5, lower.tail = F)

# Example 10.2
## (upper-tail) p-value for a value of 101 from a Normal distribution with mean equal to 100 and a standard deviation of 0.45.
pnorm(101, mean = 100, sd = 0.45, lower.tail = F)

# Figure 10.6
## Plots a Normal curve with mean equal to 100 and a standard deviation of 0.45
curve(dnorm(x, mean = 100, sd = .45), c(98, 102), xlim = c(98,102), main = "Area under the curve to the right of a mean of 101", ylab = "Density", xlab = "")
## The next three lines fill in the area under the curve starting at 101
cord.x = c(101,seq(101,102,length = 100),101)
cord.y = c(0,dnorm(seq(101,102,length = 100), 100, .45),0)
polygon(cord.x, cord.y ,col="grey")

# Figure 10.7
## Plots a Normal curve with mean equal to 280 and a standard deviation of 2.
curve(dnorm(x, mean = 280, sd = 2), c(274, 286), xlim = c(274, 286), main = "Critical areas under the curve in both tails", ylab = "Density", xlab = "")
## The next six lines fill in the area under the curve in both tails.
cord.x = c(284,seq(284,286,length = 100),286)
cord.y = c(0,dnorm(seq(284,286,length = 100), 280, 2),0)
polygon(cord.x, cord.y ,col="grey")
cord.x2 = c(274,seq(274,276,length = 100),276)
cord.y2 = c(0,dnorm(seq(274,276,length = 100), 280, 2),0)
polygon(cord.x2, cord.y2 ,col="grey")

# Calculates the two-sided p-value for Example 10.3: first by setting the mean and standard deviation within the pnorm command, and next by calculating the z-score first.
2*pnorm(276, mean = 280, sd = 2)
2*pnorm((276-280)/2)
