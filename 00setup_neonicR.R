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

#library packages
library(plyr)
library(reshape2)
library(ggplot2)
library(grid)
library(gridExtra)
library(sensitivity)
library(abind)

#specify daily simulation period
#start to stop dates
#TODO: read from varroapop output at end of 01
time <- seq(as.Date("2010/5/1"), as.Date("2010/12/31"), by="days")
Nsims <- 1000

#create input files #########
queenstrength<- runif(Nsims, 1, 6) #ICQueenStrength
wkrdrnratio<- runif(Nsims, 1, 5) #RQWkrDrnRatio
drnmitesurvive<- runif(Nsims, 0, 100) #ICDroneMiteSurvivorship
wkrmitesurvive<- runif(Nsims, 0, 100) #ICWorkerMiteSurvivorship
fgrlifespan <- runif(Nsims, 4, 16) #ICForagerLifespan
immtype <- c("Polynomial", "Cosine", "Sine", "Exponential", "Tangent", "Logarithmic")
miteimmtype <- sample(immtype, size=Nsims, replace=T) #ImmType
#pesticide exposure
adslope<- runif(Nsims, 0, 3.93) #AIAdultSlope
adLD50<- runif(Nsims, 0, 0.5) #AIAdultLD50 (ug/bee)
adslopec<- runif(Nsims, 0, 3.93) #AIAdultSlopeContact
adLD50c<- runif(Nsims, 0, 0.05) #AIAdultLD50Contact (ug/bee)
lslope<- runif(Nsims, 0, 3.4) #AILarvaSlope
lLD50<- runif(Nsims, 0, 0.9) #AILarvaLD50 (ug/larva)
kow<- runif(Nsims, 2, 8) #AIKOW
koc<- runif(Nsims, 5, 30) #AIKOC
halflife<- runif(Nsims, 0, 5) #AIHalfLife (days)
apprate<- runif(Nsims, 0, 0.7) #EAppRate (lb/A)

inputdata<- data.frame(queenstrength,wkrdrnratio, drnmitesurvive, wkrmitesurvive, fgrlifespan, miteimmtype, 
                       adslope,adLD50,adslopec,adLD50c,lslope,lLD50,kow,koc,halflife,apprate)
write.csv(inputdata, file = paste(vpdir_output, "inputdata.csv", sep = ""))

for (i in 1:Nsims) {
  
  parameter <- ("ICQueenStrength=") #queen strength
  inputvalue <- queenstrength[i]
  parameter2 <- ("RQWkrDrnRatio=") #requeen worker-drone ratio
  inputvalue2 <- wkrdrnratio[i]
  parameter3 <- ("ICDroneMiteSurvivorship=") #drone-mite survivorship
  inputvalue3 <- drnmitesurvive[i]
  parameter4 <- ("ICWorkerMiteSurvivorship=")  #worker-mite survivorship
  inputvalue4 <- wkrmitesurvive[i]
  parameter5 <- ("ICForagerLifespan=")  #Forager Lifespan
  inputvalue5 <- fgrlifespan[i]
  parameter6 <- ("ImmType=")   #Mite Immigration Type
  inputvalue6 <- miteimmtype[i]
  parameter7 <- ("AIAdultSlope=") #ai adult slope
  inputvalue7 <- adslope[i]
  parameter8 <- ("AIAdultLD50=") #ai adult LD50
  inputvalue8 <- adLD50[i]
  parameter9 <- ("AIAdultSlopeContact=") #ai adult slope contact
  inputvalue9 <- adslopec[i]
  parameter10 <- ("AIAdultLD50Contact=") #ai adult LD50 contact
  inputvalue10 <- adLD50c[i]
  parameter11 <- ("AILarvaSlope=") #ai larva slope
  inputvalue11 <- lslope[i]
  parameter12 <- ("AILarvaLD50=") #ai larva LD50
  inputvalue12 <- lLD50[i]
  parameter13 <- ("AIKOW=") #ai kow
  inputvalue13 <- kow[i]
  parameter14 <- ("AIKOC=") #ai koc
  inputvalue14 <- koc[i]
  parameter15 <- ("AIHalfLife=") #ai half life (days)
  inputvalue15 <- halflife[i]
  parameter16 <- ("EAppRate=") #application rate (lb/A)
  inputvalue16<- apprate[i]
  
  varroainput <- paste(parameter,inputvalue, sep=" ")
  write(varroainput, file = paste(vpdir_input, "input",i,".txt", sep = ""), append = FALSE)
  varroainput2 <- paste(parameter2,inputvalue2, sep=" ")
  write(varroainput2, file = paste(vpdir_input, "input",i,".txt", sep = ""), append = TRUE)
  varroainput3 <- paste(parameter3, inputvalue3, sep=" ")
  write(varroainput3, file = paste(vpdir_input, "input", i, ".txt", sep=""), append= TRUE)
  varroainput4 <- paste(parameter4, inputvalue4, sep=" ")
  write(varroainput4, file= paste(vpdir_input, "input", i, ".txt", sep=""), append= TRUE)
  varroainput5 <- paste(parameter5, inputvalue5, sep= " ")
  write(varroainput5, file= paste(vpdir_input, "input", i, ".txt", sep=""), append= TRUE)
  varroainput6 <- paste(parameter6, inputvalue6, sep= " ")
  write(varroainput6, file= paste(vpdir_input, "input", i, ".txt", sep=""), append= TRUE)
  varroainput7 <- paste(parameter7, inputvalue7, sep= " ")
  write(varroainput7, file= paste(vpdir_input, "input", i, ".txt", sep=""), append= TRUE)
  varroainput8 <- paste(parameter8, inputvalue8, sep= " ")
  write(varroainput8, file= paste(vpdir_input, "input", i, ".txt", sep=""), append= TRUE)
  varroainput9 <- paste(parameter9, inputvalue9, sep= " ")
  write(varroainput9, file= paste(vpdir_input, "input", i, ".txt", sep=""), append= TRUE)
  varroainput10 <- paste(parameter10, inputvalue10, sep= " ")
  write(varroainput10, file= paste(vpdir_input, "input", i, ".txt", sep=""), append= TRUE)
  varroainput11 <- paste(parameter11, inputvalue11, sep= " ")
  write(varroainput11, file= paste(vpdir_input, "input", i, ".txt", sep=""), append= TRUE)
  varroainput12 <- paste(parameter12, inputvalue12, sep= " ")
  write(varroainput12, file= paste(vpdir_input, "input", i, ".txt", sep=""), append= TRUE)
  varroainput13 <- paste(parameter13, inputvalue13, sep= " ")
  write(varroainput13, file= paste(vpdir_input, "input", i, ".txt", sep=""), append= TRUE)
  varroainput14 <- paste(parameter14, inputvalue14, sep= " ")
  write(varroainput14, file= paste(vpdir_input, "input", i, ".txt", sep=""), append= TRUE)
  varroainput15 <- paste(parameter15, inputvalue15, sep= " ")
  write(varroainput15, file= paste(vpdir_input, "input", i, ".txt", sep=""), append= TRUE)
  varroainput16 <- paste(parameter16, inputvalue16, sep= " ")
  write(varroainput16, file= paste(vpdir_input, "input", i, ".txt", sep=""), append= TRUE)
}

#run everything
source(paste(vpdir,"01simulation_neonic.R",sep = ""))
source(paste(vpdir,"02sensitivity_analyses.R",sep = ""))
source(paste(vpdir,"03plotting_neonicR_generic.R",sep = ""))