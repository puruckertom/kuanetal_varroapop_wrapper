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
pdf(file= paste(vpdir_output, "fig_quantile_timeseries_asb.pdf", sep=""), width = 8.5, height = 11, onefile = TRUE, paper = "USr")
#start figures
#time series plots
par(mfrow=c(2,2), mar=c(2, 4, 2, 1), oma= c(5,1,5,1))

for (r in c(1,5,2,4)){
  plot(timearray, tempout_con[,r,2], type = "l", ylim = c(0,max(tempout_con[,r,3])), ylab= paste(outvar[r]), xlab = NA, main= paste(outvar[r], sep=" "))
  lines(timearray, tempout_con[,r,1], type = "l", lty= 1, col = "red")
  lines(timearray, tempout_con[,r,3], type = "l", lty=1, col = "blue")
  
  lines(timearray, tempout_exp[,r,2], lty=2, ylim = c(0,max(tempout_exp[,r,3])))
  lines(timearray, tempout_exp[,r,1], type = "l", lty=2, col = "red")
  lines(timearray, tempout_exp[,r,3], type = "l", lty=2, col = "blue")
}

dev.off()
plot.new()
legend("right",cex = 0.65,bty="n",xpd=TRUE,legend=c("Control Q1", "Control Q2", "Control Q3", "Exposed Q1", "Exposed Q2", "Exposed Q3"), col = c("blue","black","red","blue","black","red"), lty= c(1,1,1,2,2,2))


#TORNADO PLOTS ###########
invar<- c("Drone-Mite Survivorship", "Forager Lifespan", "Queen Strength", "Worker:Drone","Worker-Mite Survivorship", "Adult Slope Contact","Adult LD50 Contact", "Larva Slope", "Larva LD50","KOW","KOC","Half Life")
datsrc_con<- list()
datsrc_exp<- list()
datpcc_con<- list()
datpcc_exp<- list()

for(j in c(1,2)){
  dfsrc_con<- mdply(srctdarray_con[93,1:6,1:12], cbind)
  tdfsrc_con<- t(dfsrc_con)
  colnames(tdfsrc_con)<- outvar
  s<- melt(tdfsrc_con)
  datsrc_con[[2]]<- s
  
  dfsrc_exp<- mdply(srctdarray_exp[93,1:6,1:12], cbind)
  tdfsrc_exp<- t(dfsrc_exp)
  colnames(tdfsrc_exp)<- outvar
  v<- melt(tdfsrc_exp)
  datsrc_exp[[2]]<- v
}



for(j in c(1,2)){
  dfpcc_con<- mdply(pcctdarray_con[j,1:5,1:12], cbind)
  tdfpcc_con<- t(dfpcc_con)
  colnames(tdfpcc_con)<- outvar[1:5]
  p<- melt(tdfpcc_con)
  datpcc_con[[j]]<- p
  
  dfpcc_exp<- mdply(pcctdarray_exp[j,1:5,1:12], cbind)
  tdfpcc_exp<- t(dfpcc_exp)
  colnames(tdfpcc_exp)<- outvar[1:5]
  u<- melt(tdfpcc_exp)
  datpcc_exp[[j]]<- u
}


#create PDF tornado
pdf(file= paste(vpdir_output, "fig_tornado_asb.pdf", sep=""), width = 8.5, height = 11, onefile = TRUE, paper="USr")
#start figures
#create plot pages
grid.newpage()
pushViewport(viewport(layout=grid.layout(2,2), gp= gpar(cex = 0.6)))
#start figures
for (i in 1:2) { #loops by timebreak
  bb<- ggplot(data=datpcc_con[[i]], aes(x= datpcc_con[[i]][[1]], y= datpcc_con[[i]][[3]])) + 
    geom_bar(stat="identity", position = "identity") +
    scale_y_continuous(limits= c(-1,1)) +
    coord_flip() +
    labs(title= "Control Before", x=" ", y= " ") +
    facet_grid(. ~ Var2) 
  print(bb, vp= viewport(layout.pos.row= i, layout.pos.col= 1), newpage= FALSE)
  
  dd<- ggplot(data=datpcc_exp[[i]], aes(x= datpcc_exp[[i]][[1]], y= datpcc_exp[[i]][[3]])) + 
    geom_bar(stat="identity", position = "identity") +
    scale_y_continuous(limits= c(-1,1)) +
    coord_flip() +
    labs(title= "Exposed Before", x=" ", y= " ") +
    facet_grid(. ~ Var2) 
  print(dd, vp= viewport(layout.pos.row= i, layout.pos.col= 2), newpage= FALSE)
}

dev.off()



df_plot <- data.frame(tdarray_exp[,1,], row.names=timearray)
dfm_plot<- melt(df_plot)
dfm_plot$timearray<- rep(timearray,1000)
pdf(file= paste(vpdir_output, "fig_exposed_simulations_asb.pdf", sep=""), width = 8.5, height = 11, onefile = TRUE, paper = "USr")
ggplot() +
  geom_line(data = dfm_plot, aes(x = timearray, y = value, group = variable)) +
  xlab("Simulated Time Period") +
  ylab("Colony Size") +
  theme(aspect.ratio=0.5) +
  ggtitle("Time Series of 1000 VarroaPop Exposed Simulations")
dev.off()

df_plot <- data.frame(tdarray_con[,1,], row.names=timearray)
dfm_plot<- melt(df_plot)
dfm_plot$timearray<- rep(timearray,1000)
pdf(file= paste(vpdir_output, "fig_control_simulations_asb.pdf", sep=""), width = 8.5, height = 11, onefile = TRUE, paper = "USr")
ggplot() +
  geom_line(data = dfm_plot, aes(x = timearray, y = value, group = variable)) +
  xlab("Simulated Time Period") +
  ylab("Colony Size") +
  theme(aspect.ratio=0.5) +
  ggtitle("Time Series of 1000 VarroaPop Non-exposed Simulations")
dev.off()
