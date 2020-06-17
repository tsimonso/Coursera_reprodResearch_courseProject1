# ##------------------
# ## Download from URL
# ##------------------

url<-"https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip"

if(!file.exists(file.path(wd,o,"activity.csv"))){ ## Download and
        if(!file.exists(file.path(wd,o,"repdata_data_activity.zip"))){  ## unzip if dataset !exists
                download(url, dest=file.path(wd,o,"repdata_data_activity.zip"), mode="wb")
                unzip(file.path(wd,o,"repdata_data_activity.zip"), exdir=file.path(wd,o))
        }
}