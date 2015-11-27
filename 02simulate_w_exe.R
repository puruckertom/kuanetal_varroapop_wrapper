#run simulations###########
#command to run simulations in varroapop with relative directory structure and write output files

# inputtest<- c(8, 54, 62, 65, 69, 70, 73, 94, 134, 137, 155, 164, 179, 195, 197, 198, 
#              203, 214, 216, 233, 246, 260, 263, 274, 277, 288, 292, 314, 324, 328, 340,
#              344, 369, 372, 383, 388, 391, 400, 409, 419, 437, 452, 460, 463, 464, 480,
#              484, 491, 505, 522, 557, 579, 586, 600, 604, 605, 613, 618, 624, 638, 646,
#              657, 679, 702, 713, 727, 737, 743, 749, 750, 768, 771, 777, 782, 786, 796,
#              798, 799, 805, 807, 848, 855, 857, 871, 875, 877, 888, 889, 909, 928, 943,
#              949, 954, 962, 996)

#the .vrp file has to know where the weather file is, R cannot tell it!
for (i in 1:Nsims) {
  # n<-inputtest[i]
  inputfile<- paste("input",i,".txt", sep="")
  outputfile<- paste("results",i,".txt", sep="")
  logfile<- paste("log",i,".txt", sep="")
  vpdir_command <- paste(vpdir_exe, "VarroaPop.exe ", vpdir_exe, "comparison.vrp", 
                         " /b /or ", vpdir_output, outputfile, 
                         " /i ", vpdir_input, inputfile, " /ol ", vpdir_output, logfile, sep="")
  print(vpdir_command)
  system(vpdir_command)
}

