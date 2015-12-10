#create input files #########
queenstrength<- runif(Nsims, 1, 6) #ICQueenStrength
wkrdrnratio<- runif(Nsims, 1, 5) #RQWkrDrnRatio
drnmitesurvive<- runif(Nsims, 0, 100) #ICDroneMiteSurvivorship
wkrmitesurvive<- runif(Nsims, 0, 100) #ICWorkerMiteSurvivorship
fgrlifespan <- runif(Nsims, 4, 16) #ICForagerLifespan
immtype <- c("Polynomial", "Cosine", "Sine", "Exponential", "Tangent", "Logarithmic")
miteimmtype <- sample(immtype, size=Nsims, replace=T) #ImmType
#pesticide exposure
adslope<- runif(Nsims, 0, 3.93) #AIAdultSlope
adLD50<- runif(Nsims, 0, 0.5) #AIAdultLD50 (ug/bee)
adslopec<- runif(Nsims, 0, 3.93) #AIAdultSlopeContact
adLD50c<- runif(Nsims, 0, 0.05) #AIAdultLD50Contact (ug/bee)
lslope<- runif(Nsims, 0, 3.4) #AILarvaSlope
lLD50<- runif(Nsims, 0, 0.9) #AILarvaLD50 (ug/larva)
kow<- runif(Nsims, 2, 8) #AIKOW
koc<- runif(Nsims, 5, 30) #AIKOC
halflife<- runif(Nsims, 0, 5) #AIHalfLife (days)
apprate_con<- runif(Nsims, 0, 0.0) #EAppRate (lb/A)
apprate_exp<- runif(Nsims, 0, 10) #EAppRate (lb/A)

inputdata_con<- data.frame(queenstrength,wkrdrnratio, drnmitesurvive, wkrmitesurvive, fgrlifespan, miteimmtype, 
                       adslope,adLD50,adslopec,adLD50c,lslope,lLD50,kow,koc,halflife,apprate_con)
inputdata_exp<- data.frame(queenstrength,wkrdrnratio, drnmitesurvive, wkrmitesurvive, fgrlifespan, miteimmtype, 
                           adslope,adLD50,adslopec,adLD50c,lslope,lLD50,kow,koc,halflife,apprate_exp)
#putting the input in the io directory so it can be read from there later
write.csv(inputdata_con, file = paste(vpdir_out_con, "inputdata_con.csv", sep = ""))
write.csv(inputdata_exp, file = paste(vpdir_out_exp, "inputdata_exp.csv", sep = ""))


