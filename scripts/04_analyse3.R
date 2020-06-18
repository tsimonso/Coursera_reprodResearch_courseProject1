## IMPUTING MISSING VALUES
## =======================

## Calculate and report the total number of missing values in the dataset (i.e. the total number of rows with NAs)
## ===============================================================================================================
sum(!complete.cases(activity))


## Calculate the proportion of missing data for 'steps'
## ----------------------------------------------------
sum(is.na(activity$steps))/length(activity$steps)


## Devise a strategy for filling in all of the missing values in the dataset. The strategy does not need to be sophisticated. 
## For example, you could use the mean/median for that day, or the mean for that 5-minute interval, etc.
## Create a new dataset that is equal to the original dataset but with the missing data filled in.
## ==========================================================================================================================

## Look for patterns in missing data
## ---------------------------------
activity%>%
        missing_plot()

activity%>%
        group_by(date)%>%
        summarise(steps=sum(steps),stepsNArm=sum(steps, na.rm = TRUE))%>% #The value in the first column will be NA if there are NAs that day, The value in the second column will be the total number of steps that day, ignoring the NAs
        filter(is.na(steps))
## interpretation: days have either no data or complete data

activity_imputation<-full_join(activity,activity_interval,by="interval")
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
        summarise(steps=sum(steps))->dailyActivity_wImputation

## Make a histogram of the total number of steps taken each day
nrNwi<-sum(complete.cases(dailyActivity_wImputation))
setwd("./graphs")
png("dailyActivity_wImput.png")
hist(dailyActivity_wImputation$steps,ylim=c(0,40),
     main="Distribution of daily activity \n (with imputation)",
     xlab="Number of steps",ylab="Frequency")
par(adj = 0)
title(sub=paste("N=",nrNwi))
par(adj = 0.5)
dev.off()
setwd(wd)

## Calculate and report the mean and median of the total number of steps taken per day
dailyActivity_wImputation%>%
        summarise(steps_mean=mean(steps, na.rm = TRUE), steps_median=median(steps, na.rm = TRUE))->dailyActivity_wImputation_summary
print(dailyActivity_wImputation_summary)

