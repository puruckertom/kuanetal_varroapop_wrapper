#create input distributions
weather_file<- rep(paste(vrp_weather, sep = ""), Nsims)
sim_start<- rep(paste(simstart, sep = ""), Nsims)
sim_end<- rep(paste(simend, sep = ""), Nsims)
inputdf<- data.frame(weather_file, sim_start, sim_end)

##initial conditions
#drnadults <- runif(Nsims, 1, 5000) ; inputdf <- cbind(inputdf, drnadults) #ICDroneAdults
#wkradults <- runif(Nsims, 1, 5000) ; inputdf <- cbind(inputdf, wkradults) #ICWorkerAdults
#drnbrood <- runif(Nsims, 1, 5000) ; inputdf <- cbind(inputdf, drnbrood) #ICDroneBrood
#wkrbrood <- runif(Nsims, 1, 5000) ; inputdf <- cbind(inputdf, wkrbrood) #ICWorkerBrood
#drnlarv <- runif(Nsims, 1, 5000) ; inputdf <- cbind(inputdf, drnlarv) #ICDroneLarvae 
#wkrlarv <- runif(Nsims, 1, 5000) ; inputdf <- cbind(inputdf, wkrlarv) #ICWorkerLarvae
#drneggs <- runif(Nsims, 1, 5000) ; inputdf <- cbind(inputdf, drneggs) #ICDroneEggs
#wkreggs <- runif(Nsims, 1, 5000) ; inputdf <- cbind(inputdf, wkreggs) #ICWorkerEggs
queenstrength<- runif(Nsims, 1, 6) ; inputdf <- cbind(inputdf, queenstrength) #ICQueenStrength
fgrlifespan <- runif(Nsims, 4, 16) ; inputdf <- cbind(inputdf, fgrlifespan) #ICForagerLifespan
#drnadultinfest <- runif(Nsims, 0, 10) ; inputdf <- cbind(inputdf, drnadultinfest) #ICDroneAdultInfest
#drnbroodinfest <- runif(Nsims, 0, 10) ; inputdf <- cbind(inputdf, drnbroodinfest) #ICDroneBroodInfest
#drnmiteoffspring <- runif(Nsmis, 0, 5) ; inputdf <- cbind(inputdf, drnmiteoffspring) #ICDroneMiteOffspring
drnmitesurvive <- runif(Nsims, 0, 100) ; inputdf <- cbind(inputdf, drnmitesurvive) #ICDroneMiteSurvivorship
#wkradultinfest <- runif(Nsims, 0, 10) ; inputdf <- cbind(inputdf, wkradultinfest) #ICWorkerAdultInfest
#wkrbroodinfest <- runif(Nsims, 0, 10) ; inputdf <- cbind(inputdf, wkrbroodinfest) #ICWorkerBroodInfest
#wkrmiteoffspring <- runif(Nsims, 0, 5) ; inputdf <- cbind(inputdf, wkrmiteoffspring) #ICWorkerMiteOffspring
wkrmitesurvive<- runif(Nsims, 0, 100) ; inputdf <- cbind(inputdf, wkrmitesurvive) #ICWorkerMiteSurvivorship

##plotting
#plotnone <- rep("false", Nsims) #PlotNone
#PlotAD <- rep("false", Nsims)
#PlotAW <- rep("false", Nsims)
#PlotCS <- rep("false", Nsims)
#PlotDB <- rep("false", Nsims)
#PlotDE <- rep("false", Nsims)
#PlotDL <- rep("false", Nsims)
#PlotF <- rep("false", Nsims)
#PlotTM <- rep("false", Nsims)
#PlotMDB <- rep("false", Nsims)
#PlotMWB <- rep("false", Nsims)
#PlotPDB <- rep("false", Nsims)
#PlotPWB <- rep("false", Nsims)
#PlotPRM <- rep("false", Nsims)
#PlotRM <- rep("false", Nsims)
#PlotWB <- rep("false", Nsims)
#PlotWE <- rep("false", Nsims)
#PlotWL <- rep("false", Nsims)
#PlotIM <- rep("false", Nsims)

#DENone
#DESwarm
#DEChalkbrood
#DEResource
#DESupercedure
#DEPesticide
##

immtype <- c("Polynomial", "Cosine", "Sine", "Exponential", "Tangent", "Logarithmic") ; miteimmtype <- sample(immtype, size=Nsims, replace=T) ; inputdf <- cbind(inputdf, miteimmtype) #ImmType
#totalimmmites <- runif(Nsims, 0, 1000) ; inputdf <- cbind(inputdf, totalimmmites) #TotalImmMites
#pctresistimmmites <- runif(Nsims, 0, 100) ; inputdf <- cbind(inputdf, pctresistimmmites) #PctImmMitesResistant
#immstart <- rep("mm/dd/yyyy", Nsims) ; inputdf <- cbind(inputdf, immstart) #ImmStart
#immend <- rep("mm/dd/yyyy", Nsims) ; inputdf <- cbind(inputdf, immend) #ImmEnd
#immenabled <- rep("false", Nsims) ; inputdf <- cbind(inputdf, immenabled) #ImmEnabled

##Requeening
#eggdelay <- runif(Nsims, 0, 50) ; inputdf <- cbind(inputdf, eggdelay) #RQEggLayDelay (days)

#wkrdrnratio<- runif(Nsims, 1, 5) #RQWkrDrnRatio
wkrdrnratio <- runif(Nsims, 1, 5) ; inputdf <- cbind(inputdf, wkrdrnratio) #RQWkrDrnRatio

#requeendate <- rep("mm/dd/yyyy", Nsims) ; inputdf <- cbind(inputdf, requeendate) #RQReQueenDate
#rqenable <- rep("true", Nsims) ; inputdf <- cbind(inputdf, rqenable) #RQEnableReQueen
#rqscheduled <- rep("true", Nsims) ; inputdf <- cbind(inputdf, rqenable) #RQScheduled
#rqqueenstrength <- runif(Nsims, 1, 6) ; inputdf <- cbind(inputdf, rqqueenstrength) #RQQueenStrength
#rqonce <- rep("true", Nsims) ; inputdf <- cbind(inputdf, rqonce) #RQOnce

##Viticide
#vtduration <- runif(Nsims, 1, 4) ; inputdf <- cbind(inputdf, vtduration) #VTTreatmentDuration (weeks)
#vtmortality <- runif(Nsims, 0, 100) ; inputdf <- cbind(inputdf, vtmortality) #VTMortality
#vtenable <- rep("true", Nsims) ; inputdf <- cbind(inputdf, vtmortality) #VTEnable
#vtstart <- rep("mm/dd/yyyy", Nsims) ; inputdf <- cbind(inputdf, vtstart) #VTTreatmentStart
#vtresistant <- runif(Nsims, 0, 100) ; inputdf <- cbind(inputdf, vtresistant) #InitMitePctResistant

immtype <- c("Polynomial", "Cosine", "Sine", "Exponential", "Tangent", "Logarithmic")
miteimmtype <- sample(immtype, size=Nsims, replace=T) #ImmType

##pesticide exposure
adslope<- runif(Nsims, 0, 3.93) ; inputdf <- cbind(inputdf, adslope)  #AIAdultSlope
adLD50<- runif(Nsims, 0, 0.2) ; inputdf <- cbind(inputdf, adLD50)  #AIAdultLD50 (ug/bee)
adslopec<- runif(Nsims, 0, 3.93) ; inputdf <- cbind(inputdf, adslopec)  #AIAdultSlopeContact
adLD50c<- runif(Nsims, 0, 0.05) ; inputdf <- cbind(inputdf, adLD50c)  #AIAdultLD50Contact (ug/bee)
lslope<- runif(Nsims, 0, 3.4) ; inputdf <- cbind(inputdf, lslope)  #AILarvaSlope
lLD50<- runif(Nsims, 0, 0.9) ; inputdf <- cbind(inputdf, lLD50)  #AILarvaLD50 (ug/larva)
kow<- runif(Nsims, 2, 6) ; inputdf <- cbind(inputdf, kow)  #AIKOW
koc<- runif(Nsims, 5, 30) ; inputdf <- cbind(inputdf, koc)  #AIKOC
halflife<- runif(Nsims, 0, 2.9) ; inputdf <- cbind(inputdf, halflife)  #AIHalfLife (days)
#contactfactor <- runif(Nsims, 1, 5) ; inputdf <- cbind(inputdf, halflife) #AIContactFactor
apprate_con<- runif(Nsims, 0, 0.0) #EAppRate (lb/A)
apprate_exp<- runif(Nsims, 0, 10) #EAppRate (lb/A)
foliar_true<- rep("true", Nsims)
foliar_false<- rep("false", Nsims)
foliar_appdate<- rep("06/07/1989", Nsims)
foliar_begin<- rep("06/05/1989", Nsims)
foliar_end<- rep("06/28/1989", Nsims)

## Consumption Data (mg/day)
#cl4pollen <- runif(Nsims, 0, 12) ; inputdf <- cbind(inputdf, cl4pollen) #CL4Pollen
#cl4nectar <- runif(Nsims, 0, 12) ; inputdf <- cbind(inputdf, cl4nectar) #CL4Nectar
#cl5pollen <- runif(Nsims, 0, 12) ; inputdf <- cbind(inputdf, cl5pollen) #CL5Pollen
#cl5nectar <- runif(Nsims, 0, 12) ; inputdf <- cbind(inputdf, cl5nectar) #CL5Nectar
#cldpollen <- runif(Nsims, 0, 12) ; inputdf <- cbind(inputdf, cldpollen) #CLDPollen
#cldnectar <- runif(Nsims, 0, 12) ; inputdf <- cbind(inputdf, cldnectar) #CLDNectar
#ca13pollen <- runif(Nsims, 0, 12) ; inputdf <- cbind(inputdf, ca13pollen) #CA13Pollen
#ca13nectar <- runif(Nsims, 0, 12) ; inputdf <- cbind(inputdf, ca13nectar) #CA13Nectar
#ca410pollen <- runif(Nsims, 0, 12) ; inputdf <- cbind(inputdf, ca410pollen) #CA410Pollen
#ca410nectar <- runif(Nsims, 0, 12) ; inputdf <- cbind(inputdf, ca410nectar) #CA410Nectar
#ca1120pollen <- runif(Nsims, 0, 12) ; inputdf <- cbind(inputdf, ca1120pollen) #CA1120Pollen
#ca1120nectar <- runif(Nsims, 0, 12) ; inputdf <- cbind(inputdf, ca1120nectar) #CA1120Nectar

#ptrips <- runif(Nsims, 0, 10) ; inputdf <- cbind(inputdf, ptrips) #IPollenTrips (per day)
#ntrips <- runif(Nsims, 0, 10) ; inputdf <- cbind(inputdf, ntrips) #INectarTrips (per day)
#pctnectarfrgrs <- runif(Nsims, 0, 100) ; inputdf <- cbind(inputdf, pctnectarfrgrs) #IPercentNectarForagers
#pload <- runif(Nsims, 0, 10) ; inputdf <- cbind(inputdf, pload) #IPollenLoad (mg/bee)
#nload <- runif(Nsims, 0 ,10) ; inputdf <- cbind(inputdf, nload) #INectarLoad (mg/bee)
foliarenable <- rep("true", Nsims) ; inputdf <- cbind(inputdf, foliarenable) #FoliarEnabled
#soilenable <- rep("true", Nsims) ; inputdf <- cbind(inputdf, soilenable) #SoilEnabled
#seedenable <- rep("true", Nsims) ; inputdf <- cbind(inputdf, seedenable) #SeedEnabled
apprate <- runif(Nsims, 0, 10) ; inputdf <- cbind(inputdf, apprate) #EAppRate (lb/A)
#soiltheta <- runif(Nsims, 1, 5) ; inputdf <- cbind(inputdf, soiltheta) #ESoilTheta
#soilp <- runif(Nsims, 1, 5) ; inputdf <- cbind(inputdf, soilp) #ESoilP
#soilfoc <- runif(Nsims, 1, 5) ; inputdf <- cbind(inputdf, soilfoc) #ESoilFoc
#soilconc <- runif(Nsims, 1, 10) ; inputdf <- cbind(inputdf, soilconc) #ESoilConcentration
#seedconc <- runif(Nsims, 1, 10) ; inputdf <- cbind(inputdf, seedconc) #ESeedConcentration
#folappdate <- rep("mm/dd/yyyy", Nsims) ; inputdf <- cbind(inputdf, folappdate) #FoliarAppDate
#folforagebeg <- rep("mm/dd/yyyy", Nsims) ; inputdf <- cbind(inputdf, folforagebeg) #FoliarForageBegin
#folforageend <- rep("mm/dd/yyyy", Nsims) ; inputdf <- cbind(inputdf, folforageend) #FoliarForageEnd
#soilforagebeg <- rep("mm/dd/yyyy", Nsims) ; inputdf <- cbind(inputdf, soilforagebeg) #SoilForageBegin
#soilforageend <- rep("mm/dd/yyyy", Nsims) ; inputdf <- cbind(inputdf, soilforageend) #SoilForageEnd
#seedforagebeg <- rep("mm/dd/yyyy", Nsims) ; inputdf <- cbind(inputdf, seedforagebeg) #SeedForageBegin
#seedforageend <- rep("mm/dd/yyyy", Nsims) ; inputdf <- cbind(inputdf, seedforageend) #SeedForageEnd

######## Create input dataframe
inputdata_con<- subset(inputdf, select = -c(foliarenable, apprate))
inputdata_exp<- inputdf
#inputdata_con<- data.frame(queenstrength,wkrdrnratio, drnmitesurvive, wkrmitesurvive, fgrlifespan, miteimmtype, 
#                           adslope,adLD50,adslopec,adLD50c,lslope,lLD50,kow,koc,halflife,apprate_con, foliar_false)
#inputdata_exp<- data.frame(queenstrength,wkrdrnratio, drnmitesurvive, wkrmitesurvive, fgrlifespan, miteimmtype, 
#                           adslope,adLD50,adslopec,adLD50c,lslope,lLD50,kow,koc,halflife,apprate_exp, foliar_true,
#                           foliar_appdate, foliar_begin, foliar_end)

#putting the input in the io directory so it can be read from there later
write.csv(inputdata_con, file = paste(vpdir_out_con, "inputdata_con.csv", sep = ""))
write.csv(inputdata_exp, file = paste(vpdir_out_exp, "inputdata_exp.csv", sep = ""))
