#curve(dunif(x, min = 2, max = 6), from = -3, to = 11, xlab=NULL, ylab=NULL)

x <- seq(-3, 11, by = 0.001)
y <- dunif(x, min = 2, max = 8)
plot_uniform <- plot(x, y, type = "l", axes=FALSE, xlab="", ylab="",col="dark red", lwd=3)

x<-seq(-4,4,length=3000)
y<-dnorm(x,mean=0, sd=1)
# plot(x,y, type = "l", lwd = 2, xlim = c(-3.5,3.5))
plot_normal <- plot(x,y, type = "l", axes = FALSE, xlab = "", ylab = "", col="dark blue",lwd=3)
# axis(1, at = -3:3, labels = c("-3s", "-2s", "-1s", "mean", "1s", "2s", "3s"))

par(mfrow=c(2,1))
plot_uniform
plot_normal
