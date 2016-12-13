#plot crunching ###########
#colony persistence
cp_control <- rep(NA, nrows)
cp_foliar <- rep(NA, nrows)
cp_soil <- rep(NA, nrows)
cp_seed <- rep(NA, nrows)
for (n in 1:nrows){
  x <- which(tdarray_control[n,1,1:Nsims] > 1000) # queries colony size > 1000 for 1000 simulations at each time point
  y <- which(tdarray_foliar[n,1,1:Nsims] > 1000)
  z <- which(tdarray_soil[n,1,1:Nsims] > 1000)
  zz <- which(tdarray_seed[n,1,1:Nsims] > 1000)
  cp_control[n] <- length(x)/Nsims #appends vector x with proportion of simulations per time step with Col Size > 0
  cp_foliar[n] <- length(y)/Nsims
  cp_soil[n] <- length(z)/Nsims
  cp_seed[n] <- length(zz)/Nsims
}

#foragers
fa_control <- rep(NA, nrows)
fa_foliar <- rep(NA, nrows)
fa_soil <- rep(NA, nrows)
fa_seed <- rep(NA, nrows)
for (n in 1:nrows){
  x <- which(tdarray_control[n,4,1:Nsims] > 50) 
  y <- which(tdarray_foliar[n,4,1:Nsims] > 50)
  z <- which(tdarray_soil[n,4,1:Nsims] > 50)
  zz <- which(tdarray_seed[n,4,1:Nsims] > 50)
  fa_control[n] <- length(x)/Nsims
  fa_foliar[n] <- length(y)/Nsims
  fa_soil[n] <- length(z)/Nsims
  fa_seed[n] <- length(zz)/Nsims
}

#adult workers
aw_control <- rep(NA, nrows)
aw_foliar <- rep(NA, nrows)
aw_soil <- rep(NA, nrows)
aw_seed <- rep(NA, nrows)
for (n in 1:nrows){
  x <- which(tdarray_control[n,3,1:Nsims] > 50)
  y <- which(tdarray_foliar[n,3,1:Nsims] > 50)
  z <- which(tdarray_soil[n,3,1:Nsims] > 50)
  zz <- which(tdarray_seed[n,3,1:Nsims] > 50)
  aw_control[n] <- length(x)/Nsims
  aw_foliar[n] <- length(y)/Nsims
  aw_soil[n] <- length(z)/Nsims
  aw_seed[n] <- length(zz)/Nsims
}

#capped worker brood
cwb_control <- rep(NA, nrows)
cwb_foliar <- rep(NA, nrows)
cwb_seed <- rep(NA, nrows)
cwb_soil <- rep(NA, nrows)
for (n in 1:nrows){
  x <- which(tdarray_control[n, 6, 1:Nsims] > 50)
  y <- which(tdarray_foliar[n, 6, 1:Nsims] > 50)
  z <- which(tdarray_seed[n, 6, 1:Nsims] > 50)
  zz <- which(tdarray_soil[n, 6, 1:Nsims] > 50)
  cwb_control[n] <- length(x)/Nsims
  cwb_foliar[n] <- length(y)/Nsims
  cwb_seed[n] <- length(z)/Nsims
  cwb_soil[n] <- length(zz)/Nsims
}

#worker eggs
we_control <- rep(NA, nrows)
we_foliar <- rep(NA, nrows)
we_soil <- rep(NA, nrows)
we_seed <- rep(NA, nrows)
for (n in 1:nrows){
  x <- which(tdarray_control[n,10,1:Nsims] > 50)
  y <- which(tdarray_foliar[n,10,1:Nsims] > 50)
  z <- which(tdarray_soil[n,10,1:Nsims] > 50)
  zz <- which(tdarray_seed[n,10,1:Nsims] > 50)
  we_control[n] <- length(x)/Nsims
  we_foliar[n] <- length(y)/Nsims
  we_soil[n] <- length(z)/Nsims
  we_seed[n] <- length(zz)/Nsims
}

#drone eggs
de_control <- rep(NA, nrows)
de_foliar <- rep(NA, nrows)
de_soil <- rep(NA, nrows)
de_seed <- rep(NA, nrows)
for (n in 1:nrows){
  x <- which(tdarray_control[n,9,1:Nsims] > 0)
  y <- which(tdarray_foliar[n,9,1:Nsims] > 0)
  z <- which(tdarray_soil[n,9,1:Nsims] > 0)
  zz <- which(tdarray_seed[n,9,1:Nsims] > 0)
  de_control[n] <- length(x)/Nsims
  de_foliar[n] <- length(y)/Nsims
  de_soil[n] <- length(z)/Nsims
  de_seed[n] <- length(zz)/Nsims
}


# #free mites
# fm_con <- rep(NA, nrows)
# fm_exp <- rep(NA, nrows)
# for (n in 1:nrows){
#   x <- which(tdarray_con[n,11,1:Nsims] > 0)
#   y <- which(tdarray_exp[n,11,1:Nsims] > 0)
#   fm_con[n] <- length(x)/Nsims 
#   fm_exp[n] <- length(y)/Nsims 
# }
# 
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
# #capped drone brood
# cdb_con <- rep(NA, nrows)
# cdb_exp <- rep(NA, nrows)
# for (n in 1:nrows){
#   x <- which(tdarray_con[n, 5, 1:Nsims] > 0)
#   y <- which(tdarray_exp[n, 5, 1:Nsims] > 0)
#   cdb_con[n] <- length(x)/Nsims
#   cdb_exp[n] <- length(y)/Nsims
# }


#MC proportions ##########
pdf(file= paste(vpdir_fig, "fig_1_MCproportions_convsexp.pdf", sep=""), width = 5, height = 9, onefile = TRUE, paper = "USr")
  #start figures
  par(mfrow=c(6,1), mar=c(2,4,1,0.5), oma=c(4,2,2,1))
  plot(timearray, cp_control, type="l", col="blue", ylab = "P(Colony Size) > 1000", ylim=c(0,1), xlab=NA)
  lines(timearray, cp_foliar, type="l", lty = 2, col="red")
  lines(timearray, cp_seed, type="l", lty = 2, col="black")
  lines(timearray, cp_soil, type="l", lty = 2, col="green")
  plot(timearray, fa_control, type="l", col="blue", ylab= "P(Foragers) > 50", ylim=c(0,1), xlab=NA) 
  lines(timearray, fa_foliar, type="l", lty = 2, col="red")
  lines(timearray, fa_seed, type="l", lty = 2, col="black")
  lines(timearray, fa_soil, type="l", lty = 2, col="green")
  plot(timearray, aw_control, type="l", col="blue", ylab= "P(Adult Workers) > 50", ylim=c(0,1), xlab=NA) 
  lines(timearray, aw_foliar, type="l", lty = 2, col="red")
  lines(timearray, aw_seed, type="l", lty = 2, col="black")
  lines(timearray, aw_soil, type="l", lty = 2, col="green")
  plot(timearray, cwb_control, type="l", col="blue", ylab = "P(Capped Worker Brood) > 50", ylim=c(0,1), xlab=NA)
  lines(timearray, cwb_foliar, type="l", lty = 2, col="red")
  lines(timearray, cwb_seed, type="l", lty = 2, col="black")
  lines(timearray, cwb_soil, type="l", lty = 2, col="green")
  plot(timearray, we_control, type="l", col="blue", ylab = "P(Worker Eggs) > 50", ylim=c(0,1), xlab=NA)
  lines(timearray, we_foliar, type="l", lty = 2, col="red")
  lines(timearray, we_seed, type="l", lty = 2, col="black")
  lines(timearray, we_soil, type="l", lty = 2, col="green")
  plot(timearray, de_control, type="l", col="blue", ylab = "P(Drone Eggs) > 0", ylim=c(0,1), xlab=NA)
  lines(timearray, de_foliar, type="l", lty = 2, col="red")
  lines(timearray, de_seed, type="l", lty = 2, col="black")
  lines(timearray, de_soil, type="l", lty = 2, col="green")
  #plot(timearray, fm_con, type="l", col="blue", ylab= "P(Free Mites) > 0", ylim=c(0,1), xlab=NA) 
  #lines(timearray, fm_exp, type="l", lty = 2, col="red")
  #plot(timearray, dfr_con, type="l", col="blue", ylab= "P(Dead Foragers) > 0", ylim=c(0,1), xlab=NA) 
  #lines(timearray, dfr_exp, type="l", lty = 2, col="red")
  #mtext(text = paste("Fig. 1 Proportion of simulations with values greater than zero"), side = 1, line = 1, outer = T)
dev.off()

png(file= paste(vpdir_fig, "fig_1_MCproportions_convsexp.png", sep=""), width = 7, height = 10, units='in', pointsize=12, res=300)
par(mfrow=c(6,1), mar=c(2,4,1,0.5), oma=c(4,2,2,1))
plot(timearray, cp_control, type="l", col="blue", ylab = "P(Colony Size) > 1000", ylim=c(0,1), xlab=NA)
lines(timearray, cp_foliar, type="l", lty = 2, col="red")
lines(timearray, cp_seed, type="l", lty = 2, col="black")
lines(timearray, cp_soil, type="l", lty = 2, col="green")
plot(timearray, fa_control, type="l", col="blue", ylab= "P(Foragers) > 50", ylim=c(0,1), xlab=NA) 
lines(timearray, fa_foliar, type="l", lty = 2, col="red")
lines(timearray, fa_seed, type="l", lty = 2, col="black")
lines(timearray, fa_soil, type="l", lty = 2, col="green")
plot(timearray, aw_control, type="l", col="blue", ylab= "P(Adult Workers) > 50", ylim=c(0,1), xlab=NA) 
lines(timearray, aw_foliar, type="l", lty = 2, col="red")
lines(timearray, aw_seed, type="l", lty = 2, col="black")
lines(timearray, aw_soil, type="l", lty = 2, col="green")
plot(timearray, cwb_control, type="l", col="blue", ylab = "P(Capped Worker Brood) > 50", ylim=c(0,1), xlab=NA)
lines(timearray, cwb_foliar, type="l", lty = 2, col="red")
lines(timearray, cwb_seed, type="l", lty = 2, col="black")
lines(timearray, cwb_soil, type="l", lty = 2, col="green")
plot(timearray, we_control, type="l", col="blue", ylab = "P(Worker Eggs) > 50", ylim=c(0,1), xlab=NA)
lines(timearray, we_foliar, type="l", lty = 2, col="red")
lines(timearray, we_seed, type="l", lty = 2, col="black")
lines(timearray, we_soil, type="l", lty = 2, col="green")
plot(timearray, de_control, type="l", col="blue", ylab = "P(Drone Eggs) > 0", ylim=c(0,1), xlab=NA)
lines(timearray, de_foliar, type="l", lty = 2, col="red")
lines(timearray, de_seed, type="l", lty = 2, col="black")
lines(timearray, de_soil, type="l", lty = 2, col="green")
dev.off()

#time series plotting #######
resvar<- c(1,3,4,10,18)
temparray_control <- tdarray_control[1:nrows,resvar,1:Nsims]
temparray_foliar <- tdarray_foliar[1:nrows,resvar,1:Nsims]
temparray_seed <- tdarray_seed[1:nrows,resvar,1:Nsims]
temparray_soil <- tdarray_soil[1:nrows, resvar, 1:Nsims]
dimnames(temparray_control)<- list(c(as.character(timearray)), c(outvar))
dimnames(temparray_foliar)<- list(c(as.character(timearray)), c(outvar))
dimnames(temparray_seed)<- list(c(as.character(timearray)), c(outvar))
dimnames(temparray_soil)<- list(c(as.character(timearray)), c(outvar))
tempout_control<- array(data=NA, c(nrows,5,3), dimnames = list(c(as.character(timearray)), 
                                                           c("Colony Size","Adult Workers", "Foragers", "Worker Eggs", "Colony Pollen (g)"),
                                                           c("25%","50%","75%")))
tempout_foliar<- array(data=NA, c(nrows,5,3), dimnames = list(c(as.character(timearray)), 
                                                           c("Colony Size","Adult Workers", "Foragers", "Worker Eggs", "Colony Pollen (g)"), 
                                                           c("25%","50%","75%")))
tempout_seed<- array(data=NA, c(nrows,5,3), dimnames = list(c(as.character(timearray)), 
                                                              c("Colony Size","Adult Workers", "Foragers", "Worker Eggs", "Colony Pollen (g)"), 
                                                              c("25%","50%","75%")))
tempout_soil<- array(data=NA, c(nrows,5,3), dimnames = list(c(as.character(timearray)), 
                                                              c("Colony Size","Adult Workers", "Foragers", "Worker Eggs", "Colony Pollen (g)"), 
                                                              c("25%","50%","75%")))
for (r in 1:5){
  for (t in 1:nrows){
    p<- quantile(temparray_control[t, r, 1:Nsims])
    z<- quantile(temparray_foliar[t, r, 1:Nsims])
    q<- quantile(temparray_seed[t, r, 1:Nsims])
    n<- quantile(temparray_soil[t,r,1:Nsims])
    for (s in 1:3){
      quant_control<- c(p[[2]], p[[3]], p[[4]])
      quant_foliar<- c(z[[2]], z[[3]], z[[4]])
      quant_seed<- c(q[[2]],q[[3]],q[[4]])
      quant_soil<- c(n[[2]],n[[3]],n[[4]])
      tempout_control[t,r,s]<- quant_control[s]
      tempout_foliar[t,r,s]<- quant_foliar[s]
      tempout_seed[t,r,s]<- quant_seed[s]
      tempout_soil[t,r,s]<- quant_soil[s]
    }
  }
}

#create PDF timeseries
pdf(file= paste(vpdir_fig, "fig_quantile_timeseries.pdf", sep=""), width = 8.5, height = 11, onefile = TRUE, paper = "USr")
#start figures
#time series plots
par(mfrow=c(4,4), mar=c(2, 4, 2, 0.5), oma= c(3,2,2,6.5))

for (r in 1:4){
  plot(timearray, tempout_control[,r,2], type = "l", ylim = c(0,max(tempout_control[,r,3])), ylab= paste(outvar[r]), xlab = NA, main= "Control")
  lines(timearray, tempout_control[,r,1], type = "l", lty= 2, col = "red")
  lines(timearray, tempout_control[,r,3], type = "l", lty= 4, col = "blue")
  
  plot(timearray, tempout_foliar[,r,2], type = "l", ylim = c(0,max(tempout_foliar[,r,3])), ylab= paste(outvar[r]), xlab = NA, main= "Foliar")
  lines(timearray, tempout_foliar[,r,1], type = "l", lty= 2, col = "red")
  lines(timearray, tempout_foliar[,r,3], type = "l", lty= 4, col = "blue")
  
  plot(timearray, tempout_seed[,r,2], type = "l", ylim = c(0,max(tempout_seed[,r,3])), ylab= paste(outvar[r]), xlab = NA, main= "Seed")
  lines(timearray, tempout_seed[,r,1], type = "l", lty= 2, col = "red")
  lines(timearray, tempout_seed[,r,3], type = "l", lty= 4, col = "blue")
  
  plot(timearray, tempout_soil[,r,2], type = "l", ylim = c(0,max(tempout_soil[,r,3])), ylab= paste(outvar[r]), xlab = NA, main= "Soil")
  lines(timearray, tempout_soil[,r,1], type = "l", lty= 2, col = "red")
  lines(timearray, tempout_soil[,r,3], type = "l", lty= 4, col = "blue")
}
#mtext(text = paste("Fig. 14 Time series plots of lower, middle, and upper quartiles."), side = 1, line = 1, outer = T)
dev.off()

png(file= paste(vpdir_fig, "fig_quantile_timeseries.png", sep=""), width = 7, height = 7, units='in', pointsize=12, res=300)
#start figures
#time series plots
par(mfrow=c(4,4), mar=c(2, 4, 2, 0.5), oma= c(3,2,2,6.5))

for (r in 1:4){
  plot(timearray, tempout_control[,r,2], type = "l", ylim = c(0,max(tempout_control[,r,3])), ylab= paste(outvar[r]), xlab = NA, main= "Control")
  lines(timearray, tempout_control[,r,1], type = "l", lty= 2, col = "red")
  lines(timearray, tempout_control[,r,3], type = "l", lty= 4, col = "blue")
  
  plot(timearray, tempout_foliar[,r,2], type = "l", ylim = c(0,max(tempout_foliar[,r,3])), ylab= paste(outvar[r]), xlab = NA, main= "Foliar")
  lines(timearray, tempout_foliar[,r,1], type = "l", lty= 2, col = "red")
  lines(timearray, tempout_foliar[,r,3], type = "l", lty= 4, col = "blue")
  
  plot(timearray, tempout_seed[,r,2], type = "l", ylim = c(0,max(tempout_seed[,r,3])), ylab= paste(outvar[r]), xlab = NA, main= "Seed")
  lines(timearray, tempout_seed[,r,1], type = "l", lty= 2, col = "red")
  lines(timearray, tempout_seed[,r,3], type = "l", lty= 4, col = "blue")
  
  plot(timearray, tempout_soil[,r,2], type = "l", ylim = c(0,max(tempout_soil[,r,3])), ylab= paste(outvar[r]), xlab = NA, main= "Soil")
  lines(timearray, tempout_soil[,r,1], type = "l", lty= 2, col = "red")
  lines(timearray, tempout_soil[,r,3], type = "l", lty= 4, col = "blue")
}
#mtext(text = paste("Fig. 14 Time series plots of lower, middle, and upper quartiles."), side = 1, line = 1, outer = T)
dev.off()


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
foliar_prepost <- tdarray_foliar[c(519, 579),1,1:Nsims] #random timestamp pre pesticide application date
seed_prepost <- tdarray_seed[c(519, 579),1,1:Nsims] #random timestamp pre pesticide application date
soil_prepost <- tdarray_soil[c(519, 579),1,1:Nsims] #random timestamp pre pesticide application date


pcccontrol_prepost<- array(data=NA, c(2,1,length(inputdata_control)), dimnames = list(c("pre", "post"),
                                                                                   c("Colony Size"),
                                                                                   c(colnames(inputdata_control))))
pccfoliar_prepost<- array(data=NA, c(2,1,length(inputdata_foliar)), dimnames = list(c("pre", "post"), 
                                                                                c("Colony Size"), 
                                                                                c(colnames(inputdata_foliar))))
pccseed_prepost<- array(data=NA, c(2,1,length(inputdata_seed)), dimnames = list(c("pre", "post"), 
                                                                            c("Colony Size"), 
                                                                            c(colnames(inputdata_seed))))
pccsoil_prepost<- array(data=NA, c(2,1,length(inputdata_soil)), dimnames = list(c("pre", "post"), 
                                                                            c("Colony Size"), 
                                                                            c(colnames(inputdata_soil))))

for (i in 1:2){  #break
  tempinput<- control_prepost[i,1:1000]
  #pcc(input_dataframe, output, rank = FALSE, nboot = 0, conf = 0.95)
  temp_pcc<- pcc(inputdata_control[1:1000,], tempinput, rank = F)
  pcccontrol_prepost[i,,] <- temp_pcc$PCC[[1]]
}
pcc_control_prepost <- adply(pcccontrol_prepost, 3)
sig_control_prepost <- subset(pcc_control_prepost, abs(pcc_control_prepost$pre) > 0.062 & abs(pcc_control_prepost$post) > 0.062)
sig_control_prepost$Method <- "Control"
ordered_control_pre <- pcc_control_prepost[order(abs(pcc_control_prepost$pre), decreasing = T),1:2]
ordered_control_post <- pcc_control_prepost[order(abs(pcc_control_prepost$post), decreasing = T),c(1,3)]
control_pcc_prepost <- cbind(ordered_control_pre[1:10,], ordered_control_post[1:10,])
#control_pcc <- subset(pccdf_control, abs(pccdf_control$V1) > 0.062)

for (i in 1:2){  #break
  tempinput<- foliar_prepost[i,1:1000]
  #pcc(input_dataframe, output, rank = FALSE, nboot = 0, conf = 0.95)
  temp_pcc<- pcc(inputdata_foliar[1:1000,], tempinput, rank = F)
  pccfoliar_prepost[i,,] <- temp_pcc$PCC[[1]]
}
pcc_foliar_prepost <- adply(pccfoliar_prepost, 3)
sig_foliar_prepost <- subset(pcc_foliar_prepost, abs(pcc_foliar_prepost$pre) > 0.062 & abs(pcc_foliar_prepost$post) > 0.062)
sig_foliar_prepost$Method <- "Foliar"
ordered_foliar_pre <- pcc_foliar_prepost[order(abs(pcc_foliar_prepost$pre), decreasing = T),1:2]
ordered_foliar_post <- pcc_foliar_prepost[order(abs(pcc_foliar_prepost$post), decreasing = T),c(1,3)]
foliar_pcc_prepost <- cbind(ordered_foliar_pre[1:10,], ordered_foliar_post[1:10,])
#foliar_pcc <- subset(pccdf_foliar, abs(pccdf_foliar$V1) > 0.062)

for (i in 1:2){  #break
  tempinput<- soil_prepost[i,1:1000]
  #pcc(input_dataframe, output, rank = FALSE, nboot = 0, conf = 0.95)
  temp_pcc<- pcc(inputdata_soil[1:1000,], tempinput, rank = F)
  pccsoil_prepost[i,,] <- temp_pcc$PCC[[1]]
}
pcc_soil_prepost <- adply(pccsoil_prepost, 3)
sig_soil_prepost <- subset(pcc_soil_prepost, abs(pcc_soil_prepost$pre) > 0.062 & abs(pcc_soil_prepost$post) > 0.062)
sig_soil_prepost$Method <- "Soil"
ordered_soil_pre <- pcc_soil_prepost[order(abs(pcc_soil_prepost$pre), decreasing = T),1:2]
ordered_soil_post <- pcc_soil_prepost[order(abs(pcc_soil_prepost$post), decreasing = T),c(1,3)]
soil_pcc_prepost <- cbind(ordered_soil_pre[1:10,], ordered_soil_post[1:10,])

for (i in 1:2){  #break
  tempinput<- seed_prepost[i,1:1000]
  #pcc(input_dataframe, output, rank = FALSE, nboot = 0, conf = 0.95)
  temp_pcc<- pcc(inputdata_seed[1:1000,], tempinput, rank = F)
  pccseed_prepost[i,,] <- temp_pcc$PCC[[1]]
}
pcc_seed_prepost <- adply(pccseed_prepost, 3)
sig_seed_prepost <- subset(pcc_seed_prepost, abs(pcc_seed_prepost$pre) > 0.062 & abs(pcc_seed_prepost$post) > 0.062)
sig_seed_prepost$Method <- "Seed"
ordered_seed_pre <- pcc_seed_prepost[order(abs(pcc_seed_prepost$pre), decreasing = T),1:2]
ordered_seed_post <- pcc_seed_prepost[order(abs(pcc_seed_prepost$post), decreasing = T),c(1,3)]
seed_pcc_prepost <- cbind(ordered_seed_pre[1:10,], ordered_seed_post[1:10,])
#seed_pcc <- subset(pccdf_seed, abs(pccdf_seed$V1) > 0.062)

sig_prepost <- melt(rbind(sig_control_prepost,sig_foliar_prepost,sig_soil_prepost,sig_seed_prepost))
ii <- ggplot(data = sig_prepost,aes(x = sig_prepost$Method, y=sig_prepost$value)) +
  geom_histogram(stat="identity") +
  scale_y_continuous(limits= c(-1,1)) +
  facet_grid(. ~ X1)

aa<- ggplot(data=control_pcc_prepost, aes(x= control_pcc_prepost[[1]], y= control_pcc_prepost[[2]])) +
  geom_bar(stat="identity", position = "identity") +
  scale_y_continuous(limits= c(-1,1)) +
  coord_flip() +
  labs(title= "Control", x=" ", y= "Partial Correlation Coefficient") +
#  facet_grid(. ~ ) +
  theme_bw()

bb<- ggplot(data=foliar_pcc_prepost, aes(x= foliar_pcc_prepost[[1]], y= foliar_pcc_prepost[[2]])) +
  geom_bar(stat="identity", position = "identity") +
  scale_y_continuous(limits= c(-1,1)) +
  coord_flip() +
  labs(title= "Foliar", x=" ", y= "Partial Correlation Coefficient") +
  #facet_grid(. ~ Var2) +
  theme_bw()

cc<- ggplot(data=seed_pcc_prepost, aes(x= seed_pcc_prepost[[1]], y= seed_pcc_prepost[[2]])) +
  geom_bar(stat="identity", position = "identity") +
  scale_y_continuous(limits= c(-1,1)) +
  coord_flip() +
  labs(title= "Seed", x=" ", y= "Partial Correlation Coefficient") +
  #facet_grid(. ~ Var2) +
  theme_bw()

dd<- ggplot(data=soil_pcc_prepost, aes(x= soil_pcc_prepost[[1]], y= soil_pcc_prepost[[2]])) +
  geom_bar(stat="identity", position = "identity") +
  scale_y_continuous(limits= c(-1,1)) +
  coord_flip() +
  labs(title= "Soil", x=" ", y= "Partial Correlation Coefficient") +
  #facet_grid(. ~ Var2) +
  theme_bw()

ee<- ggplot(data=control_pcc_prepost, aes(x= control_pcc_prepost[[3]], y= control_pcc_prepost[[4]])) +
  geom_bar(stat="identity", position = "identity") +
  scale_y_continuous(limits= c(-1,1)) +
  coord_flip() +
  labs(title= "Control", x=" ", y= "Partial Correlation Coefficient") +
  #  facet_grid(. ~ ) +
  theme_bw()

ff<- ggplot(data=foliar_pcc_prepost, aes(x= foliar_pcc_prepost[[3]], y= foliar_pcc_prepost[[4]])) +
  geom_bar(stat="identity", position = "identity") +
  scale_y_continuous(limits= c(-1,1)) +
  coord_flip() +
  labs(title= "Foliar", x=" ", y= "Partial Correlation Coefficient") +
  #facet_grid(. ~ Var2) +
  theme_bw()

gg<- ggplot(data=seed_pcc_prepost, aes(x= seed_pcc_prepost[[3]], y= seed_pcc_prepost[[4]])) +
  geom_bar(stat="identity", position = "identity") +
  scale_y_continuous(limits= c(-1,1)) +
  coord_flip() +
  labs(title= "Seed", x=" ", y= "Partial Correlation Coefficient") +
  #facet_grid(. ~ Var2) +
  theme_bw()

hh<- ggplot(data=soil_pcc_prepost, aes(x= soil_pcc_prepost[[3]], y= soil_pcc_prepost[[4]])) +
  geom_bar(stat="identity", position = "identity") +
  scale_y_continuous(limits= c(-1,1)) +
  coord_flip() +
  labs(title= "Soil", x=" ", y= "Partial Correlation Coefficient") +
  #facet_grid(. ~ Var2) +
  theme_bw()


pdf(file= paste(vpdir_fig, "fig_tornado_prepost.pdf", sep=""), width = 8.5, height = 11, onefile = TRUE, paper = "USr")
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

png(file= paste(vpdir_fig, "fig_tornado_prepost.png", sep=""), width = 8, height = 7, units='in', pointsize=12, res=300)
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
out_foliar_colsize <- tdarray_foliar[549:579,1,1:Nsims]
out_seed_colsize <- tdarray_seed[549:579,1,1:Nsims]
out_soil_colsize <- tdarray_soil[549:579,1,1:Nsims]

avg_control_colsize <- colMeans(out_control_colsize) #average across entire simulation period
avg_foliar_colsize <- colMeans(out_foliar_colsize) #average across enture simulation period
avg_seed_colsize <- colMeans(out_seed_colsize) #average across enture simulation period
avg_soil_colsize <- colMeans(out_soil_colsize) #average across enture simulation period

pcctdarray_control<- array(data=NA, c(1,1,length(inputdata_control)), dimnames = list(c("x"),
                                                           c("Colony Size"),
                                                           c(colnames(inputdata_control))))
pcctdarray_foliar<- array(data=NA, c(1,1,length(inputdata_foliar)), dimnames = list(c("x"), 
                                                           c("Colony Size"), 
                                                           c(colnames(inputdata_foliar))))
pcctdarray_seed<- array(data=NA, c(1,1,length(inputdata_seed)), dimnames = list(c("x"), 
                                                                                    c("Colony Size"), 
                                                                                    c(colnames(inputdata_seed))))
pcctdarray_soil<- array(data=NA, c(1,1,length(inputdata_soil)), dimnames = list(c("x"), 
                                                                                    c("Colony Size"), 
                                                                                    c(colnames(inputdata_soil))))

for (k in 1:length(inputdata_control)){  #input variable
  temp_control<- pcc(inputdata_control, avg_control_colsize, rank = T)
  pcctdarray_control[,,k]<- temp_control$PRCC[[1]][k]
}
pccdf_control <- adply(pcctdarray_control, c(2,3), .id = c("Colony Size", "Input"))
ordered_control <- pccdf_control[order(abs(pccdf_control$V1), decreasing = T),]
control_pcc <- ordered_control[1:10,]
#control_pcc <- subset(pccdf_control, abs(pccdf_control$V1) > 0.062)


for (k in 1:length(inputdata_foliar)){  #input variable
  temp_foliar<- pcc(inputdata_foliar, avg_foliar_colsize, rank = T)
  pcctdarray_foliar[,,k]<- temp_foliar$PRCC[[1]][k]
}
pccdf_foliar <- adply(pcctdarray_foliar, c(2,3), .id = c("Colony Size", "Input"))
ordered_foliar <- pccdf_foliar[order(abs(pccdf_foliar$V1), decreasing = T),]
foliar_pcc <- ordered_foliar[1:10,]
#foliar_pcc <- subset(pccdf_foliar, abs(pccdf_foliar$V1) > 0.062)

for (k in 1:length(inputdata_seed)){  #input variable
  temp_seed<- pcc(inputdata_seed, avg_seed_colsize, rank = T)
  pcctdarray_seed[,,k]<- temp_seed$PRCC[[1]][k]
}
pccdf_seed <- adply(pcctdarray_seed, c(2,3), .id = c("Colony Size", "Input"))
ordered_seed <- pccdf_seed[order(abs(pccdf_seed$V1), decreasing = T),]
seed_pcc <- ordered_seed[1:10,]
#seed_pcc <- subset(pccdf_seed, abs(pccdf_seed$V1) > 0.062)

for (k in 1:length(inputdata_soil)){  #input variable
  temp_soil<- pcc(inputdata_soil, avg_soil_colsize, rank = T)
  pcctdarray_soil[,,k]<- temp_soil$PRCC[[1]][k]
}
pccdf_soil <- adply(pcctdarray_soil, c(2,3), .id = c("Colony Size", "Input"))
ordered_soil <- pccdf_soil[order(abs(pccdf_soil$V1), decreasing = T),]
soil_pcc <- ordered_soil[1:10,]
#soil_pcc <- subset(pccdf_soil, abs(pccdf_soil$V1) > 0.062)


# dfpcc_con<- ldply(pcctdarray_con, rbind)
# colnames(dfpcc_con)<- c("Colony Size")

# dfpcc_control<- melt(pcctdarray_control)
# dfpcc_foliar <- melt(pcctdarray_foliar)
# dfpcc_seed <- melt(pcctdarray_seed)
# dfpcc_soil <- melt(pcctdarray_soil)

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

  bb<- ggplot(data=foliar_pcc, aes(x= foliar_pcc[[2]], y= foliar_pcc[[3]])) + 
    geom_bar(stat="identity", position = "identity") +
    scale_y_continuous(limits= c(-1,1)) +
    coord_flip() +
    labs(title= "Foliar", x=" ", y= "Partial Correlation Coefficient") +
    #facet_grid(. ~ Var2) +
    theme_bw()
  print(bb, vp= viewport(layout.pos.row= 1, layout.pos.col= 2), newpage= FALSE)
 
  cc<- ggplot(data=seed_pcc, aes(x= seed_pcc[[2]], y= seed_pcc[[3]])) + 
     geom_bar(stat="identity", position = "identity") +
     scale_y_continuous(limits= c(-1,1)) +
     coord_flip() +
     labs(title= "Seed", x=" ", y= "Partial Correlation Coefficient") +
     #facet_grid(. ~ Var2) +
     theme_bw()
   print(cc, vp= viewport(layout.pos.row= 1, layout.pos.col= 3), newpage= FALSE)
   
  dd<- ggplot(data=soil_pcc, aes(x= soil_pcc[[2]], y= soil_pcc[[3]])) + 
    geom_bar(stat="identity", position = "identity") +
    scale_y_continuous(limits= c(-1,1)) +
    coord_flip() +
    labs(title= "Soil", x=" ", y= "Partial Correlation Coefficient") +
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

bb<- ggplot(data=foliar_pcc, aes(x= foliar_pcc[[2]], y= foliar_pcc[[3]])) + 
  geom_bar(stat="identity", position = "identity") +
  scale_y_continuous(limits= c(-1,1)) +
  coord_flip() +
  labs(title= "Foliar", x=" ", y= "Partial Correlation Coefficient") +
  #facet_grid(. ~ Var2) +
  theme_bw()
print(bb, vp= viewport(layout.pos.row= 1, layout.pos.col= 2), newpage= FALSE)

cc<- ggplot(data=seed_pcc, aes(x= seed_pcc[[2]], y= seed_pcc[[3]])) + 
  geom_bar(stat="identity", position = "identity") +
  scale_y_continuous(limits= c(-1,1)) +
  coord_flip() +
  labs(title= "Seed", x=" ", y= "Partial Correlation Coefficient") +
  #facet_grid(. ~ Var2) +
  theme_bw()
print(cc, vp= viewport(layout.pos.row= 1, layout.pos.col= 3), newpage= FALSE)

dd<- ggplot(data=soil_pcc, aes(x= soil_pcc[[2]], y= soil_pcc[[3]])) + 
  geom_bar(stat="identity", position = "identity") +
  scale_y_continuous(limits= c(-1,1)) +
  coord_flip() +
  labs(title= "Soil", x=" ", y= "Partial Correlation Coefficient") +
  #facet_grid(. ~ Var2) +
  theme_bw()
print(dd, vp= viewport(layout.pos.row= 1, layout.pos.col= 4), newpage= FALSE)

dev.off()