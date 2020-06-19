## What is the average daily activity pattern?
## ===========================================

## Make a time series plot (i.e. type = "l") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all days (y-axis)
## ----------------------------------------------------------------------------------------------------------------------------------------------------
activity%>%
        group_by(interval_chr)%>%
        summarise(steps_mean=mean(steps,na.rm=TRUE))->intervalActivity
intervalActivity<-as.data.frame(intervalActivity)
str(intervalActivity)
head(intervalActivity)
summary(dailyActivity$steps)

## plot
Nobs<-sum(complete.cases(activity))
Ndays<-nrow(dailyActivity[!is.na(dailyActivity$steps),]) #number of days with complete data

setwd("./graphs")
png("intervalActivity.png")
with(intervalActivity,plot(strptime(interval_chr, "%H:%M"),steps_mean,type="l",
                           main="Pattern of activity along the day",
                           ylab="Average level of activity per 5-minute interval (Number of steps)",
                           xlab="Time of the day (hh:mm)"))
par(adj = 0)
title(sub=paste("Nr of days = ",Ndays,",     Total Nr of intervals = ",Nobs))
par(adj = 0.5)
dev.off()
setwd(wd)


## Which 5-minute interval, on average across all the days in the dataset, contains the maximum number of steps?
## -------------------------------------------------------------------------------------------------------------
intervalActivity[intervalActivity$steps_mean==max(intervalActivity$steps_mean),]
