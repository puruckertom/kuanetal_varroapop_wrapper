#run 00 and 05

library(zoo)
library(caTools)
library(reshape2)
library(ggplot2)

## plot pollen time series with percentiles 25,50,75

#plot of pollen and nectar concentrations over time
#19 pollen conc
#21 nectar conc
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
#pollen gits hit by neonics on day 611. sometimes later?..
plot(611:1096,tdarray_foliar[611:1096,19,7])

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

#runquantile
vector_length <- 1096
pollen_05 <- vector(mode = "numeric", length = vector_length)
pollen_25 <- vector(mode = "numeric", length = vector_length)
pollen_50 <- vector(mode = "numeric", length = vector_length)
pollen_75 <- vector(mode = "numeric", length = vector_length)
pollen_95 <- vector(mode = "numeric", length = vector_length)

dim(tdarray_foliar)
date2 <- seq(as.Date("1988/1/1"), as.Date("1990/12/31"), "days")
for(i in 1:1096){
  pollen_05[i] <- quantile(tdarray_foliar[i,19,1:1000],probs=0.05)
  pollen_25[i] <- quantile(tdarray_foliar[i,19,1:1000],probs=0.25)
  pollen_50[i] <- quantile(tdarray_foliar[i,19,1:1000],probs=0.5)
  pollen_75[i] <- quantile(tdarray_foliar[i,19,1:1000],probs=0.75)
  pollen_95[i] <- quantile(tdarray_foliar[i,19,1:1000],probs=0.95)
}

low_bound <- 611
up_bound <- 1096
pollen_percentiles <- as.data.frame(cbind(date2[low_bound:up_bound], 
                                          pollen_05[low_bound:up_bound],
                                          pollen_25[low_bound:up_bound],
                                          pollen_50[low_bound:up_bound],
                                          pollen_75[low_bound:up_bound],
                                          pollen_95[low_bound:up_bound]))
colnames(pollen_percentiles) <- c("Date","5%","25%","50%","75%","95%")
melted_pollen = melt(pollen_percentiles, id.vars="Date")
colnames(melted_pollen)
levels(melted_pollen$variables)
melted_pollen$variable <- factor(melted_pollen$variable, 
                               levels = c("95%","75%","50%","25%","5%"),
                               labels=c("95%","75%","50%","25","5%"))
dim(melted_pollen)
colnames(melted_pollen)
#View(melted_pollen)

pollen_plot <- ggplot(melted_pollen, aes(x=Date, y=value, group=variable)) +
  theme_bw() +
  #scale_x_discrete(breaks = c(1:10000)) +
  #scale_x_discrete(breaks = c(7184,7364,7608), labels = c("9/2/1989","3/1/1990","10/31/1990")) +
  geom_line(aes(x=Date,y=value,colour=melted_pollen$variable)) +
  guides(fill=FALSE) +
  theme_bw() +
  #scale_x_discrete(labels = c("3/1/1988","3/1/1989","9/1/1989","3/1/1990","10/31/1990")) +
  scale_colour_manual(values = c("firebrick3","red", "black","steelblue","darkblue")) +
  #theme(legend.position=c(611, 8)) +
  #theme(legend.title="Scenario") +
  guides(col = guide_legend(title="Percentile")) +
  #c(611,791,1035) -> c(7184,7364,7608)
  xlab("Simulation Day") + 
  #scale_x_discrete(breaks = c(melted_pollen$Date[1],melted_pollen$Date[10],melted_pollen$Date[100])) +
  ylab("Pollen Concentration (ug/g)")
pollen_plot

pdf(file= paste(vpdir_fig, "pollen_ts_plot.pdf", sep=""), width = 6, height = 4)
  pollen_plot
dev.off()

png(file= paste(vpdir_fig, "pollen_plot_ts.png", sep=""), width = 6, height = 4, units='in', pointsize=12, res=300)
  pollen_plot
dev.off()
