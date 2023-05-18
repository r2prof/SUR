# Chapter 5

## Loads the Statistics Using R library (once per R session)
library(sur)

# Figure 5.1
## Plots Hamburger calories on the y-axis, and hamburger fat amount on the x-axis
plot(Hamburger$calories~Hamburger$fat, xlab = "Fat", ylab = "Calories")

# Figure 5.2
## Plots SAT critical reading score against percent taking the SATs
plot(States$satcr~States$pertak, xlab = "Percent Eligble Students Taking SAT, 2012", ylab = "Average SAT Critical Reading, 2013")

# Figure 5.3
## Plots number of each currency in circulation against its value.
plot(Currency$NumberCirculation~Currency$BillValue, xlab = "Bill Value", ylab = "Number in Circulation")

# Figure 5.4
## Plots Marijuana use against the year for years between 1996 and 1987
plot(Marijuana$MarijuanaUse[Marijuana$Year <= 1996 & Marijuana$Year >= 1987]~Marijuana$Year[Marijuana$Year <= 1996 & Marijuana$Year >= 1987], xlab = "Year", ylab = "Marijuana Use")

# Customizing Figure 5.4
## Customizes the above figure
plot(Marijuana$MarijuanaUse[Marijuana$Year <= 1996 & Marijuana$Year >= 1987]~Marijuana$Year[Marijuana$Year <= 1996 & Marijuana$Year >= 1987], xlab = "Year", ylab = "Marijuana Use", main = "Marijuana Use Over the Years", pch = 16, col = "red", cex = 2)

# Figures 5.5 A through I
## Each plot below graphs the variable on the y-axis against the variable on the x-axis with the line of best fit (regression line)
plot(Figure5_5$ay~Figure5_5$ax, xlab = "Days elapsed in a given year", ylab = "Days remaining in that same year")
abline(lm(Figure5_5$ay~Figure5_5$ax), col = "red")

plot(Figure5_5$by~Figure5_5$bx, xlab = "Age", ylab = "Number of seconds to run a 100-yard dash")
abline(lm(Figure5_5$by~Figure5_5$bx), col = "red")

plot(Figure5_5$cy~Figure5_5$cx, xlab = "Introversion", ylab = "Aggression")
abline(lm(Figure5_5$cy~Figure5_5$cx), col = "red")

plot(Figure5_5$dy~Figure5_5$dx, xlab = "Moodiness", ylab = "English Ability")
abline(lm(Figure5_5$dy~Figure5_5$dx), col = "red")

plot(Figure5_5$ey~Figure5_5$ex, xlab = "Weight", ylab = "Achievement in Statistics")
abline(lm(Figure5_5$ey~Figure5_5$ex), col = "red")

plot(Figure5_5$fy~Figure5_5$fx, xlab = "Student's expected grade in a course", ylab = "Student's course evaluation of that course")
abline(lm(Figure5_5$fy~Figure5_5$fx), col = "red")

plot(Figure5_5$gy~Figure5_5$gx, xlab = "IQ scores", ylab = "Reading achievement")
abline(lm(Figure5_5$gy~Figure5_5$gx), col = "red")

plot(Figure5_5$hy~Figure5_5$hx, xlab = "Arithmetic reasoning", ylab = "Arithmetic fundamentals")
abline(lm(Figure5_5$hy~Figure5_5$hx), col = "red")

plot(Figure5_5$iy~Figure5_5$ix, xlab = "Diameter of a tree", ylab = "Circumference of a tree")
abline(lm(Figure5_5$iy~Figure5_5$ix), col = "red")

# Calculating r by hand
Hamburger$zfat = scale(Hamburger$fat)
Hamburger$zcalories = scale(Hamburger$calories)
Hamburger$prod = Hamburger$zfat*Hamburger$zcalories
prod_sum = sum(Hamburger$prod)
N = length(Hamburger$prod)
r = prod_sum/(N-1)
r

# Calculating correlation through functions
cor(Hamburger$fat, Hamburger$calories)
cor.test(Hamburger$calories, Hamburger$fat, method = "pearson")

# Example 5.1
## a) Correlation between the percentage of students taking the SAT and the average Critical Reading SAT score in the United States
cor(States$pertak, States$satcr)
## b) Correlation between the currency value of a bill and the total number of such bills in circulation
cor(Currency$BillValue, Currency$NumberCirculation)
## c) Correlation between percentage marijuana use among twelfth graders and year from 1987 through 1996
## We set the "use" argument to "pairwise.complete.obs"; like "na.rm=T" this removes missing values, however, this removes the entire row if either Year or MarijuanaUse are missing.
cor(Marijuana$MarijuanaUse[Marijuana$Year <= 1996 & Marijuana$Year >= 1987], Marijuana$Year[Marijuana$Year <= 1996 & Marijuana$Year >= 1987], use="pairwise.complete.obs")

# Example 5.3
# Calculates Spearman's correlation
cor.test(Hamburger$calories, Hamburger$fat, method = "spearman")

# Example 5.4
## Creating a cheese variable for the Hamburger dataset
Hamburger$cheese = c(0,1,0,1,1)

# Figure 5.6
## Plots calories against whether the burger contains cheese or not
## Note that the jitter() function moves the two points that would be directly on top of each other slightly away from each other.
plot(Hamburger$calories~jitter(Hamburger$cheese,0.25), xlab = "Cheese", ylab = "Calories")

# Correlation between calories and cheese
cor.test(Hamburger$calories, Hamburger$cheese, method = "pearson")

# Figure 5.7
## Customizes figure 5.6
plot(Hamburger$calories~jitter(Hamburger$cheese, 0.25), axes = F, xlab = "Cheese", ylab = "Calories")
box()
axis(2)
axis(1, at = c(0,1), labels = c("No", "Yes"))

# Figure 5.8
## Plots science achievement in the West against gender
plot(NELS$achsci12[NELS$region == "West"]~as.numeric(NELS$gender)[NELS$region == "West"], axes = F, xlab = "Gender", ylab = "Achievement")
box()
axis(2)
axis(1, at = c(1,2), labels = c("Male", "Female"))

# Example 5.5 correlation
## Calculates the correlation between science achievement and gender
cor(NELS$achsci12[NELS$region == "West"], as.numeric(NELS$gender)[NELS$region == "West"])

## Finds the row number of the male in the West with the lowest science achievement score; since row number is the same as the value of id, case number 194 is the low outlier
which(NELS$achsci12==min(NELS$achsci12[NELS$region == "West" & NELS$gender=="Male"]))

# Example 5.5 correlation without ID 194
cor(NELS$achsci12[NELS$region == "West" & NELS$id != 194], as.numeric(NELS$gender)[NELS$region == "West" & NELS$id != 194])

# Figure 5.9
## Plots reading achievement against gender for students in the West
plot(NELS$achrdg12[NELS$region == "West"]~as.numeric(NELS$gender)[NELS$region == "West"], axes = F, xlab = "Gender", ylab = "Reading Achievement")
box()
axis(2)
axis(1, at = c(1,2), labels = c("Male", "Female"))

# Example 5.5 correlation for reading achievement
cor(NELS$achrdg12[NELS$region == "West"], as.numeric(NELS$gender)[NELS$region == "West"])

# Example 5.6, part (1)
## Calculates the correlation in Example 5.6 (1)
cor(as.numeric(NELS$nursery[NELS$region == "South"]), as.numeric(NELS$gender[NELS$region == "South"]), use = "complete.obs")

# Figure 5.10
## Plots whether a child attended nursery school against their gender
plot(as.numeric(NELS$nursery)~as.numeric(NELS$gender), xlab = "Gender", ylab = "Nursery", axes = F)
box()
axis(2, at = c(1,2), labels = c("No", "Yes"))
axis(1, at = c(1,2), labels = c("Male", "Female"))

# Figure 5.11
## Makes a barplot of whether a child in the South attended nursery school by gender
barplot(table(NELS$nursery[NELS$region == "South"], NELS$gender[NELS$region == "South"]), beside = T, legend.text = c("No", "Yes"), args.legend = list(x = 3, y = 50, bty = "n"))

# Figure 5.12
## Table of whether a child in the South attended nursery school by gender
table(NELS$nursery[NELS$region == "South"], NELS$gender[NELS$region == "South"])

# Example 5.6, part (2)
# Figure 5.13
## Barplot of whether a family owned a computer split by whether the child attended nursery school (in the West)
barplot(table(NELS$computer[NELS$region == "West"],NELS$nursery[NELS$region == "West"]), beside = T, legend.text = c("No Computer", "Yes Computer"), xlab = "Nursery Attendence", args.legend = list(x = 5, y = 40, bty = "n"))

# Figure 5.14
## Table of whether a family owned a computer by whether their child attended nursery school (in the West)
table(NELS$computer[NELS$region == "West"],NELS$nursery[NELS$region == "West"])

## Calculates the correlation in Example 5.6 (2)
cor(as.numeric(NELS$nursery[NELS$region == "West"]), as.numeric(NELS$computer[NELS$region == "West"]), use = "complete.obs")

# Example 5.7, part (1)
# Figure 5.15
## Boxplot of science acheivement by gender (in the West)
boxplot(NELS$achsci12[NELS$region == "West"]~NELS$gender[NELS$region == "West"])

# Example 5.7, part (2)
# Figure 5.16
## Boxplot of reading acheivement by gender (in the West)
boxplot(NELS$achrdg12[NELS$region == "West"]~NELS$gender[NELS$region == "West"])

# Example 5.8
# Figure 5.17
## Boxplot of math achievement by region
boxplot(NELS$achmat12~NELS$region)

# Example 5.9 table
## Table of whether a family owned a computer by region
table(NELS$computer, NELS$region)

# Example 5.9 bar graph
## Barplot of computer ownership by region
barplot(table(NELS$computer, NELS$region), beside = T, legend.text = c("No", "Yes"), args.legend = list(x = 14, y = 100, bty = "n"))
