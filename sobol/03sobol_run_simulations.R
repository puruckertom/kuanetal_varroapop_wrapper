vpdir_sobol_output <- c(paste(vpdir_sobol, "output01/", sep = ""), paste(vpdir_sobol, "output02/", sep = ""),
                       paste(vpdir_sobol, "output03/", sep = ""), paste(vpdir_sobol, "output04/", sep = ""),
                       paste(vpdir_sobol, "output05/", sep = ""), paste(vpdir_sobol, "output06/", sep = ""),
                       paste(vpdir_sobol, "output07/", sep = ""), paste(vpdir_sobol, "output08/", sep = ""),
                       paste(vpdir_sobol, "output09/", sep = ""), paste(vpdir_sobol, "output10/", sep = ""),
                       paste(vpdir_sobol, "output11/", sep = ""), paste(vpdir_sobol, "output12/", sep = ""),
                       paste(vpdir_sobol, "output13/", sep = ""), paste(vpdir_sobol, "output14/", sep = ""),
                       paste(vpdir_sobol, "output15/", sep = ""), paste(vpdir_sobol, "output16/", sep = ""),
                       paste(vpdir_sobol, "output17/", sep = ""), paste(vpdir_sobol, "output18/", sep = ""),
                       paste(vpdir_sobol, "output19/", sep = ""), paste(vpdir_sobol, "output20/", sep = ""),
                       paste(vpdir_sobol, "output21/", sep = ""), paste(vpdir_sobol, "output22/", sep = ""),
                       paste(vpdir_sobol, "output23/", sep = ""), paste(vpdir_sobol, "output24/", sep = ""),
                       paste(vpdir_sobol, "output25/", sep = ""), paste(vpdir_sobol, "output26/", sep = ""),
                       paste(vpdir_sobol, "output27/", sep = ""), paste(vpdir_sobol, "output28/", sep = ""),
                       paste(vpdir_sobol, "output29/", sep = ""), paste(vpdir_sobol, "output30/", sep = ""),
                       paste(vpdir_sobol, "output31/", sep = ""), paste(vpdir_sobol, "output32/", sep = ""))
vpdir_sobol_log <- c(paste(vpdir_sobol, "log01/", sep = ""), paste(vpdir_sobol, "log02/", sep = ""),
                     paste(vpdir_sobol, "log03/", sep = ""), paste(vpdir_sobol, "log04/", sep = ""),
                     paste(vpdir_sobol, "log05/", sep = ""), paste(vpdir_sobol, "log06/", sep = ""),
                     paste(vpdir_sobol, "log07/", sep = ""), paste(vpdir_sobol, "log08/", sep = ""),
                     paste(vpdir_sobol, "log09/", sep = ""), paste(vpdir_sobol, "log10/", sep = ""),
                     paste(vpdir_sobol, "log11/", sep = ""), paste(vpdir_sobol, "log12/", sep = ""),
                     paste(vpdir_sobol, "log13/", sep = ""), paste(vpdir_sobol, "log14/", sep = ""),
                     paste(vpdir_sobol, "log15/", sep = ""), paste(vpdir_sobol, "log16/", sep = ""),
                     paste(vpdir_sobol, "log17/", sep = ""), paste(vpdir_sobol, "log18/", sep = ""),
                     paste(vpdir_sobol, "log19/", sep = ""), paste(vpdir_sobol, "log20/", sep = ""),
                     paste(vpdir_sobol, "log21/", sep = ""), paste(vpdir_sobol, "log22/", sep = ""),
                     paste(vpdir_sobol, "log23/", sep = ""), paste(vpdir_sobol, "log24/", sep = ""),
                     paste(vpdir_sobol, "log25/", sep = ""), paste(vpdir_sobol, "log26/", sep = ""),
                     paste(vpdir_sobol, "log27/", sep = ""), paste(vpdir_sobol, "log28/", sep = ""),
                     paste(vpdir_sobol, "log29/", sep = ""), paste(vpdir_sobol, "log30/", sep = ""),
                     paste(vpdir_sobol, "log31/", sep = ""), paste(vpdir_sobol, "log32/", sep = ""))

#run simulations###########
for (i in 1:32){
  for (ite in 1:Nsims){
    input_file <- paste("input", ite, ".txt", sep="")
    output_file <-  paste("output", ite, ".txt", sep="")
    log_file <- paste("log", ite, ".txt", sep="")
    sobol_command<- paste(vpdir_exe, "VarroaPop_3_2_6_2.exe ", vpdir_exe, vrp_filename, " /b /or ", 
                          vpdir_sobol_output[i], output_file, " /i ", vpdir_sobol_input[i], input_file,
                          " /ol ", vpdir_sobol_log[i], log_file, sep="")
    print(sobol_command)
    system(sobol_command)
  }
}
