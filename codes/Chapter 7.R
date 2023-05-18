# Chapter 7

## Loads the Statistics Using R library (once per R session)
library(sur)

# Figure for Example 7.5
## Table of region for the NELS dataset
table(NELS$region)

# Figure for Example 7.6
## Table of computer use by region for the NELS dataset
table(NELS$computer, NELS$region)
## Table with marginal sums
addmargins(table(NELS$computer, NELS$region))

# Figure for Example 7.7
## Creates a table of marijuana use
table(NELS$marijuan)

# Figure for Example 7.9
## Creates a table of gender by marijuana use with margins
addmargins(table(NELS$gender, NELS$marijuan))

# Figure for Example 7.15
## Creates a table of absences by hs program type with margins
addmargins(table(NELS$absent12,NELS$hsprog))

# Figure for Exercise 7.14
## Creates a table proportions of education by marital status with margins
addmargins(percent.table(Wages$ed, Wages$marr))/100
