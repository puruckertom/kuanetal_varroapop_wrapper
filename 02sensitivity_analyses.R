#load output files
load("~/git/beeRpop/output/tdarray.RData")
dim(tdarray)
#days, outputs, simulations

#read input files
indata<- read.csv(file = paste(vpdir_output, "inputdata.csv", sep = ""), header = TRUE)


#for (i in 1:1000) {
#  if(!exists("indf")){
#    indf<- read.table(paste(vpdir_input,"input",i,".txt", sep = ""), header= FALSE, sep= "=", row.names = inparam)
#  }
#  if(exists("indf")){
#    temp_indf<- read.table(paste(vpdir_input,"input",i,".txt", sep = ""), header= FALSE, sep= "=", row.names = inparam, colClasses= c("NULL","factor"))
#    indf<- cbind(temp_indf, indf)
#  }
#}
#queenstrength<- indf[1,]
#wkrdrnratio<- indf[2,]
#drnmitesurvive<- indf[3,] 
#wkrmitesurvive<- indf[4,]
#fgrlifespan<- indf[5,]
#immtype<- indf[6,]
#adslope<- indf[7,]
#adLD50<- indf[8,]
#adslopec<- indf[9,]
#adLD50c<- indf[10,]
#lslope<- indf[11,]
#lLD50<- indf[12,]
#kow<- indf[13,]
#koc<- indf[14,]
#halflife<- indf[15,]
#apprate<- indf[16,]




#colony persistence
cp <- rep(NA, nrows)
for (n in 1:nrows){
  x <- which(tdarray[n,1,1:1000] > 1000) # queries colony size > 0 for 1000 simulations at each time point
  cp[n] <- length(x)/1000 #appends vector x with proportion of simulations per time step with Col Size > 0
}

#foragers
fa <- rep(NA, nrows)
for (n in 1:nrows){
  x <- which(tdarray[n,4,1:1000] > 0) 
  fa[n] <- length(x)/1000 
}

#adult workers
aw <- rep(NA, nrows)
for (n in 1:nrows){
  x <- which(tdarray[n,3,1:1000] > 0) 
  aw[n] <- length(x)/1000 
}

#free mites
fm <- rep(NA, nrows)
for (n in 1:nrows){
  x <- which(tdarray[n,11,1:1000] > 0) 
  fm[n] <- length(x)/1000 
}

#dead foragers
dfr <- rep(NA, nrows)
for (n in 1:nrows){
  x <- which(tdarray[n,1,1:1000] > 0) 
  dfr[n] <- length(x)/1000 
}

#dead mites
dm <- rep(NA, nrows)
for (n in 1:nrows){
  x <- which(tdarray[n,16,1:1000] > 0)
  dm[n] <- length(x)/1000
}

#capped drone brood
cdb <- rep(NA, nrows)
for (n in 1:nrows){
  x <- which(tdarray[n, 5, 1:1000] > 0)
  cdb[n] <- length(x)/1000
}

#capped worker brood
cwb <- rep(NA, nrows)
for (n in 1:nrows){
  x <- which(tdarray[n, 6, 1:1000] > 0)
  cwb[n] <- length(x)/1000
}


#SENSITIVITY ANALYSIS####
#create input dataframes and arrays
d <- as.data.frame(rbind(drnmitesurvive, fgrlifespan, queenstrength, wkrdrnratio, wkrmitesurvive, adslopec, adLD50c, lslope, lLD50, kow, koc, halflife))
dt<- as.data.frame(t(d))
dim(dt)
breaks <- floor(nrows/5)
year<- c(breaks,breaks*2,breaks*3,breaks*4,nrows)
resvar<- c(1,3,4,10,18,20)
tdoutput <- tdarray[year,resvar,1:1000]
dim(tdoutput)
srctdarray<- array(data=NA, c(1,6,12), dimnames = list(c("day"),
                                                       c("Colony Size","Adult Workers", "Foragers", "Worker Eggs","Colony Pollen (g)", "Colony Nectar (g)"),
                                                       c("Drone-Mite Survivorship (%)", "Forager Lifespan (days)", "Queen Strength","Worker to Drone","Worker-Mite Survivorship (%)", "Adult Slope Contact", "Adult LD50 Contact", "Larva slope", "Larva LD50", "KOW","KOC","Half life")))
pcctdarray<- array(data=NA, c(1,6,12), dimnames = list(c("day"), 
                                                       c("Colony Size","Adult Workers", "Foragers", "Worker Eggs","Colony Pollen (g)", "Colony Nectar (g)"), 
                                                       c("Drone-Mite Survivorship (%)", "Forager Lifespan (days)", "Queen Strength","Worker to Drone","Worker-Mite Survivorship (%)", "Adult Slope Contact", "Adult LD50 Contact", "Larva slope", "Larva LD50", "KOW","KOC","Half life")))

#standard regression coefficients
for (i in 1:1){  #year
  for (j in 1:6){   #output variable
    for (k in 1:12){  #input variable
      tempinput<- tdoutput[i,j,1:1000]
      temp<- src(dt[1:1000,], tempinput, rank = T)
      srctdarray[i,j,k]<- temp$SRRC[[1]][k]
    }
  }
}


#partial correlation coefficients
for (i in 1:1){  #year
  for (j in 1:6){   #output variable
    for (k in 1:12){  #input variable
      tempinput<- tdoutput[i,j,1:1000]
      temp<- pcc(dt[1:1000,], tempinput, rank = T)
      pcctdarray[i,j,k]<- temp$PRCC[[1]][k]
    }
  }
}

srcoutput<- adply(srctdarray[,,],2, cbind)
row.names(srcoutput)<- make.names(rep(c("day"), 6), unique = T)
# write.csv(srcoutput, file = paste(vpdir_output, "srcoutput_", now, ".csv", sep=""))
pccoutput<- adply(pcctdarray[,,],2, cbind)
row.names(pccoutput)<- make.names(rep(c("day"), 6), unique = T)
# write.csv(pccoutput, file = paste(vpdir_output, "pccoutput_", now, ".csv", sep=""))


#stacking arrays for .csv file #####

#now<- Sys.time()
#now<- as.POSIXlt(now)
#now<- format(now, "%Y%m%d%H%M", tz="")

#temparray <- tdarray[1:nrows,resvar,1:1000]
#tempdf<- adply(temparray[,1:3,],2, cbind) #colony size, adult workers, foragers
#row.names(tempdf)<- make.names(as.character(rep(time,3)), unique = T)
#write.csv(tempdf, file = paste(vpdir_output,"sim_results1_", now, ".csv", sep= ""))
#tempdf2<- adply(temparray[,4:6,],2, cbind) #worker eggs, colony pollen, colony nectar
#row.names(tempdf2)<- make.names(as.character(rep(time,3)), unique = T)
#write.csv(tempdf2, file = paste(vpdir_output,"sim_results2_", now, ".csv", sep=""))

