
## Examine the data
## ----------------
str(activity)

## Format the dates
##-----------------
activity%>%
        rename(date_str=date) %>% #rename the string variable 'date' as 'date_str'
        mutate(date=ymd(date_str)) %>% #create the variable 'date' formatted as a date
        select(-date_str)->activity %>% #drop the string variable 'date_str'

str(activity)