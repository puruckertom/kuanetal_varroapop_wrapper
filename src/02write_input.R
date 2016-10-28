#create input files #########
for (i in 1:Nsims) {
  #weather <- ("WeatherFileName=")
  #weathervalue <- weather_file[i]
  ##initial parameter distributions
  parameter0 <- ("ICQueenStrength=") #queen strength
  inputvalue0 <- queenstrength[i]
  parameter1 <- ("RQWkrDrnRatio=") #requeen worker to drone ratio
  inputvalue1 <- wkrdrnratio[i]
  parameter2 <- ("ICDroneMiteSurvivorship=") #drone mite survivorship
  inputvalue2 <- drnmitesurvive[i]
  parameter3 <- ("ICWorkerMiteSurvivorship=") #worker mite survivorship
  inputvalue3 <- wkrmitesurvive[i]
  parameter4 <- ("ICForagerLifespan=") #forager lifespan
  inputvalue4 <- fgrlifespan[i]
  parameter5 <- ("ImmType=") #mite immigration
  inputvalue5 <- miteimmtype[i]
  ##Requeening
  parameter6 <- ("RQQueenStrength=") #requeen strength
  inputvalue6 <- RQQueenStrength[i]
  parameter7 <- ("RQEnableReQueen=") #requeen enable
  inputvalue7 <- rqenable[i]
  ##pesticide exposure
  parameter8 <- ("AIAdultSlope=") #adult slope
  inputvalue8 <- adslope[i]
  parameter9 <- ("AIAdultLD50=") #adult LD50 (ug/bee)
  inputvalue9 <- adLD50[i]
  parameter10 <- ("AIAdultSlopeContact=") #adult slope contact
  inputvalue10 <- adslopec[i]
  parameter11 <- ("AIAdultLD50Contact=") #adult LD50 contact (ug/bee)
  inputvalue11 <- adLD50c[i]
  parameter12 <- ("AILarvaSlope=") #larva slope
  inputvalue12 <- lslope[i]
  parameter13 <- ("AILarvaLD50=") #larva LD50 (ug/larva)
  inputvalue13 <- lLD50[i]
  parameter14 <- ("AIKOW=") #kow
  inputvalue14 <- kow[i]
  parameter15 <- ("AIKOC=") #koc
  inputvalue15 <- koc[i]
  parameter16 <- ("AIHalfLife=") #half life (days)
  inputvalue16 <- halflife[i]
  parameter17 <- ("EAppRate=") #exposed app rate (lb/A)
  inputvalue17 <- apprate[i]
  parameter18 <- ("FoliarEnabled=") #foliar enabled
  inputvalue18 <- foliarenable[i]
  parameter19 <- ("FoliarAppDate=") #foliar app date
  inputvalue19 <- foliar_appdate[i]
  parameter20 <- ("FoliarForageBegin=") #foliar forage begin
  inputvalue20 <- foliar_begin[i]
  parameter21 <- ("FoliarForageEnd=") #foliar forage end
  inputvalue21 <- foliar_end[i]
  parameter22 <- ("AIContactFactor=") #contact factor
  inputvalue22 <- contactfactor[i]
  ## Consumption Data (mg/day)
  parameter23 <- ("CL4Pollen=") #consumption larva 4 pollen
  inputvalue23 <- cl4pollen[i]
  parameter24 <- ("CL4Nectar=") #consumption larva 4 nectar
  inputvalue24 <- cl4nectar[i]
  parameter25 <- ("CL5Pollen=") #consumption larva 5 pollen
  inputvalue25 <- cl5pollen[i]
  parameter26 <- ("CL5Nectar=") #consumption larva 5 nectar
  inputvalue26 <- cl5nectar[i]
  parameter27 <- ("CLDPollen=") #consumption larva drone pollen
  inputvalue27 <- cldpollen[i]
  parameter28 <- ("CLDNectar=") #consumption larva drone nectar
  inputvalue28 <- cldnectar[i]
  parameter29 <- ("CA13Pollen=") #consumption adult 1-3 pollen
  inputvalue29 <- ca13pollen[i]
  parameter30 <- ("CA13Nectar=") #consumption adult 1-3 nectar
  inputvalue30 <- ca13nectar[i]
  parameter31 <- ("CA410Pollen=") #consumption adult 4-10 pollen
  inputvalue31 <- ca410pollen[i]
  parameter32 <- ("CA410Nectar=") #consumption adult 4-10 nectar
  inputvalue32 <- ca410nectar[i]
  parameter33 <- ("CA1120Pollen=") #consumption adult 11-20 pollen
  inputvalue33 <- ca1120pollen[i]
  parameter34 <- ("CA1120Nectar=") #consumpation adult 11-20 nectar
  inputvalue34 <- ca1120nectar[i]
  parameter35 <- ("IPollenTrips=") #pollen trips (per day)
  inputvalue35 <- ptrips[i]
  parameter36 <- ("INectarTrips=") #nectar trips (per day)
  inputvalue36 <- ntrips[i]
  parameter37 <- ("IPollenLoad=") #pollen load (mg/bee)
  inputvalue37 <- pload[i]
  parameter38 <- ("INectarLoad=") #nectar load (mg/bee)
  inputvalue38 <- nload[i]
  parameter39 <- ("ESoilP=") #soilp
  inputvalue39 <- soilp[i]
  parameter40 <- ("ESoilFoc=") #soil Foc
  inputvalue40 <- soilfoc[i]
  parameter41 <- ("SoilEnabled=") #soil enable
  inputvalue41 <- soilenable[i]
  parameter42 <- ("SeedEnabled=") #seed enable
  inputvalue42 <- seedenable[i]
  parameter43 <- ("SoilForageBegin=") #soil forage begin
  inputvalue43 <- soil_begin[i]
  parameter44 <- ("SoilForageEnd=") #soil forage end
  inputvalue44 <- soil_end[i]
  parameter45 <- ("SeedForageBegin=") #seed forage begin
  inputvalue45 <- seed_begin[i]
  parameter46 <- ("SeedForageEnd=") #seed forage end
  inputvalue46 <- seed_end[i]
  parameter47 <- ("ESeedConcentration=") #seed concentration
  inputvalue47 <- seedconc[i]
  
  varroainput0 <- paste(parameter0, inputvalue0, sep = " ")
  write(varroainput0, file = paste(vpdir_in_foliar, "input", i, ".txt", sep = ""), append = FALSE)
  write(varroainput0, file = paste(vpdir_in_control, "input", i, ".txt", sep = ""), append = FALSE)
  write(varroainput0, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = FALSE, sep = "\n")
  write(varroainput0, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = FALSE, sep = "\n")
  varroainput1 <- paste(parameter1,inputvalue1, sep=" ")
  write(varroainput1, file = paste(vpdir_in_foliar, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput1, file = paste(vpdir_in_control, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput1, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput1, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput2 <- paste(parameter2,inputvalue2, sep=" ")
  write(varroainput2, file = paste(vpdir_in_foliar, "input",i,".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput2, file = paste(vpdir_in_control, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput2, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput2, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput3 <- paste(parameter3, inputvalue3, sep=" ")
  write(varroainput3, file = paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  write(varroainput3, file = paste(vpdir_in_control, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput3, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput3, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput4 <- paste(parameter4, inputvalue4, sep=" ")
  write(varroainput4, file= paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  write(varroainput4, file = paste(vpdir_in_control, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput4, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput4, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput5 <- paste(parameter5, inputvalue5, sep= " ")
  write(varroainput5, file= paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  write(varroainput5, file = paste(vpdir_in_control, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput5, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput5, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput6 <- paste(parameter6, inputvalue6, sep= " ")
  write(varroainput6, file= paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  write(varroainput6, file = paste(vpdir_in_control, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput6, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput6, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput7 <- paste(parameter7, inputvalue7, sep= "")
  write(varroainput7, file= paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  write(varroainput7, file = paste(vpdir_in_control, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput7, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput7, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput8 <- paste(parameter8, inputvalue8, sep= " ")
  write(varroainput8, file= paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  write(varroainput8, file = paste(vpdir_in_control, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput8, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput8, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput9 <- paste(parameter9, inputvalue9, sep= " ")
  write(varroainput9, file = paste(vpdir_in_control, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput9, file= paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  write(varroainput9, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput9, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput10 <- paste(parameter10, inputvalue10, sep= " ")
  write(varroainput10, file = paste(vpdir_in_control, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput10, file= paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  write(varroainput10, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput10, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput11 <- paste(parameter11, inputvalue11, sep= " ")
  write(varroainput11, file = paste(vpdir_in_control, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput11, file= paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  write(varroainput11, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput11, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput12 <- paste(parameter12, inputvalue12, sep= " ")
  write(varroainput12, file = paste(vpdir_in_control, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput12, file= paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  write(varroainput12, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput12, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput13 <- paste(parameter13, inputvalue13, sep= " ")
  write(varroainput13, file= paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  write(varroainput13, file = paste(vpdir_in_control, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput13, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput13, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput14 <- paste(parameter14, inputvalue14, sep= " ")
  write(varroainput14, file= paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  write(varroainput14, file = paste(vpdir_in_control, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput14, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput14, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput15 <- paste(parameter15, inputvalue15, sep= " ")
  write(varroainput15, file= paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  write(varroainput15, file = paste(vpdir_in_control, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput15, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput15, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput16 <- paste(parameter16, inputvalue16, sep= " ")
  write(varroainput16, file= paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  write(varroainput16, file = paste(vpdir_in_control, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput16, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput16, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput17 <- paste(parameter17, inputvalue17, sep= " ")
  write(varroainput17, file= paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  write(varroainput17, file = paste(vpdir_in_control, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput17, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput17, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput18 <- paste(parameter18, inputvalue18, sep= "")
  write(varroainput18, file= paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput19 <- paste(parameter19, inputvalue19, sep= " ")
  write(varroainput19, file= paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput20 <- paste(parameter20, inputvalue20, sep= " ")
  write(varroainput20, file= paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput21 <- paste(parameter21, inputvalue21, sep= " ")
  write(varroainput21, file= paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput22 <- paste(parameter22, inputvalue22, sep= " ")
  write(varroainput22, file = paste(vpdir_in_foliar, "input",i,".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput22, file = paste(vpdir_in_control, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput22, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput22, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput23 <- paste(parameter23, inputvalue23, sep=" ")
  write(varroainput23, file = paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  write(varroainput23, file = paste(vpdir_in_control, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput23, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput23, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput24 <- paste(parameter24, inputvalue24, sep=" ")
  write(varroainput24, file= paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  write(varroainput24, file = paste(vpdir_in_control, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput24, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput24, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput25 <- paste(parameter25, inputvalue25, sep= " ")
  write(varroainput25, file= paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  write(varroainput25, file = paste(vpdir_in_control, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput25, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput25, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput26 <- paste(parameter26, inputvalue26, sep= " ")
  write(varroainput26, file= paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  write(varroainput26, file = paste(vpdir_in_control, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput26, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput26, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput27 <- paste(parameter27, inputvalue27, sep= " ")
  write(varroainput27, file= paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  write(varroainput27, file = paste(vpdir_in_control, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput27, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput27, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput28 <- paste(parameter28, inputvalue28, sep= " ")
  write(varroainput28, file= paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  write(varroainput28, file = paste(vpdir_in_control, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput28, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput28, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput29 <- paste(parameter29, inputvalue29, sep= " ")
  write(varroainput29, file= paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  write(varroainput29, file = paste(vpdir_in_control, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput29, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput29, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput30 <- paste(parameter30, inputvalue30, sep= " ")
  write(varroainput30, file= paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  write(varroainput30, file = paste(vpdir_in_control, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput30, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput30, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput31 <- paste(parameter31, inputvalue31, sep= " ")
  write(varroainput31, file= paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  write(varroainput31, file = paste(vpdir_in_control, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput31, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput31, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput32 <- paste(parameter32, inputvalue32, sep= " ")
  write(varroainput32, file= paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  write(varroainput32, file = paste(vpdir_in_control, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput32, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput32, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput33 <- paste(parameter33, inputvalue33, sep= " ")
  write(varroainput33, file= paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  write(varroainput33, file = paste(vpdir_in_control, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput33, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput33, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput34 <- paste(parameter34, inputvalue34, sep= " ")
  write(varroainput34, file= paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  write(varroainput34, file = paste(vpdir_in_control, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput34, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput34, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput35 <- paste(parameter35, inputvalue35, sep= " ")
  write(varroainput35, file= paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  write(varroainput35, file = paste(vpdir_in_control, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput35, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput35, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput36 <- paste(parameter36, inputvalue36, sep= " ")
  write(varroainput36, file= paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  write(varroainput36, file = paste(vpdir_in_control, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput36, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput36, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput37 <- paste(parameter37, inputvalue37, sep= " ")
  write(varroainput37, file= paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  write(varroainput37, file = paste(vpdir_in_control, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput37, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput37, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput38 <- paste(parameter38, inputvalue38, sep= " ")
  write(varroainput38, file= paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  write(varroainput38, file = paste(vpdir_in_control, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput38, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  write(varroainput38, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput39 <- paste(parameter39, inputvalue39, sep= " ")
  write(varroainput39, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput40 <- paste(parameter40, inputvalue40, sep= " ")
  write(varroainput40, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput41 <- paste(parameter41, inputvalue41, sep= "")
  write(varroainput41, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput42 <- paste(parameter42, inputvalue42, sep= "")
  write(varroainput42, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput43 <- paste(parameter43, inputvalue43, sep= " ")
  write(varroainput43, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput44 <- paste(parameter44, inputvalue44, sep= " ")
  write(varroainput44, file = paste(vpdir_in_soil, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput45 <- paste(parameter45, inputvalue45, sep= " ")
  write(varroainput45, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput46 <- paste(parameter46, inputvalue46, sep= " ")
  write(varroainput46, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput47 <- paste(parameter47, inputvalue47, sep= " ")
  write(varroainput47, file = paste(vpdir_in_seed, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  
  write("ESeedConcentration= 0", file = paste(vpdir_in_control, "input", i, ".txt", sep=""), append = TRUE, sep = "\n")
  #varroainputweather <- paste(weather, weathervalue, sep= " ")
  #write(varroainputweather, file= paste(vpdir_in_foliar, "input", i, ".txt", sep=""), append= TRUE)
}
