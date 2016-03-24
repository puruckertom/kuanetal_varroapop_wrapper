#SENSITIVITY ANALYSIS####
#create input dataframes and arrays
#d <- as.data.frame(rbind(drnmitesurvive, fgrlifespan, queenstrength, wkrdrnratio, wkrmitesurvive, adslopec, adLD50c, lslope, lLD50, kow, koc, halflife))
#dt<- as.data.frame(t(d))
#dim(dt)
#load output files
#CONTROL
load(paste(vpdir_out_con,"tdarray_con.RData", sep = ""))
dim(tdarray_con)
#EXPOSED
load(paste(vpdir_out_exp,"tdarray_exp.RData", sep = ""))
dim(tdarray_exp)
#TIME
load(paste(vpdir_output,"timearray.RData", sep = ""))
nrows<- length(timearray)
#rownames(tdarray)
#days, outputs, simulations

#read input files
#CONTROL
indata_con <- read.csv(file = paste(vpdir_out_con, "inputdata_con.csv", sep = ""), header = TRUE)
#cut out column "X"
inputdata_con<- indata_con[,2:17]
#EXPOSED
indata_exp <- read.csv(file = paste(vpdir_out_exp, "inputdata_exp.csv", sep = ""), header = TRUE)
inputdata_exp<- indata_exp[,2:17]

#extract input vectors from dataframe
for(i in 1:16){assign(names(inputdata_con)[i], inputdata_con[[i]])}
#extract input apprate vector from exposure dataframe
assign(names(inputdata_exp)[16], inputdata_exp[[16]])

#convert dataframe to list
#linputdata <- as.list(inputdata)
#withdraw miteimmtype from list
#listinput<- as.list(linputdata[c(1:5,7:16)]) 
outvar<- c("Colony Size","Adult Workers", "Foragers", "Worker Eggs", "Colony Pollen (g)", "Colony Nectar")
resvar<- c(1,3,4,10,18,20)
# breaks <- floor(length(timearray)/5)
# timebreak<- c(breaks,breaks*2,breaks*3,breaks*4,length(timearray))
tdoutput_con <- tdarray_con[488:611,resvar,1:Nsims]
tdoutput_exp <- tdarray_exp[488:611,resvar,1:Nsims]
dim(tdoutput_con)
dim(tdoutput_exp)

#CONTROL
srctdarray_con<- array(data=NA, c(124,6,16), dimnames = list(seq(as.Date("1989/05/01"), as.Date("1989/09/01"), by = "days"),
                                                           c("Colony Size","Adult Workers", "Foragers", "Worker Eggs","Colony Pollen (g)", "Colony Nectar (g)"),
                                                           c("Queen Strength", "Worker to Drone", "Drone-Mite Survivorship (%)", "Worker-Mite Survivorship (%)", "Forager Lifespan (days)", "Mite Imm Type", "Adult Slope", "Adult LD50", "Adult Slope Contact", "Adult LD50 Contact", "Larva slope", "Larva LD50", "KOW","KOC","Half life", "App Rate Control")))
pcctdarray_con<- array(data=NA, c(2,6,16), dimnames = list(c(as.Date("1989/06/01"), as.Date("1989/08/01")), 
                                                           c("Colony Size","Adult Workers", "Foragers", "Worker Eggs","Colony Pollen (g)", "Colony Nectar (g)"), 
                                                           c("Queen Strength", "Worker to Drone", "Drone-Mite Survivorship (%)", "Worker-Mite Survivorship (%)", "Forager Lifespan (days)", "Mite Imm Type", "Adult Slope", "Adult LD50", "Adult Slope Contact", "Adult LD50 Contact", "Larva slope", "Larva LD50", "KOW","KOC","Half life", "App Rate Control")))
#standard regression coefficients
for (i in 1:124){  #4 month period around application exposure
  for (j in 1:6){   #output variable
    for (k in 1:16){  #input variable
      tempinput<- tdoutput_con[i,j,1:1000]
      temp<- src(inputdata_con[1:1000,], tempinput, rank = T)
      srctdarray_con[i,j,k]<- temp$SRRC[[1]][k]
    }
  }
}

#partial correlation coefficients
for (j in 1:6){   #output variable
  for (k in 1:16){  #input variable
    tempinput<- tdoutput_con[31,j,1:1000]
    temp<- pcc(inputdata_con[1:1000,], tempinput, rank = T)
    pcctdarray_con[1,j,k]<- temp$PRCC[[1]][k]
  }
}


srcoutput_con<- adply(srctdarray_con[,,],2, cbind)
# write.csv(srcoutput, file = paste(vpdir_output, "srcoutput.csv", sep=""))
pccoutput_con<- adply(pcctdarray_con[,,],2, cbind)
# write.csv(pccoutput, file = paste(vpdir_output, "pccoutput.csv", sep=""))


#EXPOSED
srctdarray_exp<- array(data=NA, c(124,6,16), dimnames = list(seq(as.Date("1989/05/01"), as.Date("1989/09/01"), by = "days"),
                                                           c("Colony Size","Adult Workers", "Foragers", "Worker Eggs","Colony Pollen (g)", "Colony Nectar (g)"),
                                                           c("Queen Strength", "Worker to Drone", "Drone-Mite Survivorship (%)", "Worker-Mite Survivorship (%)", "Forager Lifespan (days)", "Mite Imm Type", "Adult Slope", "Adult LD50", "Adult Slope Contact", "Adult LD50 Contact", "Larva slope", "Larva LD50", "KOW","KOC","Half life", "App Rate Exposed")))
pcctdarray_exp<- array(data=NA, c(2,6,16), dimnames = list(c(as.Date("1989/06/01"), as.Date("1989/08/01")), 
                                                           c("Colony Size","Adult Workers", "Foragers", "Worker Eggs","Colony Pollen (g)", "Colony Nectar (g)"), 
                                                           c("Queen Strength", "Worker to Drone", "Drone-Mite Survivorship (%)", "Worker-Mite Survivorship (%)", "Forager Lifespan (days)", "Mite Imm Type", "Adult Slope", "Adult LD50", "Adult Slope Contact", "Adult LD50 Contact", "Larva slope", "Larva LD50", "KOW","KOC","Half life", "App Rate Exposed")))

#standard regression coefficients
for (i in c(31,93)){  #4 month period around application exposure
  for (j in 1:6){   #output variable
    for (k in 1:16){  #input variable
      tempinput<- tdoutput_exp[i,j,1:1000]
      temp<- src(inputdata_exp[1:1000,], tempinput, rank = T)
      srctdarray_exp[j,j,k]<- temp$SRRC[[1]][k]
    }
  }
}


#partial correlation coefficients
for (j in 1:6){   #output variable
  for (k in 1:16){  #input variable
    tempinput<- tdoutput_exp[93,j,1:1000]
    temp<- pcc(inputdata_exp[1:1000,], tempinput, rank = T)
    pcctdarray_exp[2,j,k]<- temp$PRCC[[1]][k]
  }
}

srcoutput_exp<- adply(srctdarray_exp[,,],2, cbind)
# write.csv(srcoutput, file = paste(vpdir_output, "srcoutput.csv", sep=""))
pccoutput_exp<- adply(pcctdarray_exp[,,],2, cbind)
# write.csv(pccoutput, file = paste(vpdir_output, "pccoutput.csv", sep=""))
