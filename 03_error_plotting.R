error<- c(4, 10, 18, 22, 36, 42, 44, 47, 58, 83, 87, 90, 100, 119, 122, 126, 135, 158, 168, 171, 172, 187, 
          200, 201, 212, 215, 222, 224, 232, 235, 236, 237, 250, 254, 268, 271, 276, 295, 
          300, 303, 311, 332, 335, 347, 364, 381, 387, 
          401, 412, 421, 448, 453, 461, 485, 496,
          509, 513, 543, 547, 551, 587, 589, 595,
          610, 619, 652, 664, 666, 669, 670, 680,
          711, 715, 745, 755, 785,
          804, 811, 812, 824, 843, 881, 894, 899,
          904, 908, 917, 950, 959, 981, 991, 995)


pdf(file= paste(vpdir_output, "graphics_output_5.pdf", sep=""), width = 8.5, height = 11, onefile = TRUE, paper = "USr")

for (j in inputparam) {
  if (j == drnmitesurvive)
    { x = "Drone-Mite Survivorship (%)"}
  if (j == fgrlifespan)
    { x = "Forager Lifespan (days)"}
  if (j == queenstrength)
    { x = "Queen Strength"}
  if (j == wkrdrnratio)
    { x = "Worker:Drone"}
  if (j == wkrmitesurvive)
    { x = "Worker-Mite Survivorship (%)"}
  if (j == adslopec)
    { x = "Adult Slope Contact"}
  if (j == adLD50c)
    { x = "Adult LD50 Contact"}
  if (j == lslope)
    { x = "Larva Slope"}
  if (j == lLD50)
    { x = "Larva LD50"}
  if (j == kow)
    { x = "KOW"}
  if (j == koc) 
    { x = "KOC"}
  if (j == halflife) 
    { x = "Half Life"}
  
  par(mfrow= c(4,4), mar= c(4,4,1,1), oma= c(1,1,1,1))
  
  plot(j,queenstrength, xlab = x)
    for (i in error) {
      points(j[i], queenstrength[i], col = "red", pch = 17)
    }
  plot(j,wkrdrnratio, xlab = x)
    for (i in error) {
      points(j[i],wkrdrnratio[i], col = "red", pch=17)
    }  
  plot(j, drnmitesurvive, xlab = x)
    for (i in error) {
      points(j[i],drnmitesurvive[i], col = "red", pch=17)
    }
  plot(j,wkrmitesurvive, xlab = x)
    for (i in error) {
      points(j[i],drnmitesurvive[i], col = "red", pch=17)
    }  
  plot(j,fgrlifespan, xlab = x)
    for (i in error) {
      points(j[i],fgrlifespan[i], col = "red", pch=17)
    }
  plot(j,adslope, xlab = x)
    for (i in error) {  
      points(j[i],adslope[i], col = "red", pch=17)
    }
  plot(j,adLD50, xlab = x)
    for (i in error) {
      points(j[i],adLD50[i], col = "red", pch=17)
    }
  plot(j,adslopec, xlab = x)
    for (i in error) {  
      points(j[i],adslopec[i], col = "red", pch=17)
    }
  plot(j,adLD50c, xlab = x)
    for (i in error) { 
      points(j[i],adLD50c[i], col = "red", pch=17)
    }
  plot(j,lslope, xlab = x)
    for (i in error) {  
      points(j[i],lslope[i], col = "red", pch=17)
    }
  plot(j,lLD50, xlab = x)
    for (i in error) {  
      points(j[i],lLD50[i], col = "red", pch=17)
    }
  plot(j,kow, xlab = x)
    for (i in error) {  
      points(j[i],kow[i], col = "red", pch=17)
    }
  plot(j,koc, xlab = x)
    for (i in error) {  
      points(j[i],koc[i], col = "red", pch=17)
    }
  plot(j,halflife, xlab = x)
    for (i in error) {
      points(j[i],halflife[i], col = "red", pch=17)
    }
  plot(j,apprate, xlab = x)
    for (i in error) {  
      points(j[i],apprate[i], col = "red", pch=17)
    }
}
dev.off()