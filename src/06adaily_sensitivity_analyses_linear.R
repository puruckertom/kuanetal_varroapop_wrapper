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
nvars_control <- length(inputdata_control)

#create pcc array for control
tdarray_pccout_control<- array(data=NA, c(ndays,nvars_control), dimnames =colnames(inputdata_control))

#partial correlation coefficients
for (i in 1:Nsims){  #break
  temp<- tdoutput_control[i,1:Nsims]
  inputdata_control$RQQueenStrength <- tdarray_control[i,27,] #replace output qs for requeen strength input
  inputdata_control$AvgTemp <- tdarray_control[i,28,1:Nsims] #append avg temp to input dataframe
  inputdata_control$Precip <- tdarray_control[i,29,1:Nsims] #append precip to input dataframe
  temp_pcc<- pcc(inputdata_control, temp, rank = F)
  print(paste(i,"out of",ndays))
  tdarray_pccout_control[i,] <- temp_pcc$PCC[[1]]
}

#write control pcc results to disk
dim(tdarray_pccout_control)
save(tdarray_pccout_control, file = paste(vpdir_out_control,"tdarray_pccout_control.RData", sep = ""))


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
nvars_foliar <- length(inputdata_foliar)

#create pcc array for foliar
tdarray_pccout_foliar<- array(data=NA, c(ndays,nvars_foliar), dimnames =colnames(inputdata_foliar))

#partial correlation coefficients
for (i in 1:ndays){  #break
  tempinput<- tdoutput_foliar[i,1:Nsims]
  inputdata_foliar$RQQueenStrength <- tdarray_foliar[i,27,] #replace output qs for requeen strength input
  inputdata_foliar$AvgTemp <- tdarray_foliar[i,28,1:Nsims] #append avg temp to input dataframe
  inputdata_foliar$Precip <- tdarray_foliar[i,29,1:Nsims] #append precip to input dataframe
  temp_pcc<- pcc(inputdata_foliar[1:Nsims,], tempinput, rank = F)
  print(paste(i,"out of",ndays))
  tdarray_pccout_foliar[i,] <- temp_pcc$PCC[[1]]
}

#write foliar pcc results to disk
dim(tdarray_pccout_foliar)
save(tdarray_pccout_foliar, file = paste(vpdir_out_foliar,"tdarray_pccout_foliar.RData", sep = ""))

#################  soil ##################################################
ndays <- length(timearray)
#timebreak<- c(breaks,breaks*2,breaks*3,breaks*4,length(timearray))
## load soil data
#tdarray_soil[day, output_variable, simulation]
dim(tdarray_soil)
head(tdarray_soil)
#colony size is 1
tdoutput_soil <- tdarray_soil[,1,1:Nsims]
#tdoutput_soil <- tdarray_soil[timebreak,resvar,1:Nsims]
dim(tdoutput_soil)
dim(inputdata_soil)
nvars_soil <- length(inputdata_soil)

#create pcc array for soil
tdarray_pccout_soil<- array(data=NA, c(ndays,nvars_soil), dimnames =colnames(inputdata_soil))

#partial correlation coefficients
for (i in 1:ndays){  #break
  tempinput<- tdoutput_soil[i,1:Nsims]
  inputdata_soil$RQQueenStrength <- tdarray_soil[i,27,] #replace output qs for requeen strength input
  inputdata_soil$AvgTemp <- tdarray_soil[i,28,1:Nsims] #append avg temp to input dataframe
  inputdata_soil$Precip <- tdarray_soil[i,29,1:Nsims] #append precip to input dataframe
  temp_pcc<- pcc(inputdata_soil[1:Nsims,], tempinput, rank = F)
  print(paste(i,"out of",ndays))
  tdarray_pccout_soil[i,] <- temp_pcc$PCC[[1]]
}

#write soil pcc results to disk
dim(tdarray_pccout_soil)
save(tdarray_pccout_soil, file = paste(vpdir_out_soil,"tdarray_pccout_soil.RData", sep = ""))

#################  seed ##################################################
ndays <- length(timearray)
#timebreak<- c(breaks,breaks*2,breaks*3,breaks*4,length(timearray))
## load seed data
#tdarray_seed[day, output_variable, simulation]
dim(tdarray_seed)
head(tdarray_seed)
#colony size is 1
tdoutput_seed <- tdarray_seed[,1,1:Nsims]
#tdoutput_seed <- tdarray_seed[timebreak,resvar,1:Nsims]
dim(tdoutput_seed)
dim(inputdata_seed)
nvars_seed <- length(inputdata_seed)

#create pcc array for seed
tdarray_pccout_seed<- array(data=NA, c(ndays,nvars_seed), dimnames =colnames(inputdata_seed))

#partial correlation coefficients
for (i in 1:ndays){  #break
  tempinput<- tdoutput_seed[i,1:Nsims]
  inputdata_seed$RQQueenStrength <- tdarray_seed[i,27,] #replace output qs for requeen strength input
  inputdata_seed$AvgTemp <- tdarray_seed[i,28,1:Nsims] #append avg temp to input dataframe
  inputdata_seed$Precip <- tdarray_seed[i,29,1:Nsims] #append precip to input dataframe
  temp_pcc<- pcc(inputdata_seed, tempinput, rank = F)
  print(paste(i,"out of",ndays))
  tdarray_pccout_seed[i,] <- temp_pcc$PCC[[1]]
}

#write seed pcc results to disk
dim(tdarray_pccout_seed)
save(tdarray_pccout_seed, file = paste(vpdir_out_seed,"tdarray_pccout_seed.RData", sep = ""))





#############################################################################################
####

# #customize colors
# #line_colors_foliar <- rep("#CC6666",nvars)
# #line_colors_foliar[1:10] <- "#9999CC"
# line_colors_foliar <- unlist(rep(rep("steelblue",35),1097))
# 
# length(line_colors_foliar)
# dim(tdarray_pccout_foliar)
# colnames(tdarray_pccout_foliar) <- colnames(inputdata_foliar)
# colnames(tdarray_pccout_foliar)
# date <- 1:ndays
# 
# #qs = melted_foliar$value[which(melted_foliar$variable=="queenstrength")]
# #plot foliar daily sensitivities
# pdf(file= paste(vpdir_fig, "daily_sensitivity_foliar.pdf", sep=""), width = 8, height = 6)
#   pcc_foliar <- as.data.frame(cbind(date, tdarray_pccout_foliar))
#   colnames(pcc_foliar)
#   melted_foliar = melt(pcc_foliar, id.vars="date")
#   ggplot(melted_foliar, aes(x=date, y=value, group=variable)) +
#     geom_line(aes(colour=melted_foliar$variable)) +
#     #geom_line(aes(y=qs), colour = "red") +
#     xlab("Simulation Day") + 
#     ylab("Partial Correlation Coefficient") +
#     #scale_color_manual(values=c("coral", "chocolate", "cornsilk", "papayawhip", "blanchedalmond")) +
#     ggtitle("Daily Sensitivity (PCC) for Foliar Scenario") +
#     theme_bw()
# dev.off()
# 




#parallel not working for sensitivity:pcc
# #parallel version
# library(foreach)
# if(Sys.info()['sysname'] != "Windows"){
#   require("doMC")
#   registerDoMC(Ncores)
# }else{
#   require("doParallel")
#   cl <- makeCluster(2)
#   registerDoParallel(cl)
#   #snow is also an option
# }
# 
# foreach(i = 1:ndays, .options.multicore=list(preschedule=TRUE)) %dopar% {
#   tempinput<- tdoutput_control[i,1:Nsims]
#   #pcc(input_dataframe, output, rank = FALSE, nboot = 0, conf = 0.95)
#   temp_pcc<- pcc(inputdata_control[1:Nsims,], tempinput, rank = F)
#   print(paste(i,"out of",ndays))
#   tdarray_pccout_control[i,] <- temp_pcc$PCC[[1]]
# }


