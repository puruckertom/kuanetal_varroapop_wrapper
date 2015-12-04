#load output files
load(paste(vpdir_output,"tdarray.RData", sep =""))
dim(tdarray)
tdarray2<- tdarray[,2:27,]
load(paste(vpdir_output,"timearray.RData", sep = ""))
nrows<- length(timearray)
#rownames(tdarray)
#days, outputs, simulations

#read input files
indata <- read.csv(file = paste(vpdir_output, "inputdata.csv", sep = ""), header = TRUE)
#cut out column "X"
inputdata<- indata[,2:17]

#extract input vectors from dataframe
for(i in 1:16){assign(names(inputdata)[i], inputdata[[i]])}

#convert dataframe to list
linputdata <- as.list(inputdata)
#withdraw miteimmtype from list
listinput<- as.list(linputdata[c(1:5,7:16)]) 
outvar<- c("Colony Size","Adult Workers", "Foragers", "Worker Eggs", "Colony Pollen (g)", "Colony Nectar")
