
#Determine path directory ######


#windows
if(Sys.info()[4]=="DC2626UTPURUCKE"){
  vpdir_input<-path.expand("C:\\git\\Dropbox\\NeonicR\\input\\")
  vpdir_output<-path.expand("C:\\git\\Dropbox\\NeonicR\\output\\")
  #vpdir_exe<-path.expand("C:\\Program Files (x86)\\VarroaPop\\")
  vpdir_exe<-path.expand("C:\\git\\Dropbox\\NeonicR\\exe\\")
}

#marcia epa computer
if(Sys.info()[4]=="LZ2626UMSNYDE02"){
  vpdir<-path.expand("C:\\Users\\msnyde02\\varroapoptest2\\")
}

#system("C:\\Users\\msnyde02\\varroapoptest2\\VarroaPop.exe C:\\Users\\msnyde02\\varroapoptest2\\Default.vrp /b /or C:\\Users\\msnyde02\\varroapoptest2\\results7.txt /i C:\\Users\\msnyde02\\varroapoptest2\\queenvar.txt")

#carmen personal laptop

if(Sys.info()[4]=="Ashleys-MacBook-Pro.local"){
  vpdir<-path.expand("/git/beeRpop/")
  vpdir_input<-path.expand("/git/beeRpop/input/")
  vpdir_output<-path.expand("/git/beeRpop/output/")
  vpdir_exe<-path.expand("/git/beeRpop/exe/")
}
if(Sys.info()[4]=="ACKUAN-PC"){
  vpdir<-path.expand("C:\\gitrepo\\beeRpop\\")
  vpdir_input<-path.expand("C:\\gitrepo\\beeRpop\\input\\")
  vpdir_output<-path.expand("C:\\gitrepo\\beeRpop\\output\\")
  vpdir_exe<-path.expand("C:\\gitrepo\\beeRpop\\exe\\")
}

#library packages
library(plyr)
library(reshape2)
library(ggplot2)
library(grid)
library(gridExtra)

#create input files #########

queenstrength<- runif(1000, 1, 6) #ICQueenStrength
wkrdrnratio<- runif(1000, 1, 5) #RQWkrDrnRatio
drnmitesurvive<- runif(1000, 0, 100) #ICDroneMiteSurvivorship
wkrmitesurvive<- runif(1000, 0, 100) #ICWorkerMiteSurvivorship
fgrlifespan <- runif(1000, 4, 16) #ICForagerLifespan
immtype <- c("Polynomial", "Cosine", "Sine", "Exponential", "Tangent", "Logarithmic")
miteimmtype <- sample(immtype, size=1000, replace=T) #ImmType

#pesticide exposure
adslope<- runif(1000, 0, 3.4) #AIAdultSlope
adLD50<- runif(1000, 0, 3) #AIAdultLD50 (ug/bee)
adslopec<- runif(1000, 0, 3.93) #AIAdultSlopeContact
adLD50c<- runif(1000, 0, 0.05) #AIAdultLD50Contact (ug/bee)
lslope<- runif(1000, 0, 3.4) #AILarvaSlope
lLD50<- runif(1000, 0, 0.9) #AILarvaLD50 (ug/larva)
kow<- runif(1000, 2, 8) #AIKOW
koc<- runif(1000, 5, 30) #AIKOC
halflife<- runif(1000, 0, 14) #AIHalfLife (days)
apprate<- runif(1000, 0, 1) #EAppRate (lb/A)




for (i in 1:1000) {
  
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



#run simulations###########
#command to run simulations in varroapop with relative directory structure and write output files


for (i in 1:1000) {
  inputfile<- paste("input",i,".txt", sep="")
  outputfile<- paste("results",i,".txt", sep="")
  logfile<- paste("log",i,".txt", sep="")
  vpdir_command <- paste(vpdir_exe, "VarroaPop.exe ", vpdir_exe, "Default.vrp", 
                         " /b /or ", vpdir_output, outputfile, 
                         " /i ", vpdir_input, inputfile, " /ol ", vpdir_output, logfile, sep="")
  print(vpdir_command)
  system(vpdir_command)
}



# 3d array ######

tdarray <- array(data=NA,c(1827,26,1000))
dim(tdarray)
library(abind)

for (i in 1:1000) {
  df<- read.table(paste(vpdir_output,"results",i,".txt", sep=""), header= FALSE, sep= "", 
                  skip = 6, stringsAsFactors = FALSE, row.names=NULL)
  newarray <- df[,2:27]
  newarray2<- data.matrix(newarray)
  tdarray[1:1827,1:26,i] <- abind(newarray2[1:1827,1:26], along=3)
}
save(tdarray, file = paste(vpdir_output,"tdarray.RData", sep = ""))
#load("/git/beeRpop/output/tdarray.RData")


# data crunching #####

#colony persistence
cp <- rep(NA, 1827)
for (n in 1:1827){
  x <- which(tdarray[n,1,1:1000] > 1000) #queries colony size > 0 for 1000 simulations at each time point 
  cp[n] <- length(x)/1000 #appends vector x with proportion of simulations per time step with Col Size > 0
}

#foragers
fa <- rep(NA, 1827)
for (n in 1:1827){
  x <- which(tdarray[n,4,1:1000] > 0) #queries colony size > 0 for 1000 simulations at each time point 
  fa[n] <- length(x)/1000 #appends vector x with proportion of simulations per time step with Col Size > 0
}

#adult workers
aw <- rep(NA, 1827)
for (n in 1:1827){
  x <- which(tdarray[n,3,1:1000] > 0) #queries colony size > 0 for 1000 simulations at each time point 
  aw[n] <- length(x)/1000 #appends vector x with proportion of simulations per time step with Col Size > 0
}

#free mites
fm <- rep(NA, 1827)
for (n in 1:1827){
  x <- which(tdarray[n,11,1:1000] > 0) #queries colony size > 0 for 1000 simulations at each time point 
  fm[n] <- length(x)/1000 #appends vector x with proportion of simulations per time step with Col Size > 0
}

#dead foragers
dfr <- rep(NA, 1827)
for (n in 1:1827){
  x <- which(tdarray[n,1,1:1000] > 0) #queries colony size > 0 for 1000 simulations at each time point 
  dfr[n] <- length(x)/1000 #appends vector x with proportion of simulations per time step with Col Size > 0
}

#dead mites
dm <- rep(NA, 1827)
for (n in 1:1827){
  x <- which(tdarray[n,16,1:1000] > 0)
  dm[n] <- length(x)/1000
}

#capped drone brood
cdb <- rep(NA, 1827)
for (n in 1:1827){
  x <- which(tdarray[n, 5, 1:1000] > 0)
  cdb[n] <- length(x)/1000
}

#capped worker brood
cwb <- rep(NA, 1827)
for (n in 1:1827){
  x <- which(tdarray[n, 6, 1:1000] > 0)
  cwb[n] <- length(x)/1000
}


#stacking arrays for .csv file #####

now<- Sys.time()
now<- as.POSIXlt(now)
now<- format(now, "%Y%m%d%H%M", tz="")

library(plyr)
temparray <- tdarray[1:1827,resvar,1:1000]
tempdf<- adply(temparray[,1:3,],2, cbind) #colony size, adult workers, foragers
row.names(tempdf)<- make.names(as.character(rep(time,3)), unique = T)
write.csv(tempdf, file = paste(vpdir_output,"sim_results1_", now, ".csv", sep= ""))
tempdf2<- adply(temparray[,4:6,],2, cbind) #worker eggs, colony pollen, colony nectar
row.names(tempdf2)<- make.names(as.character(rep(time,3)), unique = T)
write.csv(tempdf2, file = paste(vpdir_output,"sim_results2_", now, ".csv", sep=""))



#SENSITIVITY ANALYSIS####

library(sensitivity)
#create input dataframes and arrays
d <- as.data.frame(cbind(drnmitesurvive, fgrlifespan, queenstrength, wkrdrnratio, wkrmitesurvive, adslopec, adLD50c, lslope, lLD50, kow, koc, halflife))
year<- c(183,549,914,1279,1644)
resvar<- c(1,3,4,10,18,20)
tdoutput <- tdarray[year,resvar,1:1000]
srctdarray<- array(data=NA, c(5,6,12), dimnames = list(c("1999","2000","2001","2002", "2003"),
                                                       c("Colony Size","Adult Workers", "Foragers", "Worker Eggs","Colony Pollen (g)", "Colony Nectar (g)"),
                                                       c("Drone-Mite Survivorship (%)", "Forager Lifespan (days)", "Queen Strength","Worker to Drone","Worker-Mite Survivorship (%)", "Adult Slope Contact", "Adult LD50 Contact", "Larva slope", "Larva LD50", "KOW","KOC","Half life")))
pcctdarray<- array(data=NA, c(5,6,12), dimnames = list(c("1999","2000","2001","2002", "2003"), 
                                                       c("Colony Size","Adult Workers", "Foragers", "Worker Eggs","Colony Pollen (g)", "Colony Nectar (g)"), 
                                                       c("Drone-Mite Survivorship (%)", "Forager Lifespan (days)", "Queen Strength","Worker to Drone","Worker-Mite Survivorship (%)", "Adult Slope Contact", "Adult LD50 Contact", "Larva slope", "Larva LD50", "KOW","KOC","Half life")))

#standard regression coefficients
for (i in 1:5){  #year
  for (j in 1:6){   #output variable
    for (k in 1:12){  #input variable
    tempinput<- tdoutput[i,j,1:1000]
    temp<- src(d, tempinput, rank = T)
    srctdarray[i,j,k]<- temp$SRRC[[1]][k]
    }
  }
}


#partial correlation coefficients
for (i in 1:5){  #year
  for (j in 1:6){   #output variable
    for (k in 1:12){  #input variable
      tempinput<- tdoutput[i,j,1:1000]
      temp<- pcc(d, tempinput, rank = T)
      pcctdarray[i,j,k]<- temp$PRCC[[1]][k]
    }
  }
}

srcoutput<- adply(srctdarray[,,],2, cbind)
row.names(srcoutput)<- make.names(rep(c("1999", "2000", "2001", "2002", "2003"), 6), unique = T)
write.csv(srcoutput, file = paste(vpdir_output, "srcoutput_", now, ".csv", sep=""))
pccoutput<- adply(pcctdarray[,,],2, cbind)
row.names(pccoutput)<- make.names(rep(c("1999", "2000", "2001", "2002", "2003"), 6), unique = T)
write.csv(pccoutput, file = paste(vpdir_output, "pccoutput_", now, ".csv", sep=""))




#plot crunching ###########

#separate and query QS values
qs1 <- which(queenstrength >=1 & queenstrength <2)
qs2 <- which(queenstrength >=2 & queenstrength <3)
qs3 <- which(queenstrength >=3 & queenstrength <4)
qs4 <- which(queenstrength >=4 & queenstrength <5)
qs5 <- which(queenstrength >=5 & queenstrength <6)

#list response variables to plot
inputparam<- list(drnmitesurvive, fgrlifespan, queenstrength, wkrdrnratio, wkrmitesurvive, adslopec, adLD50c, lslope, lLD50, kow, koc, halflife)
outvar<- c("Colony Size","Adult Workers", "Foragers", "Worker Eggs", "Colony Pollen (g)", "Colony Nectar")

time <- seq(as.Date("1998/12/31"), as.Date("2003/12/31"), by="days")


#create PDF
pdf(file= paste(vpdir_output, "graphics_output.pdf", sep=""), width = 8.5, height = 11, onefile = TRUE, paper = "USr")
#start figures
par(mfrow=c(5,5), mar=c(2,2,1,0.5), oma=c(4,2,2,2))

plot(time[1:366], cp[1:366], type="l", ylab = "P(Colony Size) > 0", main= "1999", ylim=c(0,1), xlab=NA)
plot(time[367:732], cp[367:732], type="l", main= "2000", ylim=c(0,1), ylab=NA, xlab=NA)
plot(time[733:1097], cp[733:1097], type="l", main= "2001", ylim=c(0,1), ylab=NA, xlab=NA)
plot(time[1098:1462], cp[1098:1462], type="l", main= "2002", ylim=c(0,1), ylab=NA, xlab=NA)
plot(time[1463:1827], cp[1463:1827], type="l", main= "2003", ylim=c(0,1), ylab=NA, xlab=NA)

plot(time[1:366], fa[1:366], type="l", ylab= "P(Foragers) > 0", ylim=c(0,1), xlab=NA) 
plot(time[367:732], fa[367:732], type="l", ylim=c(0,1), ylab=NA, xlab=NA)
plot(time[733:1097], fa[733:1097], type="l", ylim=c(0,1), ylab=NA, xlab=NA)
plot(time[1098:1462], fa[1098:1462], type="l", ylim=c(0,1), ylab=NA, xlab=NA)
plot(time[1463:1827], fa[1463:1827], type="l", ylim=c(0,1), ylab=NA, xlab=NA)

plot(time[1:366], aw[1:366], type="l", ylab= "P(Adult Workers) > 0", ylim=c(0,1), xlab=NA) 
plot(time[367:732], aw[367:732], type="l", ylim=c(0,1), ylab=NA, xlab=NA)
plot(time[733:1097], aw[733:1097], type="l", ylim=c(0,1), ylab=NA, xlab=NA)
plot(time[1098:1462], aw[1098:1462], type="l", ylim=c(0,1), ylab=NA, xlab=NA)
plot(time[1463:1827], aw[1463:1827], type="l", ylim=c(0,1), ylab=NA, xlab=NA)

plot(time[1:366], fm[1:366], type="l", ylab= "P(Free Mites) > 0", ylim=c(0,1), xlab=NA) 
plot(time[367:732], fm[367:732], type="l", ylim=c(0,1), ylab=NA, xlab=NA)
plot(time[733:1097], fm[733:1097], type="l", ylim=c(0,1), ylab=NA, xlab=NA)
plot(time[1098:1462], fm[1098:1462], type="l", ylim=c(0,1), ylab=NA, xlab=NA)
plot(time[1463:1827], fm[1463:1827], type="l", ylim=c(0,1), ylab=NA, xlab=NA)

plot(time[1:366], dfr[1:366], type="l", ylab= "P(Dead Foragers) > 0", ylim=c(0,1), xlab=NA) 
plot(time[367:732], dfr[367:732], type="l", ylim=c(0,1), ylab=NA, xlab=NA)
plot(time[733:1097], dfr[733:1097], type="l", ylim=c(0,1), ylab=NA, xlab=NA)
plot(time[1098:1462], dfr[1098:1462], type="l", ylim=c(0,1), ylab=NA, xlab=NA)
plot(time[1463:1827], dfr[1463:1827], type="l", ylim=c(0,1), ylab=NA, xlab=NA)

mtext(text = paste("Fig. 1 Proportion of 1000 simulations with values greater than zero"), side = 1, line = 1, outer = T)

  
for (i in inputparam){      #margin labels
  
    par(mfrow=c(6,5), mar=c(2, 2, 1.5, 0.5), oma= c(4,2,2,7))
    
    if (i == drnmitesurvive)
      { x = "Drone-Mite Survivorship (%)"
        n = 2}
    if (i == fgrlifespan)
      { x = "Forager Lifespan (days)"
        n = 3}
    if (i == queenstrength)
      { x = "Queen Strength"
        n = 4}
    if (i == wkrdrnratio)
      { x = "Worker:Drone"
        n = 5}
    if (i == wkrmitesurvive)
      { x = "Worker-Mite Survivorship (%)"
        n = 6}
    if (i == adslopec)
      { x = "Adult Slope Contact"
        n = 7}
    if (i == adLD50c)
      { x = "Adult LD50 Contact"
        n = 8}
    if (i == lslope)
      { x = "Larva Slope"
        n = 9}
    if (i == lLD50)
      { x = "Larva LD50"
        n = 10}
    if (i == kow)
      { x = "KOW"
        n = 11}
    if (i == koc) 
      { x = "KOC"
        n = 12}
    if (i == halflife) 
      { x = "Half Life"
        n = 13}
  
  #COLONY SIZE
    plot(i, tdarray[122, 1, 1:1000], type="p", pch=20, main= "May 1999", ylab= "Colony Size", ylim=c(0,80000), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=T, tick= T, ylab= "Colony Size")
    points(i[qs1],tdarray[122,1, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[122,1, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[122,1, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[122,1, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[122,1, qs5], type="p", col=5, pch=20)
  lofit<- loess(tdarray[122,1,1:1000]~i)        #loess line
  j<- order(i)
  lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
    text(x = min(i), y = 80000, labels = paste("pcc=", signif(pcctdarray[1, 1, n-1], 3), "\n src=", signif(srctdarray[1,1,n-1], 3), sep = ""), cex = 0.75, adj= c(0,1))
 
    plot(i, tdarray[153, 1, 1:1000], type="p", pch=20, main= "June 1999", ylab= NA, ylim=c(0,80000), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick= T)
    points(i[qs1],tdarray[153,1, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[153,1, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[153,1, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[153,1, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[153,1, qs5], type="p", col=5, pch=20)
  lofit<- loess(tdarray[153,1,1:1000]~i)
  j<- order(i)
  lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
  text(x = min(i), y = 80000, labels = paste("pcc=", signif(pcctdarray[2, 1, n-1], 3), "\n src=", signif(srctdarray[1,1,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
  
  
    plot(i, tdarray[183, 1, 1:1000], type="p", pch=20, main= "July 1999", ylab= NA, ylim=c(0,80000), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick= T)
    points(i[qs1],tdarray[183,1, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[183,1, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[183,1, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[183,1, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[183,1, qs5], type="p", col=5, pch=20)
  lofit<- loess(tdarray[183,1,1:1000]~i)
  j<- order(i)
  lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
  text(x = min(i), y = 80000, labels = paste("pcc=", signif(pcctdarray[3, 1, n-1],3), "\n src=", signif(srctdarray[1,1,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
  
    
    plot(i, tdarray[214, 1, 1:1000], type="p", pch=20, main= "Aug 1999", ylab= NA, ylim=c(0,80000), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick= T)
    points(i[qs1],tdarray[214,1, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[214,1, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[214,1, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[214,1, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[214,1, qs5], type="p", col=5, pch=20)
  lofit<- loess(tdarray[214,1,1:1000]~i)
  j<- order(i)
  lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
  text(x = min(i), y = 80000, labels = paste("pcc=", signif(pcctdarray[4, 1, n-1],3), "\n src=", signif(srctdarray[1,1,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
  
      
    plot(i, tdarray[245, 1, 1:1000], type="p", pch=20, main= "Sept 1999", ylab= NA, ylim=c(0,80000), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)  
    axis(2, labels= F, tick= T)
    points(i[qs1],tdarray[245,1, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[245,1, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[245,1, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[245,1, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[245,1, qs5], type="p", col=5, pch=20)
  lofit<- loess(tdarray[245,1,1:1000]~i)
  j<- order(i)
  lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
  text(x = min(i), y = 80000, labels = paste("pcc=", signif(pcctdarray[5, 1, n-1],3), "\n src=", signif(srctdarray[1,1,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
  
    
    
  #ADULT WORKERS
    plot(i, tdarray[122, 3, 1:1000], type="p", pch=20,  ylab="Adult Workers", ylim=c(0,60000), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=T, tick=T, ylab= "Adult Workers")
    points(i[qs1],tdarray[122,3, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[122,3, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[122,3, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[122,3, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[122,3, qs5], type="p", col=5, pch=20)
  lofit<- loess(tdarray[122,3,1:1000]~i)
  j<- order(i)
  lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
  text(x = min(i), y = 60000, labels = paste("pcc=", signif(pcctdarray[1, 2, n-1],3), "\n src=", signif(srctdarray[1,1,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
  
    
    plot(i, tdarray[153, 3, 1:1000], type="p", pch=20, ylab= NA, ylim=c(0,60000), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[153,3, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[153,3, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[153,3, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[153,3, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[153,3, qs5], type="p", col=5, pch=20)
  lofit<- loess(tdarray[153,3,1:1000]~i)
  j<- order(i)
  lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
  text(x = min(i), y = 60000, labels = paste("pcc=", signif(pcctdarray[2, 2, n-1],3), "\n src=", signif(srctdarray[1,1,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
  
  
    plot(i, tdarray[183, 3, 1:1000], type="p", pch=20, ylab= NA, ylim=c(0,60000), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[183,3, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[183,3, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[183,3, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[183,3, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[183,3, qs5], type="p", col=5, pch=20)
  lofit<- loess(tdarray[183,3,1:1000]~i)
  j<- order(i)
  lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
  text(x = min(i), y = 60000, labels = paste("pcc=", signif(pcctdarray[3, 2, n-1],3), "\n src=", signif(srctdarray[1,1,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
  
  
    plot(i, tdarray[214, 3, 1:1000], type="p", pch=20, ylab= NA, ylim=c(0,60000), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[214,3, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[214,3, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[214,3, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[214,3, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[214,3, qs5], type="p", col=5, pch=20)
  lofit<- loess(tdarray[214,3,1:1000]~i)
  j<- order(i)
  lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
  text(x = min(i), y = 60000, labels = paste("pcc=", signif(pcctdarray[4, 2, n-1],3), "\n src=", signif(srctdarray[1,1,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
  
  
    plot(i, tdarray[245, 3, 1:1000], type="p", pch=20, ylab= NA, ylim=c(0,60000), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[245,3, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[245,3, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[245,3, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[245,3, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[245,3, qs5], type="p", col=5, pch=20)
  lofit<- loess(tdarray[245,3,1:1000]~i)
  j<- order(i)
  lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
  text(x = min(i), y = 60000, labels = paste("pcc=", signif(pcctdarray[5, 2, n-1],3), "\n src=", signif(srctdarray[1,1,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
  
  
  
  
  #FORAGERS
    plot(i, tdarray[122, 4, 1:1000], type="p", pch=20, ylab= "Foragers", ylim=c(0,40000), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=T, tick=T, ylab= "Foragers")
    points(i[qs1],tdarray[122,4, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[122,4, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[122,4, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[122,4, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[122,4, qs5], type="p", col=5, pch=20)
  lofit<- loess(tdarray[122,4,1:1000]~i)
  j<- order(i)
  lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
  text(x = min(i), y = 40000, labels = paste("pcc=", signif(pcctdarray[1, 3, n-1], 3), "\n src=", signif(srctdarray[1,1,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
  
    
    plot(i, tdarray[153, 4, 1:1000], type="p", pch=20, ylim=c(0,40000), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[153,4, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[153,4, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[153,4, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[153,4, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[153,4, qs5], type="p", col=5, pch=20)
  lofit<- loess(tdarray[53,4,1:1000]~i)
  j<- order(i)
  lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
  text(x = min(i), y = 40000, labels = paste("pcc=", signif(pcctdarray[2, 3, n-1],3), "\n src=", signif(srctdarray[1,1,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
  
  
    plot(i, tdarray[183, 4, 1:1000], type="p", pch=20, ylim=c(0,40000), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[183,4, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[183,4, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[183,4, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[183,4, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[183,4, qs5], type="p", col=5, pch=20)
  lofit<- loess(tdarray[183,4,1:1000]~i)
  j<- order(i)
  lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
  text(x = min(i), y = 40000, labels = paste("pcc=", signif(pcctdarray[3, 3, n-1],3), "\n src=", signif(srctdarray[1,1,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
  
    
    plot(i, tdarray[214, 4, 1:1000], type="p", pch=20, ylim=c(0,40000), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[214,4, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[214,4, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[214,4, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[214,4, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[214,4, qs5], type="p", col=5, pch=20)
  lofit<- loess(tdarray[214,4,1:1000]~i)
  j<- order(i)
  lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
  text(x = min(i), y = 40000, labels = paste("pcc=", signif(pcctdarray[4, 3, n-1],3), "\n src=", signif(srctdarray[1,1,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
  
    
    plot(i, tdarray[245, 4, 1:1000], type="p", pch=20, ylim=c(0,40000), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)  
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[245,4, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[245,4, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[245,4, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[245,4, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[245,4, qs5], type="p", col=5, pch=20)
  lofit<- loess(tdarray[245,4,1:1000]~i)
  j<- order(i)
  lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
  text(x = min(i), y = 40000, labels = paste("pcc=", signif(pcctdarray[5, 3, n-1],3), "\n src=", signif(srctdarray[1,1,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
  
  
    
    
  #WORKER EGGS
    plot(i, tdarray[122, 10, 1:1000], type="p", pch=20, ylab="Worker Eggs", ylim=c(0,8000), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=T, tick=T, ylab= "Worker Eggs")
    points(i[qs1],tdarray[122,10, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[122,10, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[122,10, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[122,10, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[122,10, qs5], type="p", col=5, pch=20)
  lofit<- loess(tdarray[122,10,1:1000]~i)
  j<- order(i)
  lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
  text(x = min(i), y = 8000, labels = paste("pcc=", signif(pcctdarray[1, 4, n-1],3), "\n src=", signif(srctdarray[1,1,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
  
  
    plot(i, tdarray[153, 10, 1:1000], type="p", pch=20, ylim=c(0,8000), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[153,10, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[153,10, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[153,10, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[153,10, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[153,10, qs5], type="p", col=5, pch=20)
  lofit<- loess(tdarray[153,10,1:1000]~i)
  j<- order(i)
  lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
  text(x = min(i), y = 8000, labels = paste("pcc=", signif(pcctdarray[2, 4, n-1],3), "\n src=", signif(srctdarray[1,1,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
  
    
    plot(i, tdarray[183, 10, 1:1000], type="p", pch=20, ylim=c(0,8000), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[183,10, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[183,10, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[183,10, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[183,10, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[183,10, qs5], type="p", col=5, pch=20)
  lofit<- loess(tdarray[183,10,1:1000]~i)
  j<- order(i)
  lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
  text(x = min(i), y = 8000, labels = paste("pcc=", signif(pcctdarray[3, 4, n-1],3), "\n src=", signif(srctdarray[1,1,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
  
  
    plot(i, tdarray[214, 10, 1:1000], type="p", pch=20, ylim=c(0,8000), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[214,10, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[214,10, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[214,10, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[214,10, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[214,10, qs5], type="p", col=5, pch=20)
  lofit<- loess(tdarray[214,10,1:1000]~i)
  j<- order(i)
  lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
  text(x = min(i), y = 8000, labels = paste("pcc=", signif(pcctdarray[4, 4, n-1],3), "\n src=", signif(srctdarray[1,1,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
  
    
    plot(i, tdarray[245, 10, 1:1000], type="p", pch=20, ylim=c(0,8000), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[245,10, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[245,10, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[245,10, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[245,10, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[245,10, qs5], type="p", col=5, pch=20)
  lofit<- loess(tdarray[245,10,1:1000]~i)
  j<- order(i)
  lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
  text(x = min(i), y = 8000, labels = paste("pcc=", signif(pcctdarray[5, 4, n-1],3), "\n src=", signif(srctdarray[1,1,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
  
  
  
   
  #COLONY POLLEN
    plot(i, tdarray[122, 18, 1:1000], type="p", pch=20, ylab= "Colony Pollen (g)", ylim=c(0,10), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=T, tick=T, ylab= "Colony Pollen (g)")
    points(i[qs1],tdarray[122,18, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[122,18, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[122,18, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[122,18, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[122,18, qs5], type="p", col=5, pch=20)
  lofit<- loess(tdarray[122,18,1:1000]~i)
  j<- order(i)
  lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
  text(x = min(i), y = 10, labels = paste("pcc=", signif(pcctdarray[1, 5, n-1],3), "\n src=", signif(srctdarray[1,1,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
  
  
    plot(i, tdarray[153, 18, 1:1000], type="p", pch=20, ylim=c(0,10), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[153,18, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[153,18, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[153,18, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[153,18, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[153,18, qs5], type="p", col=3, pch=20)
  lofit<- loess(tdarray[153,18,1:1000]~i)
  j<- order(i)
  lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
  text(x = min(i), y = 10, labels = paste("pcc=", signif(pcctdarray[2, 5, n-1],3), "\n src=", signif(srctdarray[1,1,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
  
  
    plot(i, tdarray[183, 18, 1:1000], type="p", pch=20, ylim=c(0,10), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[183,18, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[183,18, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[183,18, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[183,18, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[183,18, qs5], type="p", col=5, pch=20)
  lofit<- loess(tdarray[183,18,1:1000]~i)
  j<- order(i)
  lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
  text(x = min(i), y = 10, labels = paste("pcc=", signif(pcctdarray[3, 5, n-1],3), "\n src=", signif(srctdarray[1,1,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
  
    
    plot(i, tdarray[214, 18, 1:1000], type="p", pch=20, ylim=c(0,10), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[214,18, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[214,18, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[214,18, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[214,18, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[214,18, qs5], type="p", col=5, pch=20)
  lofit<- loess(tdarray[214,18,1:1000]~i)
  j<- order(i)
  lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
  text(x = min(i), y = 10, labels = paste("pcc=", signif(pcctdarray[4, 5, n-1],3), "\n src=", signif(srctdarray[1,1,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
  
   
    plot(i, tdarray[245, 18, 1:1000], type="p", pch=20, ylim=c(0,10), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[245,18, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[245,18, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[245,18, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[245,18, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[245,18, qs5], type="p", col=5, pch=20)
  lofit<- loess(tdarray[245,18,1:1000]~i)
  j<- order(i)
  lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
  text(x = min(i), y = 10, labels = paste("pcc=", signif(pcctdarray[5, 5, n-1],3), "\n src=", signif(srctdarray[1,1,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
  
    
    
  
  #COLONY NECTAR
    plot(i, tdarray[122, 20, 1:1000], type="p", pch=20, ylab= "Colony Nectar", ylim=c(0,400), 
         xlab= x)
    axis(1, labels=F, tick=T)
    axis(2, labels=T, tick=T, ylab= "Colony Nectar")
    points(i[qs1],tdarray[122,20, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[122,20, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[122,20, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[122,20, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[122,20, qs5], type="p", col=5, pch=20)
  lofit<- loess(tdarray[122,20,1:1000]~i)
  j<- order(i)
  lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
  text(x = min(i), y = 400, labels = paste("pcc=", signif(pcctdarray[1, 6, n-1],3), "\n src=", signif(srctdarray[1,1,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
  
  
    plot(i, tdarray[153, 20, 1:1000], type="p", pch=20, ylim=c(0,400), ylab= NA, 
         xlab= x)
    axis(1, labels=F, tick=T)  
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[153,20, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[153,20, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[153,20, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[153,20, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[153,20, qs5], type="p", col=5, pch=20)
  lofit<- loess(tdarray[153,20,1:1000]~i)
  j<- order(i)
  lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
  text(x = min(i), y = max(tdarray[year,20,1:1000]), labels = paste("pcc=", signif(pcctdarray[2, 6, n-1],3), "\n src=", signif(srctdarray[1,1,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
  
  
    plot(i, tdarray[183, 20, 1:1000], type="p", pch=20, ylim=c(0,400), ylab= NA, 
         xlab= x)
    axis(1, labels=F, tick=T)  
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[183,20, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[183,20, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[183,20, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[183,20, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[183,20, qs5], type="p", col=5, pch=20)
  lofit<- loess(tdarray[183,20,1:1000]~i)
  j<- order(i)
  lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
  text(x = min(i), y = 400, labels = paste("pcc=", signif(pcctdarray[3, 6, n-1],3), "\n src=", signif(srctdarray[1,1,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
  
  
    plot(i, tdarray[214, 20, 1:1000], type="p", pch=20, ylim=c(0,400), ylab= NA, 
         xlab= x)
    axis(1, labels=F, tick=T)  
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[214,20, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[214,20, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[214,20, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[214,20, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[214,20, qs5], type="p", col=5, pch=20)
  lofit<- loess(tdarray[214,20,1:1000]~i)
  j<- order(i)
  lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
  text(x = min(i), y = 400, labels = paste("pcc=", signif(pcctdarray[4, 6, n-1],3), "\n src=", signif(srctdarray[1,1,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
  
  
    plot(i, tdarray[245, 20, 1:1000], type="p", pch=20, ylim=c(0,400), ylab= NA, 
         xlab= x)
    axis(1, labels=F, tick=T)  
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[245,20, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[245,20, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[245,20, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[245,20, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[245,20, qs5], type="p", col=5, pch=20)
  lofit<- loess(tdarray[245,20,1:1000]~i)
  j<- order(i)
  lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
  text(x = min(i), y = 400, labels = paste("pcc=", signif(pcctdarray[5, 6, n-1],3), "\n src=", signif(srctdarray[1,1,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
  
  
  
  #add legend and marginal text  
 
  par(mfrow=c(1,1), oma= c(6,4,1,4), new= TRUE, xpd=NA)
  plot(0:1,0:1, type="n", xlab=NA, ylab=NA, axes=FALSE)
  legend("topright",inset=c(-0.15,0), xpd=NA, legend=c("qs1", "qs2", "qs3", "qs4", "qs5"), fill=c(1:5),
           title= "Queen Strength", cex=0.65, bty="n")
  mtext(text = paste("Fig.",n, "Scatterplots of response variables vs.",x,"input values for 1000 simulations", sep= " "), side = 1, outer = T, line = 5)    
  }



#time series plotting #######
temparray <- tdarray[1:1827,resvar,1:1000]
dimnames(temparray)<- list(c(as.character(time)), c(outvar))
tempout<- array(data=NA, c(1827,6,3), dimnames = list(c(as.character(time)), 
                                                      c("Colony Size","Adult Workers", "Foragers", "Worker Eggs", "Colony Pollen (g)","Colony Nectar"), 
                                                      c("25%","50%","75%")))
for (r in 1:6){
  for (t in 1:1827){
    p<- quantile(temparray[t, r, 1:1000])
    for (s in 1:3){
      quant<- c(p[[2]], p[[3]], p[[4]])
      tempout[t,r,s]<- quant[s]
    }
  }
}


#time series plots
par(mfrow=c(6,5), mar=c(1.5, 4, 2, 0.5), oma= c(4,2,2,7))

for (r in 1:6){
  plot(time[1:366], tempout[1:366,r,2], type = "l", ylim = c(0,max(tempout[1:366,r,3])), ylab= paste(outvar[r]), xlab = NA, main= "1999")
  lines(time[1:366],tempout[1:366,r,1], type = "l", lty= 2, col = "red")
  lines(time[1:366], tempout[1:366,r,3], type = "l", lty=4, col = "blue")
  
  plot(time[367:732], tempout[367:732,r,2], type = "l", ylim = c(0,max(tempout[1:366,r,3])), ylab= paste(outvar[r]), xlab = NA, main = "2000")
  lines(time[367:732],tempout[367:732,r,1], type = "l", lty= 2, col = "red")
  lines(time[367:732], tempout[367:732,r,3], type = "l", lty=4, col = "blue")
  
  plot(time[733:1097], tempout[733:1097,r,2], type = "l", ylim = c(0,max(tempout[1:366,r,3])), ylab= paste(outvar[r]), xlab = NA, main = "2001")
  lines(time[733:1097],tempout[733:1097,r,1], type = "l", lty= 2, col = "red")
  lines(time[733:1097], tempout[733:1097,r,3], type = "l", lty=4, col = "blue")
  
  plot(time[1098:1462], tempout[1098:1462,r,2], type = "l", ylim = c(0,max(tempout[1:366,r,3])), ylab= paste(outvar[r]), xlab = NA, main = "2002")
  lines(time[1098:1462],tempout[1098:1462,r,1], type = "l", lty= 2, col = "red")
  lines(time[1098:1462], tempout[1098:1462,r,3], type = "l",lty=4, col = "blue")
  
  plot(time[1463:1827], tempout[1463:1827,r,2], type = "l", ylim = c(0,max(tempout[1:366,r,3])), ylab= paste(outvar[r]), xlab = NA, main = "2003")
  lines(time[1463:1827],tempout[1463:1827,r,1], type = "l", lty= 2, col = "red")
  lines(time[1463:1827], tempout[1463:1827,r,3], type = "l",lty=4, col = "blue")
}


#tornado plots
library(reshape2)
invar<- c("Drone-Mite Survivorship", "Forager Lifespan", "Queen Strength", "Worker:Drone","Worker-Mite Survivorship", "Adult Slope Contact","Adult LD50 Contact", "Larva Slope", "Larva LD50","KOW","KOC","Half Life")
datsrc<- list()
datpcc<- list()

for (i in 1:5) {
  dfsrc<- mdply(srctdarray[i,1:6,1:12], cbind)
  tdfsrc<- t(dfsrc)
  colnames(tdfsrc)<- outvar
  s<- melt(tdfsrc)
  datsrc[[i]]<- s
}


for (i in 1:5){
  dfpcc<- mdply(pcctdarray[i,1:6,1:12], cbind)
  tdfpcc<- t(dfpcc)
  colnames(tdfpcc)<- outvar
  p<- melt(tdfpcc)
  datpcc[[i]]<- p
}

grid.newpage()
pushViewport(viewport(layout=grid.layout(5,1), gp= gpar(cex = 0.6)))
library(gridExtra)
#start figures
for (i in 1:5) { #loops by year
  aa<- ggplot(data=datsrc[[i]], aes(x= datsrc[[i]][[1]], y= datsrc[[i]][[3]])) + 
    geom_bar(stat="identity", position = "identity") +
    scale_y_continuous(limits= c(-1,1)) +
    coord_flip() +
    labs(title= paste("Year", i, sep=" "), x=" ", y= "Standardized Regression Coefficient") +
    facet_grid(. ~ Var2) +
    theme_bw()
  print(aa, vp= viewport(layout.pos.row= i, layout.pos.col= 1), newpage= F)
}

grid.newpage()
pushViewport(viewport(layout=grid.layout(5,1), gp= gpar(cex = 0.6)))
for (i in 1:5) { #loops by year
  bb<- ggplot(data=datpcc[[i]], aes(x= datpcc[[i]][[1]], y= datpcc[[i]][[3]])) + 
    geom_bar(stat="identity", position = "identity") +
    scale_y_continuous(limits= c(-1,1)) +
    coord_flip() +
    labs(title= paste("Year", i, sep = " "), x=" ", y= "Partial Correlation Coefficient") +
    facet_grid(. ~ Var2) +
    theme_bw()
  print(bb, vp= viewport(layout.pos.row= i, layout.pos.col= 1), newpage= F)
}


dev.off()
