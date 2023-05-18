# Chapter 13

## Loads the Statistics Using R library (once per R session)
library(sur)

# Figure 13.1
## Plots tri-modal distribution for manual dexterity sccores
x1 = seq(-4.5, -1.5, length = 100)
x2 = seq(-1.5, 1.5, length = 100)
x3 = seq(1.5, 4.5, length = 100)
hx1 = dnorm(x1, mean = -3, sd = .5)
hx2 = dnorm(x2, mean = 0, sd = .5)
hx3 = dnorm(x3, mean = 3, sd = .5)
plot(c(0), type = "n", xlab = "Manual Dexterity Score", xlim = c(-4.5,4.5), ylim = c(0,1), ylab = "")
lines(hx1~x1)
lines(hx2~x2)
lines(hx3~x3)

# Figure 13.2
## Plots three overlapping normal distribution curves for manual dexterity scores
x = seq(-12, 12, length = 100)
hx1 = dnorm(x, mean = -3, sd = 3)
hx2 = dnorm(x, mean = 0, sd = 3)
hx3 = dnorm(x, mean = 3, sd = 3)
plot(c(0), type = "n", xlab = "Manual Dexterity Score", xlim = c(-12,12), ylim = c(0,.15), ylab = "")
lines(hx1~x)
lines(hx2~x)
lines(hx3~x)

## The next four plots are F distributions
# Figure 13.3 (a)
curve(df(x, 1, 27), 0, 3, xlab = "F(1,27)", ylab = "Density")

# Figure 13.3 (b)
curve(df(x, 2, 27), 0, 3, xlab = "F(2,27)", ylab = "Density")

# Figure 13.3 (c)
curve(df(x, 4, 27), 0, 3, xlab = "F(4,27)", ylab = "Density")

# Figure 13.3 (d)
curve(df(x, 16, 27), 0, 3, xlab = "F(16,27)", ylab = "Density")

# Example 13.1
## P value for an anova of manual dexterity on treatment
pf(19.52, 2, 27, lower.tail = F)
## ANOVA for manual dexterity on treatment
results = aov(ManDext$ManualDex ~ ManDext$Treatment)
summary(results)

## Descriptive statistics for each of the treatments for manual dexterity scores
skew(ManDext$ManualDex[ManDext$Treatment == 1])
se.skew(ManDext$ManualDex[ManDext$Treatment == 1])
skew.ratio(ManDext$ManualDex[ManDext$Treatment == 1])

skew(ManDext$ManualDex[ManDext$Treatment == 2])
se.skew(ManDext$ManualDex[ManDext$Treatment == 2])
skew.ratio(ManDext$ManualDex[ManDext$Treatment == 2])

skew(ManDext$ManualDex[ManDext$Treatment == 3])
se.skew(ManDext$ManualDex[ManDext$Treatment == 3])
skew.ratio(ManDext$ManualDex[ManDext$Treatment == 3])

## Levene's test for equality of variances
levenes.test(ManDext$ManualDex, ManDext$Treatment)

# Example 13.2
## Boxplots of unit math by region
boxplot(NELS$unitmath~NELS$region)
## ANOVA for unit math by region
results = aov(NELS$unitmath~NELS$region)
summary(results)
## Levene's test for equality of variances
levenes.test(NELS$unitmath, NELS$region)

# Example 13.3
#install.packages(DescTools)
## Load the DescTools package
library(DescTools)

## ANOVA for manual dexterity by treatment
results = aov(ManDext$ManualDex~ManDext$Treatment)

## Four types of post-hoc correction procedures for pairwise comparisons
PostHocTest(results, method = "hsd")
PostHocTest(results, method = "lsd")
PostHocTest(results, method = "scheffe")
PostHocTest(results, method = "bonferroni")

# Example 13.4
## ANOVA for unitmath by region
results = aov(NELS$unitmath~NELS$region)

## Four types of post-hoc correction procedures for pairwise comparisons
PostHocTest(results, method = "hsd")
PostHocTest(results, method = "lsd")
PostHocTest(results, method = "scheffe")
PostHocTest(results, method = "bonferroni")

# Example 13.5
## Recode the hsprog variable
NELS$hsprog2 = NELS$hsprog
for(i in 1:length(NELS$hsprog)){
	if(NELS$hsprog[i] == "Some Vocational")
		NELS$hsprog2[i] = "Other"
	}
NELS$hsprog2 = droplevels(NELS$hsprog2)

## Boxplot of self concept scores in 12th grade by hsprog2
boxplot(NELS$slfcnc12 ~ NELS$hsprog2)

## ANOVA and Levene's test
results = aov(NELS$slfcnc12 ~ NELS$hsprog2)
summary(results)
levenes.test(NELS$slfcnc12, NELS$hsprog2)

# Example 13.6
## Boxplot of school attendence rate by region
boxplot(NELS$schattrt ~ NELS$region)
## Without the two outliers
boxplot(NELS$schattrt[NELS$id != 396 & NELS$id != 64] ~ NELS$region[NELS$id != 396 & NELS$id != 64])

## ANOVA for school attendence rate by region
results = aov(NELS$schattrt ~ NELS$region)
summary(results)
## Levene's test for equality of variances
levenes.test(NELS$schattrt, NELS$region)
## Pairwise comparisons with post-hoc corrections
PostHocTest(results, method = "hsd")
PostHocTest(results, method = "lsd")
PostHocTest(results, method = "scheffe")
PostHocTest(results, method = "bonferroni")

# Example 13.7
## T-test for rural versus urban SES
t.test(NELS$ses[NELS$urban == "Rural"], NELS$ses[NELS$urban == "Urban"], var.equal = T, alternative = "less")
## T-test for rural versus suburban SES
t.test(NELS$ses[NELS$urban == "Rural"], NELS$ses[NELS$urban == "Suburban"], var.equal = T, alternative = "less")

# Example 13.8
## Boxplots of acheivement scores by gender
par(mfrow = c(2,2))
boxplot(NELS$achmat12~NELS$gender, main = "Math")
boxplot(NELS$achrdg12~NELS$gender, main = "Reading")
boxplot(NELS$achsci12~NELS$gender, main = "Science")
boxplot(NELS$achsls12~NELS$gender, main = "Social Studies")

## T-tests for achievement scores by gender
t.test(NELS$achmat12~NELS$gender, var.equal = T)
t.test(NELS$achrdg12~NELS$gender, var.equal = T)
t.test(NELS$achsci12~NELS$gender, var.equal = T)
t.test(NELS$achsls12~NELS$gender, var.equal = T)


# Example 13.9
## Load the pwr library
library(pwr)
## Power for an ANOVA
pwr.anova.test(k = 3, f = 0.25, power = 0.8, sig.level = 0.05)

