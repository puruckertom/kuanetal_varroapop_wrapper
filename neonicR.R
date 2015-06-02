
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

if(Sys.info()[4]=="ACKUAN-PC"){
  vpdir<-path.expand("C:\\gitrepo\\beeRpop\\")
}


#create input files #########

queenstrength<- runif(1000, 1, 6) #ICQueenStrength
wkrdrnratio<- runif(1000, 1, 5) #RQWkrDrnRatio
drnmitesurvive<- runif(1000, 0, 100) #ICDroneMiteSurvivorship
wkrmitesurvive<- runif(1000, 0, 100) #ICWorkerMiteSurvivorship
miteimm <- c("TRUE","FALSE") #ImmEnabled
miteimmigration <- sample(miteimm, size= 1000, replace=T) 
fgrlifespan <- runif(1000, 4, 16) #ICForagerLifespan
immtype <- c("Polynomial", "Cosine", "Sine", "Exponential", "Tangent", "Logarithmic")
miteimmtype <- sample(immtype, size=1000, replace=T) #ImmType

#pesticide exposure
adslope<- runif(1000, 0, 10) #AIAdultSlope
adLD50<- runif(1000, 0, 1) #AIAdultLD50 (ug/bee)
adslopec<- runif(1000, 0, 10) #AIAdultSlopeContact
adLD50c<- runif(1000, 0, 0.2) #AIAdultLD50Contact (ug/bee)
lslope<- runif(1000, 0, 10) #AILarvaSlope
lLD50<- runif(1000, 0, 2) #AILarvaLD50 (ug/larva)
kow<- runif(1000, 0, 100) #AIKOW
koc<- runif(1000, 0, 100) #AIKOC
halflife<- runif(1000, 0, 14) #AIHalfLife (days)
apprate<- runif(1000, 0, 2) #EAppRate (lb/A)




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
  write(varroainput, file = paste(vpdir,"input\\", "input",i,".txt", sep = ""), append = FALSE)
  varroainput2 <- paste(parameter2,inputvalue2, sep=" ")
  write(varroainput2, file = paste(vpdir,"input\\", "input",i,".txt", sep = ""), append = TRUE)
  varroainput3 <- paste(parameter3, inputvalue3, sep=" ")
  write(varroainput3, file = paste(vpdir,"input\\", "input", i, ".txt", sep=""), append= TRUE)
  varroainput4 <- paste(parameter4, inputvalue4, sep=" ")
  write(varroainput4, file= paste(vpdir,"input\\", "input", i, ".txt", sep=""), append= TRUE)
  varroainput5 <- paste(parameter5, inputvalue5, sep= " ")
  write(varroainput5, file= paste(vpdir,"input\\", "input", i, ".txt", sep=""), append= TRUE)
  varroainput6 <- paste(parameter6, inputvalue6, sep= " ")
  write(varroainput6, file= paste(vpdir,"input\\", "input", i, ".txt", sep=""), append= TRUE)
  varroainput7 <- paste(parameter7, inputvalue7, sep= " ")
  write(varroainput7, file= paste(vpdir,"input\\", "input", i, ".txt", sep=""), append= TRUE)
  varroainput8 <- paste(parameter8, inputvalue8, sep= " ")
  write(varroainput8, file= paste(vpdir,"input\\", "input", i, ".txt", sep=""), append= TRUE)
  varroainput9 <- paste(parameter9, inputvalue9, sep= " ")
  write(varroainput9, file= paste(vpdir,"input\\", "input", i, ".txt", sep=""), append= TRUE)
  varroainput10 <- paste(parameter10, inputvalue10, sep= " ")
  write(varroainput10, file= paste(vpdir,"input\\", "input", i, ".txt", sep=""), append= TRUE)
  varroainput11 <- paste(parameter11, inputvalue11, sep= " ")
  write(varroainput11, file= paste(vpdir,"input\\", "input", i, ".txt", sep=""), append= TRUE)
  varroainput12 <- paste(parameter12, inputvalue12, sep= " ")
  write(varroainput12, file= paste(vpdir,"input\\", "input", i, ".txt", sep=""), append= TRUE)
  varroainput13 <- paste(parameter13, inputvalue13, sep= " ")
  write(varroainput13, file= paste(vpdir,"input\\", "input", i, ".txt", sep=""), append= TRUE)
  varroainput14 <- paste(parameter14, inputvalue14, sep= " ")
  write(varroainput14, file= paste(vpdir,"input\\", "input", i, ".txt", sep=""), append= TRUE)
  varroainput15 <- paste(parameter15, inputvalue15, sep= " ")
  write(varroainput15, file= paste(vpdir,"input\\", "input", i, ".txt", sep=""), append= TRUE)
  varroainput16 <- paste(parameter16, inputvalue16, sep= " ")
  write(varroainput16, file= paste(vpdir,"input\\", "input", i, ".txt", sep=""), append= TRUE)
}



#run simulations###########
#command to run simulations in varroapop with relative directory structure and write output files


for (i in 1:1000) {
  inputfile<- paste("input",i,".txt", sep="")
  outputfile<- paste("results",i,".txt", sep="")
  vpdir_command <- paste(vpdir, "exe\\", "VarroaPop.exe ", vpdir, "exe\\", "Default.vrp", 
                         " /b /or ", vpdir, "output\\", outputfile, 
                         " /i ", vpdir, "input\\", inputfile, sep="")
  print(vpdir_command)
  system(vpdir_command)
}



# 3d array ######
#create a three dimension array that is 1827,26,1000

tdarray <- array(data=NA,c(1827,26,1000))
dim(tdarray)
library(abind)

for (i in 1:1000) {
  df<- read.table(paste(vpdir, "output\\","results",i,".txt", sep=""), header= FALSE, sep= "", 
                  skip = 6, stringsAsFactors = FALSE, row.names=NULL)
  newarray <- df[,2:27]
  newarray2<- data.matrix(newarray)
  tdarray[1:1827,1:26,i] <- abind(newarray2[1:1827,1:26], along=3)
}




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




#SENSITIVITY ANALYSIS

#create input dataframes and arrays
d <- as.data.frame(cbind(drnmitesurvive, fgrlifespan, queenstrength, wkrdrnratio, wkrmitesurvive))
year<- c(122, 153, 183, 214, 245)
resvar<- c(1,3,4,10,18,20)
tdoutput <- tdarray[year,resvar,1:1000]
srctdarray<- array(data=NA, c(5,6,5), dimnames = list(c("1999","2000","2001","2002","2003"),
                                                      c("Colony Size","Adult Workers", "Foragers", "Worker Eggs","Colony Pollen (g)", "Colony Nectar (g)"),
                                                      c("Drone-Mite Survivorship (%)", "Forager Lifespan (days)", "Queen Strength","Worker to Drone","Worker-Mite Survivorship (%)")))
pcctdarray<- array(data=NA, c(5,6,5), dimnames = list(c("1999","2000","2001","2002","2003"),
                                                      c("Colony Size","Adult Workers", "Foragers", "Worker Eggs","Colony Pollen (g)", "Colony Nectar (g)"),
                                                      c("Drone-Mite Survivorship (%)", "Forager Lifespan (days)", "Queen Strength","Worker to Drone","Worker-Mite Survivorship (%)")))

#standard regression coefficients
for (i in 1:5){  #year
  for (j in 1:6){   #output variable
    for (k in 1:5){  #input variable
    tempinput<- tdoutput[i,j,1:1000]
    temp<- src(d, tempinput)
    srctdarray[i,j,k]<- temp$SRC[[1]][k]
    }
  }
}


#partial correlation coefficients
for (i in 1:5){  #year
  for (j in 1:6){   #output variable
    for (k in 1:5){  #input variable
      tempinput<- tdoutput[i,j,1:1000]
      temp<- pcc(d, tempinput)
      pcctdarray[i,j,k]<- temp$PCC[[1]][k]
    }
  }
}





#plot crunching ###########

#separate and query QS values
qs1 <- which(queenstrength >=1 & queenstrength <2)
qs2 <- which(queenstrength >=2 & queenstrength <3)
qs3 <- which(queenstrength >=3 & queenstrength <4)
qs4 <- which(queenstrength >=4 & queenstrength <5)
qs5 <- which(queenstrength >=5 & queenstrength <6)

#list response variables to plot
inputparam<- list(drnmitesurvive, fgrlifespan, queenstrength, wkrdrnratio, wkrmitesurvive)

time <- as.Date(df[,1], "%m / %d / %y")


#create PDF

pdf(file= paste(vpdir, "output\\", "graphics_output.pdf", sep=""), width = 8, height = 11, onefile = TRUE, paper = "letter")


#start figures
par(mfrow=c(5,5), mar=c(2,2,1,0.5), oma=c(4,4,2,2))

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

mtext(text = paste("Fig. 1 Proportion of 1000 simulations with values greater than zero during 1999"), side = 1, line = 1, outer = T)

  
  for (i in inputparam){
  
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
  
  #COLONY SIZE
    plot(i, tdarray[122, 1, 1:1000], type="p", pch=20, main= "May 1999", ylab= "Colony Size", ylim=c(0,71000), xaxt='n', xlab=NA)
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
 
    plot(i, tdarray[153, 1, 1:1000], type="p", pch=20, main= "June 1999", ylab= NA, ylim=c(0,71000), xaxt='n', xlab=NA)
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
  
    plot(i, tdarray[183, 1, 1:1000], type="p", pch=20, main= "July 1999", ylab= NA, ylim=c(0,71000), xaxt='n', xlab=NA)
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
    
    plot(i, tdarray[214, 1, 1:1000], type="p", pch=20, main= "Aug 1999", ylab= NA, ylim=c(0,71000), xaxt='n', xlab=NA)
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
      
    plot(i, tdarray[245, 1, 1:1000], type="p", pch=20, main= "Sept 1999", ylab= NA, ylim=c(0,71000), xaxt='n', xlab=NA)
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
    
    
  #ADULT WORKERS
    plot(i, tdarray[122, 3, 1:1000], type="p", pch=20,  ylab="Adult Workers", ylim=c(0,45000), xaxt='n', xlab=NA)
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
    
    plot(i, tdarray[153, 3, 1:1000], type="p", pch=20, ylab= NA, ylim=c(0,45000), xaxt='n', xlab=NA)
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
  
    plot(i, tdarray[183, 3, 1:1000], type="p", pch=20, ylab= NA, ylim=c(0,45000), xaxt='n', xlab=NA)
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
  
    plot(i, tdarray[214, 3, 1:1000], type="p", pch=20, ylab= NA, ylim=c(0,45000), xaxt='n', xlab=NA)
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
  
    plot(i, tdarray[245, 3, 1:1000], type="p", pch=20, ylab= NA, ylim=c(0,45000), xaxt='n', xlab=NA)
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
  
  
  
  #FORAGERS
    plot(i, tdarray[122, 4, 1:1000], type="p", pch=20, ylab= "Foragers", ylim=c(0,30000), xaxt='n', xlab=NA)
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
    
    plot(i, tdarray[153, 4, 1:1000], type="p", pch=20, ylim=c(0,30000), ylab= NA, xaxt='n', xlab=NA)
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
  
    plot(i, tdarray[183, 4, 1:1000], type="p", pch=20, ylim=c(0,30000), ylab= NA, xaxt='n', xlab=NA)
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
    
    plot(i, tdarray[214, 4, 1:1000], type="p", pch=20, ylim=c(0,30000), ylab= NA, xaxt='n', xlab=NA)
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
    
    plot(i, tdarray[245, 4, 1:1000], type="p", pch=20, ylim=c(0,30000), ylab= NA, xaxt='n', xlab=NA)
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
  
  
   
  #COLONY POLLEN
    plot(i, tdarray[122, 18, 1:1000], type="p", pch=20, ylab= "Colony Pollen (g)", ylim=c(0,5), xaxt='n', xlab=NA)
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
  
    plot(i, tdarray[153, 18, 1:1000], type="p", pch=20, ylim=c(0,5), ylab= NA, xaxt='n', xlab=NA)
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
  
    plot(i, tdarray[183, 18, 1:1000], type="p", pch=20, ylim=c(0,5), ylab= NA, xaxt='n', xlab=NA)
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
    
    plot(i, tdarray[214, 18, 1:1000], type="p", pch=20, ylim=c(0,5), ylab= NA, xaxt='n', xlab=NA)
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
   
    plot(i, tdarray[245, 18, 1:1000], type="p", pch=20, ylim=c(0,5), ylab= NA, xaxt='n', xlab=NA)
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
    
    
  
  #COLONY NECTAR
    plot(i, tdarray[122, 20, 1:1000], type="p", pch=20, ylab= "Colony Nectar", ylim=c(0,30000), 
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
  
    plot(i, tdarray[153, 20, 1:1000], type="p", pch=20, ylim=c(0,30000), ylab= NA, 
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
  
    plot(i, tdarray[183, 20, 1:1000], type="p", pch=20, ylim=c(0,30000), ylab= NA, 
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
  
    plot(i, tdarray[214, 20, 1:1000], type="p", pch=20, ylim=c(0,30000), ylab= NA, 
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
  
    plot(i, tdarray[245, 20, 1:1000], type="p", pch=20, ylim=c(0,30000), ylab= NA, 
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
  
  
  
  #add legend and marginal text  
 
  par(mfrow=c(1,1), oma= c(6,4,1,4), new= TRUE, xpd=NA)
  plot(0:1,0:1, type="n", xlab=NA, ylab=NA, axes=FALSE)
  legend("topright",inset=c(-0.15,0), xpd=NA, legend=c("qs1", "qs2", "qs3", "qs4", "qs5"), fill=c(1:5),
           title= "Queen Strength", cex=0.65, bty="n")
  mtext(text = paste("Fig.",n, "Scatterplots of response variables vs.",x,"input values for 1000 simulations", sep= " "), side = 1, outer = T, line = 5)    
  }


dev.off()
