#create input distributions
weather_file<- rep(paste(vrp_weather, sep = ""), Nsims)
sim_start<- rep(paste(simstart, sep = ""), Nsims)
sim_end<- rep(paste(simend, sep = ""), Nsims)
immenable<- rep("true", Nsims)
miteimmtype <- rep("cosine", Nsims) #ImmType
immstart<- rep("02/01/1988", Nsims)
immend<- rep("02/08/1988", Nsims)
foliar_true<- rep("true", Nsims)
foliar_appdate<- rep("06/07/1989", Nsims)
foliar_begin<- rep("06/05/1989", Nsims)
foliar_end<- rep("06/28/1989", Nsims)
##initial conditions
drnadults<- runif(Nsims, 0, 1000)
da2<- runif(Nsims, 0, 1000)
wkradults<- runif(Nsims, 0, 8000)
wa2<- runif(Nsims, 0, 8000)
drnbrood<- runif(Nsims, 0, 1000)
db2<- runif(Nsims, 0, 1000)
wkrbrood<- runif(Nsims, 0, 8000)
wb2<- runif(Nsims, 0, 8000)
drnlarv<- runif(Nsims, 0, 1000)
dl2<- runif(Nsims, 0, 1000)
wkrlarv<- runif(Nsims, 0, 10000)
wl2<- runif(Nsims, 0, 10000)
drneggs<- runif(Nsims, 0, 1000)
de2<- runif(Nsims, 0, 1000)
wkreggs<- runif(Nsims, 0, 5000)
we2<- runif(Nsims, 0, 5000)
queenstrength<- runif(Nsims, 1, 6) #ICQueenStrength
qs2<- runif(Nsims, 1, 6)
fgrlifespan <- runif(Nsims, 4, 16) #ICForagerLifespan
fl2<- runif(Nsims, 4, 16)
drnadultinfest<- runif(Nsims, 0, 100) #percentage
dainfest2<- runif(Nsims, 0, 100)
drnbroodinfest<- runif(Nsims, 0, 100)
dbinfest2<- runif(Nsims, 0, 100)
drnmiteoffspring<- runif(Nsims, 0, 5)
dmoffs2<- runif(Nsims, 0, 5)
drnmitesurvive<- runif(Nsims, 0, 100) #ICDroneMiteSurvivorship
dmsurv2<- runif(Nsims, 0, 100)
wkradultinfest<- runif(Nsims, 0, 100)
wainfest2<- runif(Nsims, 0, 100)
wkrbroodinfest<- runif(Nsims, 0, 100)
wbinfest2<- runif(Nsims, 0, 100)
wkrmiteoffspring<- runif(Nsims, 0, 5)
wmoffs2<- runif(Nsims, 0, 5)
wkrmitesurvive<- runif(Nsims, 0, 100) #ICWorkerMiteSurvivorship
wmsurv2<- runif(Nsims, 0, 100)
wkrdrnratio<- runif(Nsims, 1, 5) #RQWkrDrnRatio
wd2<- runif(Nsims, 1, 5)
#initmitepctresist<- runif(Nsims, 0, 100)
#pctresist2<- runif(Nsims, 0, 100)
immmites<- runif(Nsims, 0, 2000)
im2<- runif(Nsims, 0, 2000)
#pctimmmitesresist<- runif(Nsims, 0, 100)
#immpctresist2<- runif(Nsims, 0, 100)
#pesticide exposure
adslope<- runif(Nsims, 0, 3.93) #AIAdultSlope
as2<- runif(Nsims, 0, 3.93)
adLD50<- runif(Nsims, 0, 0.2) #AIAdultLD50 (ug/bee)
aL2<- runif(Nsims, 0, 0.2)
adslopec<- runif(Nsims, 0, 3.93) #AIAdultSlopeContact
asc2<- runif(Nsims, 0, 3.93)
adLD50c<- runif(Nsims, 0, 0.05) #AIAdultLD50Contact (ug/bee)
aLc2<- runif(Nsims, 0, 0.05)
lslope<- runif(Nsims, 0, 3.4) #AILarvaSlope
ls2<- runif(Nsims, 0, 3.4)
lLD50<- runif(Nsims, 0, 0.9) #AILarvaLD50 (ug/larva)
lL2<- runif(Nsims, 0, 0.9)
kow<- runif(Nsims, 2, 6) #AIKOW
kow2<- runif(Nsims, 2, 6)
koc<- runif(Nsims, 5, 30) #AIKOC
koc2<- runif(Nsims, 5, 30)
halflife<- runif(Nsims, 0, 2.9) #AIHalfLife (days)
hl2<- runif(Nsims, 0, 2.9)
apprate<- runif(Nsims, 0, 10) #EAppRate (lb/A)
ar2<- runif(Nsims, 0, 10)


sb1_input<- data.frame(weather_file, sim_start, sim_end,immenable,miteimmtype,immstart,immend,
                             foliar_true,foliar_appdate,foliar_begin,foliar_end,drnadults,wkradults,
                             drnbrood,wkrbrood,drnlarv,wkrlarv,drneggs,wkreggs,queenstrength,
                             fgrlifespan,drnadultinfest,drnbroodinfest,drnmiteoffspring,
                             drnmitesurvive,wkradultinfest,wkrbroodinfest,wkrmiteoffspring,
                             wkrmitesurvive,wkrdrnratio,immmites,adslope,adLD50,adslopec,adLD50c,
                             lslope,lLD50,kow,koc,halflife,apprate, stringsAsFactors = FALSE)
sb2_input<- data.frame(weather_file,sim_start,sim_end,immenable,miteimmtype,immstart,immend,
                              foliar_true,foliar_appdate,foliar_begin,foliar_end,da2,wa2,db2,wb2,
                              dl2,wl2,de2,we2,qs2,fl2,dainfest2,dbinfest2,dmoffs2,dmsurv2,wainfest2,
                              wbinfest2,wmoffs2,wmsurv2,wd2,im2,as2,aL2,asc2,aLc2,ls2,lL2,kow2,koc2,
                              hl2,ar2, stringsAsFactors = FALSE)
#putting the input in the io directory so it can be read from there later
write.csv(sb1_input, file = paste(vpdir_sobol, "inputdata_sobol.csv", sep = ""))
write.csv(sb2_input, file = paste(vpdir_sobol, "inputdata_sobol2.csv", sep = ""))

##################
# Create crossed input matrices
################
Nparam <- length(sb1_input)
sb_inputs <- array(data = NA, c(Nsims, Nparam, Nparam-9))
sb_inputs[,,1] <- abind(sb1_input, along = 3, use.dnns = TRUE)
sb_inputs[,,2] <- abind(sb2_input, along = 3, use.dnns = TRUE)
for (n in 12:Nparam){
  a <- sb1_input
  a[,n]<- sb2_input[n]
  assign(paste("sb",n-9,"_input", sep=""), a)
  sb_inputs[,,n-9] <- abind(a, along = 3, use.dnns = TRUE)
}
