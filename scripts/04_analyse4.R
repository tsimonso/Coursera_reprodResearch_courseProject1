# Are there differences in activity patterns between weekdays and weekends?
activity_imputation%>%
        mutate(weekday7=factor(weekdays(date),levels=c("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")))%>%
        mutate(weekday2=fct_collapse(weekday7, Weekday = c("Monday","Tuesday","Wednesday","Thursday","Friday"), Weekend = c("Saturday","Sunday")))%>%
        group_by(interval,weekday2)%>%
        summarise(steps=mean(steps,na.rm=TRUE))->patternActivityWeekday

str(patternActivityWeekday)

## plot (lattice system)
setwd("./graphs")
png(filename="WeekdayWeekend_lattice.png")
with(patternActivityWeekday,xyplot(steps~interval|weekday2,type="l"))# 
dev.off()
setwd(wd)

## plot (ggplot2)
g<-ggplot(patternActivityWeekday,aes(interval,steps))+
        geom_line()+
        facet_grid(.~weekday2)+
        ggtitle("Activity pattern on weekdays and weekends")+
        xlab("Interval")+
        ylab("Steps")
setwd("./graphs")
ggsave(filename="WeekdayWeekend_ggplot.png")
setwd(wd)
