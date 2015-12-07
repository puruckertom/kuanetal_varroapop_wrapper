#SENSITIVITY ANALYSIS####
#create input dataframes and arrays
#d <- as.data.frame(rbind(drnmitesurvive, fgrlifespan, queenstrength, wkrdrnratio, wkrmitesurvive, adslopec, adLD50c, lslope, lLD50, kow, koc, halflife))
#dt<- as.data.frame(t(d))
#dim(dt)

breaks <- floor(length(timearray)/5)
timebreak<- c(breaks,breaks*2,breaks*3,breaks*4,length(time))
resvar<- c(1,3,4,10,18,20)
tdoutput <- tdarray2[timebreak,resvar,1:1000]
dim(tdoutput)
srctdarray<- array(data=NA, c(5,6,16), dimnames = list(c("break1", "break2", "break3", "break4", "break5"),
                                                       c("Colony Size","Adult Workers", "Foragers", "Worker Eggs","Colony Pollen (g)", "Colony Nectar (g)"),
                                                       c("Queen Strength", "Worker to Drone", "Drone-Mite Survivorship (%)", "Worker-Mite Survivorship (%)", "Forager Lifespan (days)", "Mite Imm Type", "Adult Slope", "Adult LD50", "Adult Slope Contact", "Adult LD50 Contact", "Larva slope", "Larva LD50", "KOW","KOC","Half life", "App Rate")))
pcctdarray<- array(data=NA, c(5,6,16), dimnames = list(c("break1", "break2", "break3", "break4", "break5"), 
                                                       c("Colony Size","Adult Workers", "Foragers", "Worker Eggs","Colony Pollen (g)", "Colony Nectar (g)"), 
                                                       c("Queen Strength", "Worker to Drone", "Drone-Mite Survivorship (%)", "Worker-Mite Survivorship (%)", "Forager Lifespan (days)", "Mite Imm Type", "Adult Slope", "Adult LD50", "Adult Slope Contact", "Adult LD50 Contact", "Larva slope", "Larva LD50", "KOW","KOC","Half life", "App Rate")))

#standard regression coefficients
for (i in 1:5){  #break
  for (j in 1:6){   #output variable
    for (k in 1:16){  #input variable
      tempinput<- tdoutput[i,j,1:1000]
      temp<- src(inputdata[1:1000,], tempinput, rank = T)
      srctdarray[i,j,k]<- temp$SRRC[[1]][k]
    }
  }
}


#partial correlation coefficients
for (i in 1:5){  #break
  for (j in 1:6){   #output variable
    for (k in 1:16){  #input variable
      tempinput<- tdoutput[i,j,1:1000]
      temp<- pcc(inputdata[1:1000,], tempinput, rank = T)
      pcctdarray[i,j,k]<- temp$PRCC[[1]][k]
    }
  }
}

srcoutput<- adply(srctdarray[,,],2, cbind)
# write.csv(srcoutput, file = paste(vpdir_output, "srcoutput.csv", sep=""))
pccoutput<- adply(pcctdarray[,,],2, cbind)
# write.csv(pccoutput, file = paste(vpdir_output, "pccoutput.csv", sep=""))

