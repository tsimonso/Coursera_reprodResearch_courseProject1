
## Examine the data
## ----------------
str(activity)

## Format the dates
##-----------------

#interval
activity$interval<-as.character(activity$interval)
not4digits<-sum(!grepl("^([0-9]{4})",activity$interval))
while(not4digits>0){
        activity$interval[!grepl("^([0-9]{4})",activity$interval)]<-paste("0",activity$interval[!grepl("^([0-9]{4})",activity$interval)],sep="")
        not4digits<-sum(!grepl("^([0-9]{4})",activity$interval))
}

activity$hh<-unlist(str_match_all(activity$interval,"^[0-9][0-9]"))
activity$mm<-unlist(str_match_all(activity$interval,"[0-9][0-9]$"))
activity%>%
        mutate(interval_chr=paste(hh,mm,sep=":"))%>%
        select(-c(hh,mm))->activity# as a character variable
str(activity)

#date
activity%>%
        rename(date_str=date) %>% #rename the string variable 'date' as 'date_str'
        mutate(date=ymd(date_str)) %>% #create the variable 'date' formatted as a date
        select(-date_str)->activity #drop the string variable 'date_str'

str(activity)
