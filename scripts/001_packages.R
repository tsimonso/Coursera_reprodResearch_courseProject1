##----------
## Packages
## ---------
requiredPackages = c("downloader","readr","reader", "dplyr", "data.table", "lubridate", "chron" ,"finalfit","ggplot2","forcats","markdown","knitr","stringr","scales")
for(p in requiredPackages){
        if(!require(p,character.only = TRUE)) install.packages(p)
        library(p,character.only = TRUE)
}
rm(p)

##---------------
## Time settings
##---------------

Sys.setlocale("LC_TIME", "C")           #language settings for time and date -> English
Sys.setenv(TZ='GMT')                    #We will use GMT ()
