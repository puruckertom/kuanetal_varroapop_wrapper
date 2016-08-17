#plot crunching ###########
#colony persistence
cp_con <- rep(NA, nrows)
cp_exp <- rep(NA, nrows)
for (n in 1:nrows){
  x <- which(tdarray_con[n,1,1:Nsims] > 1000) # queries colony size > 1000 for 1000 simulations at each time point
  y <- which(tdarray_exp[n,1,1:Nsims] > 1000)
  cp_con[n] <- length(x)/Nsims #appends vector x with proportion of simulations per time step with Col Size > 0
  cp_exp[n] <- length(y)/Nsims
}

#foragers
fa_con <- rep(NA, nrows)
fa_exp <- rep(NA, nrows)
for (n in 1:nrows){
  x <- which(tdarray_con[n,4,1:Nsims] > 0) 
  y <- which(tdarray_exp[n,4,1:Nsims] > 0)
  fa_con[n] <- length(x)/Nsims
  fa_exp[n] <- length(y)/Nsims
}

#adult workers
aw_con <- rep(NA, nrows)
aw_exp <- rep(NA, nrows)
for (n in 1:nrows){
  x <- which(tdarray_con[n,3,1:Nsims] > 0)
  y <- which(tdarray_exp[n,3,1:Nsims] > 0)
  aw_con[n] <- length(x)/Nsims
  aw_exp[n] <- length(y)/Nsims
}

#free mites
fm_con <- rep(NA, nrows)
fm_exp <- rep(NA, nrows)
for (n in 1:nrows){
  x <- which(tdarray_con[n,11,1:Nsims] > 0)
  y <- which(tdarray_exp[n,11,1:Nsims] > 0)
  fm_con[n] <- length(x)/Nsims 
  fm_exp[n] <- length(y)/Nsims 
}

#dead foragers
dfr_con <- rep(NA, nrows)
dfr_exp <- rep(NA, nrows)
for (n in 1:nrows){
  x <- which(tdarray_con[n,1,1:Nsims] > 0) 
  y <- which(tdarray_exp[n,1,1:Nsims] > 0) 
  dfr_con[n] <- length(x)/Nsims 
  dfr_exp[n] <- length(y)/Nsims
}

#dead mites
dm_con <- rep(NA, nrows)
dm_exp <- rep(NA, nrows)
for (n in 1:nrows){
  x <- which(tdarray_con[n,16,1:Nsims] > 0)
  y <- which(tdarray_exp[n,16,1:Nsims] > 0)
  dm_con[n] <- length(x)/Nsims
  dm_exp[n] <- length(y)/Nsims
}

#capped drone brood
cdb_con <- rep(NA, nrows)
cdb_exp <- rep(NA, nrows)
for (n in 1:nrows){
  x <- which(tdarray_con[n, 5, 1:Nsims] > 0)
  y <- which(tdarray_exp[n, 5, 1:Nsims] > 0)
  cdb_con[n] <- length(x)/Nsims
  cdb_exp[n] <- length(y)/Nsims
}

#capped worker brood
cwb_con <- rep(NA, nrows)
cwb_exp <- rep(NA, nrows)
for (n in 1:nrows){
  x <- which(tdarray_con[n, 6, 1:Nsims] > 0)
  y <- which(tdarray_exp[n, 6, 1:Nsims] > 0)
  cwb_con[n] <- length(x)/Nsims
  cwb_exp[n] <- length(y)/Nsims
}

#MC proportions ##########
pdf(file= paste(vpdir_fig, "fig_1_MCproportions_convsexp.pdf", sep=""), width = 5, height = 9, onefile = TRUE, paper = "USr")
  #start figures
  par(mfrow=c(3,1), mar=c(2,4,1,0.5), oma=c(4,2,2,1))
  plot(timearray, cp_con, type="l", col="blue", ylab = "P(Colony Size) > 0", main= "Time", ylim=c(0,1), xlab=NA)
  lines(timearray, cp_exp, type="l", lty = 2, col="red")
  plot(timearray, fa_con, type="l", col="blue", ylab= "P(Foragers) > 0", ylim=c(0,1), xlab=NA) 
  lines(timearray, fa_exp, type="l", lty = 2, col="red")
  plot(timearray, aw_con, type="l", col="blue", ylab= "P(Adult Workers) > 0", ylim=c(0,1), xlab=NA) 
  lines(timearray, aw_exp, type="l", lty = 2, col="red")
  #plot(timearray, fm_con, type="l", col="blue", ylab= "P(Free Mites) > 0", ylim=c(0,1), xlab=NA) 
  #lines(timearray, fm_exp, type="l", lty = 2, col="red")
  #plot(timearray, dfr_con, type="l", col="blue", ylab= "P(Dead Foragers) > 0", ylim=c(0,1), xlab=NA) 
  #lines(timearray, dfr_exp, type="l", lty = 2, col="red")
  #mtext(text = paste("Fig. 1 Proportion of simulations with values greater than zero"), side = 1, line = 1, outer = T)
dev.off()


#time series plotting #######
temparray_con <- tdarray_con[1:nrows,resvar,1:Nsims]
temparray_exp <- tdarray_exp[1:nrows,resvar,1:Nsims]
dimnames(temparray_con)<- list(c(as.character(timearray)), c(outvar))
dimnames(temparray_exp)<- list(c(as.character(timearray)), c(outvar))
tempout_con<- array(data=NA, c(nrows,5,3), dimnames = list(c(as.character(timearray)), 
                                                           c("Colony Size","Adult Workers", "Foragers", "Worker Eggs", "Colony Pollen (g)"),
                                                           c("25%","50%","75%")))
tempout_exp<- array(data=NA, c(nrows,5,3), dimnames = list(c(as.character(timearray)), 
                                                           c("Colony Size","Adult Workers", "Foragers", "Worker Eggs", "Colony Pollen (g)"), 
                                                           c("25%","50%","75%")))
for (r in 1:5){
  for (t in 1:nrows){
    p<- quantile(temparray_con[t, r, 1:Nsims])
    z<- quantile(temparray_exp[t, r, 1:Nsims])
    for (s in 1:3){
      quant_con<- c(p[[2]], p[[3]], p[[4]])
      quant_exp<- c(z[[2]], z[[3]], z[[4]])
      tempout_con[t,r,s]<- quant_con[s]
      tempout_exp[t,r,s]<- quant_exp[s]
    }
  }
}

#create PDF timeseries
pdf(file= paste(vpdir_fig, "fig_quantile_timeseries.pdf", sep=""), width = 8.5, height = 11, onefile = TRUE, paper = "USr")
#start figures
#time series plots
par(mfrow=c(5,2), mar=c(2, 4, 2, 0.5), oma= c(3,2,2,6.5))

for (r in 1:4){
  plot(timearray, tempout_con[,r,2], type = "l", ylim = c(0,max(tempout_con[,r,3])), ylab= paste(outvar[r]), xlab = NA, main= "Control")
  lines(timearray, tempout_con[,r,1], type = "l", lty= 2, col = "red")
  lines(timearray, tempout_con[,r,3], type = "l", lty= 4, col = "blue")
  
  plot(timearray, tempout_exp[,r,2], type = "l", ylim = c(0,max(tempout_exp[,r,3])), ylab= paste(outvar[r]), xlab = NA, main= "Exposed")
  lines(timearray, tempout_exp[,r,1], type = "l", lty= 2, col = "red")
  lines(timearray, tempout_exp[,r,3], type = "l", lty= 4, col = "blue")
}
#mtext(text = paste("Fig. 14 Time series plots of lower, middle, and upper quartiles."), side = 1, line = 1, outer = T)
dev.off()

#tornado plots #########
invar<- c(colnames(inputdata_exp))
datsrc_con<- list()
datsrc_exp<- list()
datpcc_con<- list()
datpcc_exp<- list()

for (i in 1:5) {
  dfsrc_con<- mdply(srctdarray_con[i,1:5,], cbind)
  tdfsrc_con<- t(dfsrc_con)
  colnames(tdfsrc_con)<- outvar
  s<- melt(tdfsrc_con)
  datsrc_con[[i]]<- s
  
  dfsrc_exp<- mdply(srctdarray_exp[i,1:5,], cbind)
  tdfsrc_exp<- t(dfsrc_exp)
  colnames(tdfsrc_exp)<- outvar
  m<- melt(tdfsrc_exp)
  datsrc_exp[[i]]<- m
}


for (i in 1:5){
  dfpcc_con<- mdply(pcctdarray_con[i,1:5,], cbind)
  tdfpcc_con<- t(dfpcc_con)
  colnames(tdfpcc_con)<- outvar
  p<- melt(tdfpcc_con)
  datpcc_con[[i]]<- p
  
  dfpcc_exp<- mdply(pcctdarray_exp[i,1:5,], cbind)
  tdfpcc_exp<- t(dfpcc_exp)
  colnames(tdfpcc_exp)<- outvar
  n<- melt(tdfpcc_exp)
  datpcc_exp[[i]]<- n
}

#create PDF tornado
pdf(file= paste(vpdir_fig, "fig_tornado.pdf", sep=""), width = 8.5, height = 11, onefile = TRUE, paper = "USr")
#start figures
#create plot pages
grid.newpage()
pushViewport(viewport(layout=grid.layout(length(timebreak),1), gp= gpar(cex = 0.6)))
#start figures
for (i in 1:length(timebreak)) { #loops by timebreak
  aa<- ggplot(data=datsrc_con[[i]], aes(x= datsrc_con[[i]][[1]], y= datsrc_con[[i]][[3]])) + 
    geom_bar(stat="identity", position = "identity") +
    scale_y_continuous(limits= c(-1,1)) +
    coord_flip() +
    labs(title= paste("Control", i, sep=" "), x=" ", y= "Standardized Regression Coefficient") +
    facet_grid(. ~ Var2) +
    theme_bw()
  print(aa, vp= viewport(layout.pos.row= i, layout.pos.col= 1), newpage= FALSE)
}

grid.newpage()
pushViewport(viewport(layout=grid.layout(length(timebreak),1), gp= gpar(cex = 0.6)))
for (i in 1:length(timebreak)) { #loops by timebreak
  cc<- ggplot(data=datsrc_exp[[i]], aes(x= datsrc_exp[[i]][[1]], y= datsrc_exp[[i]][[3]])) + 
    geom_bar(stat="identity", position = "identity") +
    scale_y_continuous(limits= c(-1,1)) +
    coord_flip() +
    labs(title= paste("Exposed", i, sep=" "), x=" ", y= "Standardized Regression Coefficient") +
    facet_grid(. ~ Var2) +
    theme_bw()
  print(cc, vp= viewport(layout.pos.row= i, layout.pos.col= 1), newpage= FALSE)
}

grid.newpage()
pushViewport(viewport(layout=grid.layout(length(timebreak),1), gp= gpar(cex = 0.6)))
for (i in 1:length(timebreak)) { #loops by timebreak
  bb<- ggplot(data=datpcc_con[[i]], aes(x= datpcc_con[[i]][[1]], y= datpcc_con[[i]][[3]])) + 
    geom_bar(stat="identity", position = "identity") +
    scale_y_continuous(limits= c(-1,1)) +
    coord_flip() +
    labs(title= paste("Control", i, sep = " "), x=" ", y= "Partial Correlation Coefficient") +
    facet_grid(. ~ Var2) +
    theme_bw()
  print(bb, vp= viewport(layout.pos.row= i, layout.pos.col= 1), newpage= FALSE)
}

grid.newpage()
pushViewport(viewport(layout=grid.layout(length(timebreak),1), gp= gpar(cex = 0.6)))
for (i in 1:length(timebreak)) { #loops by timebreak
  dd<- ggplot(data=datpcc_exp[[i]], aes(x= datpcc_exp[[i]][[1]], y= datpcc_exp[[i]][[3]])) + 
    geom_bar(stat="identity", position = "identity") +
    scale_y_continuous(limits= c(-1,1)) +
    coord_flip() +
    labs(title= paste("Exposed", i, sep = " "), x=" ", y= "Partial Correlation Coefficient") +
    facet_grid(. ~ Var2) +
    theme_bw()
  print(dd, vp= viewport(layout.pos.row= i, layout.pos.col= 1), newpage= FALSE)
}
dev.off()


#tornado plot of COLONY SIZE #######
tdoutput_con <- tdarray_con[800,1,1:Nsims]
tdoutput_exp <- tdarray_exp[800,1,1:Nsims]

pcctdarray_con<- array(data=NA, c(1,1,length(inputdata_con)), dimnames = list(c("x"),
                                                           c("Colony Size"),
                                                           c(colnames(inputdata_con))))
pcctdarray_exp<- array(data=NA, c(1,1,length(inputdata_exp)), dimnames = list(c("x"), 
                                                           c("Colony Size"), 
                                                           c(colnames(inputdata_exp))))
#PCC control
for (i in 800){  
  for (j in 1){   #output variable
    for (k in 1:length(inputdata_con)){  #input variable
      tempinput<- tdoutput_con[1:Nsims]
      temp<- pcc(inputdata_con[1:Nsims,], tempinput, rank = T)
      pcctdarray_con[1,j,k]<- temp$PRCC[[1]][k]
      print(i)
    }
  }
}

#PCC exposed
for (i in 800){  #break
  for (j in 1){   #output variable
    for (k in 1:length(inputdata_exp)){  #input variable
      tempinput<- tdoutput_exp[1:Nsims]
      temp<- pcc(inputdata_exp[1:Nsims,], tempinput, rank = T)
      pcctdarray_exp[1,j,k]<- temp$PRCC[[1]][k]
      print(i)
    }
  }
}



# srctdarray_con<- array(data=NA, c(1,1,length(inputdata_con)), dimnames = list(c("x"),
#                                                                                   c("Colony Size"),
#                                                                                   c(colnames(inputdata_con))))
# srctdarray_exp<- array(data=NA, c(1,1,length(inputdata_exp)), dimnames = list(c("x"), 
#                                                                                   c("Colony Size"), 
#                                                                                   c(colnames(inputdata_exp))))
# #SRC control
# for (i in 800){  
#   for (j in 1){   #output variable
#     for (k in 1:length(inputdata_con)){  #input variable
#       tempinput<- tdoutput_con[1:Nsims]
#       temp<- src(inputdata_con[1:Nsims,], tempinput, rank = T)
#       srctdarray_con[1,j,k]<- temp$SRRC[[1]][k]
#       print(i)
#     }
#   }
# }
# 
# #SRC exposed
# for (i in 800){  #break
#   for (j in 1){   #output variable
#     for (k in 1:length(inputdata_exp)){  #input variable
#       tempinput<- tdoutput_exp[1:Nsims]
#       temp<- src(inputdata_exp[1:Nsims,], tempinput, rank = T)
#       srctdarray_exp[1,j,k]<- temp$SRRC[[1]][k]
#       print(i)
#     }
#   }
# }

invar<- c(colnames(inputdata_exp))
datpcc_con<- list()
datpcc_exp<- list()

  dfpcc_con<- ldply(pcctdarray_con[1,1,], rbind)
  colnames(dfpcc_con)<- c("Input","Colony Size")
  s<- melt(dfpcc_con)
  datpcc_con[[1]]<- s
  
  dfpcc_exp <- ldply(pcctdarray_exp[1,1,], rbind)
  colnames(dfpcc_exp)<- c("Input","Colony Size")
  n<- melt(dfpcc_exp)
  datpcc_exp[[1]]<- n


pdf(file= paste(vpdir_fig, "fig_tornado_colonysize.pdf", sep=""), width = 8.5, height = 11, onefile = TRUE, paper = "USr")
#start figures
#create plot pages
grid.newpage()
pushViewport(viewport(layout=grid.layout(1,2), gp= gpar(cex = 0.6)))
#start figures
  aa<- ggplot(data=dfpcc_con, aes(x= dfpcc_con[[1]], y= dfpcc_con[[2]])) + 
    geom_bar(stat="identity", position = "identity") +
    scale_y_continuous(limits= c(-1,1)) +
    coord_flip() +
    labs(title= "Control", x=" ", y= "Partial Correlation Coefficient") +
    #facet_grid(. ~ Colony Size) +
    theme_bw()
  print(aa, vp= viewport(layout.pos.row= 1, layout.pos.col= 1), newpage= FALSE)

  cc<- ggplot(data=dfpcc_exp, aes(x= dfpcc_exp[[1]], y= dfpcc_exp[[2]])) + 
    geom_bar(stat="identity", position = "identity") +
    scale_y_continuous(limits= c(-1,1)) +
    coord_flip() +
    labs(title= "Exposed", x=" ", y= "Partial Correlation Coefficient") +
    #facet_grid(. ~ Var2) +
    theme_bw()
  print(cc, vp= viewport(layout.pos.row= 1, layout.pos.col= 2), newpage= FALSE)

dev.off()
