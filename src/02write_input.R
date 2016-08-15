#create input files #########

#CONTROL
for (i in 1:Nsims) {
  ## load monte carlo realization inputs
  #weather <- ("WeatherFileName=")
  #weathervalue <- weather_file[i]
  parameter00 <- ("RQQueenStrength=") #queen strength
  inputvalue00 <- RQQueenStrength[i]
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
  #parameter16 <- ("EAppRate=") #application rate (lb/A)
  #inputvalue16<- apprate_con[i]
  #parameter17 <- ("FoliarEnabled=") #foliar spray enable
  #inputvalue17<- foliar_false[i]

  ##write parameter inputs to disk
  varroainput <- paste(parameter,inputvalue, sep=" ")
  write(varroainput, file = paste(vpdir_in_con, "input",i,".txt", sep = ""), append = FALSE)
  varroainput00 <- paste(parameter00,inputvalue00, sep=" ")  
  write(varroainput00, file = paste(vpdir_in_con, "input",i,".txt", sep = ""), append = TRUE, sep="\n")
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
  #varroainput16 <- paste(parameter16, inputvalue16, sep= " ")
  #write(varroainput16, file= paste(vpdir_in_con, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  #varroainput17 <- paste(parameter17, inputvalue17, sep= " ")
  #write(varroainput17, file= paste(vpdir_in_con, "input", i, ".txt", sep=""), append= TRUE, sep = "\n")
  #varroainputweather <- paste(weather, weathervalue, sep= " ")
  #write(varroainputweather, file= paste(vpdir_in_con, "input", i, ".txt", sep=""), append= TRUE)
}


#EXPOSED
for (i in 1:Nsims) {
  parameter00 <- ("RQQueenStrength=") #queen strength
  inputvalue00 <- RQQueenStrength[i]
  #weather <- ("WeatherFileName=")
  #weathervalue <- weather_file[i]
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
  inputvalue16 <- apprate_exp[i]
  parameter17 <- ("FoliarEnabled=") #foliar spray enabled
  inputvalue17 <- foliar_true[i]
  parameter18 <- ("FoliarAppDate=") #foliar spray application date
  inputvalue18 <- foliar_appdate[i]
  parameter19 <- ("FoliarForageBegin=") #foliar spray exposure interval begin
  inputvalue19 <- foliar_begin[i]
  parameter20 <- ("FoliarForageEnd=") #foliar spray exposure interval end
  inputvalue20 <- foliar_end[i]

  varroainput <- paste(parameter,inputvalue, sep=" ")
  write(varroainput, file = paste(vpdir_in_exp, "input",i,".txt", sep = ""), append = FALSE)
  varroainput00 <- paste(parameter00,inputvalue00, sep=" ")  
  write(varroainput00, file = paste(vpdir_in_exp, "input",i,".txt", sep = ""), append = TRUE, sep="\n")
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
  #varroainputweather <- paste(weather, weathervalue, sep= " ")
  #write(varroainputweather, file= paste(vpdir_in_exp, "input", i, ".txt", sep=""), append= TRUE)
}
