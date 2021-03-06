vpdir_sobol_input <- c(paste(vpdir_sobol, "input01/", sep = ""), paste(vpdir_sobol, "input02/", sep = ""),
                       paste(vpdir_sobol, "input03/", sep = ""), paste(vpdir_sobol, "input04/", sep = ""),
                       paste(vpdir_sobol, "input05/", sep = ""), paste(vpdir_sobol, "input06/", sep = ""),
                       paste(vpdir_sobol, "input07/", sep = ""), paste(vpdir_sobol, "input08/", sep = ""),
                       paste(vpdir_sobol, "input09/", sep = ""), paste(vpdir_sobol, "input10/", sep = ""),
                       paste(vpdir_sobol, "input11/", sep = ""), paste(vpdir_sobol, "input12/", sep = ""),
                       paste(vpdir_sobol, "input13/", sep = ""), paste(vpdir_sobol, "input14/", sep = ""),
                       paste(vpdir_sobol, "input15/", sep = ""), paste(vpdir_sobol, "input16/", sep = ""),
                       paste(vpdir_sobol, "input17/", sep = ""), paste(vpdir_sobol, "input18/", sep = ""),
                       paste(vpdir_sobol, "input19/", sep = ""), paste(vpdir_sobol, "input20/", sep = ""),
                       paste(vpdir_sobol, "input21/", sep = ""), paste(vpdir_sobol, "input22/", sep = ""))

parameter1 <- ("WeatherFileName=") #weather file
parameter2 <- ("SimStart=") #simulation start date
parameter3 <- ("SimEnd=") #simulation end date
# parameter4 <- ("ImmEnabled=") #enable mite immigration
# parameter5 <- ("ImmType=")   #Mite Immigration Type
# parameter6 <- ("ImmStart=") #mite immigration start date
# parameter7 <- ("ImmEnd=") #mite immigration end date
parameter8 <- ("FoliarEnabled=") #foliar spray enable
parameter9 <- ("FoliarAppDate=") #foliar spray application date
parameter10 <- ("FoliarForageBegin=") #foliar spray bee forage exposure start date
parameter11 <- ("FoliarForageEnd=") #foliar spray bee forage exposure end date
parameter12 <- ("ICDroneAdults= ") #initial condition drone adults
parameter13 <- ("ICWorkerAdults= ") #inital condition worker adults
parameter14 <- ("ICDroneBrood= ") #initial condition drone brood
parameter15 <- ("ICWorkerBrood= ") #initial condition worker brood
parameter16 <- ("ICDroneLarvae= ") #initial condition drone larvae
parameter17 <- ("ICWorkerLarvae= ") #initial condition worker larvae
parameter18 <- ("ICDroneEggs= ") #initial condition drone eggs
parameter19 <- ("ICWorkerEggs= ") #initial condition worker eggs
parameter20 <- ("ICQueenStrength= ") #queen strength
parameter21 <- ("ICForagerLifespan= ")  #Forager Lifespan

# parameter22 <- ("ICDroneAdultInfest= ") #initial condition adult drone infestation
# parameter23 <- ("ICDroneBroodInfest= ") #initial condition drone brood infestation
# parameter24 <- ("ICDroneMiteOffspring= ") #initial condition drone mite offspring
# parameter25 <- ("ICDroneMiteSurvivorship= ") #drone-mite survivorship
# parameter26 <- ("ICWorkerAdultInfest= ") #initial condition adult worker infestation
# parameter27 <- ("ICWorkerBroodInfest= ") #initial condition worker brood infestation
# parameter28 <- ("ICWorkerMiteOffspring= ") #initial condition worker mite offspring
# parameter29 <- ("ICWorkerMiteSurvivorship= ")  #worker-mite survivorship

parameter30 <- ("RQWkrDrnRatio= ") #requeen worker-drone ratio
# parameter31 <- ("TotalImmMites= ") # total immigrating mites
parameter32 <- ("AIAdultSlope= ") #ai adult slope
parameter33 <- ("AIAdultLD50= ") #ai adult LD50
parameter34 <- ("AIAdultSlopeContact= ") #ai adult slope contact
parameter35 <- ("AIAdultLD50Contact= ") #ai adult LD50 contact
parameter36 <- ("AILarvaSlope= ") #ai larva slope
parameter37 <- ("AILarvaLD50= ") #ai larva LD50
parameter38 <- ("AIKOW= ") #ai kow
parameter39 <- ("AIKOC= ") #ai koc
parameter40 <- ("AIHalfLife= ") #ai half life (days)
parameter41 <- ("EAppRate= ") #application rate (lb/A)
#  parameter42<- ("InitMitePctResistant= ") #initial mite % resistant
#  parameter43<- ("PctImmMitesResistant= ") #immigrating mites % resistant
parname <- c(parameter1, parameter2, parameter3, parameter8, parameter9, parameter10, 
             parameter11, parameter12, parameter13, parameter14, parameter15, parameter16, 
             parameter17, parameter18, parameter19, parameter20, parameter21, parameter30, 
             parameter32, parameter33, parameter34, parameter35, parameter36, parameter37, 
             parameter38, parameter39, parameter40, parameter41)


inputs<- array(data=NA, Nparam)
for (i in 1:length(vpdir_sobol_input)){
  pth <- vpdir_sobol_input[i]
  df <- sb_inputs[,,i]
  for (ite in 1:Nsims){
    b <- df[ite,]
    con <- file(paste(pth,"input", ite, ".txt", sep=""))
    for (n in 1:Nparam){
      varroainput <- paste(parname[n], b[[n]], sep= "")
      inputs[n]<- varroainput
    }
    writeLines(inputs,con)
    close(con)
  }
}




# #######
# # save each set of inputs for simulation to txt files
# #######
# for (i in 1:32){
#   df <- sb_inputs[,,i]
#   for (ite in 1:Nsims){
#     b <- df[ite,]
#     for (n in 1:Nparam){
#       varroainput <- paste(parname[n], b[[n]], sep= "")
#       if (n == 1){
#         write(varroainput, file= paste(vpdir_sobol_input[i], "input", ite, ".txt", sep=""), append= FALSE)
#       }
#       else {
#         write(varroainput, file= paste(vpdir_sobol_input[i], "input", ite, ".txt", sep=""), append= TRUE)
#       }
#       print(n)
#       print(ite)
#       print(i)
#     }
#   }
# }

