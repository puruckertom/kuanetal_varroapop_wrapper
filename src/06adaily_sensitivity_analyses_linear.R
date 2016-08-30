#SENSITIVITY ANALYSIS####
#create input dataframes and arrays
#d <- as.data.frame(rbind(drnmitesurvive, fgrlifespan, queenstrength, wkrdrnratio, wkrmitesurvive, adslopec, adLD50c, lslope, lLD50, kow, koc, halflife))
#dt<- as.data.frame(t(d))
#dim(dt)



#############################  CONTROL ######################################
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
tdarray_pccout_control<- array(data=NA, c(ndays,nvars), dimnames =colnames(inputdata_control))

#partial correlation coefficients
for (i in 1:ndays){  #break
  tempinput<- tdoutput_control[i,1:1000]
  #pcc(input_dataframe, output, rank = FALSE, nboot = 0, conf = 0.95)
  temp_pcc<- pcc(inputdata_control[1:1000,], tempinput, rank = F)
  print(paste(i,"out of",ndays))
  tdarray_pccout_control[i,] <- temp_pcc$PCC[[1]]
}

dim(tdarray_pccout_control)
colnames(tdarray_pccout_control) <- colnames(inputdata_control)
colnames(tdarray_pccout_control)
date <- 1:ndays

qs = melted_control$value[which(melted_control$variable=="queenstrength")]
#plot control daily sensitivities
pcc_control <- as.data.frame(cbind(date, tdarray_pccout_control))
colnames(pcc_control)
melted_control = melt(pcc_control, id.vars="date")
ggplot(melted_control, aes(x=date, y=value, group=variable)) +
    geom_line(color='steelblue') +
    geom_line(aes(y=qs), colour = "red") +
    xlab("Simulation Day") + 
    ylab("Partial Correlation Coefficient") +
    ggtitle("Daily Sensitivity (PCC) for Control Scenario") +
    theme_bw()

#################  FOLIAR ##################################################
ndays <- length(timearray)
#timebreak<- c(breaks,breaks*2,breaks*3,breaks*4,length(timearray))


## load foliar data
#tdarray_foliar[day, output_variable, simulation]
dim(tdarray_foliar)
head(tdarray_foliar)
#colony size is 1
tdoutput_foliar <- tdarray_foliar[,1,1:Nsims]
#tdoutput_foliar <- tdarray_foliar[timebreak,resvar,1:Nsims]
dim(tdoutput_foliar)
dim(inputdata_foliar)
nvars <- length(inputdata_foliar)

#create pcc array for foliar
tdarray_pccout_foliar<- array(data=NA, c(ndays,nvars), dimnames =colnames(inputdata_foliar))

#partial correlation coefficients
for (i in 1:ndays){  #break
  tempinput<- tdoutput_foliar[i,1:1000]
  #pcc(input_dataframe, output, rank = FALSE, nboot = 0, conf = 0.95)
  temp_pcc<- pcc(inputdata_foliar[1:1000,], tempinput, rank = F)
  print(paste(i,"out of",ndays))
  tdarray_pccout_foliar[i,] <- temp_pcc$PCC[[1]]
}

#customize colors
line_colors_foliar <- rep("#CC6666",nvars)
line_colors_foliar[1:10] <- "#9999CC"

dim(tdarray_pccout_foliar)
colnames(tdarray_pccout_foliar) <- colnames(inputdata_foliar)
colnames(tdarray_pccout_foliar)
date <- 1:ndays

#qs = melted_foliar$value[which(melted_foliar$variable=="queenstrength")]
#plot foliar daily sensitivities
pcc_foliar <- as.data.frame(cbind(date, tdarray_pccout_foliar))
colnames(pcc_foliar)
melted_foliar = melt(pcc_foliar, id.vars="date")
ggplot(melted_foliar, aes(x=date, y=value, group=variable)) +
  geom_line(color="steelblue") +
  #geom_line(aes(y=qs), colour = "red") +
  xlab("Simulation Day") + 
  ylab("Partial Correlation Coefficient") +
  scale_color_manual(values=line_colors_foliar) +
  ggtitle("Daily Sensitivity (PCC) for Foliar Scenario") +
  theme_bw()



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



