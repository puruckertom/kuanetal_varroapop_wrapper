#SENSITIVITY ANALYSIS####
#create input dataframes and arrays
#d <- as.data.frame(rbind(drnmitesurvive, fgrlifespan, queenstrength, wkrdrnratio, wkrmitesurvive, adslopec, adLD50c, lslope, lLD50, kow, koc, halflife))
#dt<- as.data.frame(t(d))
#dim(dt)

breaks <- floor(length(time)/5)
year<- c(breaks,breaks*2,breaks*3,breaks*4,length(time))
resvar<- c(1,3,4,10,18,20)
tdoutput <- tdarray[year,resvar,1:1000]
dim(tdoutput)
srctdarray<- array(data=NA, c(5,6,16), dimnames = list(c("year1", "year2", "year3", "year4", "year5"),
                                                       c("Colony Size","Adult Workers", "Foragers", "Worker Eggs","Colony Pollen (g)", "Colony Nectar (g)"),
                                                       c("Queen Strength", "Worker to Drone", "Drone-Mite Survivorship (%)", "Worker-Mite Survivorship (%)", "Forager Lifespan (days)", "Mite Imm Type", "Adult Slope", "Adult LD50", "Adult Slope Contact", "Adult LD50 Contact", "Larva slope", "Larva LD50", "KOW","KOC","Half life", "App Rate")))
pcctdarray<- array(data=NA, c(5,6,16), dimnames = list(c("year1", "year2", "year3", "year4", "year5"), 
                                                       c("Colony Size","Adult Workers", "Foragers", "Worker Eggs","Colony Pollen (g)", "Colony Nectar (g)"), 
                                                       c("Queen Strength", "Worker to Drone", "Drone-Mite Survivorship (%)", "Worker-Mite Survivorship (%)", "Forager Lifespan (days)", "Mite Imm Type", "Adult Slope", "Adult LD50", "Adult Slope Contact", "Adult LD50 Contact", "Larva slope", "Larva LD50", "KOW","KOC","Half life", "App Rate")))

#standard regression coefficients
for (i in 1:5){  #year
  for (j in 1:6){   #output variable
    for (k in 1:16){  #input variable
      tempinput<- tdoutput[i,j,1:1000]
      temp<- src(inputdata[1:1000,], tempinput, rank = T)
      srctdarray[i,j,k]<- temp$SRRC[[1]][k]
    }
  }
}


#partial correlation coefficients
for (i in 1:5){  #year
  for (j in 1:6){   #output variable
    for (k in 1:16){  #input variable
      tempinput<- tdoutput[i,j,1:1000]
      temp<- pcc(inputdata[1:1000,], tempinput, rank = T)
      pcctdarray[i,j,k]<- temp$PRCC[[1]][k]
    }
  }
}

srcoutput<- adply(srctdarray[,,],2, cbind)
row.names(srcoutput)<- make.names(rep(c("year"), times = 5, length.out = 30), unique = T)
# write.csv(srcoutput, file = paste(vpdir_output, "srcoutput_", now, ".csv", sep=""))
pccoutput<- adply(pcctdarray[,,],2, cbind)
row.names(pccoutput)<- make.names(rep(c("year"), times = 5, length.out = 30), unique = T)
# write.csv(pccoutput, file = paste(vpdir_output, "pccoutput_", now, ".csv", sep=""))


#stacking arrays for .csv file #####

#now<- Sys.time()
#now<- as.POSIXlt(now)
#now<- format(now, "%Y%m%d%H%M", tz="")

#temparray <- tdarray[1:nrows,resvar,1:1000]
#tempdf<- adply(temparray[,1:3,],2, cbind) #colony size, adult workers, foragers
#row.names(tempdf)<- make.names(as.character(rep(time,3)), unique = T)
#write.csv(tempdf, file = paste(vpdir_output,"sim_results1_", now, ".csv", sep= ""))
#tempdf2<- adply(temparray[,4:6,],2, cbind) #worker eggs, colony pollen, colony nectar
#row.names(tempdf2)<- make.names(as.character(rep(time,3)), unique = T)
#write.csv(tempdf2, file = paste(vpdir_output,"sim_results2_", now, ".csv", sep=""))

