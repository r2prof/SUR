# Chapter 12

## Loads the Statistics Using R library (once per R session)
library(sur)

# Figure 12.1

x1 = runif(30, 83, 90)
x2 = runif(30, 90, 96)

y1 = x1 + 140 + rnorm(30,0,2)
y2 = x2 + 150 + rnorm(30,0,2)
group = c(rep(0,30), rep(1,30))

plot(c(x1,x2), c(y1,y2), pch = 16+ group, xlab = "Quantitative Measure Score \n (Cut-off Score Centered at 90th Percentile)", ylab = "Treatment Scores", main = "Regression Discontinuity \n (Treatment Effect)")

abline(v = 90, lty = 2)
lines(83:90, (83:90) + 140, lty = 2)
lines(90:96, (90:96) + 150, lty = 2)


legend("bottomright", legend = c("Group 1", "Group 2"), pch = c(16, 17))
