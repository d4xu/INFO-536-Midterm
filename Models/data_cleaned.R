# install.packages(tidyverse)
library(tidyverse) #Import Tidyverse
library(ggplot2) # Import GGPlot
library(car) # import Car



pima_hmda <- read.csv("../Data/pima.csv") #Import and assign population data.
pima_hmda_clean <- pima_hmda %>%
  select(
    interest_rate,
    income,
    loan_term,
    action_taken,
    property_value,
    loan_amount
  ) %>%
  mutate(
    interest_rate = as.numeric(na_if(interest_rate, "Exempt")),
    property_value = as.numeric(na_if(property_value, "Exempt")),
    loan_term = as.numeric(na_if(loan_term, "Exempt"), "NA")
  ) %>%
  filter(
    !is.na(interest_rate),
    !is.na(loan_term),
    !is.na(income),
    !is.na(action_taken),
    !is.na(property_value),
    !is.na(loan_amount)
  )

pima_logistic <- pima_hmda %>%
  select(
    action_taken, 
    income, 
    loan_amount, 
    property_value) %>%
  mutate(
    property_value = as.numeric(na_if(property_value, "Exempt"))
  ) %>%
  filter(
    action_taken %in% c(1, 3),   # 1 = originated applications, 3 = denied applications
    !is.na(income),
    !is.na(loan_amount),
    !is.na(property_value)
  ) %>%
  mutate(denial = ifelse(action_taken == 3, 1, 0))

