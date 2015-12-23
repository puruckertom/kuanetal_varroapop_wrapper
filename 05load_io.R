#load output files
#CONTROL
load(paste(vpdir_out_con,"tdarray_con.RData", sep = ""))
dim(tdarray_con)
#EXPOSED
load(paste(vpdir_out_exp,"tdarray_exp.RData", sep = ""))
dim(tdarray_exp)
#TIME
load(paste(vpdir_output,"timearray.RData", sep = ""))
nrows<- length(timearray)
#rownames(tdarray)
#days, outputs, simulations

#read input files
#CONTROL
indata_con <- read.csv(file = paste(vpdir_out_con, "inputdata_con.csv", sep = ""), header = TRUE)
#cut out column "X"
inputdata_con<- indata_con[,2:length(indata_con)]
#EXPOSED
indata_exp <- read.csv(file = paste(vpdir_out_exp, "inputdata_exp.csv", sep = ""), header = TRUE)
inputdata_exp<- indata_exp[,2:length(indata_exp)]

#extract input vectors from dataframe
for(i in 1:length(inputdata_con)){assign(names(inputdata_con)[i], inputdata_con[[i]])}
for(i in 1:length(inputdata_exp)){assign(names(inputdata_exp)[i], inputdata_exp[[i]])}


#convert dataframe to list
#linputdata <- as.list(inputdata)
#withdraw miteimmtype from list
#listinput<- as.list(linputdata[c(1:5,7:16)]) 
outvar<- c("Colony Size","Adult Workers", "Foragers", "Worker Eggs", "Colony Pollen (g)", "Colony Nectar")
