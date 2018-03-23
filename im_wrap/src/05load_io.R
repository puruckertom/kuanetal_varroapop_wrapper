#load output files
#CONTROL
load(paste(vpdir_out_control,"tdarray_control.RData", sep = ""))
dim(tdarray_control)
#level1
load(paste(vpdir_out_level1,"tdarray_level1.RData", sep = ""))
dim(tdarray_level1)
#level2
load(paste(vpdir_out_level2,"tdarray_level2.RData", sep = ""))
dim(tdarray_level2)
#level3
load(paste(vpdir_out_level3,"tdarray_level3.RData", sep = ""))
dim(tdarray_level3)
#level4
load(paste(vpdir_out_level4,"tdarray_level4.RData", sep = ""))
dim(tdarray_level4)
#TIME
load(paste(vpdir_output,"timearray.RData", sep = ""))
nrows<- length(timearray)
#rownames(tdarray)
#days, outputs, simulations


#read input files
#CONTROL
indata_control <- read.csv(file = paste(vpdir_in_control, "inputdata_control.csv", sep = ""), header = TRUE)
#cut out column "X"
del_col <- which(colnames(indata_control)=="X")
inputdata_control<- indata_control[,-del_col]
#level1
indata_level1 <- read.csv(file = paste(vpdir_in_level1, "inputdata_level1.csv", sep = ""), header = TRUE)
inputdata_level1<- indata_level1%>%select_if(is.numeric)%>%select(-1)
indata_level2 <- read.csv(file = paste(vpdir_in_level2, "inputdata_level2.csv", sep = ""), header = TRUE)
inputdata_level2<- indata_level2%>%select_if(is.numeric)%>%select(-1)
indata_level3 <- read.csv(file = paste(vpdir_in_level3, "inputdata_level3.csv", sep = ""), header = TRUE)
inputdata_level3<- indata_level3%>%select_if(is.numeric)%>%select(-1)
indata_level4 <- read.csv(file = paste(vpdir_in_level4, "inputdata_level4.csv", sep = ""), header = TRUE)
inputdata_level4<- indata_level4%>%select_if(is.numeric)%>%select(-1)
#extract input vectors from dataframe
for(i in 1:length(inputdata_control)){assign(names(inputdata_control)[i], inputdata_control[[i]])}
for(i in 1:length(inputdata_level1)){assign(names(inputdata_level1)[i], inputdata_level1[[i]])}
for(i in 1:length(inputdata_level2)){assign(names(inputdata_level2)[i], inputdata_level2[[i]])}
for(i in 1:length(inputdata_level3)){assign(names(inputdata_level3)[i], inputdata_level3[[i]])}
for(i in 1:length(inputdata_level4)){assign(names(inputdata_level4)[i], inputdata_level4[[i]])}

#convert dataframe to list
#linputdata <- as.list(inputdata)
#withdraw miteimmtype from list
#listinput<- as.list(linputdata[c(1:5,7:16)]) 



