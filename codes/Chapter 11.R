# Chapter 11

## Loads the Statistics Using R library (once per R session)
library(sur)

# Example 11.1
## Quantile from the t distribution with 20 degrees of freedom
qt(.025, 20, lower.tail = F)

## Descriptive statistics for Blood systolc1
mean(Blood$systolc1)
sd(Blood$systolc1)
skew(Blood$systolc1)
se.skew(Blood$systolc1)
skew.ratio(Blood$systolc1)

# Figure 11.2
## QQ Plot for blood systolc1
qqnorm(Blood$systolc1)
qqline(Blood$systolc1)

# Figure 11.3
## Histogram with normal curve overlay for Blood systolc1
hist(Blood$systolc1, freq = F, main = "", xlab = "systolc1")
x = seq(min(Blood$systolc1), max(Blood$systolc1), length = 100)
hx = dnorm(x, mean(Blood$systolc1), sd(Blood$systolc1))
lines(hx~x)

# Example 11.1 continued
## Confidence intervals for the mean of Blood systolc1
t.test(Blood$systolc1)
# or
t.test(Blood$systolc1)$conf.int

# Example 11.2
## Descriptive statistics for the unitmath variable in the NELS dataset
mean(NELS$unitmath)
sd(NELS$unitmath)
skew(NELS$unitmath)
se.skew(NELS$unitmath)
skew.ratio(NELS$unitmath)

## Descriptive statistics only for Females in the South
mean(NELS$unitmath[NELS$gender == "Female" & NELS$region == "South"])
sd(NELS$unitmath[NELS$gender == "Female" & NELS$region == "South"])
skew(NELS$unitmath[NELS$gender == "Female" & NELS$region == "South"])
se.skew(NELS$unitmath[NELS$gender == "Female" & NELS$region == "South"])
skew.ratio(NELS$unitmath[NELS$gender == "Female" & NELS$region == "South"])

# Figure 11.4
## QQ plot for unitmath for Females in the South
qqnorm(NELS$unitmath[NELS$gender == "Female" & NELS$region == "South"])
qqline(NELS$unitmath[NELS$gender == "Female" & NELS$region == "South"])

# Example 11.2 continued
## T test (and confidence interval) for the mean unitmath value for Females in the South
t.test(NELS$unitmath[NELS$gender == "Female" & NELS$region == "South"])

# Example 11.3
## 99% t-test and confidence interval for the mean unitmath value for Females in the South
t.test(NELS$unitmath[NELS$gender == "Female" & NELS$region == "South"], conf.level = 0.99)

# Example 11.4
## P-value for a test statistic of -2.86 on 20 degrees of freedom
pt(-2.86, 20)
## T test for the mean systolc1 values against an null hypothesis value of 120
t.test(Blood$systolc1, mu = 120)

# Example 11.5
## T test for unit math for Females in the South against a null value of 3
t.test(NELS$unitmath[NELS$gender == "Female" & NELS$region == "South"], mu = 3)

# Example 11.6
## Number of observations and mean for unit math for Males in the South
length(NELS$unitmath[NELS$gender == "Male" & NELS$region == "South"])
mean(NELS$unitmath[NELS$gender == "Male" & NELS$region == "South"])
## One sided hypothesis test (and confidence interval) for unit math for Males in the south, where the test is being run against a null hypothesis value of 3.
t.test(NELS$unitmath[NELS$gender == "Male" & NELS$region == "South"], mu = 3, alternative = "greater")

# Table 11.1
## Descriptive statistics for unit math for Males in the South
length(NELS$unitmath[NELS$gender == "Male" & NELS$region == "South"])
mean(NELS$unitmath[NELS$gender == "Male" & NELS$region == "South"])
sd(NELS$unitmath[NELS$gender == "Male" & NELS$region == "South"])
min(NELS$unitmath[NELS$gender == "Male" & NELS$region == "South"])
max(NELS$unitmath[NELS$gender == "Male" & NELS$region == "South"])

## Descriptive statistics for unit math for Females in the South
length(NELS$unitmath[NELS$gender == "Female" & NELS$region == "South"])
mean(NELS$unitmath[NELS$gender == "Female" & NELS$region == "South"])
sd(NELS$unitmath[NELS$gender == "Female" & NELS$region == "South"])
min(NELS$unitmath[NELS$gender == "Female" & NELS$region == "South"])
max(NELS$unitmath[NELS$gender == "Female" & NELS$region == "South"])

# Example 11.7
## Descriptive statistics for blood systolc1 for the Calcium and Placebo groups, respectively
mean(Blood$systolc1[Blood$treatmen == "Calcium"])
sd(Blood$systolc1[Blood$treatmen == "Calcium"])
skew(Blood$systolc1[Blood$treatmen == "Calcium"])
se.skew(Blood$systolc1[Blood$treatmen == "Calcium"])
skew.ratio(Blood$systolc1[Blood$treatmen == "Calcium"])
mean(Blood$systolc1[Blood$treatmen == "Placebo"])
sd(Blood$systolc1[Blood$treatmen == "Placebo"])
skew(Blood$systolc1[Blood$treatmen == "Placebo"])
se.skew(Blood$systolc1[Blood$treatmen == "Placebo"])
skew.ratio(Blood$systolc1[Blood$treatmen == "Placebo"])

## P value and critical region value for a T distribution on 19 degrees of freedom
pt(.356, 19, lower.tail = F)
qt(.025, 19, lower.tail = F)

## T test for blood systolc1 for the Placebo group and Calcium group
t.test(Blood$systolc1[Blood$treatmen == "Placebo"],Blood$systolc1[Blood$treatmen == "Calcium"], var.equal = T)
## Levenes test of equality of variance
levenes.test(Blood$systolc1, Blood$treatmen)

# Example 11.8
## Boxplot of years of math for the South against gender
boxplot(NELS$unitmath[NELS$region == "South"]~NELS$gender[NELS$region =="South"])

## T-test and levene's test for unit math for males in the south against females in the south
t.test(NELS$unitmath[NELS$region == "South" & NELS$gender == "Male"], NELS$unitmath[NELS$region == "South" & NELS$gender == "Female"], var.equal = T)
levenes.test(NELS$unitmath[NELS$region == "South"],NELS$gender[NELS$region == "South"])

## Effect Size Calculation d for Example 11.8
(3.917-3.664)/sqrt(((65)*(.737)^2 +(83)*(.723)^2)/(66+84-2))

# Example 11.9
## Boxplot of math achievement for the Northeast against computer ownership
boxplot(NELS$achmat12[NELS$region == "Northeast"]~NELS$computer[NELS$region =="Northeast"])
## T-test for math achievement against computer ownership
t.test(NELS$achmat12[NELS$region == "Northeast" & NELS$computer == "No"], NELS$achmat12[NELS$region == "Northeast" & NELS$computer == "Yes"], var.equal = T)
## Levene's test for equality of variances
levenes.test(NELS$achmat12[NELS$region == "Northeast"], NELS$computer[NELS$region =="Northeast"])

# Example 11.10
## Calculating difference in systolc1 and systolc2
Blood$d = Blood$systolc1-Blood$systolc2
## Skew of each of the three variables
skew(Blood$systolc1)
skew(Blood$systolc2)
skew(Blood$d)
## P-value fo the hypothesis test
pt(1.19, 20, lower.tail = F)
## Using the t-test function
t.test(Blood$systolc1, Blood$systolc2, paired = T)

# Example 11.11
## Boxplot of self concept scores for 8th and 12th grades for females in the south
boxplot(NELS$slfcnc08[NELS$gender == "Female" & NELS$region == "South"], NELS$slfcnc12[NELS$gender == "Female" & NELS$region == "South"], names = c("8th grade", "12th grade"))
## Paired t-test for self concept scores for 8th and 12th grade for females in the south
t.test(NELS$slfcnc08[NELS$gender == "Female" & NELS$region == "South"], NELS$slfcnc12[NELS$gender == "Female" & NELS$region == "South"], paired = T)

# Effect size estimate for paired t-test
diffs = NELS$slfcnc12[NELS$gender == "Female" & NELS$region == "South"] - NELS$slfcnc08[NELS$gender == "Female" & NELS$region == "South"]
mean(diffs)
sd(diffs)
d = mean(diffs)/sd(diffs)
d

## Correlation between self concept scores for females in the south in 12th and 8th grade
cor.test(NELS$slfcnc12[NELS$gender == "Female" & NELS$region == "South"], NELS$slfcnc08[NELS$gender == "Female" & NELS$region == "South"])

# Loading the pwr library
install.packages("pwr") ## Once per machine
library(pwr) 			## each time R is loaded

# Example 11.12
## Calculates the power for a t-test for one sample for a two sided test
pwr.t.test(d = 0.2, sig.level = 0.05, power = 0.8, type = "one.sample", alternative = "two.sided")

# Example 11.13
## Calculates the power for a t-test for one sample for a one sided test
pwr.t.test(d = 0.2, sig.level = 0.05, power = 0.8, type = "one.sample", alternative = "greater")

# Example 11.14
## Calculates the power for a t-test for two samples for a two sided test
pwr.t.test(d = 0.5, sig.level = 0.05, power = 0.8, type = "two.sample", alternative = "two.sided")

# Example 11.15
## Calculates the power for a paired t-test for a two sided test
pwr.t.test(d = 0.5, sig.level = 0.05, power = 0.8, type = "paired", alternative = "two.sided")
