# install.packages(tidyverse)
library(tidyverse) #Import Tidyverse

pima_hmda <- read.csv("Data/pima.csv") #Import and assign population data.
pima_hmda_clean <- pima_hmda %>%
  select(
    interest_rate,
    income,
    loan_term,
    action_taken,
    property_value,
    loan_amount,
    denial_reason.1,
    applicant_age
  ) %>%
  mutate(
    interest_rate = as.numeric(na_if(interest_rate, "Exempt")),
    property_value = as.numeric(na_if(property_value, "Exempt")),
    loan_term = as.numeric(na_if(loan_term, "Exempt"), "NA"),
    applicant_age = as.factor(na_if(applicant_age, "8888"))
  ) %>%
  filter(
    !is.na(interest_rate),
    !is.na(loan_term),
    !is.na(income),
    !is.na(action_taken),
    !is.na(property_value),
    !is.na(loan_amount),
    !is.na(applicant_age)
  )


