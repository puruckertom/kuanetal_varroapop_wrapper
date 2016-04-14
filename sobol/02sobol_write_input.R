#create input files #########
#sobol1
for (i in 1:Nsims) {
  parameter <- ("ICQueenStrength=") #queen strength
  inputvalue <- queenstrength[i]
  parameter2 <- ("RQWkrDrnRatio=") #requeen worker-drone ratio
  inputvalue2 <- wkrdrnratio[i]
  parameter3 <- ("ICDroneMiteSurvivorship=") #drone-mite survivorship
  inputvalue3 <- drnmitesurvive[i]
  parameter4 <- ("ICWorkerMiteSurvivorship=")  #worker-mite survivorship
  inputvalue4 <- wkrmitesurvive[i]
  parameter5 <- ("ICForagerLifespan=")  #Forager Lifespan
  inputvalue5 <- fgrlifespan[i]
  parameter6 <- ("ImmType=")   #Mite Immigration Type
  inputvalue6 <- miteimmtype[i]
  parameter7 <- ("AIAdultSlope=") #ai adult slope
  inputvalue7 <- adslope[i]
  parameter8 <- ("AIAdultLD50=") #ai adult LD50
  inputvalue8 <- adLD50[i]
  parameter9 <- ("AIAdultSlopeContact=") #ai adult slope contact
  inputvalue9 <- adslopec[i]
  parameter10 <- ("AIAdultLD50Contact=") #ai adult LD50 contact
  inputvalue10 <- adLD50c[i]
  parameter11 <- ("AILarvaSlope=") #ai larva slope
  inputvalue11 <- lslope[i]
  parameter12 <- ("AILarvaLD50=") #ai larva LD50
  inputvalue12 <- lLD50[i]
  parameter13 <- ("AIKOW=") #ai kow
  inputvalue13 <- kow[i]
  parameter14 <- ("AIKOC=") #ai koc
  inputvalue14 <- koc[i]
  parameter15 <- ("AIHalfLife=") #ai half life (days)
  inputvalue15 <- halflife[i]
  parameter16 <- ("EAppRate=") #application rate (lb/A)
  inputvalue16<- apprate[i]
  parameter17 <- ("FoliarEnabled=") #foliar spray enable
  inputvalue17<- foliar_true[i]
  parameter18 <- ("WeatherFileName=") #weather file
  inputvalue18<- weather_file[i]
  parameter19<- ("SimStart=") #simulation start date
  inputvalue19<- sim_start[i]
  parameter20<- ("SimEnd=") #simulation end date
  inputvalue20<- sim_end[i]
  parameter21<- ("ImmEnabled=") #enable mite immigration
  inputvalue21<- immenable[i]
  parameter22<- ("ImmStart=") #mite immigration start date
  inputvalue22<- immstart[i]
  parameter23<- ("ImmEnd=") #mite immigration end date
  inputvalue23<- immend[i]
  parameter24<- ("FoliarAppDate=") #foliar spray application date
  inputvalue24<- foliar_appdate[i]
  parameter25<- ("FoliarForageBegin=") #foliar spray bee forage exposure start date
  inputvalue25<- foliar_begin[i]
  parameter26<- ("FoliarForageEnd=") #foliar spray bee forage exposure end date
  inputvalue26<- foliar_end[i]
  parameter27<- ("ICDroneAdults=") #initial condition drone adults
  inputvalue27<- drnadults[i]
  parameter28<- ("ICWorkerAdults=") #inital condition worker adults
  inputvalue28<- wkradults[i]
  parameter29<- ("ICDroneBrood=") #initial condition drone brood
  inputvalue29<- drnbrood[i]
  parameter30<- ("ICWorkerBrood=") #initial condition worker brood
  inputvalue30<- wkrbrood[i]
  parameter31<- ("ICDroneLarvae=") #initial condition drone larvae
  inputvalue31<- drnlarv[i]
  parameter32<- ("ICWorkerLarvae=") #initial condition worker larvae
  inputvalue32<- wkrlarv[i]
  parameter33<- ("ICDroneEggs=") #initial condition drone eggs
  inputvalue33<- drneggs[i]
  parameter34<- ("ICWorkerEggs=") #initial condition worker eggs
  inputvalue34<- wkreggs[i]
  parameter35<- ("ICDroneAdultInfest=") #initial condition adult drone infestation
  inputvalue35<- drnadultinfest[i]
  parameter36<- ("ICDroneBroodInfest=") #initial condition drone brood infestation
  inputvalue36<- drnbroodinfest[i]
  parameter37<- ("ICDroneMiteOffspring=") #initial condition drone mite offspring
  inputvalue37<- drnmiteoffspring[i]
  parameter38<- ("ICWorkerAdultInfest=") #initial condition adult worker infestation
  inputvalue38<- wkradultinfest[i]
  parameter39<- ("ICWorkerBroodInfest=") #initial condition worker brood infestation
  inputvalue39<- wkrbroodinfest[i]
  parameter40<- ("ICWorkerMiteOffspring=") #initial condition worker mite offspring
  inputvalue40<- wkrmiteoffspring[i]
#  parameter41<- ("InitMitePctResistant=") #initial mite % resistant
#  inputvalue41<- initmitepctresist[i]
  parameter42<- ("TotalImmMites=") # total immigrating mites
  inputvalue42<- immmites[i]
#  parameter43<- 
#  inputvalue43<- pctimmmitesresist[i]
  
  
  varroainput <- paste(parameter,inputvalue, sep=" ")
  write(varroainput, file = paste(vpdir_sobol_in1, "input",i,".txt", sep = ""), append = FALSE)
  varroainput2 <- paste(parameter2,inputvalue2, sep=" ")
  write(varroainput2, file = paste(vpdir_sobol_in1, "input",i,".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput3 <- paste(parameter3, inputvalue3, sep=" ")
  write(varroainput3, file = paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput4 <- paste(parameter4, inputvalue4, sep=" ")
  write(varroainput4, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput5 <- paste(parameter5, inputvalue5, sep= " ")
  write(varroainput5, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput6 <- paste(parameter6, inputvalue6, sep= " ")
  write(varroainput6, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput7 <- paste(parameter7, inputvalue7, sep= " ")
  write(varroainput7, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput8 <- paste(parameter8, inputvalue8, sep= " ")
  write(varroainput8, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput9 <- paste(parameter9, inputvalue9, sep= " ")
  write(varroainput9, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput10 <- paste(parameter10, inputvalue10, sep= " ")
  write(varroainput10, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput11 <- paste(parameter11, inputvalue11, sep= " ")
  write(varroainput11, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput12 <- paste(parameter12, inputvalue12, sep= " ")
  write(varroainput12, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput13 <- paste(parameter13, inputvalue13, sep= " ")
  write(varroainput13, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput14 <- paste(parameter14, inputvalue14, sep= " ")
  write(varroainput14, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput15 <- paste(parameter15, inputvalue15, sep= " ")
  write(varroainput15, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput16 <- paste(parameter16, inputvalue16, sep= " ")
  write(varroainput16, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput17 <- paste(parameter17, inputvalue17, sep= " ")
  write(varroainput17, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput18 <- paste(parameter18, inputvalue18, sep= " ")
  write(varroainput18, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput19 <- paste(parameter19, inputvalue19, sep= " ")
  write(varroainput19, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput20 <- paste(parameter20, inputvalue20, sep= " ")
  write(varroainput20, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput21 <- paste(parameter21, inputvalue21, sep= "")
  write(varroainput21, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput22 <- paste(parameter22, inputvalue22, sep= " ")
  write(varroainput22, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput23 <- paste(parameter23, inputvalue23, sep= " ")
  write(varroainput23, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput24 <- paste(parameter24, inputvalue24, sep= " ")
  write(varroainput24, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput25 <- paste(parameter25, inputvalue25, sep= " ")
  write(varroainput25, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput26 <- paste(parameter26, inputvalue26, sep= " ")
  write(varroainput26, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput27 <- paste(parameter27, inputvalue27, sep= " ")
  write(varroainput27, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput28 <- paste(parameter28, inputvalue28, sep= " ")
  write(varroainput28, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput29 <- paste(parameter29, inputvalue29, sep= " ")
  write(varroainput29, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput30 <- paste(parameter30, inputvalue30, sep= " ")
  write(varroainput30, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput31 <- paste(parameter31, inputvalue31, sep= " ")
  write(varroainput31, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput32 <- paste(parameter32, inputvalue32, sep= " ")
  write(varroainput32, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput33 <- paste(parameter33, inputvalue33, sep= " ")
  write(varroainput33, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput34 <- paste(parameter34, inputvalue34, sep= " ")
  write(varroainput34, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput35 <- paste(parameter35, inputvalue35, sep= " ")
  write(varroainput35, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput36 <- paste(parameter36, inputvalue36, sep= " ")
  write(varroainput36, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput37 <- paste(parameter37, inputvalue37, sep= " ")
  write(varroainput37, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput38 <- paste(parameter38, inputvalue38, sep= " ")
  write(varroainput38, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput39 <- paste(parameter39, inputvalue39, sep= " ")
  write(varroainput39, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput40 <- paste(parameter40, inputvalue40, sep= " ")
  write(varroainput40, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  #  parameter41<- ("InitMitePctResistant=") #initial mite % resistant
  #  inputvalue41<- initmitepctresist[i]
  varroainput42 <- paste(parameter42, inputvalue42, sep= " ")
  write(varroainput42, file= paste(vpdir_sobol_in1, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  #  parameter43<- 
  #  inputvalue43<- pctimmmitesresist[i]
}


#sobol2
for (i in 1:Nsims) {
  parameter <- ("ICQueenStrength=") #queen strength
  inputvalue <- qs2[i]
  parameter2 <- ("RQWkrDrnRatio=") #requeen worker-drone ratio
  inputvalue2 <- wd2[i]
  parameter3 <- ("ICDroneMiteSurvivorship=") #drone-mite survivorship
  inputvalue3 <- dmsurv2[i]
  parameter4 <- ("ICWorkerMiteSurvivorship=")  #worker-mite survivorship
  inputvalue4 <- wmsurv2[i]
  parameter5 <- ("ICForagerLifespan=")  #Forager Lifespan
  inputvalue5 <- fl2[i]
  parameter6 <- ("ImmType=")   #Mite Immigration Type
  inputvalue6 <- miteimmtype[i]
  parameter7 <- ("AIAdultSlope=") #ai adult slope
  inputvalue7 <- as2[i]
  parameter8 <- ("AIAdultLD50=") #ai adult LD50
  inputvalue8 <- aL2[i]
  parameter9 <- ("AIAdultSlopeContact=") #ai adult slope contact
  inputvalue9 <- asc2[i]
  parameter10 <- ("AIAdultLD50Contact=") #ai adult LD50 contact
  inputvalue10 <- aLc2[i]
  parameter11 <- ("AILarvaSlope=") #ai larva slope
  inputvalue11 <- ls2[i]
  parameter12 <- ("AILarvaLD50=") #ai larva LD50
  inputvalue12 <- lL2[i]
  parameter13 <- ("AIKOW=") #ai kow
  inputvalue13 <- kow2[i]
  parameter14 <- ("AIKOC=") #ai koc
  inputvalue14 <- koc2[i]
  parameter15 <- ("AIHalfLife=") #ai half life (days)
  inputvalue15 <- hl2[i]
  parameter16 <- ("EAppRate=") #application rate (lb/A)
  inputvalue16<- ar2[i]
  parameter17 <- ("FoliarEnabled=") #foliar spray enable
  inputvalue17<- foliar_true[i]
  parameter18 <- ("WeatherFileName=") #weather file
  inputvalue18<- weather_file[i]
  parameter19<- ("SimStart=") #simulation start date
  inputvalue19<- sim_start[i]
  parameter20<- ("SimEnd=") #simulation end date
  inputvalue20<- sim_end[i]
  parameter21<- ("ImmEnabled=") #enable mite immigration
  inputvalue21<- immenable[i]
  parameter22<- ("ImmStart=") #mite immigration start date
  inputvalue22<- immstart[i]
  parameter23<- ("ImmEnd=") #mite immigration end date
  inputvalue23<- immend[i]
  parameter24<- ("FoliarAppDate=") #foliar spray application date
  inputvalue24<- foliar_appdate[i]
  parameter25<- ("FoliarForageBegin=") #foliar spray bee forage exposure start date
  inputvalue25<- foliar_begin[i]
  parameter26<- ("FoliarForageEnd=") #foliar spray bee forage exposure end date
  inputvalue26<- foliar_end[i]
  parameter27<- ("ICDroneAdults=") #initial condition drone adults
  inputvalue27<- da2[i]
  parameter28<- ("ICWorkerAdults=") #inital condition worker adults
  inputvalue28<- wa2[i]
  parameter29<- ("ICDroneBrood=") #initial condition drone brood
  inputvalue29<- db2[i]
  parameter30<- ("ICWorkerBrood=") #initial condition worker brood
  inputvalue30<- wb2[i]
  parameter31<- ("ICDroneLarvae=") #initial condition drone larvae
  inputvalue31<- dl2[i]
  parameter32<- ("ICWorkerLarvae=") #initial condition worker larvae
  inputvalue32<- wl2[i]
  parameter33<- ("ICDroneEggs=") #initial condition drone eggs
  inputvalue33<- de2[i]
  parameter34<- ("ICWorkerEggs=") #initial condition worker eggs
  inputvalue34<- we2[i]
  parameter35<- ("ICDroneAdultInfest=") #initial condition adult drone infestation
  inputvalue35<- dainfest2[i]
  parameter36<- ("ICDroneBroodInfest=") #initial condition drone brood infestation
  inputvalue36<- dbinfest2[i]
  parameter37<- ("ICDroneMiteOffspring=") #initial condition drone mite offspring
  inputvalue37<- dmoffs2[i]
  parameter38<- ("ICWorkerAdultInfest=") #initial condition adult worker infestation
  inputvalue38<- wainfest2[i]
  parameter39<- ("ICWorkerBroodInfest=") #initial condition worker brood infestation
  inputvalue39<- wbinfest2[i]
  parameter40<- ("ICWorkerMiteOffspring=") #initial condition worker mite offspring
  inputvalue40<- wmoffs2[i]
  #  parameter41<- ("InitMitePctResistant=") #initial mite % resistant
  #  inputvalue41<- pctresist2[i]
  parameter42<- ("TotalImmMites=") # total immigrating mites
  inputvalue42<- im2[i]
  #  parameter43<- ("PctImmMitesResistant=") #immigrating mites % resistant
  #  inputvalue43<- immpctresist2[i]
  
  
  varroainput <- paste(parameter,inputvalue, sep=" ")
  write(varroainput, file = paste(vpdir_sobol_in2, "input",i,".txt", sep = ""), append = FALSE)
  varroainput2 <- paste(parameter2,inputvalue2, sep=" ")
  write(varroainput2, file = paste(vpdir_sobol_in2, "input",i,".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput3 <- paste(parameter3, inputvalue3, sep=" ")
  write(varroainput3, file = paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput4 <- paste(parameter4, inputvalue4, sep=" ")
  write(varroainput4, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput5 <- paste(parameter5, inputvalue5, sep= " ")
  write(varroainput5, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput6 <- paste(parameter6, inputvalue6, sep= " ")
  write(varroainput6, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput7 <- paste(parameter7, inputvalue7, sep= " ")
  write(varroainput7, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput8 <- paste(parameter8, inputvalue8, sep= " ")
  write(varroainput8, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput9 <- paste(parameter9, inputvalue9, sep= " ")
  write(varroainput9, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput10 <- paste(parameter10, inputvalue10, sep= " ")
  write(varroainput10, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput11 <- paste(parameter11, inputvalue11, sep= " ")
  write(varroainput11, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput12 <- paste(parameter12, inputvalue12, sep= " ")
  write(varroainput12, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput13 <- paste(parameter13, inputvalue13, sep= " ")
  write(varroainput13, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput14 <- paste(parameter14, inputvalue14, sep= " ")
  write(varroainput14, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput15 <- paste(parameter15, inputvalue15, sep= " ")
  write(varroainput15, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput16 <- paste(parameter16, inputvalue16, sep= " ")
  write(varroainput16, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput17 <- paste(parameter17, inputvalue17, sep= "")
  write(varroainput17, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput18 <- paste(parameter18, inputvalue18, sep= " ")
  write(varroainput18, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput19 <- paste(parameter19, inputvalue19, sep= " ")
  write(varroainput19, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput20 <- paste(parameter20, inputvalue20, sep= " ")
  write(varroainput20, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput21 <- paste(parameter21, inputvalue21, sep= "")
  write(varroainput21, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput22 <- paste(parameter22, inputvalue22, sep= " ")
  write(varroainput22, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput23 <- paste(parameter23, inputvalue23, sep= " ")
  write(varroainput23, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput24 <- paste(parameter24, inputvalue24, sep= " ")
  write(varroainput24, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput25 <- paste(parameter25, inputvalue25, sep= " ")
  write(varroainput25, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput26 <- paste(parameter26, inputvalue26, sep= " ")
  write(varroainput26, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput27 <- paste(parameter27, inputvalue27, sep= " ")
  write(varroainput27, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput28 <- paste(parameter28, inputvalue28, sep= " ")
  write(varroainput28, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput29 <- paste(parameter29, inputvalue29, sep= " ")
  write(varroainput29, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput30 <- paste(parameter30, inputvalue30, sep= " ")
  write(varroainput30, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput31 <- paste(parameter31, inputvalue31, sep= " ")
  write(varroainput31, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput32 <- paste(parameter32, inputvalue32, sep= " ")
  write(varroainput32, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput33 <- paste(parameter33, inputvalue33, sep= " ")
  write(varroainput33, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput34 <- paste(parameter34, inputvalue34, sep= " ")
  write(varroainput34, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput35 <- paste(parameter35, inputvalue35, sep= " ")
  write(varroainput35, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput36 <- paste(parameter36, inputvalue36, sep= " ")
  write(varroainput36, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput37 <- paste(parameter37, inputvalue37, sep= " ")
  write(varroainput37, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput38 <- paste(parameter38, inputvalue38, sep= " ")
  write(varroainput38, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput39 <- paste(parameter39, inputvalue39, sep= " ")
  write(varroainput39, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput40 <- paste(parameter40, inputvalue40, sep= " ")
  write(varroainput40, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  #  parameter41<- ("InitMitePctResistant=") #initial mite % resistant
  #  inputvalue41<- initmitepctresist[i]
  varroainput42 <- paste(parameter42, inputvalue42, sep= " ")
  write(varroainput42, file= paste(vpdir_sobol_in2, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  #  parameter43<- 
  #  inputvalue43<- pctimmmitesresist[i]
}
