
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
  vpdir<-path.expand("C:\\Users\\ackuan\\VarroaPop\\")
}


#create input files #########


#ICQueenStrength
queenstrength<- runif(1000, 1, 6)
#RQWkrDrnRatio
wkrdrnratio<- runif(1000, 1, 5)
#ICDroneMiteSurvivorship
drnmitesurvive<- runif(1000, 0, 100)
#ICWorkerMiteSurvivorship
wkrmitesurvive<- runif(1000, 0, 100)
#ImmEnabled
miteimm <- c("TRUE","FALSE")
miteimmigration <- sample(miteimm, size= 1000, replace=T) 
#ICForagerLifespan
fgrlifespan <- runif(1000, 4, 16)
#ImmType
immtype <- c("Polynomial", "Cosine", "Sine", "Exponential", "Tangent", "Logarithmic")
miteimmtype <- sample(immtype, size=1000, replace=T)


for (i in 1:1000) {
  #queen strength
  parameter <- ("ICQueenStrength=")
  inputvalue <- queenstrength[i]
  #requeen worker-drone ratio
  parameter2 <- ("RQWkrDrnRatio=")
  inputvalue2 <- wkrdrnratio[i]
  #drone-mite survivorship
  parameter3 <- ("ICDroneMiteSurvivorship=")
  inputvalue3 <- drnmitesurvive[i]
  #worker-mite survivorship
  parameter4 <- ("ICWorkerMiteSurvivorship=")
  inputvalue4 <- wkrmitesurvive[i]
  #Forager Lifespan
  parameter5 <- ("ICForagerLifespan=")
  inputvalue5 <- fgrlifespan[i]
  #Mite Immigration Type
  parameter6 <- ("ImmType=")
  inputvalue6 <- miteimmtype[i]
  
  varroainput <- paste(parameter,inputvalue, sep=" ")
  write(varroainput, file = paste(vpdir,"input",i,".txt", sep = ""), append = FALSE)
  varroainput2 <- paste(parameter2,inputvalue2, sep=" ")
  write(varroainput2, file = paste(vpdir,"input",i,".txt", sep = ""), append = TRUE)
  varroainput3 <- paste(parameter3, inputvalue3, sep=" ")
  write(varroainput3, file = paste(vpdir, "input", i, ".txt", sep=""), append= TRUE)
  varroainput4 <- paste(parameter4, inputvalue4, sep=" ")
  write(varroainput4, file= paste(vpdir, "input", i, ".txt", sep=""), append= TRUE)
  varroainput5 <- paste(parameter5, inputvalue5, sep= " ")
  write(varroainput5, file= paste(vpdir, "input", i, ".txt", sep=""), append= TRUE)
  varroainput6 <- paste(parameter6, inputvalue6, sep= " ")
  write(varroainput6, file= paste(vpdir, "input", i, ".txt", sep=""), append= TRUE)
}



#run simulations###########
#command to run simulations in varroapop with relative directory structure and write output files


for (i in 1:1000) {
  inputfile<- paste("input",i,".txt", sep="")
  vpdir_command <- paste(vpdir,"VarroaPop.exe ", vpdir, "Default.vrp", 
                         " /b /or ", vpdir, "results",i,".txt", 
                         " /i ", vpdir, inputfile, sep="")
  print(vpdir_command)
  system(vpdir_command)
}



# 3d array ######
#create a three dimension array that is 1827,26,1000

tdarray <- array(data=NA,c(1827,26,1000))
dim(tdarray)
library(abind)

for (i in 1:1000) {
  df<- read.table(paste(vpdir,"results",i,".txt", sep=""), header= FALSE, sep= "", 
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


#plot crunching ###########

#separate and query QS values
qs1 <- which(queenstrength >=1 & queenstrength <2)
qs2 <- which(queenstrength >=2 & queenstrength <3)
qs3 <- which(queenstrength >=3 & queenstrength <4)
qs4 <- which(queenstrength >=4 & queenstrength <5)
qs5 <- which(queenstrength >=5 & queenstrength <6)

#list response variables to plot
inputparam<- list(DroneMiteSurvivorship= drnmitesurvive,
                  ForagerLifespan= fgrlifespan, 
                  QueenStrength= queenstrength, 
                  WorkertoDroneRatio= wkrdrnratio, 
                  WorkerMiteSurvivorship= wkrmitesurvive)

inputnames <- names(inputparam)

time <- as.Date(df[,1], "%m / %d / %y")


#create PDF

pdf(file= paste(vpdir,"graphics_output.pdf", sep=""), width = 8, height = 10, onefile = TRUE, paper = "letter")


#start figures
par(mfrow=c(5,5), mar=c(1.5,4,1.5,0.5), oma=c(2,2,2,2))

plot(time[1:366], cp[1:366], type="l", ylab = "Colony Size", main= "1999", ylim=c(0,1))
plot(time[367:732], cp[367:732], type="l", main= "2000", ylim=c(0,1), ylab=NA)
plot(time[733:1097], cp[733:1097], type="l", main= "2001", ylim=c(0,1), ylab=NA)
plot(time[1098:1462], cp[1098:1462], type="l", main= "2002", ylim=c(0,1), ylab=NA)
plot(time[1463:1827], cp[1463:1827], type="l", main= "2003", ylim=c(0,1), ylab=NA)

plot(time[1:366], fa[1:366], type="l", ylab= "Foragers", ylim=c(0,1)) 
plot(time[367:732], fa[367:732], type="l", ylim=c(0,1), ylab=NA)
plot(time[733:1097], fa[733:1097], type="l", ylim=c(0,1), ylab=NA)
plot(time[1098:1462], fa[1098:1462], type="l", ylim=c(0,1), ylab=NA)
plot(time[1463:1827], fa[1463:1827], type="l", ylim=c(0,1), ylab=NA)

plot(time[1:366], aw[1:366], type="l", ylab= "Adult Workers", ylim=c(0,1)) 
plot(time[367:732], aw[367:732], type="l", ylim=c(0,1), ylab=NA)
plot(time[733:1097], aw[733:1097], type="l", ylim=c(0,1), ylab=NA)
plot(time[1098:1462], aw[1098:1462], type="l", ylim=c(0,1), ylab=NA)
plot(time[1463:1827], aw[1463:1827], type="l", ylim=c(0,1), ylab=NA)

plot(time[1:366], fm[1:366], type="l", ylab= "Free Mites", ylim=c(0,1)) 
plot(time[367:732], fm[367:732], type="l", ylim=c(0,1), ylab=NA)
plot(time[733:1097], fm[733:1097], type="l", ylim=c(0,1), ylab=NA)
plot(time[1098:1462], fm[1098:1462], type="l", ylim=c(0,1), ylab=NA)
plot(time[1463:1827], fm[1463:1827], type="l", ylim=c(0,1), ylab=NA)

plot(time[1:366], dfr[1:366], type="l", ylab= "Dead Foragers", ylim=c(0,1)) 
plot(time[367:732], dfr[367:732], type="l", ylim=c(0,1), ylab=NA)
plot(time[733:1097], dfr[733:1097], type="l", ylim=c(0,1), ylab=NA)
plot(time[1098:1462], dfr[1098:1462], type="l", ylim=c(0,1), ylab=NA)
plot(time[1463:1827], dfr[1463:1827], type="l", ylim=c(0,1), ylab=NA)


  
  
  for (i in inputparam){
  
    par(mfrow=c(6,5), mar=c(0.5, 4, 1.5, 0.5), oma= c(4,4,2,7))
  
  #COLONY SIZE
    plot(i, tdarray[122, 1, 1:1000], type="p", pch=20, main= "May 1999", ylab= "Colony Size", ylim=c(0,71000), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=T, tick= T, ylab= "Colony Size")
    points(i[qs1],tdarray[122,1, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[122,1, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[122,1, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[122,1, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[122,1, qs5], type="p", col=5, pch=20)
     
    plot(i, tdarray[153, 1, 1:1000], type="p", pch=20, main= "June 1999", ylab= NA, ylim=c(0,71000), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick= T)
    points(i[qs1],tdarray[153,1, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[153,1, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[153,1, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[153,1, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[153,1, qs5], type="p", col=5, pch=20)
    
    plot(i, tdarray[183, 1, 1:1000], type="p", pch=20, main= "July 1999", ylab= NA, ylim=c(0,71000), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick= T)
    points(i[qs1],tdarray[183,1, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[183,1, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[183,1, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[183,1, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[183,1, qs5], type="p", col=5, pch=20)
  
    plot(i, tdarray[214, 1, 1:1000], type="p", pch=20, main= "Aug 1999", ylab= NA, ylim=c(0,71000), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick= T)
    points(i[qs1],tdarray[214,1, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[214,1, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[214,1, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[214,1, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[214,1, qs5], type="p", col=5, pch=20)
    
    plot(i, tdarray[245, 1, 1:1000], type="p", pch=20, main= "Sept 1999", ylab= NA, ylim=c(0,71000), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)  
    axis(2, labels= F, tick= T)
    points(i[qs1],tdarray[245,1, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[245,1, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[245,1, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[245,1, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[245,1, qs5], type="p", col=5, pch=20)
  
  
    
  #ADULT WORKERS
    plot(i, tdarray[122, 3, 1:1000], type="p", pch=20,  ylab="Adult Workers", ylim=c(0,5), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=T, tick=T, ylab= "Adult Workers")
    points(i[qs1],tdarray[122,3, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[122,3, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[122,3, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[122,3, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[122,3, qs5], type="p", col=5, pch=20)
    
    plot(i, tdarray[153, 3, 1:1000], type="p", pch=20, ylab= NA, ylim=c(0,5), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[153,3, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[153,3, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[153,3, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[153,3, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[153,3, qs5], type="p", col=5, pch=20)
      
    plot(i, tdarray[183, 3, 1:1000], type="p", pch=20, ylab= NA, ylim=c(0,5), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[183,3, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[183,3, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[183,3, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[183,3, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[183,3, qs5], type="p", col=5, pch=20)
  
    plot(i, tdarray[214, 3, 1:1000], type="p", pch=20, ylab= NA, ylim=c(0,5), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[214,3, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[214,3, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[214,3, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[214,3, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[214,3, qs5], type="p", col=5, pch=20)
  
    plot(i, tdarray[245, 3, 1:1000], type="p", pch=20, ylab= NA, ylim=c(0,5), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[245,3, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[245,3, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[245,3, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[245,3, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[245,3, qs5], type="p", col=5, pch=20)
  
  
  
  #FORAGERS
    plot(i, tdarray[122, 4, 1:1000], type="p", pch=20, ylab= "Foragers", ylim=c(0,5), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=T, tick=T, ylab= "Foragers")
    points(i[qs1],tdarray[122,4, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[122,4, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[122,4, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[122,4, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[122,4, qs5], type="p", col=5, pch=20)
    
    plot(i, tdarray[153, 4, 1:1000], type="p", pch=20, ylim=c(0,5), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[153,4, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[153,4, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[153,4, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[153,4, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[153,4, qs5], type="p", col=5, pch=20)
  
    plot(i, tdarray[183, 4, 1:1000], type="p", pch=20, ylim=c(0,5), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[183,4, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[183,4, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[183,4, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[183,4, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[183,4, qs5], type="p", col=5, pch=20)
    
    plot(i, tdarray[214, 4, 1:1000], type="p", pch=20, ylim=c(0,5), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[214,4, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[214,4, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[214,4, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[214,4, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[214,4, qs5], type="p", col=5, pch=20)
    
    plot(i, tdarray[245, 4, 1:1000], type="p", pch=20, ylim=c(0,5), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)  
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[245,4, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[245,4, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[245,4, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[245,4, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[245,4, qs5], type="p", col=5, pch=20)
  
    
    
  #WORKER EGGS
    plot(i, tdarray[122, 10, 1:1000], type="p", pch=20, ylab="Worker Eggs", ylim=c(0,8000), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=T, tick=T, ylab= "Worker Eggs")
    points(i[qs1],tdarray[122,10, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[122,10, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[122,10, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[122,10, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[122,10, qs5], type="p", col=5, pch=20)
  
    plot(i, tdarray[153, 10, 1:1000], type="p", pch=20, ylim=c(0,8000), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[153,10, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[153,10, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[153,10, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[153,10, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[153,10, qs5], type="p", col=5, pch=20)
    
    plot(i, tdarray[183, 10, 1:1000], type="p", pch=20, ylim=c(0,8000), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[183,10, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[183,10, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[183,10, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[183,10, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[183,10, qs5], type="p", col=5, pch=20)
    
    plot(i, tdarray[214, 10, 1:1000], type="p", pch=20, ylim=c(0,8000), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[214,10, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[214,10, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[214,10, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[214,10, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[214,10, qs5], type="p", col=5, pch=20)
    
    plot(i, tdarray[245, 10, 1:1000], type="p", pch=20, ylim=c(0,8000), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[245,10, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[245,10, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[245,10, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[245,10, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[245,10, qs5], type="p", col=5, pch=20)
  
  
   
  #COLONY POLLEN
    plot(i, tdarray[122, 18, 1:1000], type="p", pch=20, ylab= "Colony Pollen (g)", ylim=c(0,5), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=T, tick=T, ylab= "Colony Pollen (g)")
    points(i[qs1],tdarray[122,18, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[122,18, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[122,18, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[122,18, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[122,18, qs5], type="p", col=5, pch=20)
  
    plot(i, tdarray[153, 18, 1:1000], type="p", pch=20, ylim=c(0,5), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[153,18, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[153,18, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[153,18, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[153,18, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[153,18, qs5], type="p", col=3, pch=20)
  
    plot(i, tdarray[183, 18, 1:1000], type="p", pch=20, ylim=c(0,5), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[183,18, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[183,18, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[183,18, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[183,18, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[183,18, qs5], type="p", col=5, pch=20)
    
    plot(i, tdarray[214, 18, 1:1000], type="p", pch=20, ylim=c(0,5), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[214,18, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[214,18, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[214,18, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[214,18, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[214,18, qs5], type="p", col=5, pch=20)
   
    plot(i, tdarray[245, 18, 1:1000], type="p", pch=20, ylim=c(0,5), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[245,18, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[245,18, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[245,18, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[245,18, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[245,18, qs5], type="p", col=5, pch=20)
    
    
  
  #COLONY NECTAR
    plot(i, tdarray[122, 20, 1:1000], type="p", pch=20, ylab= "Colony Nectar", ylim=c(0,30000), 
         xlab= if (i = drnmitesurvive){ paste("Drone Mite Survivorship (%)")}
              if (i = fgrlifespan){ paste("Forager Lifespan (days)")}
              if (i = queenstrength){ paste("Queen Strength")}
              if (i = wkrdrnratio){ paste("Worker:Drone")}
              if (i = wkrmitesurvive){ paste("Worker Mite Survivorship (%)")}
           )
    axis(1, labels=F, tick=T)
    axis(2, labels=T, tick=T, ylab= "Colony Nectar")
    points(i[qs1],tdarray[122,20, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[122,20, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[122,20, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[122,20, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[122,20, qs5], type="p", col=5, pch=20)
  
    plot(i, tdarray[153, 20, 1:1000], type="p", pch=20, ylim=c(0,30000), ylab= NA, 
         xlab= if (i = DroneMiteSurvivorship){ paste("Drone Mite Survivorship (%)")
                                               else if (i = ForagerLifespan) paste("Forager Lifespan (days)")
                                               else if (i = QueenStrength) paste("Queen Strength")
                                               else if (i = WorkertoDroneRatio) paste("Worker:Drone")
                                               else if (i = WorkerMiteSurvivorship) paste("Worker Mite Survivorship (%)")}
          )
    axis(1, labels=F, tick=T)  
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[153,20, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[153,20, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[153,20, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[153,20, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[153,20, qs5], type="p", col=5, pch=20)
  
    plot(i, tdarray[183, 20, 1:1000], type="p", pch=20, ylim=c(0,30000), ylab= NA, 
         xlab= if (i = DroneMiteSurvivorship){ paste("Drone Mite Survivorship (%)")
                                               else if (i = ForagerLifespan) paste("Forager Lifespan (days)")
                                               else if (i = QueenStrength) paste("Queen Strength")
                                               else if (i = WorkertoDroneRatio) paste("Worker:Drone")
                                               else if (i = WorkerMiteSurvivorship) paste("Worker Mite Survivorship (%)")}
           )
    axis(1, labels=F, tick=T)  
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[183,20, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[183,20, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[183,20, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[183,20, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[183,20, qs5], type="p", col=5, pch=20)
  
    plot(i, tdarray[214, 20, 1:1000], type="p", pch=20, ylim=c(0,30000), ylab= NA, 
         xlab= if (i = DroneMiteSurvivorship){ paste("Drone Mite Survivorship (%)")
                                               else if (i = ForagerLifespan) paste("Forager Lifespan (days)")
                                               else if (i = QueenStrength) paste("Queen Strength")
                                               else if (i = WorkertoDroneRatio) paste("Worker:Drone")
                                               else if (i = WorkerMiteSurvivorship) paste("Worker Mite Survivorship (%)")}
           )
    axis(1, labels=F, tick=T)  
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[214,20, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[214,20, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[214,20, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[214,20, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[214,20, qs5], type="p", col=5, pch=20)
  
    plot(i, tdarray[245, 20, 1:1000], type="p", pch=20, ylim=c(0,30000), ylab= NA, 
         xlab= if (i = DroneMiteSurvivorship){ paste("Drone Mite Survivorship (%)")
                                               else if (i = ForagerLifespan) paste("Forager Lifespan (days)")
                                               else if (i = QueenStrength) paste("Queen Strength")
                                               else if (i = WorkertoDroneRatio) paste("Worker:Drone")
                                               else if (i = WorkerMiteSurvivorship) paste("Worker Mite Survivorship (%)")}
           )
    axis(1, labels=F, tick=T)  
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[245,20, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[245,20, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[245,20, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[245,20, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[245,20, qs5], type="p", col=5, pch=20)
  
  
  
  #add legend and marginal text  
 
  par(mfrow=c(1,1), oma= c(1,4,1,4), new= TRUE, xpd=NA)
  plot(0:1,0:1, type="n", xlab=NA, ylab=NA, axes=FALSE)
  legend("right",inset=c(-0.15,0), xpd=NA, legend=c("qs1", "qs2", "qs3", "qs4", "qs5"), fill=c(1:5),
           title= "Queen Strength", cex=0.65, bty="n")
  }


dev.off()
