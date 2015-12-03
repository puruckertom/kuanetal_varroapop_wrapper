# load up varroapop data into a 3d array dataframe ######
df <- read.table(paste(vpdir_output,"results",i,".txt", sep=""), header= FALSE, sep= "", 
                skip = 6, stringsAsFactors = FALSE, row.names=NULL)
dim(df)

nrows <- dim(df[1])[[1]] #this is dependent on the duration of the simulation as set in the comparison.vrp file
tdarray <- array(data=NA,c(nrows,26,Nsims))
dim(tdarray)

# read output files
for (i in 1:Nsims) {
  df <- read.table(paste(vpdir_output,"results",i,".txt", sep=""), header= FALSE, sep= "", 
                  skip = 6, stringsAsFactors = FALSE, row.names=NULL)
  newarray <- df[,1:27]
  newarray2 <- data.matrix(newarray)
  tdarray[1:nrows,1:27,i] <- abind(newarray2[1:nrows,1:26], along=3)
}

# save tdarray
save(tdarray, file = paste(vpdir_output,"tdarray.RData", sep = ""))