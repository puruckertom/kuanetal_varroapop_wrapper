# load up varroapop data into a 3d array dataframe ######
df <- read.table(paste(vpdir_out_control,"results",i,".txt", sep=""), header= FALSE, sep= "", 
                skip = 6, stringsAsFactors = FALSE, row.names=NULL)
dim(df)
nrows <- dim(df[1])[[1]] #this is dependent on the duration of the simulation as set in the comparison.vrp file

timearray<- array(data=NA, c(nrows))
timearray[2:nrows]<- df[2:nrows,1]
timearray<- as.Date(timearray,"%m/%d/%Y")
timediff <- timearray[3]-timearray[2]
timearray[1] <- timearray[2]-timediff
length(timearray)

# read output files
#CONTROL
tdarray_control <- array(data=NA, c(nrows,26,Nsims))
dim(tdarray_control)
for (i in 1:Nsims) {
  df <- read.table(paste(vpdir_out_control,"results",i,".txt", sep=""), header= FALSE, sep= "", 
                  skip = 6, stringsAsFactors = FALSE, row.names=NULL)
  newarray <- df[,2:27]
  tdarray_control[1:nrows,1:26,i] <- abind(newarray[1:nrows,1:26], along=3)
}
save(tdarray_control, file = paste(vpdir_out_control,"tdarray_control.RData", sep = ""))
rm(tdarray_control)

#FOLIAR
tdarray_foliar <- array(data=NA, c(nrows,26,Nsims))
dim(tdarray_foliar)
for (i in 1:Nsims) {
  df <- read.table(paste(vpdir_out_foliar,"results",i,".txt", sep=""), header= FALSE, sep= "", 
                   skip = 6, stringsAsFactors = FALSE, row.names=NULL)
  newarray <- df[,2:27]
  tdarray_foliar[1:nrows,1:26,i] <- abind(newarray[1:nrows,1:26], along=3)
}
save(tdarray_foliar, file = paste(vpdir_out_foliar,"tdarray_foliar.RData", sep = ""))
rm(tdarray_foliar)

#SEED
tdarray_seed <- array(data=NA, c(nrows,26,Nsims))
dim(tdarray_seed)
for (i in 1:Nsims) {
  df <- read.table(paste(vpdir_out_seed,"results",i,".txt", sep=""), header= FALSE, sep= "", 
                   skip = 6, stringsAsFactors = FALSE, row.names=NULL)
  newarray <- df[,2:27]
  tdarray_seed[1:nrows,1:26,i] <- abind(newarray[1:nrows,1:26], along=3)
}
save(tdarray_seed, file = paste(vpdir_out_seed,"tdarray_seed.RData", sep = ""))
rm(tdarray_seed)

#SOIL
tdarray_soil <- array(data=NA, c(nrows,26,Nsims))
dim(tdarray_soil)
for (i in 1:Nsims) {
  df <- read.table(paste(vpdir_out_soil,"results",i,".txt", sep=""), header= FALSE, sep= "", 
                   skip = 6, stringsAsFactors = FALSE, row.names=NULL)
  newarray <- df[,2:27]
  tdarray_soil[1:nrows,1:26,i] <- abind(newarray[1:nrows,1:26], along=3)
}
save(tdarray_soil, file = paste(vpdir_out_soil,"tdarray_soil.RData", sep = ""))
rm(tdarray_soil)

save(timearray,file = paste(vpdir_output,"timearray.RData", sep = ""))
