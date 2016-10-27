#run 00

nsims = 10000
#logKow <- seq(-2,5,length.out = nsims)
logKow <- seq(-2,5,length.out = nsims)

#2012 white paper (Briggs et al 1982,1983 model with modification by Ryan et al 1988)
#Briggs,G.,Bromilow,R.,Evans,A.,Williams,M.,1983.Relationships between lipophilicity and the
#distribution ofnon  ionisedchemicals  in  barley  shoots  following uptake by the  roots.  Pesticide 
#Science, 14, 492  500. 
#Briggs, G.G., Bromilow, R.H., Evans, A.A., 1982. Relationships between lipophilicity and root uptake and 
#translocation of non  ionised chemicals by barley. Pesticide Science, 13, 495  504. 
#Ryan,J.A., R.  M.  Bell,  J.  M.  Davidson  and  G.  A.  Oconnor.  1988.  Plant  Uptake  of  Non  ionic  organic 
#chemicals from soils. Chemosphere, 17, 2299-2323.
tscf2012 <- 0.784*10^(-4.34*(logKow-1.78)^2/2.44)


#2014 beerex guidance (why did the tscf calculation change?)
#trying to be more conservative
#switching to 95%ile of tscf in 2014
#from Kris Garber talk
#Modifications to the TSCF calculation were made by EPA to generate
#more conservative estimates of the concentration in stems (Appendix 5)
#our EPA 2014 pollinator risk assessment guidance does not have an appendix 5
tscf2014 <- -0.0648*(logKow)^2 + 0.241*logKow + 0.5822
#0.2431 instead of 0.241 in beerex for tscf2014??

#build a little long dataset for ggplot2
#calcuated values
tscf <- c(tscf2012,tscf2014)
length(tscf)
#factors for calculation plots
tscf_factor_2012 <- rep('tscf2012',nsims)
tscf_factor_2014 <- rep('tscf2014',nsims)
tscf_factor <- factor(c(tscf_factor_2012,tscf_factor_2014),levels=c('tscf2012','tscf2014'))
is.factor(tscf_factor)
tscf_factor[1]
tscf_factor[nsims+1]
class(tscf_factor[1])
length(tscf_factor)
#log10kow as x values for plots
log10kow <- c(logKow,logKow)
length(log10kow)
#bind
compare_tscf <- cbind.data.frame(tscf,tscf_factor,log10kow)
class(compare_tscf)
#View(compare_tscf)
  
#ggplot
p <- ggplot(data=compare_tscf,aes(x=log10kow, y=tscf, group=tscf_factor))
p_tscf <- p + geom_line(aes(colour=tscf_factor))+theme_bw()
p_tscf

#write to pdf
pdf(file= paste(vpdir_fig, "tscf_comparison.pdf", sep=""), width = 8, height = 6)
  p_tscf
dev.off()

#write to jpg
jpeg(file= paste(vpdir_fig, "tscf_comparison.jpg", sep=""), width = 10, height = 6, units='in', pointsize=12, res=300)
  p_tscf
dev.off()

csoil <- 1.0
rho <- 1.5
#theta <- 1-(rho/2.65) ??
theta <- 0.2
koc <- 0.35*10^logKow
foc <- 0.01
#this equation is the same in both the 2012 white paper and the 2014 beerex manual
#(rho/(theta+rho*koc*foc))*csoil is the ryan 1988 modification
conc_stem2012 <- (10^(.95*logKow-2.05)+0.82)*tscf2012*(rho/(theta+rho*koc*foc))*csoil
conc_stem2014 <- (10^(.95*logKow-2.05)+0.82)*tscf2014*(rho/(theta+rho*koc*foc))*csoil

max_conc <- max(conc_stem2012,conc_stem2014,na.rm=T)
max_conc
min_conc <- min(conc_stem2012,conc_stem2014,na.rm=T)
min_conc
plot(logKow,conc_stem2014,type='l',col='red',ylim=c(min_conc,max_conc))
lines(logKow,conc_stem2012,type='l')

log10_conc_ratio <- log10(conc_stem2014/conc_stem2012)
#View(cbind(logKow,conc_stem2014,conc_stem2012,conc_ratio))
#concentration goes negative for logKow between -1.667467 and -1.668167 (headed down)
#also confirmed by entering logKow of -1.67 into beerex
#also blow up log ratios
min(log10_conc_ratio,na.rm=T)
max(log10_conc_ratio,na.rm=T)
plot(logKow,log10_conc_ratio)
