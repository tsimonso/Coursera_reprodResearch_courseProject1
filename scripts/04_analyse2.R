## What is the average daily activity pattern?
## ===========================================

## Make a time series plot (i.e. type = "l") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all days (y-axis)
## ----------------------------------------------------------------------------------------------------------------------------------------------------
activity_analytic1%>%
        group_by(interval)%>%
        summarise(steps_mean=mean(steps,na.rm=TRUE))->activity_interval

str(activity_interval)

## plot
with(activity_interval,plot(interval,steps_mean,type="l"))

## Which 5-minute interval, on average across all the days in the dataset, contains the maximum number of steps?
## -------------------------------------------------------------------------------------------------------------
activity_interval[activity_interval$steps_mean==max(activity_interval$steps_mean),]
