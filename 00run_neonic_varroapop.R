#library dependencies
library(plyr)
library(reshape2)
library(ggplot2)
library(grid)
library(gridExtra)
library(sensitivity)
library(abind)


#Determine path directory based on the user machine######
#tom epa windows
if(Sys.info()[4]=="DC2626UTPURUCKE"){
  vpdir<-path.expand("C:/git/beeRpop/")
}
#marcia epa computer
if(Sys.info()[4]=="LZ2626UMSNYDE02"){
  vpdir<-path.expand("C:/Users/msnyde02/varroapoptest2/")
}
#carmen personal laptop
if(Sys.info()[4]=="Ashleys-MBP"){
  vpdir<-path.expand("~/git/beeRpop/")
}
#carmen epa desktop
if(Sys.info()[4]=="ACKUAN-PC"){
  vpdir<-path.expand("C:\\gitrepo\\beeRpop\\")
}
#andrew epa
if(Sys.info()[4]=="LZ2032EAKANAREK"){
  vpdir <- path.expand("C:/Users/AKanarek/Documents/GitHub/beeRpop/")
} 
#tom laptop
if(Sys.info()[4]=="stp-air.local"){
  vpdir<-path.expand("~/git/beeRpop/")
}

#subdirectories
vpdir_input <- paste(vpdir + "input/", paste = "")
vpdir_output <- paste(vpdir + "output/", paste = "")
vpdir_exe <- paste(vpdir + "exe/", paste = "")


#specify daily simulation period
#start to stop dates
#TODO: read from varroapop output at end of 01
time <- seq(as.Date("2010/5/1"), as.Date("2010/12/31"), by="days")
Nsims <- 1000

#run everything
source(paste(vpdir,"01parameterize_simulation.R",sep = ""))
source(paste(vpdir,"02simulate_w_exe.R",sep = ""))
source(paste(vpdir,"03read_output.R",sep = ""))
source(paste(vpdir,"04sensitivity_analyses.R",sep = ""))
source(paste(vpdir,"05plotting_neonic_generic.R",sep = ""))

##########################################################
# #git stuff - you only need to do this once
# #install
# https://help.github.com/desktop/guides/getting-started/installing-github-desktop/
# 
# # to clone this onto a machine with github installed
# #navigate in the github shell to a directory where you have read/write privileges
# #then from the directory above where you want to install the R source code:
# git clone https://github.com/puruckertom/beeRpop.git
# #####
# 
# #git stuff you have to do more often
# #switch into that directory
# cd beeRpop
# #check status (you should be )
# git status
# #check for changes on this and other branches
# git fetch
# #checkout a different branch
# git branch
# git checkout andrew
# 
# #after making some changes and you want to push those changes to the cloud
# git fetch
# git pull
# git commit -am "some explanatory message about what this commit was about"
# git push