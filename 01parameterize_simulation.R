#create input distributions
weather_file<- rep(paste(vrp_weather, sep = ""), Nsims)
sim_start<- rep(paste(simstart, sep = ""), Nsims)
sim_end<- rep(paste(simend, sep = ""), Nsims)
##initial conditions
#drnadults 
#wkradults
#drnbrood
#wkrbrood
#drnlarv
#wkrlarv
#drneggs
#wkreggs
queenstrength<- runif(Nsims, 1, 6) #ICQueenStrength
fgrlifespan <- runif(Nsims, 4, 16) #ICForagerLifespan
#drnadultinfest
#drnbroodinfest
#drnmiteoffspring
drnmitesurvive<- runif(Nsims, 0, 100) #ICDroneMiteSurvivorship
#wkradultinfest
#wkrbroodinfest
#wkrmiteoffspring
wkrmitesurvive<- runif(Nsims, 0, 100) #ICWorkerMiteSurvivorship

##plotting
#PlotNone
#PlotAD
#PlotAW
#PlotCS
#PlotDB
#PlotDE
#PlotDL
#PlotF
#PlotTM
#PlotMDB
#PlotMWB
#PlotPDB
#PlotPWB
#PlotPRM
#PlotRM
#PlotWB
#PlotWE
#PlotWL
#PlotIM

#DENone
#DESwarm
#DEChalkbrood
#DEResource
#DESupercedure
#DEPesticide

immtype <- c("Polynomial", "Cosine", "Sine", "Exponential", "Tangent", "Logarithmic")
miteimmtype <- sample(immtype, size=Nsims, replace=T) #ImmType
#TotalImmMites
#PctImmMitesResistant
#ImmStart
#ImmEnd
#ImmEnabled

##Requeening
#RQEggLayDelay
wkrdrnratio<- runif(Nsims, 1, 5) #RQWkrDrnRatio
#RQReQueenDate
#RQEnableReQueen
#RQScheduled
#RQQueenStrength
#RQOnce

##Viticide
#VTTreatmentDuration
#VTMortality
#VTEnable
#VTTreatmentStart
#InitMitePctResistant

##pesticide exposure
adslope<- runif(Nsims, 0, 3.93) #AIAdultSlope
adLD50<- runif(Nsims, 0, 0.2) #AIAdultLD50 (ug/bee)
adslopec<- runif(Nsims, 0, 3.93) #AIAdultSlopeContact
adLD50c<- runif(Nsims, 0, 0.05) #AIAdultLD50Contact (ug/bee)
lslope<- runif(Nsims, 0, 3.4) #AILarvaSlope
lLD50<- runif(Nsims, 0, 0.9) #AILarvaLD50 (ug/larva)
kow<- runif(Nsims, 2, 6) #AIKOW
koc<- runif(Nsims, 5, 30) #AIKOC
halflife<- runif(Nsims, 0, 2.9) #AIHalfLife (days)
#AIContactFactor

#CL4Pollen
#CL4Nectar
#CL5Pollen
#CL5Nectar
#CLDPollen
#CLDNectar
#CA13Pollen
#CA13Nectar
#CA410Pollen
#CA410Nectar
#CA1120Pollen
#CA1120Nectar

#IPollenTrips
#INectarTrips
#IPercentNectarForagers
#IPollenLoad
#INectarLoad
foliar_true<- rep("true", Nsims) #FoliarEnabled
foliar_false<- rep("false", Nsims)
#SoilEnabled
#SeedEnabled
apprate_con<- runif(Nsims, 0, 0.0) #EAppRate (lb/A) control
apprate_exp<- runif(Nsims, 0, 10) #EAppRate (lb/A) exposed
#ESoilTheta
# ESoilP
# ESoilFoc
# ESoilConcentration
# ESeedConcentration
# FoliarAppDate
# FoliarForageBegin
# FoliarForageEnd
# SoilForageBegin
# SoilForageEnd
# SeedForageBegin
# SeedForageEnd



######## Create input dataframe
inputdata_con<- data.frame(queenstrength,wkrdrnratio, drnmitesurvive, wkrmitesurvive, fgrlifespan, miteimmtype, 
                           adslope,adLD50,adslopec,adLD50c,lslope,lLD50,kow,koc,halflife,apprate_con, foliar_false)
inputdata_exp<- data.frame(queenstrength,wkrdrnratio, drnmitesurvive, wkrmitesurvive, fgrlifespan, miteimmtype, 
                           adslope,adLD50,adslopec,adLD50c,lslope,lLD50,kow,koc,halflife,apprate_exp, foliar_true)
#putting the input in the io directory so it can be read from there later
write.csv(inputdata_con, file = paste(vpdir_out_con, "inputdata_con.csv", sep = ""))
write.csv(inputdata_exp, file = paste(vpdir_out_exp, "inputdata_exp.csv", sep = ""))