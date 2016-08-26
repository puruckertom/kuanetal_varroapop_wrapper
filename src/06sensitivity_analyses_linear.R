#SENSITIVITY ANALYSIS####
#create input dataframes and arrays
#d <- as.data.frame(rbind(drnmitesurvive, fgrlifespan, queenstrength, wkrdrnratio, wkrmitesurvive, adslopec, adLD50c, lslope, lLD50, kow, koc, halflife))
#dt<- as.data.frame(t(d))
#dim(dt)

breaks <- floor(length(timearray)/5)
timebreak<- c(breaks,breaks*2,breaks*3,breaks*4,length(timearray))

tdoutput_con <- tdarray_con[timebreak,resvar,1:Nsims]
tdoutput_exp <- tdarray_exp[timebreak,resvar,1:Nsims]
dim(tdoutput_con)
dim(tdoutput_exp)

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



