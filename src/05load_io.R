#load output files
#CONTROL
load(paste(vpdir_out_control,"tdarray_control.RData", sep = ""))
dim(tdarray_control)
#do we need names here?
names(tdarray_control)

#FOLIAR
load(paste(vpdir_out_foliar,"tdarray_foliar.RData", sep = ""))
dim(tdarray_foliar)
#SEED
load(paste(vpdir_out_seed,"tdarray_seed.RData", sep = ""))
dim(tdarray_seed)
#SOIL
load(paste(vpdir_out_soil,"tdarray_soil.RData", sep = ""))
dim(tdarray_soil)
#TIME
load(paste(vpdir_output,"timearray.RData", sep = ""))
nrows<- length(timearray)
#rownames(tdarray)
#days, outputs, simulations

#read input files
#CONTROL
indata_control <- read.csv(file = paste(vpdir_out_control, "inputdata_control.csv", sep = ""), header = TRUE)
#cut out column "X"
inputdata_control<- indata_control[, c(5:9,11,13:21,23:38,42:44)]
#FOLIAR
indata_foliar <- read.csv(file = paste(vpdir_out_foliar, "inputdata_foliar.csv", sep = ""), header = TRUE)
inputdata_foliar<- indata_foliar[, c(5:9,11,13:22,24:39,44:46)]
indata_seed <- read.csv(file = paste(vpdir_out_seed, "inputdata_seed.csv", sep = ""), header = TRUE)
inputdata_seed<- indata_seed[, c(5:9,11,13:22,24:39,44:46)]
indata_soil <- read.csv(file = paste(vpdir_out_soil, "inputdata_soil.csv", sep = ""), header = TRUE)
inputdata_soil<- indata_soil[, c(5:9,11,13:22,24:39,44:46)]

#extract input vectors from dataframe
for(i in 1:length(inputdata_control)){assign(names(inputdata_control)[i], inputdata_control[[i]])}
for(i in 1:length(inputdata_foliar)){assign(names(inputdata_foliar)[i], inputdata_foliar[[i]])}
for(i in 1:length(inputdata_seed)){assign(names(inputdata_seed)[i], inputdata_seed[[i]])}
for(i in 1:length(inputdata_soil)){assign(names(inputdata_soil)[i], inputdata_soil[[i]])}

#convert dataframe to list
#linputdata <- as.list(inputdata)
#withdraw miteimmtype from list
#listinput<- as.list(linputdata[c(1:5,7:16)]) 
outvar<- c("Colony Size","Adult Workers", "Foragers", "Worker Eggs", "Colony Pollen (g)")
