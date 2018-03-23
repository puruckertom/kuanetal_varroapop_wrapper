#############################  CONTROL ######################################
ndays <- length(timearray)
#timebreak<- c(breaks,breaks*2,breaks*3,breaks*4,length(timearray))
## load control data
#tdarray_control[day, output_variable, simulation]
dim(tdarray_control)
tdarray_control[1:10,,1]
#colony size is 1
tdoutput_control <- tdarray_control[,1,1:Nsims]
#tdoutput_control <- tdarray_control[timebreak,resvar,1:Nsims]
dim(tdoutput_control)
dim(inputdata_control)
nvars_control <- length(inputdata_control)

#create pcc array for control
tdarray_pccout_control<- array(data=NA, c(ndays,nvars_control-1)) #drop nonquant cols below

#partial correlation coefficients
dim(inputdata_control)
colnames(inputdata_control)
for (i in 1:ndays){  #break
  temp<- tdoutput_control[i,1:Nsims]
 ## inputdata_control$RQQueenStrength <- tdarray_control[i,27,] #replace output qs for requeen strength input
#  inputdata_control$AvgTemp <- tdarray_control[i,28,1:Nsims] #append avg temp to input dataframe
#  inputdata_control$Precip <- tdarray_control[i,29,1:Nsims] #append precip to input dataframe
  #drop nonquantitative input variables for pcc
  inputdata_control2 <- inputdata_control[-c(6)]
  print(dim(inputdata_control2))
  print(dim(temp))
  temp_pcc<- pcc(inputdata_control2, temp, rank = F)
  print(paste(i,"out of",ndays)) 
  print(dim(tdarray_pccout_control))
  tdarray_pccout_control[i,] <- temp_pcc$PCC[[1]]
}

#write control pcc results to disk
dim(tdarray_pccout_control)
save(tdarray_pccout_control, file = paste(vpdir_out_control,"tdarray_pccout_control.RData", sep = ""))


# #################  level1 ##################################################
ndays <- length(timearray)
#timebreak<- c(breaks,breaks*2,breaks*3,breaks*4,length(timearray))
## load level1 data
#tdarray_level1[day, output_variable, simulation]
dim(tdarray_level1)
head(tdarray_level1)
#colony size is 1
tdoutput_level1 <- tdarray_level1[,1,1:Nsims]
#tdoutput_level1 <- tdarray_level1[timebreak,resvar,1:Nsims]
dim(tdoutput_level1)
dim(inputdata_level1)
nvars_level1 <- length(inputdata_level1)

#create pcc array for level1
tdarray_pccout_level1<- array(data=NA, c(ndays,nvars_level1))

#partial correlation coefficients
for (i in 1:ndays){  #break
  temp<- tdoutput_level1[i,1:Nsims]
##  inputdata_level1$RQQueenStrength <- tdarray_level1[i,27,] #replace output qs for requeen strength input
#  inputdata_level1$AvgTemp <- tdarray_level1[i,28,1:Nsims] #append avg temp to input dataframe
#  inputdata_level1$Precip <- tdarray_level1[i,29,1:Nsims] #append precip to input dataframe
#  inputdata_level12 <- inputdata_level1[-c(6)]
  temp_pcc<- pcc(inputdata_level1, temp, rank = F)
  print(paste(i,"out of",ndays))
  tdarray_pccout_level1[i,] <- temp_pcc$PCC[[1]]
}

#write level1 pcc results to disk
dim(tdarray_pccout_level1)
save(tdarray_pccout_level1, file = paste(vpdir_out_level1,"tdarray_pccout_level1.RData", sep = ""))

# #################  level2 ##################################################
ndays <- length(timearray)
#timebreak<- c(breaks,breaks*2,breaks*3,breaks*4,length(timearray))
## load level2 data
#tdarray_level2[day, output_variable, simulation]
dim(tdarray_level2)
head(tdarray_level2)
#colony size is 1
tdoutput_level2 <- tdarray_level2[,1,1:Nsims]
#tdoutput_level2 <- tdarray_level2[timebreak,resvar,1:Nsims]
dim(tdoutput_level2)
dim(inputdata_level2)
nvars_level2 <- length(inputdata_level2)

#create pcc array for level2
tdarray_pccout_level2<- array(data=NA, c(ndays,nvars_level2))

#partial correlation coefficients
for (i in 1:ndays){  #break
  temp<- tdoutput_level2[i,1:Nsims]
##  inputdata_level2$RQQueenStrength <- tdarray_level2[i,27,] #replace output qs for requeen strength input
#  inputdata_level2$AvgTemp <- tdarray_level2[i,28,1:Nsims] #append avg temp to input dataframe
#  inputdata_level2$Precip <- tdarray_level2[i,29,1:Nsims] #append precip to input dataframe
#  inputdata_level22 <- inputdata_level2[-c(6)]
  temp_pcc<- pcc(inputdata_level2, temp, rank = F)
  print(paste(i,"out of",ndays))
  tdarray_pccout_level2[i,] <- temp_pcc$PCC[[1]]
}

#write level2 pcc results to disk
dim(tdarray_pccout_level2)
save(tdarray_pccout_level2, file = paste(vpdir_out_level2,"tdarray_pccout_level2.RData", sep = ""))

# #################  level3 ##################################################
ndays <- length(timearray)
#timebreak<- c(breaks,breaks*2,breaks*3,breaks*4,length(timearray))
## load level3 data
#tdarray_level3[day, output_variable, simulation]
dim(tdarray_level3)
head(tdarray_level3)
#colony size is 1
tdoutput_level3 <- tdarray_level3[,1,1:Nsims]
#tdoutput_level3 <- tdarray_level3[timebreak,resvar,1:Nsims]
dim(tdoutput_level3)
dim(inputdata_level3)
nvars_level3 <- length(inputdata_level3)

#create pcc array for level3
tdarray_pccout_level3<- array(data=NA, c(ndays,nvars_level3))

#partial correlation coefficients
for (i in 1:ndays){  #break
  temp<- tdoutput_level3[i,1:Nsims]
##  inputdata_level3$RQQueenStrength <- tdarray_level3[i,27,] #replace output qs for requeen strength input
#  inputdata_level3$AvgTemp <- tdarray_level3[i,28,1:Nsims] #append avg temp to input dataframe
#  inputdata_level3$Precip <- tdarray_level3[i,29,1:Nsims] #append precip to input dataframe
#  inputdata_level32 <- inputdata_level3[-c(6)]
  temp_pcc<- pcc(inputdata_level3, temp, rank = F)
  print(paste(i,"out of",ndays))
  tdarray_pccout_level3[i,] <- temp_pcc$PCC[[1]]
}

#write level3 pcc results to disk
dim(tdarray_pccout_level3)
save(tdarray_pccout_level3, file = paste(vpdir_out_level3,"tdarray_pccout_level3.RData", sep = ""))


# 
# #################  level4 ##################################################
ndays <- length(timearray)
#timebreak<- c(breaks,breaks*2,breaks*3,breaks*4,length(timearray))
## load level4 data
#tdarray_level4[day, output_variable, simulation]
dim(tdarray_level4)
head(tdarray_level4)
#colony size is 1
tdoutput_level4 <- tdarray_level4[,1,1:Nsims]
#tdoutput_level4 <- tdarray_level4[timebreak,resvar,1:Nsims]
dim(tdoutput_level4)
dim(inputdata_level4)
nvars_level4 <- length(inputdata_level4)

#create pcc array for level4
tdarray_pccout_level4<- array(data=NA, c(ndays,nvars_level4))

#partial correlation coefficients
for (i in 1:ndays){  #break
  temp<- tdoutput_level4[i,1:Nsims]
  ##  inputdata_level4$RQQueenStrength <- tdarray_level4[i,27,] #replace output qs for requeen strength input
  #  inputdata_level4$AvgTemp <- tdarray_level4[i,28,1:Nsims] #append avg temp to input dataframe
  #  inputdata_level4$Precip <- tdarray_level4[i,29,1:Nsims] #append precip to input dataframe
 # inputdata_level42 <- inputdata_level4[-c(6)]
  temp_pcc<- pcc(inputdata_level4, temp, rank = F)
  print(paste(i,"out of",ndays))
  tdarray_pccout_level4[i,] <- temp_pcc$PCC[[1]]
}

#write level4 pcc results to disk
dim(tdarray_pccout_level4)
save(tdarray_pccout_level4, file = paste(vpdir_out_level4,"tdarray_pccout_level4.RData", sep = ""))



#############################################################################################
####

# #customize colors
# #line_colors_level1 <- rep("#CC6666",nvars)
# #line_colors_level1[1:10] <- "#9999CC"
# line_colors_level1 <- unlist(rep(rep("steelblue",35),1097))
# 
# length(line_colors_level1)
# dim(tdarray_pccout_level1)
# colnames(tdarray_pccout_level1) <- colnames(inputdata_level1)
# colnames(tdarray_pccout_level1)
# date <- 1:ndays
# 
# #qs = melted_level1$value[which(melted_level1$variable=="queenstrength")]
# #plot level1 daily sensitivities
# pdf(file= paste(vpdir_fig, "daily_sensitivity_level1.pdf", sep=""), width = 8, height = 6)
#   pcc_level1 <- as.data.frame(cbind(date, tdarray_pccout_level1))
#   colnames(pcc_level1)
#   melted_level1 = melt(pcc_level1, id.vars="date")
#   ggplot(melted_level1, aes(x=date, y=value, group=variable)) +
#     geom_line(aes(colour=melted_level1$variable)) +
#     #geom_line(aes(y=qs), colour = "red") +
#     xlab("Simulation Day") + 
#     ylab("Partial Correlation Coefficient") +
#     #scale_color_manual(values=c("coral", "chocolate", "cornsilk", "papayawhip", "blanchedalmond")) +
#     ggtitle("Daily Sensitivity (PCC) for level1 Scenario") +
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


