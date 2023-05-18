# Chapter 14

## Loads the Statistics Using R library (once per R session)
library(sur)

# Table 14.4
# Calculate individual cell means and standard deviations
aggregate(ManDext$ManualDex ~ ManDext$Sex + ManDext$Treatment, FUN=mean)
aggregate(ManDext$ManualDex ~ ManDext$Sex + ManDext$Treatment, FUN=sd)

# Calculate marginal row means and standard deviations
aggregate(ManDext$ManualDex ~ ManDext$Sex, FUN=mean)
aggregate(ManDext$ManualDex ~ ManDext$Sex, FUN=sd)

# Calculate marginal column means and standard deviations
aggregate(ManDext$ManualDex ~ ManDext$Treatment, FUN=mean)
aggregate(ManDext$ManualDex ~ ManDext$Treatment, FUN=sd)

# Calculate the overall mean and standard deviation
mean(ManDext$ManualDex)
sd(ManDext$ManualDex)


# Figure 14.2
# Create a line graph of male and female manual dexterity means by treatment level depicting
# disordinal interaction
interaction.plot(ManDext$Treatment, ManDext$Sex, ManDext$ManualDex, xlab = "Treatment",
                 ylab = "Manual Dexterity", trace.label = "Sex")

# Figures 14.3 - 14.4d use dataset ManDext2

# Figure 14.3
# Create a line graph of male and female manual dexterity means, yhat2, by treatment level depicting
# ordinal interaction
interaction.plot(ManDext2$Treatment, ManDext2$Sex, ManDext2$yhat2, xlab = "Treatment",
                 ylab = "Manual Dexterity", trace.label = "Sex")

# Figure 14.4a
# Create a line graph of male and female manual dexterity means, yhat3, by treatment level depicting
# no interaction
interaction.plot(ManDext2$Treatment, ManDext2$Sex, ManDext2$yhat3, xlab = "Treatment",
                 ylab = "Manual Dexterity", trace.label = "Sex")

# Figure 14.4b
# Create a line graph of male and female manual dexterity means, yhat4, by treatment level depicting
# no interaction
interaction.plot(ManDext2$Treatment, ManDext2$Sex, ManDext2$yhat4, xlab = "Treatment",
                 ylab = "Manual Dexterity", trace.label = "Sex")

# Figure 14.4c
# Create a line graph of male and female manual dexterity means, yhat5, by treatment level depicting
# no interaction
interaction.plot(ManDext2$Treatment, ManDext2$Sex, ManDext2$yhat5, xlab = "Treatment",
                 ylab = "Manual Dexterity", trace.label = "Sex")

# Figure 14.4d
# Create a line graph of male and female manual dexterity means, yhat6, by treatment level depicting
# no interaction
interaction.plot(ManDext2$Treatment, ManDext2$Sex, ManDext2$yhat6, xlab = "Treatment",
                 ylab = "Manual Dexterity", trace.label = "Sex")


# Skewness of Manual Dexterity
# Examine skewness, standard error of skewness, and skewness ratio of manual dexterity scores for:

# Males who received Treatment 1
skew(ManDext$ManualDex[ManDext$Treatment == 1 & ManDext$Sex == "Male"])
se.skew(ManDext$ManualDex[ManDext$Treatment == 1 & ManDext$Sex == "Male"])
skew.ratio(ManDext$ManualDex[ManDext$Treatment == 1 & ManDext$Sex == "Male"])

# Males who received Treatment 2
skew(ManDext$ManualDex[ManDext$Treatment == 2 & ManDext$Sex == "Male"])
se.skew(ManDext$ManualDex[ManDext$Treatment == 2 & ManDext$Sex == "Male"])
skew.ratio(ManDext$ManualDex[ManDext$Treatment == 2 & ManDext$Sex == "Male"])

# Males who received Treatment 3
skew(ManDext$ManualDex[ManDext$Treatment == 3 & ManDext$Sex == "Male"])
se.skew(ManDext$ManualDex[ManDext$Treatment == 3 & ManDext$Sex == "Male"])
skew.ratio(ManDext$ManualDex[ManDext$Treatment == 3 & ManDext$Sex == "Male"])

# Females who received Treatment 1
skew(ManDext$ManualDex[ManDext$Treatment == 1 & ManDext$Sex == "Female"])
se.skew(ManDext$ManualDex[ManDext$Treatment == 1 & ManDext$Sex == "Female"])
skew.ratio(ManDext$ManualDex[ManDext$Treatment == 1 & ManDext$Sex == "Female"])

# Females who received Treatment 2
skew(ManDext$ManualDex[ManDext$Treatment == 2 & ManDext$Sex == "Female"])
se.skew(ManDext$ManualDex[ManDext$Treatment == 2 & ManDext$Sex == "Female"])
skew.ratio(ManDext$ManualDex[ManDext$Treatment == 2 & ManDext$Sex == "Female"])

# Females who received Treatment 3
skew(ManDext$ManualDex[ManDext$Treatment == 3 & ManDext$Sex == "Female"])
se.skew(ManDext$ManualDex[ManDext$Treatment == 3 & ManDext$Sex == "Female"])
skew.ratio(ManDext$ManualDex[ManDext$Treatment == 3 & ManDext$Sex == "Female"])


# p-values for ANOVA

# Calculate the p-value associated with the main effect due to Sex
pf(0.12, 1, 24, lower.tail = F)

# Calculate the p-value associated with the main effect for Treatment
pf(40.00, 2, 24, lower.tail = F)

# Calculate the p-value associated with the Sex by Treatment interaction
pf(15.69, 2, 24, lower.tail = F)



# Table 14.7 and Example 14.2
# Run a two-way ANOVA and save results as an object named results
results = aov(ManDext$ManualDex ~ ManDext$Sex*ManDext$Treatment)
# Display summary of the anova obect named results
summary(results)

# Levene's Test for Example 14.2
# Test for homogeneity of variance using Levene's Test
levenes.test(ManDext$ManualDex, ManDext$Sex:ManDext$Treatment)


# Install the phia package if it is not already installed on this computer
install.packages("phia")

# Load the phia package into working memory
library(phia)

# Calculate estimated marginal means and standard errors of the results object
interactionMeans(results)

# Test the simple effects for Treatment at each level of Sex without adjusting the p-value
testInteractions(results, fixed = "ManDext$Sex", across="ManDext$Treatment", adjustment = "none")

# Test the simple effects for Sex at each level of Treatment without adjusting the p-value
testInteractions(results, fixed = "ManDext$Treatment", across="ManDext$Sex", adjustment = "none")

# Conduct Bonferroni-adjusted pairwise comparisons of Treatment group means at each level of Sex
testInteractions(results, fixed = "ManDext$Sex", pairwise = "ManDext$Treatment", adjustment = "bonferroni")

# Conduct pairwise comparisons of Treatment group means at each level of Sex without adjusting the p-value
testInteractions(results, fixed = "ManDext$Sex", pairwise = "ManDext$Treatment", adjustment = "none")

# Conduct Bonferroni-adjusted pairwise comparisons of Sex group means at each level of Treatment
testInteractions(results, fixed = "ManDext$Treatment", pairwise = "ManDext$Sex", adjustment = "bonferroni")


# Install the emmeans package if it is not already installed on this computer
install.packages("emmeans")

# Install the multcompView package if it is not already installed on this computer
install.packages("multcompView")

# Load the emmeans package into working memory
library(emmeans)

# Load the multcompView package into working memory
library(multcompView)

# Store ANOVA results in an emmeans object named results.emm
results.emm = emmeans(results, ~ Treatment*Sex)

# Produce a table of means grouped by statistically significant similarity with Bonferroni adjustments
CLD(results.emm, adjust = "bonferroni")


# Example 14.3
# Conduct a two-way ANOVA and save results as an object named results
results2 = aov(Wages$wage~Wages$sex*Wages$ed)
# Display summary of the anova obect named results
summary(results2)

# Create a line graph of male and female wage means by education level. Use the numeric form of eduction,
# rather than the factor form, so that all levels of education are easily displayed on the x-axis.
interaction.plot(as.numeric(Wages$ed), Wages$sex, Wages$wage,
                 xlab = "Highest education level", ylab = "Predicted cell means of Wages",
                 trace.label = "Gender")

# Install the DescTools package if it is not already installed on this computer
install.packages("DescTools")

# Load the DescTools package into working memory
library(DescTools)

# Conduct pairwise comparisons on the ANOVA object results2 with an hsd adjustment and only
# display the comparisons on eduction.
PostHocTest(results2, method = "hsd")$`Wages$ed`


# Power analysis

# Install the pwr2 package if it is not already installed on this computer
install.packages("pwr2")

# Load the pwr2 package into working memory
library(pwr2)

# Obtain the sample size for the main effect due to rows
ss.2way(a = 3, b = 4, alpha = 0.05, beta = 0.2, f.A = 0.25, f.B = 1, B = 100)

# Obtain the sample size for the main effect due to columns
ss.2way(a = 3, b = 4, alpha = 0.05, beta = 0.2, f.A = 1, f.B = 0.25, B = 100)
