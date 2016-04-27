install.packages("plyr")
library(plyr)
install.packages("reshape2")
library(reshape2)
install.packages("ggplot2")
library(ggplot2)
library(grid)
install.packages("gridExtra")
library(gridExtra)
install.packages("sensitivity")
library(sensitivity)
install.packages("abind")
library(abind)
install.packages("doParallel")
library(doParallel)
library(parallel)

#echo environment
Sys.info()
Sys.info()[4]
.Platform
version

#Determine path directory based on the user machine######
#tom epa windows 
if(Sys.info()[4]=="DZ2626UTPURUCKE"){
  vpdir<-path.expand("k:/git/beeRpop/")
  vrp_filename <- "comparison_stp.vrp"
  #vrp_filename <- "comparison.vrp"
}
#marcia epa computer
if(Sys.info()[4]=="LZ2626UMSNYDE02"){
  vpdir<-path.expand("C:/Users/msnyde02/varroapoptest2/")
}
#carmen personal laptop
if(Sys.info()[4]=="Ashleys-MBP"||Sys.info()[4]=="Ashleys-MacBook-Pro-2.local"||Sys.info()[4]=="Ashleys-MBP-2") {
  vpdir<-path.expand("~/git/beeRpop/")
  vrp_filename <- "comparison.vrp"
}
#carmen epa desktop
if(Sys.info()[4]=="DZ2626UCKUAN"){
  vpdir<-path.expand("C:/Users/ckuan/git/beeRpop/")
  vrp_filename <- "comparison.vrp"
}
#andrew epa
if(Sys.info()[4]=="LZ2032EAKANAREK"){
  vpdir <- path.expand("C:/Users/AKanarek/Documents/GitHub/beeRpop/")
} 
#tom laptop
if(Sys.info()[4]=="stp-air.local"){
  vpdir<-path.expand("~/git/beeRpop/")
}
#kurt epa
if(Sys.info()[4]=="L2626UKWOLFE2"){
  vpdir<-path.expand("G:/Carmen/beeRpop/")
}

#subdirectories
vpdir_input <- paste(vpdir, "input/", sep = "")
vpdir_output <- paste(vpdir, "output/", sep = "")
vpdir_log <- paste(vpdir, "log/", sep = "")
vpdir_fig <- paste(vpdir, "fig/", sep = "")
vpdir_exe <- paste(vpdir, "exe/", sep = "")
vpdir_io <- paste(vpdir, "io/", sep = "")
vpdir_in_exp <- paste(vpdir_input, "exposed/", sep = "")
vpdir_in_con <- paste(vpdir_input, "control/", sep = "")
vpdir_out_exp <- paste(vpdir_output, "exposed/", sep = "")
vpdir_out_con <- paste(vpdir_output, "control/", sep = "")
vpdir_weather <- paste(vpdir, "weather/", sep = "")
vpdir_sobol <- paste(vpdir, "sobol/", sep = "")

#number of simulations 
Nsims <- 5000

#weather file
#can be .dvf or .wth
vrp_weather <- "w93193-tempadj.dvf"
#simulation start and end
#must have mm/dd/yyyy format
simstart <- "01/01/1988"
simend <- "12/31/1990"

# define distributions for input parameters
source(paste(vpdir_sobol,"01sobol_parameterization.R",sep = ""))
# create and save input text files for simulations
source(paste(vpdir_sobol,"02sobol_write_input.R",sep = ""))
#may need to turn off virus checker!
# automate simulations for 'Nsims' number of simulations
source(paste(vpdir_sobol,"03sobol_run_simulations.R",sep = ""))
# read text files and save results in 3d arrays
#source(paste(vpdir,"04sobol_read_output.R",sep = ""))
# load input and output objects into environment