
## Examine the data
## ----------------
str(activity)

## Format the dates
##-----------------
activity%>%
        mutate(date=ymd(date))->activity_analytic1 # Contain missing values for steps. No  imputation yet.

str(activity_analytic1)

