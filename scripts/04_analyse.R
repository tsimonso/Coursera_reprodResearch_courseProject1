## What is mean total number of steps taken per day?
## =================================================

## Calculate the total number of steps taken per day
activity_analytic%>%
        group_by(date)%>%
        summarise(dailysteps=sum(steps))->activity_daily

## Make a histogram of the total number of steps taken each day
hist(activity_daily$dailysteps)

## Calculate and report the mean and median of the total number of steps taken per day
activity_daily%>%
        summarise(dailysteps_mean=mean(dailysteps, na.rm = TRUE), dailysteps_median=median(dailysteps, na.rm = TRUE))->dailyactivity_summary
print(dailyactivity_summary)
