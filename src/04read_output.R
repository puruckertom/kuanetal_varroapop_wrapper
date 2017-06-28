# load up varroapop data into a 3d array dataframe ######
i <- 1
df <- read.table(paste(vpdir_out_control,"results",i,".txt", sep=""), header= FALSE, sep= "", 
                skip = 6, stringsAsFactors = FALSE, row.names=NULL)
dim(df)
nrows <- dim(df)[[1]] #this is dependent on the duration of the simulation as set in the comparison.vrp file
ncols <- dim(df)[[2]]

timearray<- array(data=NA, c(nrows))
timearray[2:nrows]<- df[2:nrows,1]
timearray<- as.Date(timearray,"%m/%d/%Y")
timediff <- timearray[3]-timearray[2]
timearray[1] <- timearray[2]-timediff
length(timearray)
outvar<- c("Date","Colony Size","Adult Drones","Adult Workers", "Foragers", "Capped Drone Brood", "Capped Worker Brood",
           "Drone Larvae", "Worker Larvae", "Drone Eggs", "Worker Eggs", "Free Mites", "Drone Brood Mites",
           "Worker Brood Mites", "Mites/Drone Cell", "Mites/Worker Cell", "Mites Dying", "Proportion Mites Dying",
           "Colony Pollen (g)", "Pollen Pesticide Concentration", "Colony Nectar", "Nectar Pesticide Concentration",
           "Dead Drone Larvae", "Dead Worker Larvae", "Dead Drone Adults", "Dead Worker Adults", "Dead Foragers",
           "Queen Strength", "Average Temperature (celsius)", "Rain")



# read output files
#CONTROL
tdarray_control <- array(data=NA, c(nrows,ncols-1,Nsims))
dim(tdarray_control)
for (i in 1:Nsims) {
  df <- read.table(paste(vpdir_out_control,"results",i,".txt", sep=""), header= FALSE, sep= "", 
                  skip = 6, stringsAsFactors = FALSE, row.names=NULL, col.names = outvar)
  newarray <- df[,2:ncols]
  tdarray_control[1:nrows,1:(ncols-1),i] <- abind(newarray[1:nrows,1:(ncols-1)], along=3)
}

save(tdarray_control, file = paste(vpdir_out_control,"tdarray_control.RData", sep = ""))
rm(tdarray_control)

#FOLIAR
tdarray_foliar <- array(data=NA, c(nrows,ncols-1,Nsims))
dim(tdarray_foliar)
for (i in 1:Nsims) {
  df <- read.table(paste(vpdir_out_foliar,"results",i,".txt", sep=""), header= FALSE, sep= "", 
                   skip = 6, stringsAsFactors = FALSE, row.names=NULL)
  newarray <- df[,2:ncols]
  tdarray_foliar[1:nrows,1:(ncols-1),i] <- abind(newarray[1:nrows,1:(ncols-1)], along=3)
}
save(tdarray_foliar, file = paste(vpdir_out_foliar,"tdarray_foliar.RData", sep = ""))
rm(tdarray_foliar)

#SEED
tdarray_seed <- array(data=NA, c(nrows,ncols-1,Nsims))
dim(tdarray_seed)
for (i in 1:Nsims) {
  df <- read.table(paste(vpdir_out_seed,"results",i,".txt", sep=""), header= FALSE, sep= "", 
                   skip = 6, stringsAsFactors = FALSE, row.names=NULL)
  newarray <- df[,2:ncols]
  tdarray_seed[1:nrows,1:(ncols-1),i] <- abind(newarray[1:nrows,1:(ncols-1)], along=3)
}
save(tdarray_seed, file = paste(vpdir_out_seed,"tdarray_seed.RData", sep = ""))
rm(tdarray_seed)

#SOIL
tdarray_soil <- array(data=NA, c(nrows,ncols-1,Nsims))
dim(tdarray_soil)
for (i in 1:Nsims) {
  df <- read.table(paste(vpdir_out_soil,"results",i,".txt", sep=""), header= FALSE, sep= "", 
                   skip = 6, stringsAsFactors = FALSE, row.names=NULL)
  newarray <- df[,2:ncols]
  tdarray_soil[1:nrows,1:(ncols-1),i] <- abind(newarray[1:nrows,1:(ncols-1)], along=3)
}
save(tdarray_soil, file = paste(vpdir_out_soil,"tdarray_soil.RData", sep = ""))
rm(tdarray_soil)

save(timearray,file = paste(vpdir_output,"timearray.RData", sep = ""))
