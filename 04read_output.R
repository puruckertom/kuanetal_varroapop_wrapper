# load up varroapop data into a 3d array dataframe ######
df <- read.table(paste(vpdir_out_con,"results",i,".txt", sep=""), header= FALSE, sep= "", 
                skip = 6, stringsAsFactors = FALSE, row.names=NULL)
dim(df)
nrows <- dim(df[1])[[1]] #this is dependent on the duration of the simulation as set in the comparison.vrp file

tdarray_con <- array(data=NA, c(nrows,26,Nsims))
dim(tdarray_con)
tdarray_exp <- array(data=NA, c(nrows,26,Nsims))
dim(tdarray_exp)
timearray<- array(data=NA, c(nrows))
timearray[2:nrows]<- df[2:nrows,1]
timearray<- as.Date(timearray,"%m/%d/%Y")
timediff <- timearray[3]-timearray[2]
timearray[1] <- timearray[2]-timediff
length(timearray)

# read output files
#CONTROL
for (i in 1:Nsims) {
  df <- read.table(paste(vpdir_out_con,"results",i,".txt", sep=""), header= FALSE, sep= "", 
                  skip = 6, stringsAsFactors = FALSE, row.names=NULL)
  newarray <- df[,2:27]
  tdarray_con[1:nrows,1:26,i] <- abind(newarray[1:nrows,1:26], along=3)
}

#EXPOSED
for (i in 1:Nsims) {
  df <- read.table(paste(vpdir_out_exp,"results",i,".txt", sep=""), header= FALSE, sep= "", 
                   skip = 6, stringsAsFactors = FALSE, row.names=NULL)
  newarray <- df[,2:27]
  tdarray_exp[1:nrows,1:26,i] <- abind(newarray[1:nrows,1:26], along=3)
}

# save tdarray
save(tdarray_con, file = paste(vpdir_out_con,"tdarray_con.RData", sep = ""))
save(tdarray_exp, file = paste(vpdir_out_exp,"tdarray_exp.RData", sep = ""))
save(timearray,file = paste(vpdir_output,"timearray.RData", sep = ""))
