nsims = 10000
logKow <- seq(-2,5,length.out = nsims)

#2012 white paper
tscf2012 <- 0.784*10^(-4.34*(logKow-1.78)^2/2.44)

#2014 beerex guidance
tscf2014 <- -0.0648*(logKow)^2 + 0.241*logKow + 0.5822

#0.2431 instead of 0.241 in beerex for tscf2014??

plot(logKow,tscf2014,type='l',col='red')
lines(logKow,tscf2012,type='l')

csoil <- 1.0
rho <- 1.5
#theta <- 1-(rho/2.65) ??
theta <- 0.2
koc <- 30
foc <- 0.01
#this equation is the same in both the 2012 white paper and the 2014 beerex manual
conc_stem2012 <- (10^(.95*logKow-2.05)+0.82)*tscf2012*(rho/(theta+rho*koc*foc))*csoil
conc_stem2014 <- (10^(.95*logKow-2.05)+0.82)*tscf2014*(rho/(theta+rho*koc*foc))*csoil

plot(logKow,conc_stem2014,type='l',col='red')
lines(logKow,conc_stem2012,type='l')


conc_ratio <- conc_stem2014/conc_stem2012
#View(cbind(conc_stem2014,conc_stem2012,conc_ratio))
plot(logKow,conc_ratio)
