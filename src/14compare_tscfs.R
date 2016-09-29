nsims = 10000
logKow <- seq(-2,5,length.out = nsims)

#2012 white paper
tscf2012 <- 0.784*10^(-4.34*(logKow-1.78)^2/2.44)

#2014 beerex guidance
tscf2014 <- -0.0648*(logKow)^2 + 0.241*logKow + 0.5822

plot(logKow,tscf2014,type='l',col='red')
lines(logKow,tscf2012,type='l')

csoil <- 1.0
rho <- 2.5
theta <- 1-(rho/2.65)
koc <- 10000
foc <- 0.01
#this equation is the same in both the 2012 white paper and the 2014 beerex manual
c_stem_2012 <- (10^(.95*logKow-2.05)+0.82)*tscf2012*(rho/(theta+rho*koc*foc))*csoil
c_stem_2014 <- (10^(.95*logKow-2.05)+0.82)*tscf2014*(rho/(theta+rho*koc*foc))*csoil

plot(logKow,c_stem_2014,type='l',col='red')
lines(logKow,c_stem_2012,type='l')
