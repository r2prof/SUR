# Chapter 18

## Loads the Statistics Using R library (once per R session)
library(sur)

# Figure 18.1
## Plots a chi-squared distribution with one degree of freedom
curve(dchisq(x, 1), 0, 3.5, ylab = "Density", xlab = "Chi-square with one degree of freedom")

# Figure 18.2
## Plots a chi-squared distribution with two degrees of freedom
curve(dchisq(x, 2), 0, 12, ylab = "Density", xlab = "Chi-square with two degrees of freedom")

# Figure 18.3
## Splits the plotting frame into two side-by-side plots
par(mfrow = c(1,2))
## Plots chi-squared distributions with 4 and 9 degrees of freedom, respectively.
curve(dchisq(x, 4), 0, 30, ylab = "Density", xlab = "Chi-square with four degrees of freedom")
curve(dchisq(x, 9), 0, 30, ylab = "Density", xlab = "Chi-square with nine degrees of freedom")

# Example 18.1
## Calculates the upper-tail probability associated with a value of 23.19 from a chi-squared distribution with 3 degrees of freedom
pchisq(23.19, 3, lower.tail = F)

## Creates a variable named type with four values (of car models)
type = c(“Nissan”, “Mazda”, “Toyota”, “Honda”)
## Creates a variable named freq with the frequency of each car model
freq = c(150, 65, 385, 400)
## Creates a variable named prob with the expected proportions of each type of car model
prob = c(.18, .10, .35, .37)

## Runs a chi-squared test for the frequencies of car models against the expected proportions given in the variable prob
chisq.test(freq, p = prob)

# Example 18.2
## Runs a chi-squared test for the NELS region variable against the expected proportions specified in the p = argument.
chisq.test(table(NELS$region), p = c(0.25, 0.25, 0.25, 0.25))

## Calculates the p-value associated with the test statistic of 20.19 from a chi-squared distribution with 2 degrees of freedom
pchisq(20.19, 2, lower.tail = F)

## Runs a chi-squared test of independence between Gender and Political Party affiliation from the Politics dataset
chisq.test(table(Politics$Gender, Politics$Party))
## Outputs a table of Gender by Political Party affiliation for the Politics dataset
table(Politics$Gender, Politics$Party)

# Example 18.3
## Runs a chi-squared test of gender against nursery from the NELS dataset
chisq.test(table(NELS$gender, NELS$nursery), correct = F)
## calculates the correlation between nursery and gender from the NELS dataset
cor.test(as.numeric(NELS$nursery), as.numeric(NELS$gender))

# Example 18.4
## Runs a chi-squared test between region and computer use from the NELS dataset
chisq.test(table(NELS$region, NELS$computer))

# Example 18.5
## Creates a 2-by-2 matrix of the numbers 2 and 6 in the first row, and 4 and 0 in the second row, and stores this matrix in an object called data
data = matrix(c(2,6,4,0), nrow = 2, byrow = T)
## Runs the Fisher's test on the data matrix
fisher.test(data)

# Example in the Fisher's test by hand section
## Creates a 2-by-2 matrix of the numbers 3 and 3 in the first row, and 5 and 1 in the second row, and stores this matrix in an object called data.
data = matrix(c(3,3,5,1), nrow = 2, byrow = T)
## Runs Fisher's test on the data matrix
fisher.test(data)

# Example 18.6
## Enters record and actual weight data
recordwt = c(11.5, 10.0, 17.0, 16.0, 12.5, 9.0, 8.75, 6.0, 8.0, 20.5, 5.75, 16.0)
actualwt = c(11.8, 10.0, 16.5, 16.0, 13.0, 9.5, 9.0, 6.0, 8.2, 19.5, 6.2, 16.2)
## Loads necessary library
library(BSDA)
## Performs a sign test on record and actual weight
SIGN.test(recordwt, actualwt)

# Example 18.7
## Enters data for both girls and boys.
girls = c(7, 13, 15, 16, 12)
boys = c(14, 17, 18, 25)
## Performs a two-sided Wilcoxon's test on the girls versus boys data
wilcox.test(girls, boys)

# Example 18.8
## Enters data for both girls and boys
boys = c(25, 32, 16, 11, 29, 31, 22, 15)
girls = c(9, 10, 12, 26, 24)
## Performs a one-sided (lower-tail) Wilcoxon's test on the girls versus boys data
wilcox.test(girls, boys, alternative = "less")

# Example 18.9
## Enters time data
time = c(48, 42, 40, 46, 35, 39, 32, 41, 28, 33, 26, 34, 29, 36, 31, 22, 21, 17, 15, 19, 20, 25, 18, 27, 16)
## Creates a vector for group with the number 1 repeated 8 times, the number 2 repeated 10 times, and the number 3 repeated 7 times
group = c(rep(1, 8), rep(2, 10), rep(3, 7))
## Runs the Kruskall-Wallis test on time over the different groups.
kruskal.test(time~group)
