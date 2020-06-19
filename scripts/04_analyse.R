## What is mean total number of steps taken per day?
## =================================================

## Calculate the total number of steps taken per day
activity%>%
        group_by(date)%>%
        summarise(steps=sum(steps))->dailyActivity
dailyActivity<-as.data.frame(dailyActivity)
## Make a histogram of the total number of steps taken each day
nrNA<-sum(!complete.cases(dailyActivity))
nrN<-sum(complete.cases(dailyActivity))
setwd("./graphs")
png("dailyActivity_woImput.png")
hist(dailyActivity$steps,ylim=c(0,40),
     main="Distribution of daily activity \n (without imputation)",
     xlab="Number of steps",ylab="Frequency")
par(adj = 0)
title(sub=paste("N=",nrN, ", NA=",nrNA))
par(adj = 0.5)
dev.off()
setwd(wd)
## Calculate and report the mean and median of the total number of steps taken per day
dailyActivity%>%
        summarise(steps_mean=mean(steps, na.rm = TRUE), steps_median=median(steps, na.rm = TRUE))->dailyActivity_summary
print(dailyActivity_summary)
