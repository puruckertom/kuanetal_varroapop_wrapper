#plot crunching ###########
#colony persistence
cp_control <- rep(NA, nrows)
cp_level1 <- rep(NA, nrows)
cp_level2 <- rep(NA, nrows)
cp_level3 <- rep(NA, nrows)
cp_level4 <- rep(NA, nrows)
for (n in 1:nrows){
  x <- which(tdarray_control[n,1,1:Nsims] > 1000) # queries colony size > 1000 for 1000 simulations at each time point
  y <- which(tdarray_level1[n,1,1:Nsims] > 1000)
  z <- which(tdarray_level2[n,1,1:Nsims] > 1000)
  zz <- which(tdarray_level3[n,1,1:Nsims] > 1000)
  zzz <- which(tdarray_level4[n,1,1:Nsims] > 1000)
  cp_control[n] <- length(x)/Nsims #appends vector x with proportion of simulations per time step with Col Size > 0
  cp_level1[n] <- length(y)/Nsims
  cp_level2[n] <- length(z)/Nsims
  cp_level3[n] <- length(zz)/Nsims
  cp_level4[n] <- length(zzz)/Nsims
}

#foragers
fa_control <- rep(NA, nrows)
fa_level1 <- rep(NA, nrows)
fa_level2 <- rep(NA, nrows)
fa_level3 <- rep(NA, nrows)
fa_level4 <- rep(NA, nrows)
for (n in 1:nrows){
  x <- which(tdarray_control[n,4,1:Nsims] > 50) 
  y <- which(tdarray_level1[n,4,1:Nsims] > 50)
  z <- which(tdarray_level2[n,4,1:Nsims] > 50)
  zz <- which(tdarray_level3[n,4,1:Nsims] > 50)
  zzz <- which(tdarray_level4[n,4,1:Nsims] > 50)
  fa_control[n] <- length(x)/Nsims
  fa_level1[n] <- length(y)/Nsims
  fa_level2[n] <- length(z)/Nsims
  fa_level3[n] <- length(zz)/Nsims
  fa_level4[n] <- length(zzz)/Nsims
}

#adult workers
aw_control <- rep(NA, nrows)
aw_level1 <- rep(NA, nrows)
aw_level2 <- rep(NA, nrows)
aw_level3 <- rep(NA, nrows)
aw_level4 <- rep(NA, nrows)
for (n in 1:nrows){
  x <- which(tdarray_control[n,3,1:Nsims] > 50)
  y <- which(tdarray_level1[n,3,1:Nsims] > 50)
  z <- which(tdarray_level2[n,3,1:Nsims] > 50)
  zz <- which(tdarray_level3[n,3,1:Nsims] > 50)
  zzz <- which(tdarray_level4[n,3,1:Nsims] > 50)
  aw_control[n] <- length(x)/Nsims
  aw_level1[n] <- length(y)/Nsims
  aw_level2[n] <- length(z)/Nsims
  aw_level3[n] <- length(zz)/Nsims
  aw_level4[n] <- length(zzz)/Nsims
}

#capped worker brood
cwb_control <- rep(NA, nrows)
cwb_level1 <- rep(NA, nrows)
cwb_level2 <- rep(NA, nrows)
cwb_level3 <- rep(NA, nrows)
cwb_level4 <- rep(NA, nrows)
for (n in 1:nrows){
  x <- which(tdarray_control[n, 6, 1:Nsims] > 50)
  y <- which(tdarray_level1[n, 6, 1:Nsims] > 50)
  z <- which(tdarray_level2[n, 6, 1:Nsims] > 50)
  zz <- which(tdarray_level3[n, 6, 1:Nsims] > 50)
  zzz <- which(tdarray_level4[n, 6, 1:Nsims] > 50)
  cwb_control[n] <- length(x)/Nsims
  cwb_level1[n] <- length(y)/Nsims
  cwb_level2[n] <- length(z)/Nsims
  cwb_level3[n] <- length(zz)/Nsims
  cwb_level4[n] <- length(zzz)/Nsims
}

#worker eggs
we_control <- rep(NA, nrows)
we_level1 <- rep(NA, nrows)
we_level2 <- rep(NA, nrows)
we_level3 <- rep(NA, nrows)
we_level4 <- rep(NA, nrows)
for (n in 1:nrows){
  x <- which(tdarray_control[n,10,1:Nsims] > 50)
  y <- which(tdarray_level1[n,10,1:Nsims] > 50)
  z <- which(tdarray_level2[n,10,1:Nsims] > 50)
  zz <- which(tdarray_level3[n,10,1:Nsims] > 50)
  zzz <- which(tdarray_level4[n,10,1:Nsims] > 50)
  we_control[n] <- length(x)/Nsims
  we_level1[n] <- length(y)/Nsims
  we_level2[n] <- length(z)/Nsims
  we_level3[n] <- length(zz)/Nsims
  we_level4[n] <- length(zzz)/Nsims
}

#drone eggs
de_control <- rep(NA, nrows)
de_level1 <- rep(NA, nrows)
de_level2 <- rep(NA, nrows)
de_level3 <- rep(NA, nrows)
de_level4 <- rep(NA, nrows)
for (n in 1:nrows){
  x <- which(tdarray_control[n,9,1:Nsims] > 0)
  y <- which(tdarray_level1[n,9,1:Nsims] > 0)
  z <- which(tdarray_level2[n,9,1:Nsims] > 0)
  zz <- which(tdarray_level3[n,9,1:Nsims] > 0)
  zzz <- which(tdarray_level4[n,9,1:Nsims] > 0)
  de_control[n] <- length(x)/Nsims
  de_level1[n] <- length(y)/Nsims
  de_level2[n] <- length(z)/Nsims
  de_level3[n] <- length(zz)/Nsims
  de_level4[n] <- length(zzz)/Nsims
}


#free mites
fm_control <- rep(NA, nrows)
fm_level1 <- rep(NA, nrows)
fm_level2 <- rep(NA, nrows)
fm_level3 <- rep(NA, nrows)
fm_level4 <- rep(NA, nrows)
for (n in 1:nrows){
  x <- which(tdarray_control[n,11,1:Nsims] > 0)
  y <- which(tdarray_level1[n,11,1:Nsims] > 0)
  z <- which(tdarray_level2[n,11,1:Nsims] > 0)
  zz <- which(tdarray_level3[n,11,1:Nsims] > 0)
  zzz <- which(tdarray_level4[n,11,1:Nsims] > 0)
  fm_control[n] <- length(x)/Nsims
  fm_level1[n] <- length(y)/Nsims
  fm_level2[n] <- length(z)/Nsims
  fm_level3[n] <- length(zz)/Nsims
  fm_level4[n] <- length(zzz)/Nsims
}

# #dead foragers
# dfr_con <- rep(NA, nrows)
# dfr_exp <- rep(NA, nrows)
# for (n in 1:nrows){
#   x <- which(tdarray_con[n,1,1:Nsims] > 0) 
#   y <- which(tdarray_exp[n,1,1:Nsims] > 0) 
#   dfr_con[n] <- length(x)/Nsims 
#   dfr_exp[n] <- length(y)/Nsims
# }
# 
# #dead mites
# dm_con <- rep(NA, nrows)
# dm_exp <- rep(NA, nrows)
# for (n in 1:nrows){
#   x <- which(tdarray_con[n,16,1:Nsims] > 0)
#   y <- which(tdarray_exp[n,16,1:Nsims] > 0)
#   dm_con[n] <- length(x)/Nsims
#   dm_exp[n] <- length(y)/Nsims
# }
# 
#capped drone brood
cdb_control <- rep(NA, nrows)
cdb_level1 <- rep(NA, nrows)
cdb_level2 <- rep(NA,nrows)
cdb_level3 <- rep(NA,nrows)
cdb_level4 <- rep(NA,nrows)
for (n in 1:nrows){
  x <- which(tdarray_control[n, 5, 1:Nsims] > 50)
  y <- which(tdarray_level1[n, 5, 1:Nsims] > 50)
  z <- which(tdarray_level2[n,5,1:Nsims] > 50)
  zz <- which(tdarray_level3[n,5,1:Nsims] > 50)
  zzz <- which(tdarray_level4[n,5,1:Nsims] > 50)
  cdb_control[n] <- length(x)/Nsims
  cdb_level1[n] <- length(y)/Nsims
  cdb_level2[n] <- length(z)/Nsims
  cdb_level3[n] <- length(zz)/Nsims
  cdb_level4[n] <- length(zzz)/Nsims
}


#MC proportions ##########
pdf(file= paste(vpdir_fig, "fig_1_MCproportions_convsexp.pdf", sep=""), width = 5, height = 9, onefile = TRUE, paper = "USr")
  #start figures
  par(mfrow=c(6,1), mar=c(2,4,1,0.5), oma=c(4,2,2,1))
  plot(timearray, cp_control, type="l", col="blue", ylab = "P(Colony Size) > 1000", ylim=c(0,1), xlab=NA)
  lines(timearray, cp_level1, type="l", lty = 2, col="red")
  lines(timearray, cp_level2, type="l", lty = 2, col="black")
  lines(timearray, cp_level3, type="l", lty = 2, col="green")
  lines(timearray, cp_level4, type="l", lty = 2, col="orange")
  plot(timearray, fa_control, type="l", col="blue", ylab= "P(Foragers) > 50", ylim=c(0,1), xlab=NA) 
  lines(timearray, fa_level1, type="l", lty = 2, col="red")
  lines(timearray, fa_level2, type="l", lty = 2, col="black")
  lines(timearray, fa_level3, type="l", lty = 2, col="green")
  lines(timearray, fa_level4, type="l", lty = 2, col="orange")
  plot(timearray, aw_control, type="l", col="blue", ylab= "P(Adult Workers) > 50", ylim=c(0,1), xlab=NA) 
  lines(timearray, aw_level1, type="l", lty = 2, col="red")
  lines(timearray, aw_level2, type="l", lty = 2, col="black")
  lines(timearray, aw_level3, type="l", lty = 2, col="green")
  lines(timearray, aw_level4, type="l", lty = 2, col="orange")
  plot(timearray, cwb_control, type="l", col="blue", ylab = "P(Capped Worker Brood) > 50", ylim=c(0,1), xlab=NA)
  lines(timearray, cwb_level1, type="l", lty = 2, col="red")
  lines(timearray, cwb_level2, type="l", lty = 2, col="black")
  lines(timearray, cwb_level3, type="l", lty = 2, col="green")
  lines(timearray, cwb_level4, type="l", lty = 2, col="orange")
  # plot(timearray, we_control, type="l", col="blue", ylab = "P(Worker Eggs) > 50", ylim=c(0,1), xlab=NA)
  # lines(timearray, we_level1, type="l", lty = 2, col="red")
  # lines(timearray, we_level3, type="l", lty = 2, col="black")
  # lines(timearray, we_level2, type="l", lty = 2, col="green")
  plot(timearray, cdb_control, type="l", col="blue", ylab= "P(Capped Drone Brood) > 50", ylim=c(0,1), xlab=NA)
  lines(timearray, cdb_level1, type="l", lty = 2, col="red")
  lines(timearray, cdb_level2, type="l", lty = 2, col="black")
  lines(timearray, cdb_level3, type="l", lty = 2, col="green")
  lines(timearray, cdb_level4, type="l", lty = 2, col="orange")
  plot(timearray, de_control, type="l", col="blue", ylab = "P(Drone Eggs) > 0", ylim=c(0,1), xlab=NA)
  lines(timearray, de_level1, type="l", lty = 2, col="red")
  lines(timearray, de_level2, type="l", lty = 2, col="black")
  lines(timearray, de_level3, type="l", lty = 2, col="green")
  lines(timearray, de_level4, type="l", lty = 2, col="orange")
  # plot(timearray, fm_control, type="l", col="blue", ylab= "P(Free Mites) > 0", ylim=c(0,1), xlab=NA)
  # lines(timearray, fm_level1, type="l", lty = 2, col="red")
  # lines(timearray, fm_level3, type="l", lty = 2, col="black")
  # lines(timearray, fm_level2, type="l", lty = 2, col="green")
  #plot(timearray, dfr_con, type="l", col="blue", ylab= "P(Dead Foragers) > 0", ylim=c(0,1), xlab=NA) 
  #lines(timearray, dfr_exp, type="l", lty = 2, col="red")
  #mtext(text = paste("Fig. 1 Proportion of simulations with values greater than zero"), side = 1, line = 1, outer = T)
dev.off()

# png(file= paste(vpdir_fig, "fig_1_MCproportions_convsexp.png", sep=""), width = 7, height = 10, units='in', pointsize=12, res=300)
# par(mfrow=c(6,1), mar=c(2,4,1,0.5), oma=c(4,2,2,1))
# plot(timearray, cp_control, type="l", col="blue", ylab = "P(Colony Size) > 1000", ylim=c(0,1), xlab=NA)
# lines(timearray, cp_level1, type="l", lty = 2, col="red")
# lines(timearray, cp_level3, type="l", lty = 2, col="black")
# lines(timearray, cp_level2, type="l", lty = 2, col="green")
# plot(timearray, fa_control, type="l", col="blue", ylab= "P(Foragers) > 50", ylim=c(0,1), xlab=NA) 
# lines(timearray, fa_level1, type="l", lty = 2, col="red")
# lines(timearray, fa_level3, type="l", lty = 2, col="black")
# lines(timearray, fa_level2, type="l", lty = 2, col="green")
# plot(timearray, aw_control, type="l", col="blue", ylab= "P(Adult Workers) > 50", ylim=c(0,1), xlab=NA) 
# lines(timearray, aw_level1, type="l", lty = 2, col="red")
# lines(timearray, aw_level3, type="l", lty = 2, col="black")
# lines(timearray, aw_level2, type="l", lty = 2, col="green")
# plot(timearray, cwb_control, type="l", col="blue", ylab = "P(Capped Worker Brood) > 50", ylim=c(0,1), xlab=NA)
# lines(timearray, cwb_level1, type="l", lty = 2, col="red")
# lines(timearray, cwb_level3, type="l", lty = 2, col="black")
# lines(timearray, cwb_level2, type="l", lty = 2, col="green")
# plot(timearray, we_control, type="l", col="blue", ylab = "P(Worker Eggs) > 50", ylim=c(0,1), xlab=NA)
# lines(timearray, we_level1, type="l", lty = 2, col="red")
# lines(timearray, we_level3, type="l", lty = 2, col="black")
# lines(timearray, we_level2, type="l", lty = 2, col="green")
# plot(timearray, de_control, type="l", col="blue", ylab = "P(Drone Eggs) > 0", ylim=c(0,1), xlab=NA)
# lines(timearray, de_level1, type="l", lty = 2, col="red")
# lines(timearray, de_level3, type="l", lty = 2, col="black")
# lines(timearray, de_level2, type="l", lty = 2, col="green")
# dev.off()

#time series plotting #######
resvar<- c(1,3,4,6,13) #colony size, adult wkr, foragers, capped wkr brood, wbrood mites
resvar_names<- c("Colony Size","Adult Workers", "Foragers", "Capped Worker Brood", "Worker Brood Mites")

temparray_control <- tdarray_control[1:nrows,resvar,1:Nsims]
temparray_level1 <- tdarray_level1[1:nrows,resvar,1:Nsims]
temparray_level2 <- tdarray_level2[1:nrows,resvar,1:Nsims]
temparray_level3 <- tdarray_level3[1:nrows, resvar, 1:Nsims]
temparray_level4 <- tdarray_level4[1:nrows, resvar, 1:Nsims]
dimnames(temparray_control)<- list(c(as.character(timearray)), c(resvar_names))
dimnames(temparray_level1)<- list(c(as.character(timearray)), c(resvar_names))
dimnames(temparray_level2)<- list(c(as.character(timearray)), c(resvar_names))
dimnames(temparray_level3)<- list(c(as.character(timearray)), c(resvar_names))
dimnames(temparray_level4)<- list(c(as.character(timearray)), c(resvar_names))
tempout_control<- array(data=NA, c(nrows,5,3), dimnames = list(c(as.character(timearray)), 
                                                           c("Colony Size","Adult Workers", "Foragers", "Capped Worker Brood", "Worker Brood Mites"),
                                                           c("25%","50%","75%")))
tempout_level1<- array(data=NA, c(nrows,5,3), dimnames = list(c(as.character(timearray)), 
                                                           c("Colony Size","Adult Workers", "Foragers", "Capped Worker Brood", "Worker Brood Mites"), 
                                                           c("25%","50%","75%")))
tempout_level2<- array(data=NA, c(nrows,5,3), dimnames = list(c(as.character(timearray)), 
                                                              c("Colony Size","Adult Workers", "Foragers", "Capped Worker Brood", "Worker Brood Mites"), 
                                                              c("25%","50%","75%")))
tempout_level3<- array(data=NA, c(nrows,5,3), dimnames = list(c(as.character(timearray)), 
                                                              c("Colony Size","Adult Workers", "Foragers", "Capped Worker Brood", "Worker Brood Mites"), 
                                                              c("25%","50%","75%")))
tempout_level4<- array(data=NA, c(nrows,5,3), dimnames = list(c(as.character(timearray)), 
                                                              c("Colony Size","Adult Workers", "Foragers", "Capped Worker Brood", "Worker Brood Mites"), 
                                                              c("25%","50%","75%")))
for (r in 1:5){
  for (t in 1:nrows){
    p<- quantile(temparray_control[t, r, 1:Nsims])
    z<- quantile(temparray_level1[t, r, 1:Nsims])
    q<- quantile(temparray_level2[t, r, 1:Nsims])
    n<- quantile(temparray_level3[t,r,1:Nsims])
    k<- quantile(temparray_level4[t,r,1:Nsims])
    for (s in 1:3){
      quant_control<- c(p[[2]], p[[3]], p[[4]])
      quant_level1<- c(z[[2]], z[[3]], z[[4]])
      quant_level2<- c(q[[2]],q[[3]],q[[4]])
      quant_level3<- c(n[[2]],n[[3]],n[[4]])
      quant_level4<- c(k[[2]],k[[3]],k[[4]])
      tempout_control[t,r,s]<- quant_control[s]
      tempout_level1[t,r,s]<- quant_level1[s]
      tempout_level2[t,r,s]<- quant_level2[s]
      tempout_level3[t,r,s]<- quant_level3[s]
      tempout_level4[t,r,s]<- quant_level4[s]
    }
  }
}

#create PDF timeseries
pdf(file= paste(vpdir_fig, "fig_quantile_timeseries_2.pdf", sep=""), width = 8.5, height = 11, onefile = TRUE, paper = "USr")
#start figures
#time series plots
par(mfrow=c(5,5), mar=c(2, 4, 2, 0.5), oma= c(3,2,2,6.5))

for (r in 1:5){
  plot(timearray, tempout_control[,r,2], type = "l", ylim = c(0,max(tempout_control[,r,3])), ylab= paste(resvar_names[r]), xlab = NA, main= "Control")
  lines(timearray, tempout_control[,r,1], type = "l", lty= 2, col = "red")
  lines(timearray, tempout_control[,r,3], type = "l", lty= 4, col = "blue")
  
  plot(timearray, tempout_level1[,r,2], type = "l", ylim = c(0,max(tempout_level1[,r,3])), ylab= paste(resvar_names[r]), xlab = NA, main= "level1")
  lines(timearray, tempout_level1[,r,1], type = "l", lty= 2, col = "red")
  lines(timearray, tempout_level1[,r,3], type = "l", lty= 4, col = "blue")
  
  plot(timearray, tempout_level2[,r,2], type = "l", ylim = c(0,max(tempout_level2[,r,3])), ylab= paste(resvar_names[r]), xlab = NA, main= "level2")
  lines(timearray, tempout_level2[,r,1], type = "l", lty= 2, col = "red")
  lines(timearray, tempout_level2[,r,3], type = "l", lty= 4, col = "blue")
  
  plot(timearray, tempout_level3[,r,2], type = "l", ylim = c(0,max(tempout_level3[,r,3])), ylab= paste(resvar_names[r]), xlab = NA, main= "level3")
  lines(timearray, tempout_level3[,r,1], type = "l", lty= 2, col = "red")
  lines(timearray, tempout_level3[,r,3], type = "l", lty= 4, col = "blue")
  
  plot(timearray, tempout_level4[,r,2], type = "l", ylim = c(0,max(tempout_level4[,r,3])), ylab= paste(resvar_names[r]), xlab = NA, main= "level4")
  lines(timearray, tempout_level4[,r,1], type = "l", lty= 2, col = "red")
  lines(timearray, tempout_level4[,r,3], type = "l", lty= 4, col = "blue")
}
#mtext(text = paste("Fig. 14 Time series plots of lower, middle, and upper quartiles."), side = 1, line = 1, outer = T)
dev.off()
# 
#create PDF timeseries
pdf(file= paste(vpdir_fig, "fig_quantile_timeseries_simple.pdf", sep=""), width = 8.5, height = 11, onefile = TRUE, paper = "USr")
#start figures
#time series plots
#par(mfrow=c(1,5))#, mar=c(2, 4, 2, 0.5), oma= c(3,2,2,6.5))

for (r in 1:1){
  plot(timearray, tempout_control[,r,2], type = "l", ylim = c(0,max(tempout_control[,r,3])), ylab= paste(resvar_names[r]), xlab = NA, main= "Control")
  lines(timearray, tempout_control[,r,1], type = "l", lty= 2, col = "red")
  lines(timearray, tempout_control[,r,3], type = "l", lty= 4, col = "blue")
  
  plot(timearray, tempout_level1[,r,2], type = "l", ylim = c(0,max(tempout_level1[,r,3])), ylab= paste(resvar_names[r]), xlab = NA, main= "level1")
  lines(timearray, tempout_level1[,r,1], type = "l", lty= 2, col = "red")
  lines(timearray, tempout_level1[,r,3], type = "l", lty= 4, col = "blue")
  
  plot(timearray, tempout_level2[,r,2], type = "l", ylim = c(0,max(tempout_level2[,r,3])), ylab= paste(resvar_names[r]), xlab = NA, main= "level2")
  lines(timearray, tempout_level2[,r,1], type = "l", lty= 2, col = "red")
  lines(timearray, tempout_level2[,r,3], type = "l", lty= 4, col = "blue")
  
  plot(timearray, tempout_level3[,r,2], type = "l", ylim = c(0,max(tempout_level3[,r,3])), ylab= paste(resvar_names[r]), xlab = NA, main= "level3")
  lines(timearray, tempout_level3[,r,1], type = "l", lty= 2, col = "red")
  lines(timearray, tempout_level3[,r,3], type = "l", lty= 4, col = "blue")
  
  plot(timearray, tempout_level4[,r,2], type = "l", ylim = c(0,max(tempout_level4[,r,3])), ylab= paste(resvar_names[r]), xlab = NA, main= "level4")
  lines(timearray, tempout_level4[,r,1], type = "l", lty= 2, col = "red")
  lines(timearray, tempout_level4[,r,3], type = "l", lty= 4, col = "blue")
}
#mtext(text = paste("Fig. 14 Time series plots of lower, middle, and upper quartiles."), side = 1, line = 1, outer = T)
dev.off()
# 
# png(file= paste(vpdir_fig, "fig_quantile_timeseries.png", sep=""), width = 7, height = 7, units='in', pointsize=12, res=300)
# #start figures
# #time series plots
# par(mfrow=c(4,4), mar=c(2, 4, 2, 0.5), oma= c(3,2,2,6.5))
# 
# for (r in 1:4){
#   plot(timearray, tempout_control[,r,2], type = "l", ylim = c(0,max(tempout_control[,r,3])), ylab= paste(resvar_names[r]), xlab = NA, main= "Control")
#   lines(timearray, tempout_control[,r,1], type = "l", lty= 2, col = "red")
#   lines(timearray, tempout_control[,r,3], type = "l", lty= 4, col = "blue")
#   
#   plot(timearray, tempout_level1[,r,2], type = "l", ylim = c(0,max(tempout_level1[,r,3])), ylab= paste(resvar_names[r]), xlab = NA, main= "level1")
#   lines(timearray, tempout_level1[,r,1], type = "l", lty= 2, col = "red")
#   lines(timearray, tempout_level1[,r,3], type = "l", lty= 4, col = "blue")
#   
#   plot(timearray, tempout_level3[,r,2], type = "l", ylim = c(0,max(tempout_level3[,r,3])), ylab= paste(resvar_names[r]), xlab = NA, main= "level3")
#   lines(timearray, tempout_level3[,r,1], type = "l", lty= 2, col = "red")
#   lines(timearray, tempout_level3[,r,3], type = "l", lty= 4, col = "blue")
#   
#   plot(timearray, tempout_level2[,r,2], type = "l", ylim = c(0,max(tempout_level2[,r,3])), ylab= paste(resvar_names[r]), xlab = NA, main= "level2")
#   lines(timearray, tempout_level2[,r,1], type = "l", lty= 2, col = "red")
#   lines(timearray, tempout_level2[,r,3], type = "l", lty= 4, col = "blue")
# }
# #mtext(text = paste("Fig. 14 Time series plots of lower, middle, and upper quartiles."), side = 1, line = 1, outer = T)
# dev.off()
# 

#tornado plots #########
# 
# datsrc_con<- list()
# datsrc_exp<- list()
# datpcc_con<- list()
# datpcc_exp<- list()
# 
# for (i in 1:5) {
#   dfsrc_con<- mdply(srctdarray_con[i,1:5,], cbind)
#   tdfsrc_con<- t(dfsrc_con)
#   colnames(tdfsrc_con)<- outvar
#   s<- melt(tdfsrc_con)
#   datsrc_con[[i]]<- s
#   
#   dfsrc_exp<- mdply(srctdarray_exp[i,1:5,], cbind)
#   tdfsrc_exp<- t(dfsrc_exp)
#   colnames(tdfsrc_exp)<- outvar
#   m<- melt(tdfsrc_exp)
#   datsrc_exp[[i]]<- m
# }
# 
# 
# for (i in 1:5){
#   dfpcc_con<- mdply(pcctdarray_con[i,1:5,], cbind)
#   tdfpcc_con<- t(dfpcc_con)
#   colnames(tdfpcc_con)<- outvar
#   p<- melt(tdfpcc_con)
#   datpcc_con[[i]]<- p
#   
#   dfpcc_exp<- mdply(pcctdarray_exp[i,1:5,], cbind)
#   tdfpcc_exp<- t(dfpcc_exp)
#   colnames(tdfpcc_exp)<- outvar
#   n<- melt(tdfpcc_exp)
#   datpcc_exp[[i]]<- n
# }
# 
# #create PDF tornado
# pdf(file= paste(vpdir_fig, "fig_tornado.pdf", sep=""), width = 8.5, height = 11, onefile = TRUE, paper = "USr")
# #start figures
# #create plot pages
# grid.newpage()
# pushViewport(viewport(layout=grid.layout(length(timebreak),1), gp= gpar(cex = 0.6)))
# #start figures
# for (i in 1:length(timebreak)) { #loops by timebreak
#   aa<- ggplot(data=datsrc_con[[i]], aes(x= datsrc_con[[i]][[1]], y= datsrc_con[[i]][[3]])) + 
#     geom_bar(stat="identity", position = "identity") +
#     scale_y_continuous(limits= c(-1,1)) +
#     coord_flip() +
#     labs(title= paste("Control", i, sep=" "), x=" ", y= "Standardized Regression Coefficient") +
#     facet_grid(. ~ Var2) +
#     theme_bw()
#   print(aa, vp= viewport(layout.pos.row= i, layout.pos.col= 1), newpage= FALSE)
# }
# 
# grid.newpage()
# pushViewport(viewport(layout=grid.layout(length(timebreak),1), gp= gpar(cex = 0.6)))
# for (i in 1:length(timebreak)) { #loops by timebreak
#   cc<- ggplot(data=datsrc_exp[[i]], aes(x= datsrc_exp[[i]][[1]], y= datsrc_exp[[i]][[3]])) + 
#     geom_bar(stat="identity", position = "identity") +
#     scale_y_continuous(limits= c(-1,1)) +
#     coord_flip() +
#     labs(title= paste("Exposed", i, sep=" "), x=" ", y= "Standardized Regression Coefficient") +
#     facet_grid(. ~ Var2) +
#     theme_bw()
#   print(cc, vp= viewport(layout.pos.row= i, layout.pos.col= 1), newpage= FALSE)
# }
# 
# grid.newpage()
# pushViewport(viewport(layout=grid.layout(length(timebreak),1), gp= gpar(cex = 0.6)))
# for (i in 1:length(timebreak)) { #loops by timebreak
#   bb<- ggplot(data=datpcc_con[[i]], aes(x= datpcc_con[[i]][[1]], y= datpcc_con[[i]][[3]])) + 
#     geom_bar(stat="identity", position = "identity") +
#     scale_y_continuous(limits= c(-1,1)) +
#     coord_flip() +
#     labs(title= paste("Control", i, sep = " "), x=" ", y= "Partial Correlation Coefficient") +
#     facet_grid(. ~ Var2) +
#     theme_bw()
#   print(bb, vp= viewport(layout.pos.row= i, layout.pos.col= 1), newpage= FALSE)
# }
# 
# grid.newpage()
# pushViewport(viewport(layout=grid.layout(length(timebreak),1), gp= gpar(cex = 0.6)))
# for (i in 1:length(timebreak)) { #loops by timebreak
#   dd<- ggplot(data=datpcc_exp[[i]], aes(x= datpcc_exp[[i]][[1]], y= datpcc_exp[[i]][[3]])) + 
#     geom_bar(stat="identity", position = "identity") +
#     scale_y_continuous(limits= c(-1,1)) +
#     coord_flip() +
#     labs(title= paste("Exposed", i, sep = " "), x=" ", y= "Partial Correlation Coefficient") +
#     facet_grid(. ~ Var2) +
#     theme_bw()
#   print(dd, vp= viewport(layout.pos.row= i, layout.pos.col= 1), newpage= FALSE)
# }
# dev.off()


#tornado plot of COLONY SIZE before and after pesticide application#######
control_prepost <- tdarray_control[c(519, 579),1,1:Nsims] #random timestamp pre pesticide application date
level1_prepost <- tdarray_level1[c(519, 579),1,1:Nsims] #random timestamp pre pesticide application date
level3_prepost <- tdarray_level3[c(519, 579),1,1:Nsims] #random timestamp pre pesticide application date
level2_prepost <- tdarray_level2[c(519, 579),1,1:Nsims] #random timestamp pre pesticide application date


pcccontrol_prepost<- array(data=NA, c(2,1,length(inputdata_control)), dimnames = list(c("pre", "post"),
                                                                                   c("Colony Size"),
                                                                                   c(colnames(inputdata_control))))
pcclevel1_prepost<- array(data=NA, c(2,1,length(inputdata_level1)), dimnames = list(c("pre", "post"), 
                                                                                c("Colony Size"), 
                                                                                c(colnames(inputdata_level1))))
pcclevel3_prepost<- array(data=NA, c(2,1,length(inputdata_level3)), dimnames = list(c("pre", "post"), 
                                                                            c("Colony Size"), 
                                                                            c(colnames(inputdata_level3))))
pcclevel2_prepost<- array(data=NA, c(2,1,length(inputdata_level2)), dimnames = list(c("pre", "post"), 
                                                                            c("Colony Size"), 
                                                                            c(colnames(inputdata_level2))))

for (i in 1:2){  #break
  tempinput<- control_prepost[i,1:Nsims]
  #pcc(input_dataframe, output, rank = FALSE, nboot = 0, conf = 0.95)
  temp_pcc<- pcc(inputdata_control[1:Nsims,], tempinput, rank = F)
  pcccontrol_prepost[i,,] <- temp_pcc$PCC[[1]]
}
pcc_control_prepost <- adply(pcccontrol_prepost, 3)
sig_control_prepost <- subset(pcc_control_prepost, abs(pcc_control_prepost$pre) > 0.062 | abs(pcc_control_prepost$post) > 0.062)
sig_control_prepost$Method <- "Control"

ordered_control_pre <- pcc_control_prepost[order(abs(pcc_control_prepost$pre), decreasing = T),1:2]
ordered_control_post <- pcc_control_prepost[order(abs(pcc_control_prepost$post), decreasing = T),c(1,3)]
control_pcc_prepost <- cbind(ordered_control_pre[1:10,], ordered_control_post[1:10,])
#control_pcc <- subset(pccdf_control, abs(pccdf_control$V1) > 0.062)

for (i in 1:2){  #break
  tempinput<- level1_prepost[i,1:Nsims]
  #pcc(input_dataframe, output, rank = FALSE, nboot = 0, conf = 0.95)
  temp_pcc<- pcc(inputdata_level1[1:Nsims,], tempinput, rank = F)
  pcclevel1_prepost[i,,] <- temp_pcc$PCC[[1]]
}
pcc_level1_prepost <- adply(pcclevel1_prepost, 3)
sig_level1_prepost <- subset(pcc_level1_prepost, abs(pcc_level1_prepost$pre) > 0.062 | abs(pcc_level1_prepost$post) > 0.062)
sig_level1_prepost$Method <- "level1"
ordered_level1_pre <- pcc_level1_prepost[order(abs(pcc_level1_prepost$pre), decreasing = T),1:2]
ordered_level1_post <- pcc_level1_prepost[order(abs(pcc_level1_prepost$post), decreasing = T),c(1,3)]
level1_pcc_prepost <- cbind(ordered_level1_pre[1:10,], ordered_level1_post[1:10,])
#level1_pcc <- subset(pccdf_level1, abs(pccdf_level1$V1) > 0.062)

for (i in 1:2){  #break
  tempinput<- level2_prepost[i,1:Nsims]
  #pcc(input_dataframe, output, rank = FALSE, nboot = 0, conf = 0.95)
  temp_pcc<- pcc(inputdata_level2[1:Nsims,], tempinput, rank = F)
  pcclevel2_prepost[i,,] <- temp_pcc$PCC[[1]]
}
pcc_level2_prepost <- adply(pcclevel2_prepost, 3)
sig_level2_prepost <- subset(pcc_level2_prepost, abs(pcc_level2_prepost$pre) > 0.062 | abs(pcc_level2_prepost$post) > 0.062)
sig_level2_prepost$Method <- "level2"
ordered_level2_pre <- pcc_level2_prepost[order(abs(pcc_level2_prepost$pre), decreasing = T),1:2]
ordered_level2_post <- pcc_level2_prepost[order(abs(pcc_level2_prepost$post), decreasing = T),c(1,3)]
level2_pcc_prepost <- cbind(ordered_level2_pre[1:10,], ordered_level2_post[1:10,])

for (i in 1:2){  #break
  tempinput<- level3_prepost[i,1:Nsims]
  #pcc(input_dataframe, output, rank = FALSE, nboot = 0, conf = 0.95)
  temp_pcc<- pcc(inputdata_level3[1:Nsims,], tempinput, rank = F)
  pcclevel3_prepost[i,,] <- temp_pcc$PCC[[1]]
}
pcc_level3_prepost <- adply(pcclevel3_prepost, 3)
sig_level3_prepost <- subset(pcc_level3_prepost, abs(pcc_level3_prepost$pre) > 0.062 | abs(pcc_level3_prepost$post) > 0.062)
sig_level3_prepost$Method <- "level3"
ordered_level3_pre <- pcc_level3_prepost[order(abs(pcc_level3_prepost$pre), decreasing = T),1:2]
ordered_level3_post <- pcc_level3_prepost[order(abs(pcc_level3_prepost$post), decreasing = T),c(1,3)]
level3_pcc_prepost <- cbind(ordered_level3_pre[1:10,], ordered_level3_post[1:10,])
#level3_pcc <- subset(pccdf_level3, abs(pccdf_level3$V1) > 0.062)


#=========================================================
sig_prepost <- melt(rbind(sig_control_prepost,sig_level1_prepost,sig_level2_prepost,sig_level3_prepost))
ii <- ggplot(data = sig_prepost,aes(x = sig_prepost$X1, y=sig_prepost$value)) +
  geom_histogram(stat="identity") +
  scale_y_continuous(limits= c(-1,1)) +
  facet_grid(variable~Method) +
  labs(x = " ", y = "Partial Correlation Coefficient") +
  coord_flip() +
  theme_bw()
print(ii)

ggsave(file= paste(vpdir_fig, "fig_tornado_prepost.pdf", sep=""),ii,width = 11,height = 8.5)
png(file= paste(vpdir_fig, "fig_tornado_prepost.png", sep=""), width = 8, height = 7, units='in', pointsize=12, res=300)
print(ii)
dev.off()
#==========================================================

aa<- ggplot(data=control_pcc_prepost, aes(x= control_pcc_prepost[[1]], y= control_pcc_prepost[[2]])) +
  geom_bar(stat="identity", position = "identity") +
  scale_y_continuous(limits= c(-1,1)) +
  coord_flip() +
  labs(title= "Control", x=" ", y= "Partial Correlation Coefficient") +
#  facet_grid(. ~ ) +
  theme_bw()

bb<- ggplot(data=level1_pcc_prepost, aes(x= level1_pcc_prepost[[1]], y= level1_pcc_prepost[[2]])) +
  geom_bar(stat="identity", position = "identity") +
  scale_y_continuous(limits= c(-1,1)) +
  coord_flip() +
  labs(title= "level1", x=" ", y= "Partial Correlation Coefficient") +
  #facet_grid(. ~ Var2) +
  theme_bw()

cc<- ggplot(data=level3_pcc_prepost, aes(x= level3_pcc_prepost[[1]], y= level3_pcc_prepost[[2]])) +
  geom_bar(stat="identity", position = "identity") +
  scale_y_continuous(limits= c(-1,1)) +
  coord_flip() +
  labs(title= "level3", x=" ", y= "Partial Correlation Coefficient") +
  #facet_grid(. ~ Var2) +
  theme_bw()

dd<- ggplot(data=level2_pcc_prepost, aes(x= level2_pcc_prepost[[1]], y= level2_pcc_prepost[[2]])) +
  geom_bar(stat="identity", position = "identity") +
  scale_y_continuous(limits= c(-1,1)) +
  coord_flip() +
  labs(title= "level2", x=" ", y= "Partial Correlation Coefficient") +
  #facet_grid(. ~ Var2) +
  theme_bw()

ee<- ggplot(data=control_pcc_prepost, aes(x= control_pcc_prepost[[3]], y= control_pcc_prepost[[4]])) +
  geom_bar(stat="identity", position = "identity") +
  scale_y_continuous(limits= c(-1,1)) +
  coord_flip() +
  labs(title= "Control", x=" ", y= "Partial Correlation Coefficient") +
  #  facet_grid(. ~ ) +
  theme_bw()

ff<- ggplot(data=level1_pcc_prepost, aes(x= level1_pcc_prepost[[3]], y= level1_pcc_prepost[[4]])) +
  geom_bar(stat="identity", position = "identity") +
  scale_y_continuous(limits= c(-1,1)) +
  coord_flip() +
  labs(title= "level1", x=" ", y= "Partial Correlation Coefficient") +
  #facet_grid(. ~ Var2) +
  theme_bw()

gg<- ggplot(data=level3_pcc_prepost, aes(x= level3_pcc_prepost[[3]], y= level3_pcc_prepost[[4]])) +
  geom_bar(stat="identity", position = "identity") +
  scale_y_continuous(limits= c(-1,1)) +
  coord_flip() +
  labs(title= "level3", x=" ", y= "Partial Correlation Coefficient") +
  #facet_grid(. ~ Var2) +
  theme_bw()

hh<- ggplot(data=level2_pcc_prepost, aes(x= level2_pcc_prepost[[3]], y= level2_pcc_prepost[[4]])) +
  geom_bar(stat="identity", position = "identity") +
  scale_y_continuous(limits= c(-1,1)) +
  coord_flip() +
  labs(title= "level2", x=" ", y= "Partial Correlation Coefficient") +
  #facet_grid(. ~ Var2) +
  theme_bw()


pdf(file= paste(vpdir_fig, "fig_tornado_prepost_2.pdf", sep=""), width = 8.5, height = 11, onefile = TRUE, paper = "USr")
pushViewport(viewport(layout=grid.layout(4,2), gp= gpar(cex = 0.6)))
  print(aa, vp= viewport(layout.pos.row= 1, layout.pos.col= 1), newpage= FALSE)  
  print(ee, vp= viewport(layout.pos.row= 1, layout.pos.col= 2), newpage= FALSE)
  print(bb, vp= viewport(layout.pos.row= 2, layout.pos.col= 1), newpage= FALSE)
  print(ff, vp= viewport(layout.pos.row= 2, layout.pos.col= 2), newpage= FALSE)
  print(cc, vp= viewport(layout.pos.row= 3, layout.pos.col= 1), newpage= FALSE)
  print(gg, vp= viewport(layout.pos.row= 3, layout.pos.col= 2), newpage= FALSE)
  print(dd, vp= viewport(layout.pos.row= 4, layout.pos.col= 1), newpage= FALSE)
  print(hh, vp= viewport(layout.pos.row= 4, layout.pos.col= 2), newpage= FALSE)
dev.off()

png(file= paste(vpdir_fig, "fig_tornado_prepost_2.png", sep=""), width = 8, height = 7, units='in', pointsize=12, res=300)
pushViewport(viewport(layout=grid.layout(4,2), gp= gpar(cex = 0.6)))
print(aa, vp= viewport(layout.pos.row= 1, layout.pos.col= 1), newpage= FALSE)  
print(ee, vp= viewport(layout.pos.row= 1, layout.pos.col= 2), newpage= FALSE)
print(bb, vp= viewport(layout.pos.row= 2, layout.pos.col= 1), newpage= FALSE)
print(ff, vp= viewport(layout.pos.row= 2, layout.pos.col= 2), newpage= FALSE)
print(cc, vp= viewport(layout.pos.row= 3, layout.pos.col= 1), newpage= FALSE)
print(gg, vp= viewport(layout.pos.row= 3, layout.pos.col= 2), newpage= FALSE)
print(dd, vp= viewport(layout.pos.row= 4, layout.pos.col= 1), newpage= FALSE)
print(hh, vp= viewport(layout.pos.row= 4, layout.pos.col= 2), newpage= FALSE)
dev.off()


################## Tornado Plot - avg colony size ###########
out_control_colsize <- tdarray_control[549:579,1,1:Nsims]
out_level1_colsize <- tdarray_level1[549:579,1,1:Nsims]
out_level3_colsize <- tdarray_level3[549:579,1,1:Nsims]
out_level2_colsize <- tdarray_level2[549:579,1,1:Nsims]

avg_control_colsize <- colMeans(out_control_colsize) #average across entire simulation period
avg_level1_colsize <- colMeans(out_level1_colsize) #average across enture simulation period
avg_level3_colsize <- colMeans(out_level3_colsize) #average across enture simulation period
avg_level2_colsize <- colMeans(out_level2_colsize) #average across enture simulation period

pcctdarray_control<- array(data=NA, c(1,1,length(inputdata_control)), dimnames = list(c("x"),
                                                           c("Colony Size"),
                                                           c(colnames(inputdata_control))))
pcctdarray_level1<- array(data=NA, c(1,1,length(inputdata_level1)), dimnames = list(c("x"), 
                                                           c("Colony Size"), 
                                                           c(colnames(inputdata_level1))))
pcctdarray_level3<- array(data=NA, c(1,1,length(inputdata_level3)), dimnames = list(c("x"), 
                                                                                    c("Colony Size"), 
                                                                                    c(colnames(inputdata_level3))))
pcctdarray_level2<- array(data=NA, c(1,1,length(inputdata_level2)), dimnames = list(c("x"), 
                                                                                    c("Colony Size"), 
                                                                                    c(colnames(inputdata_level2))))

for (k in 1:length(inputdata_control)){  #input variable
  temp_control<- pcc(inputdata_control, avg_control_colsize, rank = T)
  pcctdarray_control[,,k]<- temp_control$PRCC[[1]][k]
}
pccdf_control <- adply(pcctdarray_control, c(2,3), .id = c("Colony Size", "Input"))
ordered_control <- pccdf_control[order(abs(pccdf_control$V1), decreasing = T),]
control_pcc <- ordered_control[1:10,]
#control_pcc <- subset(pccdf_control, abs(pccdf_control$V1) > 0.062)


for (k in 1:length(inputdata_level1)){  #input variable
  temp_level1<- pcc(inputdata_level1, avg_level1_colsize, rank = T)
  pcctdarray_level1[,,k]<- temp_level1$PRCC[[1]][k]
}
pccdf_level1 <- adply(pcctdarray_level1, c(2,3), .id = c("Colony Size", "Input"))
ordered_level1 <- pccdf_level1[order(abs(pccdf_level1$V1), decreasing = T),]
level1_pcc <- ordered_level1[1:10,]
#level1_pcc <- subset(pccdf_level1, abs(pccdf_level1$V1) > 0.062)

for (k in 1:length(inputdata_level3)){  #input variable
  temp_level3<- pcc(inputdata_level3, avg_level3_colsize, rank = T)
  pcctdarray_level3[,,k]<- temp_level3$PRCC[[1]][k]
}
pccdf_level3 <- adply(pcctdarray_level3, c(2,3), .id = c("Colony Size", "Input"))
ordered_level3 <- pccdf_level3[order(abs(pccdf_level3$V1), decreasing = T),]
level3_pcc <- ordered_level3[1:10,]
#level3_pcc <- subset(pccdf_level3, abs(pccdf_level3$V1) > 0.062)

for (k in 1:length(inputdata_level2)){  #input variable
  temp_level2<- pcc(inputdata_level2, avg_level2_colsize, rank = T)
  pcctdarray_level2[,,k]<- temp_level2$PRCC[[1]][k]
}
pccdf_level2 <- adply(pcctdarray_level2, c(2,3), .id = c("Colony Size", "Input"))
ordered_level2 <- pccdf_level2[order(abs(pccdf_level2$V1), decreasing = T),]
level2_pcc <- ordered_level2[1:10,]
#level2_pcc <- subset(pccdf_level2, abs(pccdf_level2$V1) > 0.062)


# dfpcc_con<- ldply(pcctdarray_con, rbind)
# colnames(dfpcc_con)<- c("Colony Size")

# dfpcc_control<- melt(pcctdarray_control)
# dfpcc_level1 <- melt(pcctdarray_level1)
# dfpcc_level3 <- melt(pcctdarray_level3)
# dfpcc_level2 <- melt(pcctdarray_level2)

pdf(file= paste(vpdir_fig, "fig_tornado_colonysize.pdf", sep=""), width = 8.5, height = 11, onefile = TRUE, paper = "USr")
#start figures
#create plot pages
grid.newpage()
pushViewport(viewport(layout=grid.layout(1,4), gp= gpar(cex = 0.6)))
#start figures
  aa<- ggplot(data=control_pcc, aes(x= control_pcc[[2]], y= control_pcc[[3]])) + 
    geom_bar(stat="identity", position = "identity") +
    scale_y_continuous(limits= c(-1,1)) +
    coord_flip() +
    labs(title= "Control", x=" ", y= "Partial Correlation Coefficient") +
    #facet_grid(. ~ Colony Size) +
    theme_bw()
  print(aa, vp= viewport(layout.pos.row= 1, layout.pos.col= 1), newpage= FALSE)

  bb<- ggplot(data=level1_pcc, aes(x= level1_pcc[[2]], y= level1_pcc[[3]])) + 
    geom_bar(stat="identity", position = "identity") +
    scale_y_continuous(limits= c(-1,1)) +
    coord_flip() +
    labs(title= "level1", x=" ", y= "Partial Correlation Coefficient") +
    #facet_grid(. ~ Var2) +
    theme_bw()
  print(bb, vp= viewport(layout.pos.row= 1, layout.pos.col= 2), newpage= FALSE)
 
  cc<- ggplot(data=level3_pcc, aes(x= level3_pcc[[2]], y= level3_pcc[[3]])) + 
     geom_bar(stat="identity", position = "identity") +
     scale_y_continuous(limits= c(-1,1)) +
     coord_flip() +
     labs(title= "level3", x=" ", y= "Partial Correlation Coefficient") +
     #facet_grid(. ~ Var2) +
     theme_bw()
   print(cc, vp= viewport(layout.pos.row= 1, layout.pos.col= 3), newpage= FALSE)
   
  dd<- ggplot(data=level2_pcc, aes(x= level2_pcc[[2]], y= level2_pcc[[3]])) + 
    geom_bar(stat="identity", position = "identity") +
    scale_y_continuous(limits= c(-1,1)) +
    coord_flip() +
    labs(title= "level2", x=" ", y= "Partial Correlation Coefficient") +
    #facet_grid(. ~ Var2) +
    theme_bw()
  print(dd, vp= viewport(layout.pos.row= 1, layout.pos.col= 4), newpage= FALSE)

dev.off()

png(file= paste(vpdir_fig, "fig_tornado_colonysize.png", sep=""), width = 8, height = 6, units='in', pointsize=12, res=300)
#start figures
#create plot pages
grid.newpage()
pushViewport(viewport(layout=grid.layout(1,4), gp= gpar(cex = 0.6)))
#start figures
aa<- ggplot(data=control_pcc, aes(x= control_pcc[[2]], y= control_pcc[[3]])) + 
  geom_bar(stat="identity", position = "identity") +
  scale_y_continuous(limits= c(-1,1)) +
  coord_flip() +
  labs(title= "Control", x=" ", y= "Partial Correlation Coefficient") +
  #facet_grid(. ~ Colony Size) +
  theme_bw()
print(aa, vp= viewport(layout.pos.row= 1, layout.pos.col= 1), newpage= FALSE)

bb<- ggplot(data=level1_pcc, aes(x= level1_pcc[[2]], y= level1_pcc[[3]])) + 
  geom_bar(stat="identity", position = "identity") +
  scale_y_continuous(limits= c(-1,1)) +
  coord_flip() +
  labs(title= "level1", x=" ", y= "Partial Correlation Coefficient") +
  #facet_grid(. ~ Var2) +
  theme_bw()
print(bb, vp= viewport(layout.pos.row= 1, layout.pos.col= 2), newpage= FALSE)

cc<- ggplot(data=level3_pcc, aes(x= level3_pcc[[2]], y= level3_pcc[[3]])) + 
  geom_bar(stat="identity", position = "identity") +
  scale_y_continuous(limits= c(-1,1)) +
  coord_flip() +
  labs(title= "level3", x=" ", y= "Partial Correlation Coefficient") +
  #facet_grid(. ~ Var2) +
  theme_bw()
print(cc, vp= viewport(layout.pos.row= 1, layout.pos.col= 3), newpage= FALSE)

dd<- ggplot(data=level2_pcc, aes(x= level2_pcc[[2]], y= level2_pcc[[3]])) + 
  geom_bar(stat="identity", position = "identity") +
  scale_y_continuous(limits= c(-1,1)) +
  coord_flip() +
  labs(title= "level2", x=" ", y= "Partial Correlation Coefficient") +
  #facet_grid(. ~ Var2) +
  theme_bw()
print(dd, vp= viewport(layout.pos.row= 1, layout.pos.col= 4), newpage= FALSE)

