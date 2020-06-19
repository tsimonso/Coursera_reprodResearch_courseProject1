# Are there differences in activity patterns between weekdays and weekends?
activity_imputation%>%
        mutate(weekday7=factor(weekdays(date),levels=c("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")))%>%
        mutate(weekday2=fct_collapse(weekday7, Weekday = c("Monday","Tuesday","Wednesday","Thursday","Friday"), Weekend = c("Saturday","Sunday")))%>%
        group_by(interval_t,weekday2)%>%
        summarise(steps=mean(steps,na.rm=TRUE))->patternActivityWeekday
patternActivityWeekday<-as.data.frame(patternActivityWeekday)
str(patternActivityWeekday)
head(patternActivityWeekday)

## plot (ggplot2)

str(patternActivityWeekday)
g<-ggplot(patternActivityWeekday,aes(interval_t,steps))+
        geom_line()+
        facet_grid(.~weekday2)+
        ggtitle("Activity pattern on weekdays and weekends")+
        xlab("Interval")+
        ylab("Steps")+
        scale_x_chron(format="%H:%M")
setwd("./graphs")
ggsave(filename="WeekdayWeekend_ggplot_test.png")
setwd(wd)


