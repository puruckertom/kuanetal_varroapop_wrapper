
nsims = 100000

kow <- sample(seq(0.01,100000,length.out = nsims))
length(kow)
min(kow)
logKow <- log10(kow)
min(logKow)

koc <- sample(seq (1,100000,length.out = nsims))
length(koc)


TSCF = -0.0648*(logKow*logKow) + 0.241*logKow + 0.5822
min(TSCF)

soilconc = 25
soilp = sample(seq(1,2,length.out = nsims))
soiltheta =5
soilfoc = sample(seq(0.001,0.02,length.out = nsims))

SoilConc = TSCF * (10^(0.95*logKow -2.05) + 0.82) *	soilconc * 
  ((soilp / soiltheta) + soilp * koc * soilfoc)


IncomingConcentration = SoilConc/1000000

plot(kow,IncomingConcentration)

