# Chapter 17

## Loads the Statistics Using R library (once per R session)
library(sur)

# Figure 17.1
## Creates an object called results which holds the results of this linear model without an
## interaction
results = lm(barsold ~ temp + relhumid, data = IceCream)

## Uses the interact_plot function in the interactions package to plot two lines from the results
## object, one where relhumid is 67 and one where it is 88. Here, pred is the predictor
## variable temp, modx is the moderating varible relhumid, and modx.values indicate
## the values of the moderator relhumid for which we want to view a line.
install.packages("interactions")
library(interactions)

interact_plot(results, pred="temp", modx = "relhumid", modx.values = c(67,88),
              x.label = "Temperature in Degrees Fahrenheit",
              y.label = "Average Number of Bars Sold",
              main.title = "Relating Ice Cream Sales to Temp and Relhumid: NO Interaction",
              legend.main = "Relhumid", colors = "Greys")


# Figure 17.2 and 17.4
## Creates an object called results2 which holds the results of this linear model with an
## interaction
results2 = lm(barsold ~ temp*relhumid, data = IceCream)
## Uses the interact_plot function in the interactions package to plot two lines: one where
## relhumid is 67 and one where it is 88.
interact_plot(results2, pred="temp", modx = "relhumid", modx.values = c(67,88),
              x.label = "Temperature in Degrees Fahrenheit",
              y.label = "Average Number of Bars Sold",
              main.title = "Relating Ice Cream Sales to Temp and Relhumid \n Relhumid Moderates the Relationship between Barsold and Temp",
              legend.main = "Relhumid", colors = "Greys")

# Example 17.1
## Creates a variable called product to represent the product of temperature and relative
## humidity as a new variable in the IceCream data set
IceCream$product = IceCream$temp*IceCream$relhumid

## Displays summary statistics of temp, barsold, relhumid and product in the IceCream data set
summary(IceCream[, c("temp", "barsold", "relhumid", "product")])

## Displays bivariate correlations
cor(IceCream[, c("temp", "barsold", "relhumid", "product")])

## Creates an object called results3 which holds the results of the linear model which
## includes the product term and temp and relhumid
results3 = lm(barsold ~ temp + relhumid + product, data = IceCream)
summary(results3)

## Alternatively, we can create an object called results4 which holds the results of the
## linear model where temp*relhumid is the only predictor term. R will provide coefficient
## estimates for both the main effects and the interaction term in the same way as results3
results4 = lm(barsold ~ temp*relhumid, data = IceCream)
summary(results4)

## Creates an ANOVA table of model summary statistics
anova(lm(barsold ~ temp + relhumid + product, data = IceCream))

## Tests for the significance of the interaction term by creating and then placing two
## nested regression objects within the anova function
model1 = lm(barsold ~ temp + relhumid, data = IceCream)
summary(model1)
model2 = lm(barsold ~ temp + relhumid + product, data = IceCream)
summary(model2)
anova(model1, model2)

# Table 17.1
## Using the Model 1 equation ((0.87*IceCream$temp)+(0.40*IceCream$relhumid) + 67.62),
## we plug in the following values:

# -1 SD Temp (66) and Low Humidity (67)
(0.87*66)+(0.40*67) + 67.62
# 0 SD Temp (75) and Low Humidity (67)
(0.87*75)+(0.40*67) + 67.62
# +1 SD Temp (84) and Low Humidity (67)
(0.87*84)+(0.40*67) + 67.62

# -1 SD Temp (66) and High Humidity (88)
(0.87*66)+(0.40*88) + 67.62
# 0 SD Temp (75) and Low Humidity (88)
(0.87*75)+(0.40*88) + 67.62
# +1 SD Temp (84) and Low Humidity (88)
(0.87*84)+(0.40*88) + 67.62

## Using the Model 2 equation ((2.97*IceCream$temp)+(2.58*IceCream$relhumid)-
## (.027*IceCream$relhumid*IceCream$temp) - 98.68), we plug in the following values:

# -1 SD Temp (66) and Low Humidity (67)
(2.97*66)+(2.58*67)-(.027*67*66) - 98.68
# 0 SD Temp (75) and Low Humidity (67)
(2.97*75)+(2.58*67)-(.027*67*75) - 98.68
# +1 SD Temp (84) and Low Humidity (67)
(2.97*84)+(2.58*67)-(.027*67*84) - 98.68

# -1 SD Temp (66) and High Humidity (88)
(2.97*66)+(2.58*88)-(.027*88*66) - 98.68
# 0 SD Temp (75) and High Humidity (88)
(2.97*75)+(2.58*88)-(.027*88*75) - 98.68
# +1 SD Temp (84) and High Humidity (88)
(2.97*84)+(2.58*88)-(.027*88*84) - 98.68

## Stores results from the make_prediction function in an object called predictions. Here,
## we use the lm object results2, created earlier in this file.
predictions = make_predictions(results2, pred = "temp", modx = "relhumid")

## Obtains simple slopes using the sim_slopes function in the interactions package for the
## results2 lm object at the relhumid values of 66 and 87
sim_slopes(results2, pred = "temp", modx = "relhumid", modx.values = c(66,87))

# Example 17.2
## Creates a mean-centered version of the variable slfcnc08 in the NELS data set and name
## itctrsfl08
NELS$ctrslf08 = NELS$slfcnc08 - mean(NELS$slfcnc08, na.rm = TRUE)

## Creates a centered version of the numeric form of the variable gender in the NELS data
## set by subtracting 1 from each current value and naming it gendernew
NELS$gendernew = as.numeric(NELS$gender) - 1

## Creates a variable called product to represent the product of the centered version of
## gender and slfcnc08 as a new variable in the NELS data set
NELS$product = NELS$newgender*NELS$ctrslf08

## Displays summary statistics of all rows and the variables slfcnc12, ctrslf08, gendernew
## and product in the NELS data set
summary(NELS[, c("slfcnc12", "ctrslf08", "gendernew", "product")])

## Displays bivariate correlations
cor(NELS[, c("slfcnc12", "ctrslf08", "gendernew", "product")])

## Creates an object called results5 which holds the results of the linear model
results5 = lm(slfcnc12 ~ ctrslf08 + gendernew + product, data = NELS)

# Displays the ANOVA table of results5
anova(results5)

# Displays the coefficient estimates of results5
summary(results5)


## Obtains simple slopes using the sim_slopes function. First, re-do the linear model
## so that the only covariate in the model is ctrslf08*gendernew, and name the new model
## results6.
results6 = lm(slfcnc12 ~ ctrslf08*gendernew, data = NELS)
sim_slopes(results6, pred = "ctrslf08", modx = "gendernew")

# Figure 17.5
## Plots the interaction between 8th grade self-concept and gender on 12th grade self-concept
## with gender as moderator
interact_plot(results6, pred="ctrslf08", modx = "gendernew",
              x.label = "ctrslf08", y.label = "12th Grade Self-Concept", interval = TRUE,
              main.title = "12th Grade Self-Concept Related to Gender & 8th Grade Self-Concept",
              legend.main = "Gender", modx.labels = c("Male","Female"), colors = "Greys")

# Figure 17.6
## Plots the interaction between 8th grade self-concept and gender on 12th grade self-concept
## with gender as moderator and including the points of the scatterplot by using the
## 'plot.points=TRUE' argument
interact_plot(results6, pred="ctrslf08", modx = "gendernew", plot.points = TRUE,
              x.label = "ctrslf08", y.label = "12th Grade Self-Concept", interval = TRUE,
              main.title = "12th Grade Self-Concept Related to Gender & 8th Grade Self-Concept",
              legend.main = "Gender", modx.labels = c("Male","Female"), colors = "Greys")

# Figure 17.7
## Plots the interaction between 8th grade self-concept and gender on 12th grade self-concept
## with ctrslf08 as the moderator. We indicate the values of ctrslf08 we want to see with
## the modx.values argument.
interact_plot(results6, pred="gendernew", modx = "ctrslf08", modx.values = c(-20,-10,0,10,20),
              x.label = "Gender", y.label = "12th Grade Self-Concept", interval = TRUE,
              pred.labels = c("Male","Female"),
              main.title = "12th Grade Self-Concept Related to Gender & 8th Grade Self-Concept",
              legend.main = "8th Grade Self-Concept", modx.labels = c("-20", "-10", "0", "10", "20"), colors = "Greys")

# Table 17.2

# Fit a model with barsold regressed on temp, get the AIC, BIC and adjusted R2 from the model
model1 = lm(barsold ~ temp, data = IceCream)
AIC(model1)
BIC(model1)
summary(model1)$adj.r.squared

# Fit a model with barsold regressed on temp and relhumid, get the AIC, BIC and adjusted R2 from the model
model2 = lm(barsold ~ temp + relhumid, data = IceCream)
AIC(model2)
BIC(model2)
summary(model2)$adj.r.squared

# Fit a model with barsold regressed on temp, relhumid, and their interaction, get the AIC, BIC and adjusted R2 from the model
model3 = lm(barsold ~ temp*relhumid, data = IceCream)
AIC(model3)
BIC(model3)
summary(model3)$adj.r.squared
