library(fitdistrplus)
data <- read.table("minterremoto_r.txt", header = TRUE)
x <- data$x
x <- x[!is.nan(x)]
#1. Analizar las observaciones
plotdist(x,histo=TRUE,demp=TRUE)
summary(x)
descdist(x)

#2. Estimar parámetros
fit_e <- fitdist(x,"exp")
fit_g <- fitdist(x,"gamma") 
summary(fit_e)
summary(fit_g)


#3. Evaluar el ajuste
plot(fit_e)
summary(fit_e)

gofstat(list(fit_e,fit_g))

par(mfrow=c(2,2))
plot.legend<-c("exponential","gamma")
denscomp(list(fit_e, fit_g), legendtext = plot.legend)
cdfcomp(list(fit_e, fit_g), legendtext = plot.legend)
qqcomp(list(fit_e,fit_g),legendtext=plot.legend)
ppcomp(list(fit_e,fit_g),legendtext=plot.legend)
