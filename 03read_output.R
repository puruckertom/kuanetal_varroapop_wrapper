# load up varroapop data into a 3d array dataframe ######
df <- read.table(paste(vpdir_output,"results",i,".txt", sep=""), header= FALSE, sep= "", 
                skip = 6, stringsAsFactors = FALSE, row.names=NULL)
dim(df)

nrows <- dim(df[1])[[1]] #this is dependent on the duration of the simulation as set in the comparison.vrp file
tdarray <- array(data=NA,c(nrows,27,Nsims))
dim(tdarray)

# read output files
for (i in 1:Nsims) {
  df <- read.table(paste(vpdir_output,"results",i,".txt", sep=""), header= FALSE, sep= "", 
                  skip = 6, stringsAsFactors = FALSE, row.names=NULL)
#  newarray <- df[,1:27]
#  newarray <- data.matrix(df)
  tdarray[1:nrows,1:27,i] <- abind(df[1:nrows,1:27], along=3)
}

# save tdarray
save(tdarray, file = paste(vpdir_output,"tdarray.RData", sep = ""))
