nsims = 10000

adult_slope <- sample(seq(1,9,length.out = nsims))
adult_ld50 <- sample(seq(0.001,100,length.out = nsims))
adult_eeconc <- sample(seq(0.1,10,length.out = nsims))

delta <- log(adult_eeconc)-log(adult_ld50)
#delta <- log10(adult_eeconc)-log10(adult_ld50)
z <- adult_slope * delta

hist(z)

phat <- (1/(2*pi)^0.5)*exp(1)^((-z^2)/2)

max(phat)

plot(adult_eeconc,z)
plot(adult_eeconc,phat)
plot(z,phat)

#varroapop c code
#double CEPAData::DoseResponse(double Dose, double LD50, double Slope)  // Incoming Dose is in Grams
#bool Valid = (Dose > LD50*0.05) && (LD50 > 0) && (Slope >= 0) && (Slope < 20);
#if (!Valid) PropKilled = 0.0; // If  Dose < 5% of LD50, approximate with 0, If Slope or LD50 not in right range, set to 0
#PropKilled = 1.0 / (1.0 + pow(Dose/LD50, -Slope))
vrp_phat <- 1/(1+(adult_eeconc/adult_ld50)^(-adult_slope))
plot(adult_eeconc, vrp_phat)
