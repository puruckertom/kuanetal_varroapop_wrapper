#check to make sure required packages are installed
list.of.packages <- c("plyr", "dplyr", "reshape2", "ggplot2", "grid", "gridExtra", "sensitivity", "abind", 
                      "ppcor")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)>0) {install.packages(new.packages)}

#load library dependencies
library(plyr)
library(reshape2)
library(ggplot2)
library(grid)
library(gridExtra)
library(sensitivity)
library(abind)
library(dplyr)

#echo environment
Sys.info()
Sys.info()[4]
.Platform
version

#Determine path directory based on the user machine######
#tom epa windows 2
if(Sys.info()[4]=="DZ2626UTPURUCKE"){
  vpdir<-path.expand("k:/git/beeRpop/")
  vpdir2<-path.expand("k:/git/beeRpop/")
  # varroapop file (without directory, the file needs to be in vpdir_exe above)
  vrp_filename <- "comparison_stp_epaw.vrp"
}
#tom mac air
if(Sys.info()[4]=="stp-air"){
  vpdir<-path.expand("~/git/beeRpop/")
}
#tom mac air
if(Sys.info()[4]=="stp-air.local"){
  vpdir<-path.expand("~/git/beeRpop/")
}
#marcia epa computer
if(Sys.info()[4]=="LZ2626UMSNYDE02"){
  vpdir<-path.expand("C:/Users/msnyde02/varroapoptest2/")
  # varroapop file (without directory, the file needs to be in vpdir_exe above)
  vrp_filename <- "comparison.vrp"
}
#carmen personal laptop
if(Sys.info()[4]=="Ashleys-MBP"||Sys.info()[4]=="Ashleys-MacBook-Pro-2.local"||
   Sys.info()[4]=="Ashleys-MBP-2"||Sys.info()[4]=="Ashleys-MacBook-Pro.local") {
  vpdir<-path.expand("~/git/beeRpop/")
  # varroapop file (without directory, the file needs to be in vpdir_exe above)
  vrp_filename <- "default.vrp"
}
#carmen other personal laptop
if(Sys.info()[4]=="ACKUAN-PC"){
  vpdir<-path.expand("C:/gitrepo/beeRpop/")
  # varroapop file (without directory, the file needs to be in vpdir_exe above)
  vrp_filename <- "default_carmen.vrp"
}
#carmen epa desktop 2
if(Sys.info()[4]=="DZ2626UCKUAN"){
  vpdir<-path.expand("C:/Users/Ckuan/Desktop/ckuan/git/beeRpop/")
  vpdir2<-path.expand("C:/Program Files (x86)/Varroapop/")
  # varroapop file (without directory, the file needs to be in vpdir_exe above)
  vrp_filename <- "carmen_new.vrp"
}
#andrew epa
if(Sys.info()[4]=="LZ2032EAKANAREK"){
  vpdir <- path.expand("C:/Users/AKanarek/Documents/GitHub/beeRpop/")
  # varroapop file (without directory, the file needs to be in vpdir_exe above)
  vrp_filename <- "comparison.vrp"
} 
if(Sys.info()[4]=="DZ2626UKWOLFE"){
  vpdir<-path.expand("E:/VarroaPop/beeRpop/")
  # varroapop file (without directory, the file needs to be in vpdir_exe above)
  vrp_filename <- "comparison_kurt.vrp"
}

#subdirectories
vpdir_input <- paste(vpdir, "input/", sep = "")
vpdir_output <- paste(vpdir, "output/", sep = "")
vpdir_log <- paste(vpdir, "log/", sep = "")
vpdir_fig <- paste(vpdir, "figures/", sep = "")
vpdir_exe <- paste(vpdir, "exe/", sep = "")
vpdir_io <- paste(vpdir, "io/", sep = "")
vpdir_in_foliar <- paste(vpdir_input, "foliar/", sep = "")
vpdir_in_control <- paste(vpdir_input, "control/", sep = "")
vpdir_in_seed <- paste(vpdir_input, "seed/", sep = "")
vpdir_in_soil <- paste(vpdir_input, "soil/", sep = "")
vpdir_out_foliar <- paste(vpdir_output, "foliar/", sep = "")
vpdir_out_control <- paste(vpdir_output, "control/", sep = "")
vpdir_out_seed <- paste(vpdir_output, "seed/", sep = "")
vpdir_out_soil <- paste(vpdir_output, "soil/", sep = "")
vpdir_weather <- paste(vpdir, "weather/", sep = "")
vpdir_sobol <- paste(vpdir, "sobol/", sep = "")

#varroapop executable version
vp_binary <- "VarroaPop.exe"
vpdir_executable <- paste(vpdir_exe, vp_binary, sep="")
vpdir2_executable <- paste(vpdir2, vp_binary, sep="")

#number of simulations 
Nsims <- 1000

#weather file
#can be .dvf or .wth
vrp_weather <- "w93193-tempadj.dvf"
#vrp_weather <- "Midwest5Yr.wth"

#simulation start and end
#must have mm/dd/yyyy format
simstart <- "01/01/1988"
simend <- "12/31/1990"

#run everything
# define distributions for input parameters
source(paste(vpdir,"src/01parameterize_simulation.R",sep = ""))

#echo the first log file
scan(file = paste(vpdir_log, "log1.txt", sep=""), what = "raw")

# create and save input text files for simulations
source(paste(vpdir,"src/02write_input.R",sep = ""))

#may need to turn off virus checker!
# automate simulations for 'Nsims' number of simulations
source(paste(vpdir,"src/03simulate_w_exe.R",sep = ""))

# read text files and save results in 3d arrays
source(paste(vpdir,"src/04read_output.R",sep = ""))

# load input and output objects into environment
source(paste(vpdir,"src/05load_io.R",sep = ""))


# run sensitivity analysis on tdarrays
source(paste(vpdir,"src/06adaily_sensitivity_analyses_linear.R",sep = ""))

# plot results
source(paste(vpdir,"src/06bdaily_sensitivity_analyses_graphics.R",sep = ""))


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



