#run simulations###########
#command to run simulations in varroapop with relative directory structure and write output files

# inputtest<- c(8, 54, 62, 65, 69, 70, 73, 94, 134, 137, 155, 164, 179, 195, 197, 198, 
#              203, 214, 216, 233, 246, 260, 263, 274, 277, 288, 292, 314, 324, 328, 340,
#              344, 369, 372, 383, 388, 391, 400, 409, 419, 437, 452, 460, 463, 464, 480,
#              484, 491, 505, 522, 557, 579, 586, 600, 604, 605, 613, 618, 624, 638, 646,
#              657, 679, 702, 713, 727, 737, 743, 749, 750, 768, 771, 777, 782, 786, 796,
#              798, 799, 805, 807, 848, 855, 857, 871, 875, 877, 888, 889, 909, 928, 943,
#              949, 954, 962, 996)


#document the system status
#exe
print(paste(file.exists(vpdir_executable), ": executable file at", vpdir_executable))
#sample input
sample_input_file <- paste(vpdir_in_con, "input1000.txt", sep="")
print(paste(file.exists(sample_input_file), ": sample input file at", sample_input_file))
#varroapop file
varroapop_file <- paste(vpdir_exe, vrp_filename, sep="")
print(paste(file.exists(varroapop_file), ": varroapop inputs file at", varroapop_file))
#weather file
weather_input <- paste(vpdir_exe, vrp_weather, sep="")
print(paste(file.exists(weather_input), ": weather file at", weather_input))
#varroapop <-> weather file message
print("the .vrp file has to know where the weather file is, R cannot tell it!")

#on epa windows symantec is returnign a security threat every ~45 simulations
#CONTROL
for (i in 1:Nsims) {
  # n<-inputtest[i]
  inputfile<- paste("input",i,".txt", sep="")
  outputfile<- paste("results",i,".txt", sep="")
  logfile<- paste("log",i,".txt", sep="")
  vpdir_command <- paste(vpdir_exe, vrp_filename, 
                         " /b /or ", vpdir_out_con, outputfile, 
                         " /i ", vpdir_in_con, inputfile, " /ol ", vpdir_log, logfile, sep="")
  print(paste(vpdir_executable, vpdir_command, sep=" "))
  system2(vpdir_executable, vpdir_command)
}

#EXPOSED
for (i in 1:Nsims) {
  # n<-inputtest[i]
  inputfile<- paste("input",i,".txt", sep="")
  outputfile<- paste("results",i,".txt", sep="")
  logfile<- paste("log",i,"exp.txt", sep="")
  vpdir_command <- paste(vpdir_exe, vrp_filename, 
                         " /b /or ", vpdir_out_exp, outputfile, 
                         " /i ", vpdir_in_exp, inputfile, " /ol ", vpdir_log, logfile, sep="")
  print(paste(vpdir_executable, vpdir_command, sep=" "))
  system2(vpdir_executable, vpdir_command)
}
