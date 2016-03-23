#TIME SERIES#######
temparray_con <- tdarray_con[1:nrows,resvar,1:Nsims]
temparray_exp <- tdarray_exp[1:nrows,resvar,1:Nsims]
dimnames(temparray_con)<- list(c(as.character(timearray)), c(outvar))
dimnames(temparray_exp)<- list(c(as.character(timearray)), c(outvar))
tempout_con<- array(data=NA, c(nrows,6,3), dimnames = list(c(as.character(timearray)), 
                                                           c("Colony Size","Adult Workers", "Foragers", "Worker Eggs", "Colony Pollen (g)","Colony Nectar"),
                                                           c("25%","50%","75%")))
tempout_exp<- array(data=NA, c(nrows,6,3), dimnames = list(c(as.character(timearray)), 
                                                           c("Colony Size","Adult Workers", "Foragers", "Worker Eggs", "Colony Pollen (g)","Colony Nectar"), 
                                                           c("25%","50%","75%")))
for (r in 1:6){
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
jpeg(filename= "fig_quantile_timeseries_asb.jpg", width = 200, height = 200, units= "px", quality=100, bg="white")
#start figures
#time series plots
par(mfrow=c(2,2), mar=c(2, 4, 2, 2), oma= c(2,2,2,2))

for (r in c(1,5,2,4)){
  plot(timearray, tempout_con[,r,2], type = "l", ylim = c(0,max(tempout_con[,r,3])), ylab= paste(outvar[r]), xlab = NA, main= paste(outvar[r], sep=" "))
  lines(timearray, tempout_con[,r,1], type = "l", lty= 1, col = "red")
  lines(timearray, tempout_con[,r,3], type = "l", lty=1, col = "blue")
  
  lines(timearray, tempout_exp[,r,2], lty=2, ylim = c(0,max(tempout_exp[,r,3])))
  lines(timearray, tempout_exp[,r,1], type = "l", lty=2, col = "red")
  lines(timearray, tempout_exp[,r,3], type = "l", lty=2, col = "blue")
}

legend("topright", legend=c("Control 1st Quartile", "Control Median", "Control 3rd Quartile", "Exposed 1st Quartile", "Exposed Median", "Exposed 3rd Quartile"), col = c("blue","black","red","blue","black","red"), lty= c(1,1,1,2,2,2), cex=0.85)
mtext(text = paste("Fig. 14 Time series plots of lower, middle, and upper quartiles."), side = 1, line = 1, outer = T)
dev.off()



#TORNADO PLOTS ###########
invar<- c("Drone-Mite Survivorship", "Forager Lifespan", "Queen Strength", "Worker:Drone","Worker-Mite Survivorship", "Adult Slope Contact","Adult LD50 Contact", "Larva Slope", "Larva LD50","KOW","KOC","Half Life")
datsrc_con<- list()
datsrc_exp<- list()
datpcc_con<- list()
datpcc_exp<- list()

for (i in 1:5) {
  dfsrc_con<- mdply(srctdarray_con[i,1:6,1:12], cbind)
  tdfsrc_con<- t(dfsrc_con)
  colnames(tdfsrc_con)<- outvar
  s<- melt(tdfsrc_con)
  datsrc_con[[i]]<- s
  
  dfsrc_exp<- mdply(srctdarray_exp[i,1:6,1:12], cbind)
  tdfsrc_exp<- t(dfsrc_exp)
  colnames(tdfsrc_exp)<- outvar
  v<- melt(tdfsrc_exp)
  datsrc_exp[[i]]<- v
}


for (i in 1:5){
  dfpcc_con<- mdply(pcctdarray_con[i,1:6,1:12], cbind)
  tdfpcc_con<- t(dfpcc_con)
  colnames(tdfpcc_con)<- outvar
  p<- melt(tdfpcc_con)
  datpcc_con[[i]]<- p
  
  dfpcc_exp<- mdply(pcctdarray_exp[i,1:6,1:12], cbind)
  tdfpcc_exp<- t(dfpcc_exp)
  colnames(tdfpcc_exp)<- outvar
  u<- melt(tdfpcc_exp)
  datpcc_exp[[i]]<- u
}

#create PDF tornado
pdf(file= paste(vpdir_output, "fig_tornado.pdf", sep=""), width = 8.5, height = 11, onefile = TRUE)
#start figures
#create plot pages
grid.newpage()
pushViewport(viewport(layout=grid.layout(length(timebreak),2), gp= gpar(cex = 0.6)))
#start figures
for (i in 1:length(timebreak)) { #loops by timebreak
  aa<- ggplot(data=datsrc_con[[i]], aes(x= datsrc_con[[i]][[1]], y= datsrc_con[[i]][[3]])) + 
    geom_bar(stat="identity", position = "identity") +
    scale_y_continuous(limits= c(-1,1)) +
    coord_flip() +
    labs(title= paste("timebreak", i, sep=" "), x=" ", y= "Standardized Regression Coefficient") +
    facet_grid(. ~ Var2) +
    theme_bw()
  print(aa, vp= viewport(layout.pos.row= i, layout.pos.col= 1), newpage= FALSE)
  
  cc<- ggplot(data=datsrc_exp[[i]], aes(x= datsrc_exp[[i]][[1]], y= datsrc_exp[[i]][[3]])) + 
    geom_bar(stat="identity", position = "identity") +
    scale_y_continuous(limits= c(-1,1)) +
    coord_flip() +
    labs(title= paste("timebreak", i, sep=" "), x=" ", y= "Standardized Regression Coefficient") +
    facet_grid(. ~ Var2,) +
    theme_bw()
  print(cc, vp= viewport(layout.pos.row= i, layout.pos.col= 2), newpage= FALSE)
}

grid.newpage()
pushViewport(viewport(layout=grid.layout(length(timebreak),2), gp= gpar(cex = 0.6)))
for (i in 1:length(timebreak)) { #loops by timebreak
  bb<- ggplot(data=datpcc_con[[i]], aes(x= datpcc_con[[i]][[1]], y= datpcc_con[[i]][[3]])) + 
    geom_bar(stat="identity", position = "identity") +
    scale_y_continuous(limits= c(-1,1)) +
    coord_flip() +
    labs(title= paste("timebreak", i, sep = " "), x=" ", y= "Partial Correlation Coefficient") +
    facet_grid(. ~ Var2) +
    theme_bw()
  print(bb, vp= viewport(layout.pos.row= i, layout.pos.col= 1), newpage= FALSE)
  
  dd<- ggplot(data=datpcc_exp[[i]], aes(x= datpcc_exp[[i]][[1]], y= datpcc_exp[[i]][[3]])) + 
    geom_bar(stat="identity", position = "identity") +
    scale_y_continuous(limits= c(-1,1)) +
    coord_flip() +
    labs(title= paste("timebreak", i, sep = " "), x=" ", y= "Partial Correlation Coefficient") +
    facet_grid(. ~ Var2) +
    theme_bw()
  print(dd, vp= viewport(layout.pos.row= i, layout.pos.col= 2), newpage= FALSE)
}

dev.off()