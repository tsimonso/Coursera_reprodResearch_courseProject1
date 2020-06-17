## IMPUTING MISSING VALUES
## =======================

## Calculate and report the total number of missing values in the dataset (i.e. the total number of rows with NAs)
## ===============================================================================================================
sum(!complete.cases(activity))


## Calculate the proportion of missing data for 'steps'
## ----------------------------------------------------
sum(is.na(activity_analytic1$steps))/length(activity_analytic1$steps)


## Devise a strategy for filling in all of the missing values in the dataset. The strategy does not need to be sophisticated. 
## For example, you could use the mean/median for that day, or the mean for that 5-minute interval, etc.
## Create a new dataset that is equal to the original dataset but with the missing data filled in.
## ==========================================================================================================================

## Look for patterns in missing data
## ---------------------------------
activity_analytic1%>%
        missing_plot()

activity_analytic1%>%
        group_by(date)%>%
        summarise(dailysteps=sum(steps),dailysteps.na.rm=sum(steps, na.rm = TRUE))%>%
        filter(is.na(dailysteps))->activity_dayswithNA
activity_dayswithNA
## interpretation: days have either no data or complete data

activity_analytic2<-activity_analytic1
for(i in activity_dayswithNA$date){
        activity_analytic2[activity_analytic2$date==i,]$steps<-activity_interval$steps_mean
}

activity_imputation<-full_join(activity_analytic2,activity_interval,by="interval")
activity_imputation%>%
        mutate(imputation=is.na(steps))->activity_imputation
activity_imputation[activity_imputation$imputation==TRUE,]$steps<-round(activity_imputation[activity_imputation$imputation==TRUE,]$steps_mean)




## Make a histogram of the total number of steps taken each day and Calculate and report the mean and median total number of steps taken per day.
## Do these values differ from the estimates from the first part of the assignment?
## What is the impact of imputing missing data on the estimates of the total daily number of steps?
## ==============================================================================================================================================

## Calculate the total number of steps taken per day
activity_imputation%>%
        group_by(date)%>%
        summarise(dailysteps=sum(steps))->activity_daily_imputation

## Make a histogram of the total number of steps taken each day
hist(activity_daily_imputation$dailysteps)

## Calculate and report the mean and median of the total number of steps taken per day
activity_daily_imputation%>%
        summarise(dailysteps_mean=mean(dailysteps, na.rm = TRUE), dailysteps_median=median(dailysteps, na.rm = TRUE))->dailyactivity_imputation_summary
print(dailyactivity_imputation_summary)
