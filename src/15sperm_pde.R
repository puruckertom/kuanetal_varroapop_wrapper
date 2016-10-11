nsims = 10000

nsperm <- seq(0,5500000,length.out = nsims)
propsperm = (5500000-nsperm)/5500000.0

#if (propsperm < 0.6) PDE = 0
pde = 1 - (-6.355*propsperm*propsperm*propsperm + 7.657*propsperm*propsperm -2.3*propsperm + 1.002)
#if (PDE < 0) PDE = 0;

plot(propsperm,pde, type="l")
min(pde)
