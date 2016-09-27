nsims = 100000

adult_slope <- sample(seq(1,9,length.out = nsims))
adult_ld50 <- sample(seq(0.001,100,length.out = nsims))
adult_eeconc <- sample(seq(0.1,10,length.out = nsims))

z <- adult_slope * (log(adult_eeconc)-log(adult_ld50))
#z <- adult_slope * (log10(adult_eeconc)-log10(adult_ld50))

hist(z)

phat <- (1/(2*pi)^0.5)*exp(1)^((-z^2)/2)

max(phat)

plot(adult_eeconc,phat)
