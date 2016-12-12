#run 00 and 05

library(zoo)
library(caTools)
library(reshape2)
library(ggplot2)

## plot pollen time series with percentiles 25,50,75

#plot of pollen and nectar concentrations over time
#33 pollen conc
#34 nectar conc
#melt


foliar_pollen_concs <- tdarray_foliar[791,19,]
foliar_pollen_concs
foliar_nectar_concs <- tdarray_foliar[791,21,]
foliar_nectar_concs

seed_pollen_concs <- tdarray_seed[791,19,]
seed_pollen_concs
seed_nectar_concs <- tdarray_seed[791,21,]
seed_nectar_concs

soil_pollen_concs <- tdarray_soil[791,19,]
soil_pollen_concs
soil_nectar_concs <- tdarray_soil[791,21,]
soil_nectar_concs

#(ug/g)
hist(foliar_pollen_concs)
max(foliar_pollen_concs)

hist(seed_pollen_concs)
max(seed_pollen_concs)

hist(soil_pollen_concs)
max(soil_pollen_concs)
length(soil_pollen_concs)

#log figure
par(mfrow=c(1,1))
plot(1:1000,log(soil_pollen_concs))
plot(1:1000,log(foliar_pollen_concs))

## determinants of foliar pollen concentration
#pollen gits hit by neonics on day 648 
plot(548:1096,tdarray_foliar[548:1096,19,7])

#View(tdarray_foliar[791,19,])
avh <- tdarray_foliar[821,19,]
dim(tdarray_foliar)
plot(600:650,tdarray_foliar[600:650,19,3])

#wtf
pcc(inputdata_foliar,avh)

colnames(inputdata_foliar)
p.avh <- ggplot(inputdata_foliar, aes(apprate, halflife))
p.avh

#day 791 is sep 30, 1989
#p.avh <- p.avh + geom_point(aes(colour=tdarray_foliar[791,19,])) + 
p.avh <- p.avh + geom_point(aes(colour=avh,size=avh)) +
  scale_colour_gradientn(colours = rainbow(10),guide = guide_legend(title = "Pollen Concentration")) + 
  theme_bw() +
  labs(x = "Application Rate", y="Half-life")
p.avh

####runquantile for foliar
vector_length <- 1096
foliar_pollen_05 <- vector(mode = "numeric", length = vector_length)
foliar_pollen_25 <- vector(mode = "numeric", length = vector_length)
foliar_pollen_50 <- vector(mode = "numeric", length = vector_length)
foliar_pollen_75 <- vector(mode = "numeric", length = vector_length)
foliar_pollen_95 <- vector(mode = "numeric", length = vector_length)

dim(tdarray_foliar)
date2 <- seq(as.Date("1988/1/1"), as.Date("1990/12/31"), "days")
for(i in 1:1096){
  foliar_pollen_05[i] <- quantile(tdarray_foliar[i,19,1:1000],probs=0.05)
  foliar_pollen_25[i] <- quantile(tdarray_foliar[i,19,1:1000],probs=0.25)
  foliar_pollen_50[i] <- quantile(tdarray_foliar[i,19,1:1000],probs=0.5)
  foliar_pollen_75[i] <- quantile(tdarray_foliar[i,19,1:1000],probs=0.75)
  foliar_pollen_95[i] <- quantile(tdarray_foliar[i,19,1:1000],probs=0.95)
}

low_bound <- 611
up_bound <- 641
foliar_pollen_percentiles <- as.data.frame(cbind(date2[low_bound:up_bound], 
                                          foliar_pollen_05[low_bound:up_bound],
                                          foliar_pollen_25[low_bound:up_bound],
                                          foliar_pollen_50[low_bound:up_bound],
                                          foliar_pollen_75[low_bound:up_bound],
                                          foliar_pollen_95[low_bound:up_bound]))
colnames(foliar_pollen_percentiles) <- c("Date","5%","25%","50%","75%","95%")
melted_foliar_pollen = melt(foliar_pollen_percentiles, id.vars="Date")
colnames(melted_foliar_pollen)
levels(melted_foliar_pollen$variables)
melted_foliar_pollen$variable <- factor(melted_foliar_pollen$variable, 
                               levels = c("95%","75%","50%","25%","5%"),
                               labels=c("95%","75%","50%","25","5%"))
dim(melted_foliar_pollen)
colnames(melted_foliar_pollen)
#View(melted_foliar_pollen)

foliar_pollen_plot <- ggplot(melted_foliar_pollen, aes(x=Date, y=value, group=variable)) +
  theme_bw() +
  #scale_x_discrete(breaks = c(1:10000)) +
  #scale_x_discrete(breaks = c(7184,7364,7608), labels = c("9/2/1989","3/1/1990","10/31/1990")) +
  geom_line(aes(x=Date,y=value,colour=melted_foliar_pollen$variable)) +
  guides(fill=FALSE) +
  theme_bw() +
  #scale_x_discrete(labels = c("3/1/1988","3/1/1989","9/1/1989","3/1/1990","10/31/1990")) +
  scale_colour_manual(values = c("firebrick3","red", "black","steelblue","darkblue")) +
  #theme(legend.position=c(611, 8)) +
  #theme(legend.title="Scenario") +
  guides(col = guide_legend(title="Percentile")) +
  annotate("text", x = 7210, y = 8, label = "Foliar", size=6) +
  #c(611,791,1035) -> c(7184,7364,7608)
  xlab("July Simulation Days") + 
  #scale_x_discrete(breaks = c(melted_foliar_pollen$Date[1],melted_foliar_pollen$Date[10],melted_foliar_pollen$Date[100])) +
  ylab("Pollen Concentration (ug/g)")
foliar_pollen_plot

pdf(file= paste(vpdir_fig, "foliar_pollen_ts_plot.pdf", sep=""), width = 6, height = 4)
  foliar_pollen_plot
dev.off()

png(file= paste(vpdir_fig, "foliar_pollen_ts_plot.png", sep=""), width = 6, height = 4, units='in', pointsize=12, res=300)
  foliar_pollen_plot
dev.off()

####runquantile for seed
vector_length <- 1096
seed_pollen_05 <- vector(mode = "numeric", length = vector_length)
seed_pollen_25 <- vector(mode = "numeric", length = vector_length)
seed_pollen_50 <- vector(mode = "numeric", length = vector_length)
seed_pollen_75 <- vector(mode = "numeric", length = vector_length)
seed_pollen_95 <- vector(mode = "numeric", length = vector_length)

dim(tdarray_seed)
date2 <- seq(as.Date("1988/1/1"), as.Date("1990/12/31"), "days")
for(i in 1:1096){
  seed_pollen_05[i] <- quantile(tdarray_seed[i,19,1:1000],probs=0.05)
  seed_pollen_25[i] <- quantile(tdarray_seed[i,19,1:1000],probs=0.25)
  seed_pollen_50[i] <- quantile(tdarray_seed[i,19,1:1000],probs=0.5)
  seed_pollen_75[i] <- quantile(tdarray_seed[i,19,1:1000],probs=0.75)
  seed_pollen_95[i] <- quantile(tdarray_seed[i,19,1:1000],probs=0.95)
}

low_bound <- 611
up_bound <- 641
seed_pollen_percentiles <- as.data.frame(cbind(date2[low_bound:up_bound], 
                                          seed_pollen_05[low_bound:up_bound],
                                          seed_pollen_25[low_bound:up_bound],
                                          seed_pollen_50[low_bound:up_bound],
                                          seed_pollen_75[low_bound:up_bound],
                                          seed_pollen_95[low_bound:up_bound]))
colnames(seed_pollen_percentiles) <- c("Date","5%","25%","50%","75%","95%")
melted_seed_pollen = melt(seed_pollen_percentiles, id.vars="Date")
colnames(melted_seed_pollen)
levels(melted_seed_pollen$variables)
melted_seed_pollen$variable <- factor(melted_seed_pollen$variable, 
                                 levels = c("95%","75%","50%","25%","5%"),
                                 labels=c("95%","75%","50%","25","5%"))
dim(melted_seed_pollen)
colnames(melted_seed_pollen)
#View(melted_seed_pollen)

seed_pollen_plot <- ggplot(melted_seed_pollen, aes(x=Date, y=value, group=variable)) +
  theme_bw() +
  #scale_x_discrete(breaks = c(1:10000)) +
  #scale_x_discrete(breaks = c(7184,7364,7608), labels = c("9/2/1989","3/1/1990","10/31/1990")) +
  geom_line(aes(x=Date,y=value,colour=melted_seed_pollen$variable)) +
  guides(fill=FALSE) +
  theme_bw() +
  #scale_x_discrete(labels = c("3/1/1988","3/1/1989","9/1/1989","3/1/1990","10/31/1990")) +
  scale_colour_manual(values = c("firebrick3","red", "black","steelblue","darkblue")) +
  #theme(legend.position=c(611, 8)) +
  #theme(legend.title="Scenario") +
  guides(col = guide_legend(title="Percentile")) +
  annotate("text", x = 7210, y = 8, label = "Seed", size=6) +
  #c(611,791,1035) -> c(7184,7364,7608)
  xlab("July Simulation Days") + 
  #scale_x_discrete(breaks = c(melted_seed_pollen$Date[1],melted_seed_pollen$Date[10],melted_seed_pollen$Date[100])) +
  ylab("Pollen Concentration (ug/g)")
seed_pollen_plot

pdf(file= paste(vpdir_fig, "seed_pollen_ts_plot.pdf", sep=""), width = 6, height = 4)
seed_pollen_plot
dev.off()

png(file= paste(vpdir_fig, "seed_pollen_ts_plot.png", sep=""), width = 6, height = 4, units='in', pointsize=12, res=300)
seed_pollen_plot
dev.off()

####runquantile for soil
vector_length <- 1096
soil_pollen_05 <- vector(mode = "numeric", length = vector_length)
soil_pollen_25 <- vector(mode = "numeric", length = vector_length)
soil_pollen_50 <- vector(mode = "numeric", length = vector_length)
soil_pollen_75 <- vector(mode = "numeric", length = vector_length)
soil_pollen_95 <- vector(mode = "numeric", length = vector_length)

dim(tdarray_soil)
date2 <- seq(as.Date("1988/1/1"), as.Date("1990/12/31"), "days")
for(i in 1:1096){
  soil_pollen_05[i] <- quantile(tdarray_soil[i,19,1:1000],probs=0.05)
  soil_pollen_25[i] <- quantile(tdarray_soil[i,19,1:1000],probs=0.25)
  soil_pollen_50[i] <- quantile(tdarray_soil[i,19,1:1000],probs=0.5)
  soil_pollen_75[i] <- quantile(tdarray_soil[i,19,1:1000],probs=0.75)
  soil_pollen_95[i] <- quantile(tdarray_soil[i,19,1:1000],probs=0.95)
}

low_bound <- 611
up_bound <- 641
soil_pollen_percentiles <- as.data.frame(cbind(date2[low_bound:up_bound], 
                                          soil_pollen_05[low_bound:up_bound],
                                          soil_pollen_25[low_bound:up_bound],
                                          soil_pollen_50[low_bound:up_bound],
                                          soil_pollen_75[low_bound:up_bound],
                                          soil_pollen_95[low_bound:up_bound]))
colnames(soil_pollen_percentiles) <- c("Date","5%","25%","50%","75%","95%")
melted_soil_pollen = melt(soil_pollen_percentiles, id.vars="Date")
colnames(melted_soil_pollen)
levels(melted_soil_pollen$variables)
melted_soil_pollen$variable <- factor(melted_soil_pollen$variable, 
                                 levels = c("95%","75%","50%","25%","5%"),
                                 labels=c("95%","75%","50%","25","5%"))
dim(melted_soil_pollen)
colnames(melted_soil_pollen)
#View(melted_soil_pollen)

soil_pollen_plot <- ggplot(melted_soil_pollen, aes(x=Date, y=value, group=variable)) +
  theme_bw() +
  #scale_x_discrete(breaks = c(1:10000)) +
  #scale_x_discrete(breaks = c(7184,7364,7608), labels = c("9/2/1989","3/1/1990","10/31/1990")) +
  geom_line(aes(x=Date,y=value,colour=melted_soil_pollen$variable)) +
  guides(fill=FALSE) +
  theme_bw() +
  #scale_x_discrete(labels = c("3/1/1988","3/1/1989","9/1/1989","3/1/1990","10/31/1990")) +
  scale_colour_manual(values = c("firebrick3","red", "black","steelblue","darkblue")) +
  #theme(legend.position=c(611, 8)) +
  #theme(legend.title="Scenario") +
  guides(col = guide_legend(title="Percentile")) +
  annotate("text", x = 7210, y = 8, label = "Soil", size=6) +
  #c(611,791,1035) -> c(7184,7364,7608)
  xlab("July Simulation Days") + 
  #scale_x_discrete(breaks = c(melted_soil_pollen$Date[1],melted_soil_pollen$Date[10],melted_soil_pollen$Date[100])) +
  ylab("Pollen Concentration (ug/g)")
soil_pollen_plot

pdf(file= paste(vpdir_fig, "soil_pollen_ts_plot.pdf", sep=""), width = 6, height = 4)
soil_pollen_plot
dev.off()

png(file= paste(vpdir_fig, "soil_pollen_ts_plot.png", sep=""), width = 6, height = 4, units='in', pointsize=12, res=300)
soil_pollen_plot
dev.off()

#multiplot

png(file= paste(vpdir_fig, "combined_pollen_ts_plot.png", sep=""), width = 7, height = 10, units='in', pointsize=12, res=300)
multiplot(foliar_pollen_plot,soil_pollen_plot,seed_pollen_plot, cols=1)
dev.off()
