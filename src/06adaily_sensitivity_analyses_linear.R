#SENSITIVITY ANALYSIS####
#create input dataframes and arrays
#d <- as.data.frame(rbind(drnmitesurvive, fgrlifespan, queenstrength, wkrdrnratio, wkrmitesurvive, adslopec, adLD50c, lslope, lLD50, kow, koc, halflife))
#dt<- as.data.frame(t(d))
#dim(dt)

ndays <- length(timearray)
#timebreak<- c(breaks,breaks*2,breaks*3,breaks*4,length(timearray))


## load control data
#tdarray_control[day, output_variable, simulation]
dim(tdarray_control)
head(tdarray_control)
#colony size is 1
tdoutput_control <- tdarray_control[,1,1:Nsims]
#tdoutput_control <- tdarray_control[timebreak,resvar,1:Nsims]
dim(tdoutput_control)
dim(inputdata_control)
nvars <- length(inputdata_control)

#create pcc array for control
tdarray_pccout_control<- array(data=NA, c(ndays,nvars))

#partial correlation coefficients
for (i in 1:ndays){  #break
  tempinput<- tdoutput_control[i,1:1000]
  #pcc(input_dataframe, output, rank = FALSE, nboot = 0, conf = 0.95)
  temp_pcc<- pcc(inputdata_control[1:1000,], tempinput, rank = F)
  tdarray_pccout_control[i,] <- temp_pcc$PCC[[1]]
  #for (k in 1:nvars){  #input variable
  #  tdpcc_control[i,k]<- temp$PRCC[[1]][k]
  #}
}

dim(tdarray_pccout_control)


##################



dim(tdoutput_foliar)
tdoutput_foliar <- tdarray_foliar[timebreak,resvar,1:Nsims]



#CONTROL
srctdarray_con<- array(data=NA, c(5,5,15), dimnames = list(c("break1", "break2", "break3", "break4", "break5"),
                                                       c("Colony Size","Adult Workers", "Foragers", "Worker Eggs","Colony Pollen (g)"),
                                                       c(colnames(inputdata_con))))
pcctdarray_con<- array(data=NA, c(5,5,15), dimnames = list(c("break1", "break2", "break3", "break4", "break5"), 
                                                       c("Colony Size","Adult Workers", "Foragers", "Worker Eggs","Colony Pollen (g)"), 
                                                       c(colnames(inputdata_con))))
#standard regression coefficients
for (i in 1:5){  #break
  for (j in 1:5){   #output variable
    for (k in 1:15){  #input variable
      tempinput<- tdoutput_con[i,j,1:1000]
      temp<- src(inputdata_con[1:1000,], tempinput, rank = T)
      srctdarray_con[i,j,k]<- temp$SRRC[[1]][k]
    }
  }
}

#partial correlation coefficients
for (i in 1:5){  #break
  for (j in 1:5){   #output variable
    for (k in 1:15){  #input variable
      tempinput<- tdoutput_con[i,j,1:1000]
      temp<- pcc(inputdata_con[1:1000,], tempinput, rank = T)
      pcctdarray_con[i,j,k]<- temp$PRCC[[1]][k]
    }
  }
}

srcoutput_con<- adply(srctdarray_con[,,],2, cbind)
#write.csv(srcoutput_con, file = paste(vpdir_output, "srcoutput.csv", sep=""))
pccoutput_con<- adply(pcctdarray_con[,,],2, cbind)
#write.csv(pccoutput, file = paste(vpdir_output, "pccoutput.csv", sep=""))


#EXPOSED
srctdarray_exp<- array(data=NA, c(5,5,16), dimnames = list(c("break1", "break2", "break3", "break4", "break5"),
                                                           c("Colony Size","Adult Workers", "Foragers", "Worker Eggs","Colony Pollen (g)"),
                                                           c(colnames(inputdata_exp))))
pcctdarray_exp<- array(data=NA, c(5,5,16), dimnames = list(c("break1", "break2", "break3", "break4", "break5"), 
                                                           c("Colony Size","Adult Workers", "Foragers", "Worker Eggs","Colony Pollen (g)"), 
                                                           c(colnames(inputdata_exp))))

#standard regression coefficients
for (i in 1:5){  #break
  for (j in 1:5){   #output variable
    for (k in 1:16){  #input variable
      tempinput<- tdoutput_exp[i,j,1:1000]
      temp<- src(inputdata_exp[1:1000,], tempinput, rank = T)
      srctdarray_exp[i,j,k]<- temp$SRRC[[1]][k]
    }
  }
}


#partial correlation coefficients
for (i in 1:5){  #break
  for (j in 1:5){   #output variable
    for (k in 1:16){  #input variable
      tempinput<- tdoutput_exp[i,j,1:1000]
      temp<- pcc(inputdata_exp[1:1000,], tempinput, rank = T)
      pcctdarray_exp[i,j,k]<- temp$PRCC[[1]][k]
    }
  }
}

srcoutput_exp<- adply(srctdarray_exp[,,],2, cbind)
# write.csv(srcoutput, file = paste(vpdir_output, "srcoutput.csv", sep=""))
pccoutput_exp<- adply(pcctdarray_exp[,,],2, cbind)
# write.csv(pccoutput, file = paste(vpdir_output, "pccoutput.csv", sep=""))



