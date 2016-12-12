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
colnames(tdarray_foliar) <- output_names
colnames(tdarray_seed) <- output_names
colnames(tdarray_soil) <- output_names

dim(inputdata_control)
colnames(inputdata_foliar)
dim(tdarray_control)
colnames(tdarray_control)

#plot of control scenario controlling parameters for colony_size
p.qvf <- ggplot(inputdata_control, aes(floor(queenstrength), fgrlifespan))
#day 791 is sep 30, 1989
p.qvf <- p.qvf + geom_jitter(aes(colour=tdarray_control[791,1,])) + 
    scale_colour_gradientn(colours = rainbow(20), guide = guide_legend(title = "Colony Size")) + 
    theme_bw() +
    labs(x = "Initial Queen Strength", y="Forager Lifespan (days)")
pdf(file=paste(vpdir_fig,"fig_qsvsfl_scatter.pdf",sep = ""))
  p.qvf
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



