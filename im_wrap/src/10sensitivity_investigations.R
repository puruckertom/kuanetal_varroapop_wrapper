#run 00 and 05

dim(inputdata_control)
colnames(inputdata_control)
dim(tdarray_control)
#days, outputs, simulations
#rownames(tdarray_control)
#colnames(tdarray_control)

output_names <- c('colony_size',
'adult_drones',
'adult_workers',
'foragers',
'capped_drone_brood',
'capped_worker_brood',
'drone_larvae',
'worker_larvae',
'drone_eggs',
'worker_eggs',
'free_mites',
'drone_brood_mites',
'worker_brood_mites',
'drone_mites_cell_cell',
'worker_mites_cell',
'mites_dying',
'prop_mites_dying',
'colony_pollen',
'conc_pollen_pest',
'colony_nectar',
'conc_nectar_pest',
'dead_drone_larvae',
'dead_worker_larvae',
'dead_drone_adults',
'dead_worker_adults',
'dead_foragers',
'queen_strength',
'avg_temp',
'precip')

colnames(tdarray_control) <- output_names
colnames(tdarray_level1) <- output_names
colnames(tdarray_level2) <- output_names
colnames(tdarray_level3) <- output_names
colnames(tdarray_level4) <- output_names

dim(inputdata_control)
colnames(inputdata_level1)
dim(tdarray_control)
colnames(tdarray_control)

#plot of control scenario controlling parameters for colony_size
p.qvf <- ggplot(inputdata_control, aes(queenstrength, fgrlifespan))
#day 550 is 4 days after first application
p.qvf <- p.qvf + geom_jitter(aes(colour=tdarray_control[550,1,])) + 
    scale_colour_gradientn(colours = rainbow(10), guide = guide_legend(title = "Colony Size")) + 
    theme_bw() +
    labs(x = "Initial Queen Strength", y="Forager Lifespan (days)")
p.qvf
png(file=paste(vpdir_fig, "fig_qsvsfl_scatter.png", sep=""), width = 5.5, height = 4, units='in', pointsize=10, res=300)
  p.qvf
dev.off()
pdf(file=paste(vpdir_fig,"fig_qsvsfl_scatter.pdf",sep = ""))
  p.qvf
dev.off()


#plot of level1 scenario controlling parameters for colony_size
p.qvf1 <- ggplot(inputdata_level1, aes(queenstrength, fgrlifespan))
#day 550 is 4 days after first application
p.qvf1 <- p.qvf1 + geom_jitter(aes(colour=tdarray_level1[550,1,])) + 
  scale_colour_gradientn(colours = rainbow(10), guide = guide_legend(title = "Colony Size (1)")) + 
  theme_bw() +
  labs(x = "Initial Queen Strength", y="Forager Lifespan (days)")
p.qvf1
png(file=paste(vpdir_fig, "fig_qsvsfl1_scatter.png", sep=""), width = 5.5, height = 4, units='in', pointsize=10, res=300)
p.qvf1
dev.off()
pdf(file=paste(vpdir_fig,"fig_qsvsfl1_scatter.pdf",sep = ""))
p.qvf1
dev.off()

#plot of level2 scenario controlling parameters for colony_size
p.qvf2 <- ggplot(inputdata_level2, aes(queenstrength, fgrlifespan))
#day 550 is 4 days after first application
p.qvf2 <- p.qvf2 + geom_jitter(aes(colour=tdarray_level2[550,1,])) + 
  scale_colour_gradientn(colours = rainbow(10), guide = guide_legend(title = "Colony Size (2)")) + 
  theme_bw() +
  labs(x = "Initial Queen Strength", y="Forager Lifespan (days)")
p.qvf2
png(file=paste(vpdir_fig, "fig_qsvsfl2_scatter.png", sep=""), width = 5.5, height = 4, units='in', pointsize=10, res=300)
p.qvf2
dev.off()
pdf(file=paste(vpdir_fig,"fig_qsvsfl2_scatter.pdf",sep = ""))
p.qvf2
dev.off()

#plot of level3 scenario controlling parameters for colony_size
p.qvf3 <- ggplot(inputdata_level3, aes(queenstrength, fgrlifespan))
#day 550 is 4 days after first application
p.qvf3 <- p.qvf3 + geom_jitter(aes(colour=tdarray_level3[550,1,])) + 
  scale_colour_gradientn(colours = rainbow(10), guide = guide_legend(title = "Colony Size (3)")) + 
  theme_bw() +
  labs(x = "Initial Queen Strength", y="Forager Lifespan (days)")
p.qvf3
png(file=paste(vpdir_fig, "fig_qsvsfl3_scatter.png", sep=""), width = 5.5, height = 4, units='in', pointsize=10, res=300)
p.qvf3
dev.off()
pdf(file=paste(vpdir_fig,"fig_qsvsfl3_scatter.pdf",sep = ""))
p.qvf3
dev.off()

#plot of level4 scenario controlling parameters for colony_size
p.qvf4 <- ggplot(inputdata_level4, aes(queenstrength, fgrlifespan))
#day 550 is 4 days after first application
p.qvf4 <- p.qvf4 + geom_jitter(aes(colour=tdarray_level4[550,1,])) + 
  scale_colour_gradientn(colours = rainbow(10), guide = guide_legend(title = "Colony Size (4)")) + 
  theme_bw() +
  labs(x = "Initial Queen Strength", y="Forager Lifespan (days)")
p.qvf4
png(file=paste(vpdir_fig, "fig_qsvsfl4_scatter.png", sep=""), width = 5.5, height = 4, units='in', pointsize=10, res=300)
p.qvf4
dev.off()
pdf(file=paste(vpdir_fig,"fig_qsvsfl4_scatter.pdf",sep = ""))
p.qvf4
dev.off()

## next thing
p.pvn <- ggplot(inputdata_control, aes(pload, nload))
#day 791 is sep 30, 1989
p.pvn <- p.pvn + geom_jitter(aes(colour=tdarray_control[791,1,])) + 
  scale_colour_gradientn(colours = rainbow(20), guide = guide_legend(title = "Colony Size")) + 
  theme_bw() +
  labs(x = "Pollen Pesticide Concentration", y="Nectar Pesticide Concentration")
pdf(file=paste(vpdir_fig,"fig_polvsnecconc_scatter.pdf",sep = ""))
  p.pvn
dev.off()



