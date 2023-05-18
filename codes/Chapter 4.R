# Chapter 4

## Loads the Statistics Using R library (once per R session)
library(sur)

# Example 4.1
## Transform Basketball data from inches to centimeters
Basketball$Height_cm = Basketball$heightin * 2.54

# Figure 4.1
## Creates a variable called x, stored locally, with these values
x = c(1,1,2,2,2,3,3)
## Transforms x into 2x+10 and stores it in a variable called y
y = 2*x + 10
## Splits plotting frame into two panels
par(mfrow= c(1,2))
## Creates a histogram of x
hist(x, main = "", xlim = c(0,16))
## Creates a histogram of y (2x + 10)
hist(y, main = "", xlab = "2x+10", xlim = c(0,16))
## Restores original plotting frame
par(mfrow= c(1,1))

# Figure 4.2
## Plots two boxplots of height in inches and heights in centimeters
boxplot(Basketball$heightin, Basketball$Height_cm, names = c("Inches", "Centimeters"))

# Figure 4.3
## Plots boxplots of self concept, times 2, times -2, and times 1/2
boxplot(NELS$slfcnc12, NELS$slfcnc12*2, NELS$slfcnc12*(-2), NELS$slfcnc12*(1/2), names = c("Self Concept", "Times 2", "Times -2", "Times 1/2"))

# Note that we could have defined local variables instead by using the following commands
times2 = NELS$slfcnc12*2
timesminus2 = NELS$slfcnc12*(-2)
timeshalf = NELS$slfcnc12*(1/2)
## Plots the same boxplots using the local variables
boxplot(NELS$slfcnc12, times2, timesminus2, timeshalf, names = c("Self Concept", "Times 2", "Times -2", "Times 1/2"))

## To add these local variables to the NELS dataset, we have to add the NELS$ prefix to each of the variable names on the left-hand side of the equals sign. Note that these variables will only appear as part of the dataset until R is closed. If R is reopened, then the variables would need to be regenerated.
NELS$times2 = NELS$slfcnc12*2
NELS$timesminus2 = NELS$slfcnc12*(-2)
NELS$timeshalf = NELS$slfcnc12*(1/2)
boxplot(NELS$slfcnc12, NELS$times2, NELS$timesminus2, NELS$timeshalf, names = c("Self Concept", "Times 2", "Times -2", "Times 1/2"))

# Figure 4.4
## Adds 5 to each self concept score
plus5 = NELS$slfcnc12 + 5
## Subtracts 5 from each self concept score
minus5 = NELS$slfcnc12 - 5
## Plots boxplots of self concept, plus 5, and minus 5
boxplot(NELS$slfcnc12, plus5, minus5, names = c("Self Concept", "Plus 5", "Minus 5"))

# Figure 4.5
## Creates an object called Xold with the values 1, 2, 2, and 3
Xold = c(1,2,2,3)
## Creates an object called Xnew with the values 5, 6, 6, and 7
Xnew = c(5,6,6,7)
## Splits the plotting frame in half
par(mfrow = c(1,2))
## Creates a histogram of Xold
hist(Xold, xlim = c(1,7), main = "")
## Creates a histogram of Xnew
hist(Xnew, xlim = c(1,7), main = "")
## Restores original plotting frame
par(mfrow= c(1,1))

# Example 4.4
## Reverses the Likert scoring for Assertiveness
Likert$assertref = -1 * Likert$Assertiveness + 6

# Example 4.6
## Obtain the mean and standard deviation of ses
mean(NELS$ses)
sd(NELS$ses)
## Create standardized ses variable
NELS$zses = scale(NELS$ses)
## Confirm mean 0 and standard deviation 1
mean(NELS$zses)
sd(NELS$zses)

# Example 4.8
## Plots a boxplot of self concept
boxplot(NELS$slfcnc12)
## Create standardized variable
NELS$zslfcnc12 = scale(NELS$slfcnc12)
## OPTIONAL: round the variable with the z-scores to three numbers after the decimal place
NELS$zslfcnc12 = round(NELS$zslfcnc12,3)
## Create frequency distribution table
table(NELS$zslfcnc12)
## Create a table of only the z scores < - 2 or > 2
table(NELS$zslfcnc12[abs(NELS$zslfcnc12) > 2])
## Another way to create a table of only the scores < -2 or > 2
table(NELS$zslfcnc12[NELS$zslfcnc12 > 2 | NELS$zslfcnc12 < -2])

# Figure 4.6
## Creates side-by-side boxplots of reading achievement by gender
boxplot(NELS$achrdg12~NELS$gender)

## Calculates summary statistics (mean and standard deviation) of achrdg12 by gender
mean(NELS$achrdg12[NELS$gender == "Male"])
sd(NELS$achrdg12[NELS$gender == "Male"])
mean(NELS$achrdg12[NELS$gender == "Female"])
sd(NELS$achrdg12[NELS$gender == "Female"])

# Example 4.9
## Creates an object called x with values 1, 4, 16, 64, and 256
x = c(1, 4, 16, 64, 256)
## Calculates the skew of x
skew(x)
## Creates an object called halfx with the values of x divided by 2
halfx = x/2
## Calculates the skew of halfx
skew(halfx)
## Creates an object called sqrtx with the square root of the values of x
sqrtx = sqrt(x)
## Calculates the skew of sqrtx
skew(sqrtx)
## Creates an object called log2x with the log base 2 values of x
log2x = log(x, 2)
## Calculates the skew of log2x
skew(log2x)

# Figure 4.7
## Creates a boxplot of expected income at 30
boxplot(NELS$expinc30)

# Figure 4.8
## Creates a boxplot of self concept
boxplot(NELS$slfcnc12)

# Example 4.10
## Calculates the summary statistics for expected income at 30 and self concept
summary(NELS$expinc30)
summary(NELS$slfcnc12)
## Creates a new variable called expinclg that is the log (base 10) of expected income plus 1
NELS$expinclg = log(NELS$expinc30+1, 10)
## Creates a new variable called expincsq which is the square root of expected income plus 1
NELS$expincsq = sqrt(NELS$expinc30+1)
## Calculates summary statistics for the log and square root variables
summary(NELS$expinclg)
summary(NELS$expincsq)

# Figure 4.9
## Splits the plotting frame in half
par(mfrow = c(1,2))
## Plots boxplots of the log and square root variables
boxplot(NELS$expincsq)
boxplot(NELS$expinclg)
## Restores the plotting frame to original settings
par(mfrow = c(1,1))

## Translation of self concept
NELS$slfcnc12reftr = (-1)*NELS$slfcnc12 + 44

# Figure 4.10
## Plots side-by-side boxplots of self concept and the translated self concept variable
boxplot(NELS$slfcnc12, NELS$slfcnc12reftr, names = c("Self Concept", "Translated Self Concept"))

## Calculates the square root of the translated self concept and stores it in a new object
NELS$slfcnc12reftrsqrt = sqrt(NELS$slfcnc12reftr)
## Calculates the skew of the new variable
skew(NELS$slfcnc12reftrsqrt)
## Takes the log (base 10) of the new variable
NELS$slfcnc12reftrlog = log(NELS$slfcnc12reftr, 10)
## Calculates its skew
skew(NELS$slfcnc12reftrlog)

# Figure 4.11
## Boxplots of the self concept square root and self concept log
boxplot(NELS$slfcnc12reftrsqrt, NELS$slfcnc12reftrlog, names = c("Self Concept Square Root", "Self Concept Log"))

# Example 4.11
## Ranks the fat of hamburgers
Hamburger$rfat = rank(Hamburger$fat)
## Ranks the calories of hamburgers
Hamburger$rcalories = rank(Hamburger$calories)

## Reverses the ranks of fat
Hamburger$rkfat = 6 - Hamburger$rfat
## Reverses the ranks of calories
Hamburger$rkcalories = 6 - Hamburger$rcalories

# Example 4.12
## Recodes school type to merge the two types of private school
NELS$schtypre = ifelse(NELS$schtyp8 == "Public", "Public", "Private")

# Example 4.13
## Calculates teh mediate of self concept at 8th grade
median(NELS$slfcnc08)
## Dichotomizes self concept by splitting at the median
NELS$slfcnc08ms = ifelse(NELS$slfcnc08 <= 21, 1, 2)
## Displays a frequency table of the median split self concept score
table(NELS$slfcnc08ms)

# Example 4.14
## Creates a new variable named sumunits which is the sum of math and english scores
NELS$sumunits = NELS$unitmath + NELS$unitengl

# Example 4.15
## Create the variable sumunits
NELS$sumunits = NELS$unitmath + NELS$unitengl
## Create a box plot of sumunits
boxplot(NELS$sumunits)
## Generate summary statistics for the variable sumunits
summary(NELS$sumunits)
