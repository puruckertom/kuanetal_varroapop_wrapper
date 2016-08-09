# load up results into a 3d array dataframe ######
df <- read.table(paste(vpdir_sobol_output[1],"output",1,".txt", sep=""), header= FALSE, sep= "", 
                 skip = 6, stringsAsFactors = FALSE, row.names=NULL)
Noutvar<- dim(df)
nrows <- dim(df[1])[[1]] #this is dependent on the duration of the simulation as set in the comparison.vrp file


timearray<- array(data=NA, c(nrows))
timearray[2:nrows]<- df[2:nrows,1]
timearray<- as.Date(timearray,"%m/%d/%Y")
timediff <- timearray[3]-timearray[2]
timearray[1] <- timearray[2]-timediff
length(timearray)

# parallelize
library(doParallel)
cl <- makeCluster(4)
registerDoParallel(cl)
memory.limit(size=30000)

# read output files
foreach(i = 1:length(vpdir_sobol_output)) %dopar% {
  sb_output <- array(data = NA, c(Noutvar[1], Noutvar[2], Nsims))
  for (n in 1:Nsims) {
    library(abind)
    df <- read.table(paste(vpdir_sobol_output[i],"output",n,".txt", sep=""), header= FALSE, sep= "", 
                     skip = 6, stringsAsFactors = FALSE, row.names=NULL)
    newarray <- cbind(timearray, df[,2:Noutvar[2]])
    sb_output[,,n] <- abind(newarray, along=3)
    print(i)
    print(n)
  }
  assign(paste("sb",i,"_output", sep=""), sb_output)
  con <- paste(vpdir_sobol, "sb",i,"_output.RData", sep="")
  save(sb_output, file= con, compress = TRUE)
}


VP_results<- abind(sb1_output,sb2_output,sb3_output,sb4_output,sb5_output,sb6_output,sb7_output,
                   sb8_output,sb9_output,sb10_output,sb11_output,sb12_output,sb13_output,
                   sb14_output,sb15_output,sb16_output,sb17_output,sb18_output,sb19_output,
                   sb20_output,sb21_output,sb22_output, along=3)

# save tdarray
save(VP_results, file = paste(vpdir_sobol,"tdarray_results.RData", sep = ""))
save(timearray,file = paste(vpdir_sobol,"timearray.RData", sep = ""))
