## What is the average daily activity pattern?
## ===========================================

## Make a time series plot (i.e. type = "l") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all days (y-axis)
## ----------------------------------------------------------------------------------------------------------------------------------------------------
activity%>%
        group_by(interval_t)%>%
        summarise(steps_mean=mean(steps,na.rm=TRUE))->intervalActivity
intervalActivity<-as.data.frame(intervalActivity)
str(intervalActivity)
head(intervalActivity)
summary(dailyActivity$steps)

## plot
Nobs<-sum(complete.cases(activity))
Ndays<-nrow(dailyActivity[!is.na(dailyActivity$steps),]) #number of days with complete data

g<-ggplot(intervalActivity,aes(interval_t,steps_mean))+
        geom_line()+
        ggtitle("Pattern of activity along the day")+
        xlab("Time of the day")+
        ylab("Average level of activity per 5-minute interval (Number of steps)")+
        scale_x_chron(format="%H:%M")
setwd("./graphs")
ggsave(filename="intervalActivity.png")
setwd(wd)

## Which 5-minute interval, on average across all the days in the dataset, contains the maximum number of steps?
## -------------------------------------------------------------------------------------------------------------
intervalActivity[intervalActivity$steps_mean==max(intervalActivity$steps_mean),]
