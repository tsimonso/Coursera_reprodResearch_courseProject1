##CHECH WORKING DIRECTORY
wd<<-getwd()
o<<-"original"
d<<-"datasets"
s<<-"scripts"
g<<-"graphs"
m<<-"markup"

source(file.path(wd,s,"001_packages.R"))
source(file.path(wd,s,"01_downloadData.R"))
source(file.path(wd,s,"02_read.R"))
source(file.path(wd,s,"03_process.R"))
source(file.path(wd,s,"04_analyse.R"))
source(file.path(wd,s,"04_analyse2.R"))
source(file.path(wd,s,"04_analyse3.R"))
source(file.path(wd,s,"04_analyse4.R"))



