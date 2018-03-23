nsims = 10000

nsperm <- seq(0,5500000,length.out = nsims)
#5500000-nsperm gives the amount of sperm that the queen is short of full
propsperm = (5500000-nsperm)/5500000.0

#if (propsperm < 0.6) PDE = 0
pde = 1 - (-6.355*propsperm*propsperm*propsperm + 7.657*propsperm*propsperm -2.3*propsperm + 1.002)
#if (PDE < 0) PDE = 0;
negs <- which(pde<0)
pde[negs]=0
lt_6 <- which(propsperm<0.6)
pde[lt_6]=0

plot(propsperm,pde, type="l")
min(pde)
max(pde)

#this seems fine, but not clear how sperm is being deprecated/subtracted

#queens are supplied with a 5 year supply of eggs (plus they do not lay eggs in the wintertime)
1800000/1000/365
2720000/1500/365
3650000/2000/365
4750000/2500/365
5500000/3000/365

#in order for a queen to lay eggs
#if (LarvPerBee > 2)  // Not enough House Bees -- House = Nurse??

#how many eggs?
#max eggs is 1000-3000 based on queen strength
max_eggs <- seq(1000,3000,length.out = nsims)
lay_days <- seq(0,1000,length.out = nsims)
#loop over days and deprecate eggs
n_eggs = max_eggs[nsims] + -0.0027*lay_days[5000]*lay_days[5000] + 0.395*lay_days[5000]
n_eggs
if (n_eggs<0) n_eggs = 0

#when does the queen pass the 0.15 pde threshold to be requeened
#
first_pde_15 <- max(which(pde>0.15))
pde[first_pde_15]
propsperm[first_pde_15]

#calculate number of years until queens of different strengths get to pde>0.15


