#create input files #########
#CONTROL
for (i in 1:Nsims) {
  ## load monte carlo realization inputs
  #weather <- ("WeatherFileName=")
  #weathervalue <- weather_file[i]
  ##initial conditions
  parameter0 <- ("ICQueenStrength=") #queen strength
  inputvalue0 <- queenstrength[i]
  parameter1 <- ("RQQueenStrength=") #requeen strength
  inputvalue1 <- RQQueenStrength[i]
  parameter2 <- ("ICForagerLifespan=") #forager lifespan
  inputvalue2 <- fgrlifespan[i]
  parameter3 <- ("ICDroneMiteSurvivorship=") #drone mite survivorship
  inputvalue3 <- drnmitesurvive[i]
  parameter4 <- ("ICWorkerMiteSurvivorship=") #worker mite survivorship
  inputvalue4 <- wkrmitesurvive[i]
  parameter5 <- ("ImmType=") #mite immigration
  inputvalue5 <- miteimmtype[i]
  parameter6 <- ("RQWkrDrnRatio=") #requeen worker to drone ratio
  inputvalue6 <- wkrdrnratio[i]
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
  parameter17 <- ("EAppRate=") #control app rate (lb/A)
  inputvalue17 <- apprate_con[i]
  parameter18 <- ("FoliarEnabled=") #foliar enabled
  inputvalue18 <- foliar_false[i]
  
  ##write parameter inputs to disk
  varroainput0 <- paste(parameter0,inputvalue0, sep=" ")
  write(varroainput0, file = paste(vpdir_in_con, "input",i,".txt", sep = ""), append = FALSE)
  varroainput1 <- paste(parameter1, inputvalue1, sep =" ")
  write(varroainput1, file = paste(vpdir_in_con, "input", i, ".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput2 <- paste(parameter2,inputvalue2, sep=" ")
  write(varroainput2, file = paste(vpdir_in_con, "input",i,".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput3 <- paste(parameter3, inputvalue3, sep=" ")
  write(varroainput3, file = paste(vpdir_in_con, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput4 <- paste(parameter4, inputvalue4, sep=" ")
  write(varroainput4, file= paste(vpdir_in_con, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput5 <- paste(parameter5, inputvalue5, sep= " ")
  write(varroainput5, file= paste(vpdir_in_con, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput6 <- paste(parameter6, inputvalue6, sep= " ")
  write(varroainput6, file= paste(vpdir_in_con, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput7 <- paste(parameter7, inputvalue7, sep= " ")
  write(varroainput7, file= paste(vpdir_in_con, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput8 <- paste(parameter8, inputvalue8, sep= " ")
  write(varroainput8, file= paste(vpdir_in_con, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput9 <- paste(parameter9, inputvalue9, sep= " ")
  write(varroainput9, file= paste(vpdir_in_con, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput10 <- paste(parameter10, inputvalue10, sep= " ")
  write(varroainput10, file= paste(vpdir_in_con, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput11 <- paste(parameter11, inputvalue11, sep= " ")
  write(varroainput11, file= paste(vpdir_in_con, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput12 <- paste(parameter12, inputvalue12, sep= " ")
  write(varroainput12, file= paste(vpdir_in_con, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput13 <- paste(parameter13, inputvalue13, sep= " ")
  write(varroainput13, file= paste(vpdir_in_con, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput14 <- paste(parameter14, inputvalue14, sep= " ")
  write(varroainput14, file= paste(vpdir_in_con, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput15 <- paste(parameter15, inputvalue15, sep= " ")
  write(varroainput15, file= paste(vpdir_in_con, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput16 <- paste(parameter16, inputvalue16, sep= " ")
  write(varroainput16, file= paste(vpdir_in_con, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput17 <- paste(parameter17, inputvalue17, sep= " ")
  write(varroainput17, file= paste(vpdir_in_con, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput18 <- paste(parameter17, inputvalue18, sep= " ")
  write(varroainput18, file= paste(vpdir_in_con, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  # varroainputweather <- paste(weather, weathervalue, sep= " ")
  # write(varroainputweather, file= paste(vpdir_in_con, "input", i, ".txt", sep=""), append= TRUE)
}


#EXPOSED
for (i in 1:Nsims) {
  #weather <- ("WeatherFileName=")
  #weathervalue <- weather_file[i]
  ##initial conditions
  parameter0 <- ("ICQueenStrength=") #queen strength
  inputvalue0 <- queenstrength[i]
  parameter1 <- ("RQQueenStrength=") #requeen strength
  inputvalue1 <- RQQueenStrength[i]
  parameter2 <- ("ICForagerLifespan=") #forager lifespan
  inputvalue2 <- fgrlifespan[i]
  parameter3 <- ("ICDroneMiteSurvivorship=") #drone mite survivorship
  inputvalue3 <- drnmitesurvive[i]
  parameter4 <- ("ICWorkerMiteSurvivorship=") #worker mite survivorship
  inputvalue4 <- wkrmitesurvive[i]
  parameter5 <- ("ImmType=") #mite immigration
  inputvalue5 <- miteimmtype[i]
  parameter6 <- ("RQWkrDrnRatio=") #requeen worker to drone ratio
  inputvalue6 <- wkrdrnratio[i]
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
  inputvalue17 <- apprate_exp[i]
  parameter18 <- ("FoliarEnabled=") #foliar enabled
  inputvalue18 <- foliar_true[i]
  parameter19 <- ("FoliarAppDate=") #foliar app date
  inputvalue19 <- foliar_appdate[i]
  parameter20 <- ("FoliarForageBegin=") #foliar forage begin
  inputvalue20 <- foliar_begin[i]
  parameter21 <- ("FoliarForageEnd=") #foliar forage end
  inputvalue21 <- foliar_end[i]
  
  varroainput0 <- paste(parameter0, inputvalue0, sep = " ")
  write(varroainput0, file = paste(vpdir_in_exp, "input", i, ".txt", sep = ""), append = FALSE)
  varroainput1 <- paste(parameter1,inputvalue1, sep=" ")
  write(varroainput1, file = paste(vpdir_in_exp, "input",i,".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput2 <- paste(parameter2,inputvalue2, sep=" ")
  write(varroainput2, file = paste(vpdir_in_exp, "input",i,".txt", sep = ""), append = TRUE, sep = "\n")
  varroainput3 <- paste(parameter3, inputvalue3, sep=" ")
  write(varroainput3, file = paste(vpdir_in_exp, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput4 <- paste(parameter4, inputvalue4, sep=" ")
  write(varroainput4, file= paste(vpdir_in_exp, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput5 <- paste(parameter5, inputvalue5, sep= " ")
  write(varroainput5, file= paste(vpdir_in_exp, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput6 <- paste(parameter6, inputvalue6, sep= " ")
  write(varroainput6, file= paste(vpdir_in_exp, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput7 <- paste(parameter7, inputvalue7, sep= " ")
  write(varroainput7, file= paste(vpdir_in_exp, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput8 <- paste(parameter8, inputvalue8, sep= " ")
  write(varroainput8, file= paste(vpdir_in_exp, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput9 <- paste(parameter9, inputvalue9, sep= " ")
  write(varroainput9, file= paste(vpdir_in_exp, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput10 <- paste(parameter10, inputvalue10, sep= " ")
  write(varroainput10, file= paste(vpdir_in_exp, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput11 <- paste(parameter11, inputvalue11, sep= " ")
  write(varroainput11, file= paste(vpdir_in_exp, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput12 <- paste(parameter12, inputvalue12, sep= " ")
  write(varroainput12, file= paste(vpdir_in_exp, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput13 <- paste(parameter13, inputvalue13, sep= " ")
  write(varroainput13, file= paste(vpdir_in_exp, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput14 <- paste(parameter14, inputvalue14, sep= " ")
  write(varroainput14, file= paste(vpdir_in_exp, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput15 <- paste(parameter15, inputvalue15, sep= " ")
  write(varroainput15, file= paste(vpdir_in_exp, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput16 <- paste(parameter16, inputvalue16, sep= " ")
  write(varroainput16, file= paste(vpdir_in_exp, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput17 <- paste(parameter17, inputvalue17, sep= " ")
  write(varroainput17, file= paste(vpdir_in_exp, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput18 <- paste(parameter18, inputvalue18, sep= " ")
  write(varroainput18, file= paste(vpdir_in_exp, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput19 <- paste(parameter19, inputvalue19, sep= " ")
  write(varroainput19, file= paste(vpdir_in_exp, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput20 <- paste(parameter20, inputvalue20, sep= " ")
  write(varroainput20, file= paste(vpdir_in_exp, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  varroainput21 <- paste(parameter21, inputvalue21, sep= " ")
  write(varroainput21, file= paste(vpdir_in_exp, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  #varroainputweather <- paste(weather, weathervalue, sep= " ")
  #write(varroainputweather, file= paste(vpdir_in_exp, "input", i, ".txt", sep=""), append= TRUE)
}
