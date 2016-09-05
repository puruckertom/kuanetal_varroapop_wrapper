########### control daily sensitivity plot
# Multiple plot function
#
# ggplot objects can be passed in ..., or to plotlist (as a list of ggplot objects)
# - cols:   Number of columns in layout
# - layout: A matrix specifying the layout. If present, 'cols' is ignored.
#
# If the layout is something like matrix(c(1,2,3,3), nrow=2, byrow=TRUE),
# then plot 1 will go in the upper left, 2 will go in the upper right, and
# 3 will go all the way across the bottom.
#
multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  library(grid)
  
  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)
  
  numPlots = length(plots)
  
  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }
  
  if (numPlots==1) {
    print(plots[[1]])
    
  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
    
    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}


ndays <- length(timearray)

#load control pcc results
load(paste(vpdir_out_control,"tdarray_pccout_control.RData", sep = ""))
dim(tdarray_pccout_control)

dim(tdarray_pccout_control)
colnames(tdarray_pccout_control) <- colnames(inputdata_control)
colnames(tdarray_pccout_control)
date <- 61:ndays
date2 <- seq(as.Date("1988/1/1"), as.Date("1991/1/1"), "days")
date3 <- date2[61:ndays]

#qs = melted_control$value[which(melted_control$variable=="queenstrength")]
#plot control daily sensitivities
pcc_control <- as.data.frame(cbind(date, tdarray_pccout_control[61:ndays,]))
colnames(pcc_control)
melted_control = melt(pcc_control, id.vars="date")

daily_sensitivity_control <-  ggplot(melted_control, aes(x=date, y=value, group=variable)) +
    geom_line(aes(colour=melted_control$variable)) +
    scale_colour_manual(values = c(
      "firebrick3",  "steelblue", "steelblue",   "steelblue",    "blue",     "firebrick",  "steelblue", "steelblue",
      #queenstrength wkrdrnratio  drnmitesurvive  wkrmitesurvive fgrlifespan RQQueenStrength adslope     adLD50
      
      "palegreen4", "darkgreen", "steelblue", "steelblue","steelblue", "steelblue",  "darkorange","steelblue",
      #adslopec  adLD50c       lslope      lLD50       kow         koc        halflife       cl4pollen
      
      "steelblue","goldenrod","deeppink4", "goldenrod3","steelblue","steelblue", "steelblue", "gold4",
      #cl4nectar  cl5pollen   cl5nectar   cldpollen     cldnectar   ca13pollen    ca13nectar     ca410pollen
      
      "steelblue",     "steelblue", "steelblue", "gold",     "steelblue", "gold3",     "deeppink", "steelblue",
      #ca410nectar    ca1120pollen    ca1120nectar          ptrips          ntrips           pload           nload  soilp
      
      "black",  "steelblue")) +
      #soilfoc        seedconc
    guides(fill=FALSE) +  
    xlab("Simulation Day") + 
    ylab("Partial Correlation Coefficient") +
    #ggtitle("Daily Sensitivity (PCC) for Control Scenario") +
    annotate("text", x = 1000, y = 0.92, label = "Control", size=6) +
    theme_bw() +
    scale_x_discrete(breaks = c(61,426,605,791,1035)) +
    theme(legend.position = "none",  axis.title.x=element_blank(), axis.text.x=element_blank())

pdf(file= paste(vpdir_fig, "daily_sensitivity_control.pdf", sep=""), width = 8, height = 6)
  daily_sensitivity_control
dev.off()

########### foliar daily sensitivity plot
#load foliar pcc results
load(paste(vpdir_out_foliar,"tdarray_pccout_foliar.RData", sep = ""))
dim(tdarray_pccout_foliar)

colnames(tdarray_pccout_foliar) <- colnames(inputdata_foliar)
colnames(tdarray_pccout_foliar)
date <- 61:ndays

#qs = melted_foliar$value[which(melted_foliar$variable=="queenstrength")]
#plot foliar daily sensitivities
pcc_foliar <- as.data.frame(cbind(date, tdarray_pccout_foliar[61:ndays,]))
colnames(pcc_foliar)
melted_foliar = melt(pcc_foliar, id.vars="date")

daily_sensitivity_foliar <- ggplot(melted_foliar, aes(x=date, y=value, group=variable)) +
    geom_line(aes(colour=melted_foliar$variable)) +
    scale_colour_manual(values = c(
      "firebrick3","steelblue", "steelblue","steelblue",       "blue",    "firebrick",  "steelblue","steelblue", 
      #queenstrength,wkrdrnratio,drnmitesurvive,wkrmitesurvive,fgrlifespan,RQQueenStrength,adslope,      adLD50
      # 0.587356118 -0.038034348 -0.057103768   -0.017899693  0.404958669   0.119566429     0.029776035  -0.028895013
      
      "palegreen4", "darkgreen", "steelblue", "steelblue","steelblue", "steelblue",  "darkorange", "blueviolet",
      # adslopec    adLD50c     lslope       lLD50       kow         koc         halflife     apprate 
      # 0.039323852 0.202252206 -0.010176605 0.027834761 0.001732525 0.005166421 -0.095259743 -0.388147178 
      
      "steelblue", "steelblue",   "goldenrod","deeppink4", "goldenrod3","steelblue","steelblue", "steelblue",
      # cl4pollen    cl4nectar    cl5pollen    cl5nectar       cldpollen       cldnectar      ca13pollen      ca13nectar 
      # -0.015331272 -0.019469068 0.062647516  0.056994488     0.060106641    -0.022921326     0.026135618    -0.011596841
      
      "gold4",   "steelblue",     "steelblue", "steelblue", "gold",     "steelblue", "gold3",     "deeppink", 
      # ca410pollen  ca410nectar  ca1120pollen ca1120nectar ptrips      ntrips       pload        nload 
      # 0.060323879  -0.009879763 -0.009316751 0.020296364  0.061448508 -0.006315187 -0.060226437 -0.112289169 
      
      "steelblue",   "black",  "steelblue")) +
      # soilp         soilfoc       seedconc 
      # -0.035085428  -0.029659169  0.009032147 
        guides(fill=FALSE) +  
    xlab("Simulation Day") + 
    ylab("Partial Correlation Coefficient") +
    #ggtitle("Daily Sensitivity (PCC) for Foliar Scenario") +
    annotate("text", x = 1000, y = 0.92, label = "Foliar", size=6) +
    theme_bw() +
    scale_x_discrete(breaks = c(61,426,605,791,1035)) +
    theme(legend.position = "none",  axis.title.x=element_blank(), axis.text.x=element_blank())

pdf(file= paste(vpdir_fig, "daily_sensitivity_foliar.pdf", sep=""), width = 8, height = 6)
  daily_sensitivity_foliar
dev.off()

########### soil daily sensitivity plot
#load soil pcc results
load(paste(vpdir_out_soil,"tdarray_pccout_soil.RData", sep = ""))
dim(tdarray_pccout_soil)

colnames(tdarray_pccout_soil) <- colnames(inputdata_soil)
colnames(tdarray_pccout_soil)
date <- 61:ndays

#qs = melted_soil$value[which(melted_soil$variable=="queenstrength")]
#plot soil daily sensitivities
pcc_soil <- as.data.frame(cbind(date, tdarray_pccout_soil[61:ndays,]))
colnames(pcc_soil)
melted_soil = melt(pcc_soil, id.vars="date")

daily_sensitivity_soil <- ggplot(melted_soil, aes(x=date, y=value, group=variable)) +
    geom_line(aes(colour=melted_soil$variable)) +
    scale_colour_manual(values = c(
      "firebrick3","steelblue", "steelblue",  "steelblue",  "blue",     "firebrick", "steelblue", "steelblue", 
      #queenstrength,wkrdrnratio,drnmitesurvive,wkrmitesurvive,fgrlifespan,RQQueenStrength,adslope,      adLD50
      # 0.464859410  -0.035015120 -0.015619560 -0.009523889 0.265147264 0.111696614   0.035542511   -0.053950074
      
      "palegreen4", "darkgreen", "steelblue", "steelblue","steelblue", "steelblue",  "darkorange", "blueviolet",
      # adslopec     adLD50c    lslope       lLD50        kow          koc          halflife      apprate 
      #-0.094180181 0.011171505 0.017747116  0.020590230  -0.024599057 -0.086616760 -0.009761324  0.003120960 
      
      "steelblue", "steelblue",   "goldenrod","deeppink4", "goldenrod3","steelblue","steelblue", "steelblue",
      # cl4pollen   cl4nectar    cl5pollen    cl5nectar    cldpollen   cldnectar   ca13pollen   ca13nectar 
      # 0.030652194 -0.008356582 0.044495384  -0.029336352 0.021575527 0.017664115 0.024856777 -0.006705257 
      
      "gold4",   "steelblue",     "steelblue", "steelblue", "gold",     "steelblue", "gold3",     "deeppink", 
      # ca410pollen  ca410nectar  ca1120pollen ca1120nectar ptrips       ntrips      pload        nload 
      # 0.117236572  -0.008777357 0.048595296  0.015513097  -0.141418576 0.013836205 -0.375044973 0.020742109 
      
      "steelblue",   "black",  "steelblue")) +
      # soilp         soilfoc       seedconc 
      # -0.012744520  -0.083988351    -0.013500727 
    guides(fill=FALSE) +  
    xlab("Simulation Day") + 
    ylab("Partial Correlation Coefficient") +
    #ggtitle("Daily Sensitivity (PCC) for Soil Scenario") +
    annotate("text", x = 1000, y = 0.92, label = "Soil", size=6) +
    theme_bw() +
    scale_x_discrete(breaks = c(61,426,605,791,1035)) +
    theme(legend.position = "none",  axis.title.x=element_blank(), axis.text.x=element_blank())
  
pdf(file= paste(vpdir_fig, "daily_sensitivity_soil.pdf", sep=""), width = 8, height = 6)
  daily_sensitivity_soil
dev.off()


########### seed daily sensitivity plot
#load seed pcc results
load(paste(vpdir_out_seed,"tdarray_pccout_seed.RData", sep = ""))
dim(tdarray_pccout_seed)

colnames(tdarray_pccout_seed) <- colnames(inputdata_seed)
colnames(tdarray_pccout_seed)
date <- 61:ndays

#qs = melted_seed$value[which(melted_seed$variable=="queenstrength")]
#plot seed daily sensitivities
pcc_seed <- as.data.frame(cbind(date, tdarray_pccout_seed[61:ndays,]))
colnames(pcc_seed)
melted_seed = melt(pcc_seed, id.vars="date")

daily_sensitivity_seed <- ggplot(melted_seed, aes(x=date, y=value, group=variable)) +
  geom_line(aes(colour=melted_seed$variable)) +
  scale_colour_manual(values = c(
    "firebrick3","steelblue", "steelblue",  "steelblue",  "blue",     "firebrick", "steelblue", "steelblue", 
    #queenstrength,wkrdrnratio,drnmitesurvive,wkrmitesurvive,fgrlifespan,RQQueenStrength,adslope,      adLD50
    # 0.464859410  -0.035015120 -0.015619560 -0.009523889 0.265147264 0.111696614   0.035542511   -0.053950074
    
    "palegreen4", "darkgreen", "steelblue", "steelblue","steelblue", "steelblue",  "darkorange", "blueviolet",
    # adslopec     adLD50c    lslope       lLD50        kow          koc          halflife      apprate 
    #-0.094180181 0.011171505 0.017747116  0.020590230  -0.024599057 -0.086616760 -0.009761324  0.003120960
    
    "steelblue", "steelblue",   "goldenrod","deeppink4", "goldenrod3","steelblue","steelblue", "steelblue",
    # cl4pollen   cl4nectar    cl5pollen    cl5nectar    cldpollen   cldnectar   ca13pollen   ca13nectar 
    # 0.030652194 -0.008356582 0.044495384  -0.029336352 0.021575527 0.017664115 0.024856777 -0.006705257 
    
    "gold4",   "steelblue",     "steelblue", "steelblue", "gold",     "steelblue", "gold3",     "deeppink", 
    # ca410pollen  ca410nectar  ca1120pollen ca1120nectar ptrips       ntrips      pload        nload 
    # 0.117236572  -0.008777357 0.048595296  0.015513097  -0.141418576 0.013836205 -0.375044973 0.020742109 
    
    "steelblue",   "black",  "steelblue")) +
  # soilp         soilfoc       soilconc 
  # -0.012744520  -0.083988351    -0.013500727 
  guides(fill=FALSE) +  
  xlab("Simulation Day") + 
  ylab("Partial Correlation Coefficient") +
  #ggtitle("Daily Sensitivity (PCC) for Seed Scenario") +
  annotate("text", x = 1000, y = 0.92, label = "Seed", size=6) +
  theme_bw() +
  #august 9 is day 221, +366 (leap year) = 587
  scale_x_discrete(breaks = c(61,426,605,791,1035), labels = c("3/1/1988","3/1/1989","8/27/1989","3/1/1990","10/31/1990")) +
  theme(legend.position = "none")

pdf(file= paste(vpdir_fig, "daily_sensitivity_seed.pdf", sep=""), width = 8, height = 6)
  daily_sensitivity_seed
dev.off()

######plot all 4 together
pdf(file= paste(vpdir_fig, "daily_sensitivity_combined.pdf", sep=""), width = 7, height = 10)
  multiplot(daily_sensitivity_control, daily_sensitivity_foliar, daily_sensitivity_soil, daily_sensitivity_seed, cols=1)
dev.off()

png(file= paste(vpdir_fig, "daily_sensitivity_combined.png", sep=""), width = 7, height = 10, units='in', pointsize=12, res=300)
  multiplot(daily_sensitivity_control, daily_sensitivity_foliar, daily_sensitivity_soil, daily_sensitivity_seed, cols=1)
dev.off()

#create custom legend
# dummy data
set.seed(45)
sens_colors <- c("firebrick3",  "blue",     "firebrick", 
                 "palegreen4", "darkgreen", "darkorange", "blueviolet",
                 "goldenrod","deeppink4", "goldenrod3",
                 "gold4", "gold", "gold3", "deeppink",   
                 "black",  "steelblue")
sens_vars_levels <- c("queenstrength","fgrlifespan", "RQQueenStrength",
                      "adslopec", "adLD50c", "halflife", "apprate",
                      "cl5pollen", "cl5nectar", "cldpollen", 
                      "ca410pollen", "ptrips", "pload", "nload",
                      "soilfoc", "others")
sens_vars_labels <- c("Queen Strength","Forager Lifespan", "ReQueen Strength",
               "adslopec", "adLD50c", "Half-life", "Application rate",
               "cl5pollen", "cl5nectar", "cldpollen", 
               "ca410pollen", "Pollen trips", "Pollen load", "Nectar load",
               "Soil foc", "All others")
sens_colors_list <- rep(sens_colors, each=5)
order_list <- rep(1:16,each=5)
Variables <- rep(sens_vars, each=5)
df <- data.frame(x=rep(1:5, 16), val=sample(1:100, 80), 
                 variable=rep(sens_vars_levels, each=5), order_list2 = order_list)
#reorder factor for labeling
df$variable <- factor(df$variable, levels=sens_vars_levels, labels=sens_vars_labels)

# plot
png(file= paste(vpdir_fig, "daily_bs_legend.png", sep=""), width = 6, height = 6, units='in', pointsize=12, res=300)
  ggplot(data = df, aes(x=x, y=val, colour=variable)) + 
    geom_line() +
    scale_color_manual(values=sens_colors) +
    theme_bw()
dev.off()


  


