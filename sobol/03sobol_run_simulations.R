#run simulations###########

#input matrix 1
for (i in 1:Nsims) {
  # n<-inputtest[i]
  inputfile<- paste("input",i,".txt", sep="")
  outputfile<- paste("results",i,".txt", sep="")
  logfile<- paste("log",i,".txt", sep="")
  vpdir_command <- paste(vpdir_exe, "VarroaPop_3_2_6_0.exe ", vpdir_exe, vrp_filename, 
                         " /b /or ", vpdir_sobol_out1, outputfile, 
                         " /i ", vpdir_sobol_in1, inputfile, " /ol ", vpdir_log, logfile, sep="")
  print(vpdir_command)
  system(vpdir_command)
}

#input matrix 2
for (i in 1:Nsims) {
  # n<-inputtest[i]
  inputfile<- paste("input",i,".txt", sep="")
  outputfile<- paste("results",i,".txt", sep="")
  logfile<- paste("log",i,"exp.txt", sep="")
  vpdir_command <- paste(vpdir_exe, "VarroaPop_3_2_6_0.exe ", vpdir_exe, vrp_filename, 
                         " /b /or ", vpdir_sobol_out2, outputfile, 
                         " /i ", vpdir_sobol_in2, inputfile, " /ol ", vpdir_log, logfile, sep="")
  print(vpdir_command)
  system(vpdir_command)
}


uncoupledsobol <- sobol2007(model = NULL, inputdata_sobol, inputdata_sobol2)
coupledsobol <- tell(uncoupledsobol, )