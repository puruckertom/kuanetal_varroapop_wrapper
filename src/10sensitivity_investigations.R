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
'dead_foragers')

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
p.qvf

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

## next thing
p.pvn <- ggplot(tdarray_control, aes(conc_pollen_pest, conc_nectar_pest))
#day 791 is sep 30, 1989
p.pvn <- p.pvn + geom_jitter(aes(colour=tdarray_control[791,1,])) + 
  scale_colour_gradientn(colours = rainbow(20), guide = guide_legend(title = "Colony Size")) + 
  theme_bw() +
  labs(x = "Initial Queen Strength", y="Forager Lifespan (days)")
p.pvn




