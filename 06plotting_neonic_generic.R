#plot crunching ###########

#separate and query QS values
qs1 <- which(queenstrength >=1 & queenstrength <2)
qs2 <- which(queenstrength >=2 & queenstrength <3)
qs3 <- which(queenstrength >=3 & queenstrength <4)
qs4 <- which(queenstrength >=4 & queenstrength <5)
qs5 <- which(queenstrength >=5 & queenstrength <6)

#colony persistence
cp <- rep(NA, length(time))
for (n in 1:length(time)){
  x <- which(tdarray[n,1,1:1000] > 1000) # queries colony size > 0 for 1000 simulations at each time point
  cp[n] <- length(x)/1000 #appends vector x with proportion of simulations per time step with Col Size > 0
}

#foragers
fa <- rep(NA, length(time))
for (n in 1:length(time)){
  x <- which(tdarray[n,4,1:1000] > 0) 
  fa[n] <- length(x)/1000 
}

#adult workers
aw <- rep(NA, length(time))
for (n in 1:length(time)){
  x <- which(tdarray[n,3,1:1000] > 0) 
  aw[n] <- length(x)/1000 
}

#free mites
fm <- rep(NA, length(time))
for (n in 1:length(time)){
  x <- which(tdarray[n,11,1:1000] > 0) 
  fm[n] <- length(x)/1000 
}

#dead foragers
dfr <- rep(NA, length(time))
for (n in 1:length(time)){
  x <- which(tdarray[n,1,1:1000] > 0) 
  dfr[n] <- length(x)/1000 
}

#dead mites
dm <- rep(NA, length(time))
for (n in 1:length(time)){
  x <- which(tdarray[n,16,1:1000] > 0)
  dm[n] <- length(x)/1000
}

#capped drone brood
cdb <- rep(NA, length(time))
for (n in 1:length(time)){
  x <- which(tdarray[n, 5, 1:1000] > 0)
  cdb[n] <- length(x)/1000
}

#capped worker brood
cwb <- rep(NA, length(time))
for (n in 1:length(time)){
  x <- which(tdarray[n, 6, 1:1000] > 0)
  cwb[n] <- length(x)/1000
}

#create figure 1
pdf(file= paste(vpdir_output, "fig_1_MCproportions.pdf", sep=""), width = 5, height = 9, onefile = TRUE, paper = "USr")
  #start figures
  par(mfrow=c(5,1), mar=c(2,4,1,0.5), oma=c(4,2,2,1))
  plot(time[1:nrows], cp[1:nrows], type="l", ylab = "P(Colony Size) > 0", main= "time1", ylim=c(0,1), xlab=NA)
  plot(time[1:nrows], fa[1:nrows], type="l", ylab= "P(Foragers) > 0", ylim=c(0,1), xlab=NA) 
  plot(time[1:nrows], aw[1:nrows], type="l", ylab= "P(Adult Workers) > 0", ylim=c(0,1), xlab=NA) 
  plot(time[1:nrows], fm[1:nrows], type="l", ylab= "P(Free Mites) > 0", ylim=c(0,1), xlab=NA) 
  plot(time[1:nrows], dfr[1:nrows], type="l", ylab= "P(Dead Foragers) > 0", ylim=c(0,1), xlab=NA) 
  mtext(text = paste("Fig. 1 Proportion of simulations with values greater than zero"), side = 1, line = 1, outer = T)
dev.off()

#create PDF 2
#start figures
for (i in listinput){      #margin labels
  if (i == queenstrength)
  { x = "Queen Strength"
  n = 2}
  if (i == wkrdrnratio)
  { x = "Worker:Drone"
  n = 3}
  if (i == drnmitesurvive)
  { x = "Drone-Mite Survivorship (%)"
  n = 4}
  if (i == wkrmitesurvive)
  { x = "Worker-Mite Survivorship (%)"
  n = 5}
  if (i == fgrlifespan)
  { x = "Forager Lifespan (days)"
  n = 6}
#  if (i == miteimmtype)
#  { x = "Mite Imm Type"
#  n = 7}
  if (i == adslope)
  { x = "Adult Slope"
  n = 8}
  if (i == adLD50)
  { x = "Adult LD50"
  n = 9}
  if (i == adslopec)
  { x = "Adult Slope Contact"
  n = 10}
  if (i == adLD50c)
  { x = "Adult LD50 Contact"
  n = 11}
  if (i == lslope)
  { x = "Larva Slope"
  n = 12}
  if (i == lLD50)
  { x = "Larva LD50"
  n = 13}
  if (i == kow)
  { x = "KOW"
  n = 14}
  if (i == koc) 
  { x = "KOC"
  n = 15}
  if (i == halflife) 
  { x = "Half Life"
  n = 16}
  if (i == apprate)
  { x = "App Rate (lb/A)"
  n = 17}

  
  #generate figure names insode of the loop
  fig_name <- paste("fig_",n,".pdf",sep="")
  pdf(file= paste(vpdir_output, fig_name, sep=""), width = 8.5, height = 11, onefile = TRUE, paper = "USr")
  
    par(mfrow=c(6,5), mar=c(1, 2, 2, 0.5), oma= c(4,2,2,7))
    
    #COLONY SIZE
    plot(i, tdarray[1, 1, 1:1000], type="p", pch=20, main= "timebreak1", ylab= "Colony Size", ylim=c(0,max(tdarray[year,1,1:1000])), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=T, tick=T, ylab= "Colony Size")
    points(i[qs1],tdarray[1,1, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[1,1, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[1,1, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[1,1, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[1,1, qs5], type="p", col=5, pch=20)
    lofit<- loess(tdarray[1,1,1:1000]~i)        #loess line
    j<- order(i)
    lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
    text(x = min(i), y = max(tdarray[year,1,1:1000]), labels = paste("pcc=", signif(pcctdarray[1, 1, n-1], 3), "\n src=", signif(srctdarray[1,1,n-1], 3), sep = ""), cex = 0.75, adj= c(0,1))
    
    plot(i, tdarray[year[1], 1, 1:1000], type="p", pch=20, main= "timebreak2", ylab= NA, ylim=c(0,max(tdarray[year,1,1:1000])), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick= T)
    points(i[qs1],tdarray[31,1, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[31,1, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[31,1, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[31,1, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[31,1, qs5], type="p", col=5, pch=20)
    lofit<- loess(tdarray[31,1,1:1000]~i)
    j<- order(i)
    lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
    text(x = min(i), y = max(tdarray[year,1,1:1000]), labels = paste("pcc=", signif(pcctdarray[1, 1, n-1], 3), "\n src=", signif(srctdarray[1,1,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
    
    
    plot(i, tdarray[year[2], 1, 1:1000], type="p", pch=20, main= "July time1", ylab= NA, ylim=c(0,max(tdarray[year,1,1:1000])), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick= T)
    points(i[qs1],tdarray[61,1, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[61,1, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[61,1, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[61,1, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[61,1, qs5], type="p", col=5, pch=20)
    lofit<- loess(tdarray[61,1,1:1000]~i)
    j<- order(i)
    lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
    text(x = min(i), y = max(tdarray[year,1,1:1000]), labels = paste("pcc=", signif(pcctdarray[1, 1, n-1],3), "\n src=", signif(srctdarray[1,1,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
    
    
    plot(i, tdarray[year[3], 1, 1:1000], type="p", pch=20, main= "Aug time1", ylab= NA, ylim=c(0,max(tdarray[year,1,1:1000])), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick= T)
    points(i[qs1],tdarray[91,1, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[91,1, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[91,1, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[91,1, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[91,1, qs5], type="p", col=5, pch=20)
    lofit<- loess(tdarray[91,1,1:1000]~i)
    j<- order(i)
    lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
    text(x = min(i), y = max(tdarray[year,1,1:1000]), labels = paste("pcc=", signif(pcctdarray[1, 1, n-1],3), "\n src=", signif(srctdarray[1,1,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
    
    
    plot(i, tdarray[year[4], 1, 1:1000], type="p", pch=20, main= "Sept time1", ylab= NA, ylim=c(0,max(tdarray[year,1,1:1000])), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)  
    axis(2, labels= F, tick= T)
    points(i[qs1],tdarray[121,1, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[121,1, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[121,1, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[121,1, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[121,1, qs5], type="p", col=5, pch=20)
    lofit<- loess(tdarray[121,1,1:1000]~i)
    j<- order(i)
    lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
    text(x = min(i), y = max(tdarray[year,1,1:1000]), labels = paste("pcc=", signif(pcctdarray[1, 1, n-1],3), "\n src=", signif(srctdarray[1,1,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
    
    #ADULT WORKERS
    plot(i, tdarray[1, 3, 1:1000], type="p", pch=20,  ylab="Adult Workers", ylim=c(0,max(tdarray[year,3,1:1000])), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=T, tick=T, ylab= "Adult Workers")
    points(i[qs1],tdarray[1,3, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[1,3, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[1,3, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[1,3, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[1,3, qs5], type="p", col=5, pch=20)
    lofit<- loess(tdarray[1,3,1:1000]~i)
    j<- order(i)
    lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
    text(x = min(i), y = max(tdarray[year,3,1:1000]), labels = paste("pcc=", signif(pcctdarray[1, 2, n-1],3), "\n src=", signif(srctdarray[1,2,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
    
    plot(i, tdarray[year[1], 3, 1:1000], type="p", pch=20, ylab= NA, ylim=c(0,max(tdarray[year,3,1:1000])), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[31,3, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[31,3, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[31,3, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[31,3, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[31,3, qs5], type="p", col=5, pch=20)
    lofit<- loess(tdarray[31,3,1:1000]~i)
    j<- order(i)
    lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
    text(x = min(i), y = max(tdarray[year,3,1:1000]), labels = paste("pcc=", signif(pcctdarray[1, 2, n-1],3), "\n src=", signif(srctdarray[1,2,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
    
    plot(i, tdarray[year[2], 3, 1:1000], type="p", pch=20, ylab= NA, ylim=c(0,max(tdarray[year,3,1:1000])), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[61,3, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[61,3, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[61,3, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[61,3, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[61,3, qs5], type="p", col=5, pch=20)
    lofit<- loess(tdarray[61,3,1:1000]~i)
    j<- order(i)
    lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
    text(x = min(i), y = max(tdarray[year,3,1:1000]), labels = paste("pcc=", signif(pcctdarray[1, 2, n-1],3), "\n src=", signif(srctdarray[1,2,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
    
    
    plot(i, tdarray[year[3], 3, 1:1000], type="p", pch=20, ylab= NA, ylim=c(0,max(tdarray[year,3,1:1000])), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[91,3, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[91,3, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[91,3, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[91,3, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[91,3, qs5], type="p", col=5, pch=20)
    lofit<- loess(tdarray[91,3,1:1000]~i)
    j<- order(i)
    lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
    text(x = min(i), y = max(tdarray[year,3,1:1000]), labels = paste("pcc=", signif(pcctdarray[1, 2, n-1],3), "\n src=", signif(srctdarray[1,2,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
    
    
    plot(i, tdarray[year[4], 3, 1:1000], type="p", pch=20, ylab= NA, ylim=c(0,max(tdarray[year,3,1:1000])), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[121,3, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[121,3, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[121,3, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[121,3, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[121,3, qs5], type="p", col=5, pch=20)
    lofit<- loess(tdarray[121,3,1:1000]~i)
    j<- order(i)
    lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
    text(x = min(i), y = max(tdarray[year,3,1:1000]), labels = paste("pcc=", signif(pcctdarray[1, 2, n-1],3), "\n src=", signif(srctdarray[1,2,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
    
    
    
    
    #FORAGERS
    plot(i, tdarray[1, 4, 1:1000], type="p", pch=20, ylab= "Foragers", ylim=c(0,max(tdarray[year,4,1:1000])), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=T, tick=T, ylab= "Foragers")
    points(i[qs1],tdarray[1,4, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[1,4, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[1,4, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[1,4, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[1,4, qs5], type="p", col=5, pch=20)
    lofit<- loess(tdarray[1,4,1:1000]~i)
    j<- order(i)
    lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
    text(x = min(i), y = max(tdarray[year,4,1:1000]), labels = paste("pcc=", signif(pcctdarray[1, 3, n-1], 3), "\n src=", signif(srctdarray[1,3,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
    
    
    plot(i, tdarray[year[1], 4, 1:1000], type="p", pch=20, ylim=c(0,max(tdarray[year,4,1:1000])), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[31,4, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[31,4, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[31,4, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[31,4, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[31,4, qs5], type="p", col=5, pch=20)
    lofit<- loess(tdarray[53,4,1:1000]~i)
    j<- order(i)
    lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
    text(x = min(i), y = max(tdarray[year,4,1:1000]), labels = paste("pcc=", signif(pcctdarray[1, 3, n-1],3), "\n src=", signif(srctdarray[1,3,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
    
    
    plot(i, tdarray[year[2], 4, 1:1000], type="p", pch=20, ylim=c(0,max(tdarray[year,4,1:1000])), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[61,4, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[61,4, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[61,4, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[61,4, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[61,4, qs5], type="p", col=5, pch=20)
    lofit<- loess(tdarray[61,4,1:1000]~i)
    j<- order(i)
    lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
    text(x = min(i), y = max(tdarray[year,4,1:1000]), labels = paste("pcc=", signif(pcctdarray[1, 3, n-1],3), "\n src=", signif(srctdarray[1,3,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
    
    
    plot(i, tdarray[year[3], 4, 1:1000], type="p", pch=20, ylim=c(0,max(tdarray[year,4,1:1000])), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[91,4, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[91,4, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[91,4, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[91,4, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[91,4, qs5], type="p", col=5, pch=20)
    lofit<- loess(tdarray[91,4,1:1000]~i)
    j<- order(i)
    lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
    text(x = min(i), y = max(tdarray[year,4,1:1000]), labels = paste("pcc=", signif(pcctdarray[1, 3, n-1],3), "\n src=", signif(srctdarray[1,3,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
    
    
    plot(i, tdarray[year[4], 4, 1:1000], type="p", pch=20, ylim=c(0,max(tdarray[year,4,1:1000])), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)  
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[121,4, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[121,4, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[121,4, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[121,4, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[121,4, qs5], type="p", col=5, pch=20)
    lofit<- loess(tdarray[121,4,1:1000]~i)
    j<- order(i)
    lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
    text(x = min(i), y = max(tdarray[year,4,1:1000]), labels = paste("pcc=", signif(pcctdarray[1, 3, n-1],3), "\n src=", signif(srctdarray[1,3,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
    
    
    
    
    #WORKER EGGS
    plot(i, tdarray[1, 10, 1:1000], type="p", pch=20, ylab="Worker Eggs", ylim=c(0,max(tdarray[year,10,1:1000])), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=T, tick=T, ylab= "Worker Eggs")
    points(i[qs1],tdarray[1,10, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[1,10, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[1,10, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[1,10, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[1,10, qs5], type="p", col=5, pch=20)
    lofit<- loess(tdarray[1,10,1:1000]~i)
    j<- order(i)
    lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
    text(x = min(i), y = max(tdarray[year,10,1:1000]), labels = paste("pcc=", signif(pcctdarray[1, 4, n-1],3), "\n src=", signif(srctdarray[1,4,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
    
    
    plot(i, tdarray[year[1], 10, 1:1000], type="p", pch=20, ylim=c(0,max(tdarray[year,10,1:1000])), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[31,10, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[31,10, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[31,10, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[31,10, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[31,10, qs5], type="p", col=5, pch=20)
    lofit<- loess(tdarray[31,10,1:1000]~i)
    j<- order(i)
    lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
    text(x = min(i), y = max(tdarray[year,10,1:1000]), labels = paste("pcc=", signif(pcctdarray[1, 4, n-1],3), "\n src=", signif(srctdarray[1,4,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
    
    
    plot(i, tdarray[year[2], 10, 1:1000], type="p", pch=20, ylim=c(0,max(tdarray[year,10,1:1000])), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[61,10, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[61,10, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[61,10, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[61,10, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[61,10, qs5], type="p", col=5, pch=20)
    lofit<- loess(tdarray[61,10,1:1000]~i)
    j<- order(i)
    lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
    text(x = min(i), y = max(tdarray[year,10,1:1000]), labels = paste("pcc=", signif(pcctdarray[1, 4, n-1],3), "\n src=", signif(srctdarray[1,4,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
    
    
    plot(i, tdarray[year[3], 10, 1:1000], type="p", pch=20, ylim=c(0,max(tdarray[year,10,1:1000])), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[91,10, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[91,10, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[91,10, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[91,10, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[91,10, qs5], type="p", col=5, pch=20)
    lofit<- loess(tdarray[91,10,1:1000]~i)
    j<- order(i)
    lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
    text(x = min(i), y = max(tdarray[year,10,1:1000]), labels = paste("pcc=", signif(pcctdarray[1, 4, n-1],3), "\n src=", signif(srctdarray[1,4,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
    
    
    plot(i, tdarray[year[4], 10, 1:1000], type="p", pch=20, ylim=c(0,max(tdarray[year,10,1:1000])), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[121,10, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[121,10, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[121,10, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[121,10, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[121,10, qs5], type="p", col=5, pch=20)
    lofit<- loess(tdarray[121,10,1:1000]~i)
    j<- order(i)
    lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
    text(x = min(i), y = max(tdarray[year,10,1:1000]), labels = paste("pcc=", signif(pcctdarray[1, 4, n-1],3), "\n src=", signif(srctdarray[1,4,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
    
    
    
    
    #COLONY POLLEN
    plot(i, tdarray[1, 18, 1:1000], type="p", pch=20, ylab= "Colony Pollen (g)", ylim=c(0,max(tdarray[year,18,1:1000])), xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=T, tick=T, ylab= "Colony Pollen (g)")
    points(i[qs1],tdarray[1,18, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[1,18, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[1,18, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[1,18, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[1,18, qs5], type="p", col=5, pch=20)
    lofit<- loess(tdarray[1,18,1:1000]~i)
    j<- order(i)
    lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
    text(x = min(i), y = max(tdarray[year,18,1:1000]), labels = paste("pcc=", signif(pcctdarray[1, 5, n-1],3), "\n src=", signif(srctdarray[1,5,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
    
    
    plot(i, tdarray[year[1], 18, 1:1000], type="p", pch=20, ylim=c(0,max(tdarray[year,18,1:1000])), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[31,18, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[31,18, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[31,18, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[31,18, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[31,18, qs5], type="p", col=3, pch=20)
    lofit<- loess(tdarray[31,18,1:1000]~i)
    j<- order(i)
    lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
    text(x = min(i), y = max(tdarray[year,18,1:1000]), labels = paste("pcc=", signif(pcctdarray[1, 5, n-1],3), "\n src=", signif(srctdarray[1,5,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
    
    
    plot(i, tdarray[year[2], 18, 1:1000], type="p", pch=20, ylim=c(0,max(tdarray[year,18,1:1000])), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[61,18, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[61,18, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[61,18, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[61,18, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[61,18, qs5], type="p", col=5, pch=20)
    lofit<- loess(tdarray[61,18,1:1000]~i)
    j<- order(i)
    lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
    text(x = min(i), y = max(tdarray[year,18,1:1000]), labels = paste("pcc=", signif(pcctdarray[1, 5, n-1],3), "\n src=", signif(srctdarray[1,5,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
    
    
    plot(i, tdarray[year[3], 18, 1:1000], type="p", pch=20, ylim=c(0,max(tdarray[year,18,1:1000])), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[91,18, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[91,18, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[91,18, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[91,18, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[91,18, qs5], type="p", col=5, pch=20)
    lofit<- loess(tdarray[91,18,1:1000]~i)
    j<- order(i)
    lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
    text(x = min(i), y = max(tdarray[year,18,1:1000]), labels = paste("pcc=", signif(pcctdarray[1, 5, n-1],3), "\n src=", signif(srctdarray[1,5,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
    
    
    plot(i, tdarray[year[4], 18, 1:1000], type="p", pch=20, ylim=c(0,max(tdarray[year,18,1:1000])), ylab= NA, xaxt='n', xlab=NA)
    axis(1, labels=F, tick=T)
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[121,18, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[121,18, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[121,18, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[121,18, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[121,18, qs5], type="p", col=5, pch=20)
    lofit<- loess(tdarray[121,18,1:1000]~i)
    j<- order(i)
    lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
    text(x = min(i), y = max(tdarray[year,18,1:1000]), labels = paste("pcc=", signif(pcctdarray[1, 5, n-1],3), "\n src=", signif(srctdarray[1,5,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
    
    
    
    
    #COLONY NECTAR
    plot(i, tdarray[1, 20, 1:1000], type="p", pch=20, ylab= "Colony Nectar", ylim=c(0,max(tdarray[year,20,1:1000])), 
         xlab= x)
    axis(1, labels=F, tick=T)
    axis(2, labels=T, tick=T, ylab= "Colony Nectar")
    points(i[qs1],tdarray[1,20, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[1,20, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[1,20, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[1,20, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[1,20, qs5], type="p", col=5, pch=20)
    lofit<- loess(tdarray[1,20,1:1000]~i)
    j<- order(i)
    lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
    text(x = min(i), y = max(tdarray[year,20,1:1000]), labels = paste("pcc=", signif(pcctdarray[1, 6, n-1],3), "\n src=", signif(srctdarray[1,6,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
    
    
    plot(i, tdarray[year[1], 20, 1:1000], type="p", pch=20, ylim=c(0,max(tdarray[year,20,1:1000])), ylab= NA, 
         xlab= x)
    axis(1, labels=F, tick=T)  
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[31,20, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[31,20, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[31,20, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[31,20, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[31,20, qs5], type="p", col=5, pch=20)
    lofit<- loess(tdarray[31,20,1:1000]~i)
    j<- order(i)
    lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
    text(x = min(i), y = max(tdarray[year,20,1:1000]), labels = paste("pcc=", signif(pcctdarray[1, 6, n-1],3), "\n src=", signif(srctdarray[1,6,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
    
    
    plot(i, tdarray[year[2], 20, 1:1000], type="p", pch=20, ylim=c(0,max(tdarray[year,20,1:1000])), ylab= NA, 
         xlab= x)
    axis(1, labels=F, tick=T)  
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[61,20, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[61,20, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[61,20, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[61,20, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[61,20, qs5], type="p", col=5, pch=20)
    lofit<- loess(tdarray[61,20,1:1000]~i)
    j<- order(i)
    lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
    text(x = min(i), y = max(tdarray[year,20,1:1000]), labels = paste("pcc=", signif(pcctdarray[1, 6, n-1],3), "\n src=", signif(srctdarray[1,6,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
    
    
    plot(i, tdarray[year[3], 20, 1:1000], type="p", pch=20, ylim=c(0,max(tdarray[year,20,1:1000])), ylab= NA, 
         xlab= x)
    axis(1, labels=F, tick=T)  
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[91,20, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[91,20, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[91,20, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[91,20, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[91,20, qs5], type="p", col=5, pch=20)
    lofit<- loess(tdarray[91,20,1:1000]~i)
    j<- order(i)
    lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
    text(x = min(i), y = max(tdarray[year,20,1:1000]), labels = paste("pcc=", signif(pcctdarray[1, 6, n-1],3), "\n src=", signif(srctdarray[1,6,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
    
    
    plot(i, tdarray[year[4], 20, 1:1000], type="p", pch=20, ylim=c(0,max(tdarray[year,20,1:1000])), ylab= NA, 
         xlab= x)
    axis(1, labels=F, tick=T)  
    axis(2, labels=F, tick=T)
    points(i[qs1],tdarray[121,20, qs1], type="p", col=1, pch=20)
    points(i[qs2],tdarray[121,20, qs2], type="p", col=2, pch=20)
    points(i[qs3],tdarray[121,20, qs3], type="p", col=3, pch=20)
    points(i[qs4],tdarray[121,20, qs4], type="p", col=4, pch=20)
    points(i[qs5],tdarray[121,20, qs5], type="p", col=5, pch=20)
    lofit<- loess(tdarray[121,20,1:1000]~i)
    j<- order(i)
    lines(i[j], lofit$fitted[j], col = "yellow", lwd = 3)
    text(x = min(i), y = max(tdarray[year,20,1:1000]), labels = paste("pcc=", signif(pcctdarray[1, 6, n-1],3), "\n src=", signif(srctdarray[1,6,n-1],3), sep = ""), cex = 0.75, adj= c(0,1))
    
    
    
    #add legend and marginal text  
    
    par(mfrow=c(1,1), oma= c(6,4,1,4), new= TRUE, xpd=NA)
    plot(0:1,0:1, type="n", xlab=NA, ylab=NA, axes=FALSE)
    legend("topright",inset=c(-0.15,0), xpd=NA, legend=c("qs1", "qs2", "qs3", "qs4", "qs5"), fill=c(1:5),
           title= "Queen Strength", cex=0.65, bty="n")
    mtext(text = paste("Fig.",n, "Scatterplots of response variables vs.",x,"input values for simulations", sep= " "), side = 1, outer = T, line = 5)
  dev.off()
}



#time series plotting #######
temparray <- tdarray[1:nrows,resvar,1:1000]
dimnames(temparray)<- list(c(as.character(time)), c(outvar))
tempout<- array(data=NA, c(nrows,6,3), dimnames = list(c(as.character(time)), 
                                                      c("Colony Size","Adult Workers", "Foragers", "Worker Eggs", "Colony Pollen (g)","Colony Nectar"), 
                                                      c("25%","50%","75%")))
for (r in 1:6){
  for (t in 1:nrows){
    p<- quantile(temparray[t, r, 1:1000])
    for (s in 1:3){
      quant<- c(p[[2]], p[[3]], p[[4]])
      tempout[t,r,s]<- quant[s]
    }
  }
}

#create PDF timeseries
pdf(file= paste(vpdir_output, "fig_quantile_timeseries.pdf", sep=""), width = 8.5, height = 11, onefile = TRUE, paper = "USr")
  #start figures
  #time series plots
  par(mfrow=c(6,5), mar=c(1.5, 4, 2, 0.5), oma= c(4,2,2,7))
  
  for (r in 1:6){
    plot(time[1:year[1]], tempout[1:year[1],r,2], type = "l", ylim = c(0,max(tempout[,r,3])), ylab= paste(outvar[r]), xlab = NA, main= "time1")
    lines(time[1:year[1]],tempout[1:year[1],r,1], type = "l", lty= 2, col = "red")
    lines(time[1:year[1]], tempout[1:year[1],r,3], type = "l", lty=4, col = "blue")
    
    plot(time[(year[1] + 1):year[2]], tempout[(year[1] + 1):year[2],r,2], type = "l", ylim = c(0,max(tempout[,r,3])), ylab= paste(outvar[r]), xlab = NA, main = "time2")
    lines(time[(year[1] + 1):year[2]],tempout[(year[1] + 1):year[2],r,1], type = "l", lty= 2, col = "red")
    lines(time[(year[1] + 1):year[2]], tempout[(year[1] + 1):year[2],r,3], type = "l", lty=4, col = "blue")
    
    plot(time[(year[2] + 1):year[3]], tempout[(year[2] + 1):year[3],r,2], type = "l", ylim = c(0,max(tempout[,r,3])), ylab= paste(outvar[r]), xlab = NA, main = "time3")
    lines(time[(year[2] + 1):year[3]],tempout[(year[2] + 1):year[3],r,1], type = "l", lty= 2, col = "red")
    lines(time[(year[2] + 1):year[3]], tempout[(year[2] + 1):year[3],r,3], type = "l", lty=4, col = "blue")
    
    plot(time[(year[3] + 1):year[4]], tempout[(year[3] + 1):year[4],r,2], type = "l", ylim = c(0,max(tempout[,r,3])), ylab= paste(outvar[r]), xlab = NA, main = "time4")
    lines(time[(year[3] + 1):year[4]],tempout[(year[3] + 1):year[4],r,1], type = "l", lty= 2, col = "red")
    lines(time[(year[3] + 1):year[4]], tempout[(year[3] + 1):year[4],r,3], type = "l",lty=4, col = "blue")
    
    plot(time[(year[4] + 1):nrows], tempout[(year[4] + 1):nrows,r,2], type = "l", ylim = c(0,max(tempout[,r,3])), ylab= paste(outvar[r]), xlab = NA, main = "time5")
    lines(time[(year[4] + 1):nrows],tempout[(year[4] + 1):nrows,r,1], type = "l", lty= 2, col = "red")
    lines(time[(year[4] + 1):nrows], tempout[(year[4] + 1):nrows,r,3], type = "l",lty=4, col = "blue")
  }
  mtext(text = paste("Fig. 14 Time series plots across a 4-year period of lower, middle, and upper quartiles."), side = 1, line = 1, outer = T)
dev.off()

#tornado plots
invar<- c("Drone-Mite Survivorship", "Forager Lifespan", "Queen Strength", "Worker:Drone","Worker-Mite Survivorship", "Adult Slope Contact","Adult LD50 Contact", "Larva Slope", "Larva LD50","KOW","KOC","Half Life")
datsrc<- list()
datpcc<- list()

for (i in 1:5) {
  dfsrc<- mdply(srctdarray[i,1:6,1:12], cbind)
  tdfsrc<- t(dfsrc)
  colnames(tdfsrc)<- outvar
  s<- melt(tdfsrc)
  datsrc[[i]]<- s
}


for (i in 1:5){
  dfpcc<- mdply(pcctdarray[i,1:6,1:12], cbind)
  tdfpcc<- t(dfpcc)
  colnames(tdfpcc)<- outvar
  p<- melt(tdfpcc)
  datpcc[[i]]<- p
}

#create PDF tornado
pdf(file= paste(vpdir_output, "fig_tornado.pdf", sep=""), width = 8.5, height = 11, onefile = TRUE, paper = "USr")
  #start figures
  #create plot pages
  grid.newpage()
  pushViewport(viewport(layout=grid.layout(length(year),1), gp= gpar(cex = 0.6)))
  #start figures
  for (i in 1:length(year)) { #loops by year
    aa<- ggplot(data=datsrc[[i]], aes(x= datsrc[[i]][[1]], y= datsrc[[i]][[3]])) + 
      geom_bar(stat="identity", position = "identity") +
      scale_y_continuous(limits= c(-1,1)) +
      coord_flip() +
      labs(title= paste("Year", i, sep=" "), x=" ", y= "Standardized Regression Coefficient") +
      facet_grid(. ~ Var2) +
      theme_bw()
    print(aa, vp= viewport(layout.pos.row= i, layout.pos.col= 1), newpage= FALSE)
  }
  
  grid.newpage()
  pushViewport(viewport(layout=grid.layout(length(year),1), gp= gpar(cex = 0.6)))
  for (i in 1:length(year)) { #loops by year
    bb<- ggplot(data=datpcc[[i]], aes(x= datpcc[[i]][[1]], y= datpcc[[i]][[3]])) + 
      geom_bar(stat="identity", position = "identity") +
      scale_y_continuous(limits= c(-1,1)) +
      coord_flip() +
      labs(title= paste("Year", i, sep = " "), x=" ", y= "Partial Correlation Coefficient") +
      facet_grid(. ~ Var2) +
      theme_bw()
    print(bb, vp= viewport(layout.pos.row= i, layout.pos.col= 1), newpage= FALSE)
  }

dev.off()