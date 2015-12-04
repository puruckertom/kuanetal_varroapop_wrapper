# load up varroapop data into a 3d array dataframe ######
df <- read.table(paste(vpdir_output,"results",i,".txt", sep=""), header= FALSE, sep= "", 
                skip = 6, stringsAsFactors = FALSE, row.names=NULL)
dim(df)

nrows <- dim(df[1])[[1]] #this is dependent on the duration of the simulation as set in the comparison.vrp file
tdarray <- array(data=NA,c(nrows,27,Nsims))
dim(tdarray)

timearray<- array(data=NA, c(nrows))
timearray[2:nrows]<- df[2:nrows,1]
timearray<- as.Date(timearray,"%m/%d/%Y")
timediff <- timearray[3]-timearray[2]
timearray[1] <- timearray[2]-timediff

# read output files
for (i in 1:Nsims) {
  df <- read.table(paste(vpdir_output,"results",i,".txt", sep=""), header= FALSE, sep= "", 
                  skip = 6, stringsAsFactors = FALSE, row.names=NULL)
  newarray <- df[,2:27]
  newarray <- data.matrix(df)
  tdarray[1:nrows,1:26,i] <- abind(df[1:nrows,1:27], along=3)
}

# save tdarray
save(tdarray, file = paste(vpdir_output,"tdarray.RData", sep = ""))
save(timearray,file = paste(vpdir_output,"timearray.RData", sep = ""))
