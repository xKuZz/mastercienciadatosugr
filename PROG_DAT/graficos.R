## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
set.seed(5)


## ----graphics1_seesummary------------------------------------------------
summary(iris[1:4])

## ----graphics1_boxplot---------------------------------------------------
boxplot(iris[1:4], outlines=F, axis=F)


## ----graphics2-----------------------------------------------------------
matriz <- matrix(runif(120), nrow=30, ncol=4)
matriz


## ----graphics2-parte2----------------------------------------------------
plot(1:30,matriz[,1], type="l", col="blue", xlab="Casos",
     ylab="Tasa de exito (clasificacion)")
lines(1:30, matriz[,2], col="red")
lines(1:30, matriz[,3], col="green")
lines(1:30, matriz[,4], col="black")
legend(x=0, y = 1, legend=c("Algoritmo 1", "Algoritmo 2", "Algoritmo 3", 
                            "Algoritmo 4"), col=c("blue", "red", "green", "black"), lty=1)




## ----ej3parte1-----------------------------------------------------------
library(MASS)
str(quine) 


## ----ej3parte2-----------------------------------------------------------
par(mfrow=c(1,2))
x <- xtabs(~ Age, data=quine)
y <- prop.table(xtabs(~ Age, data=quine))
barplot(x, main="Frecuencia absoluta de edades", col=c("blue"))
barplot(y, main="Frecuencia relativa de edades", col=c("red"))


## ----ej4-----------------------------------------------------------------
par(mfrow=c(1,2))
pie(x, clockwise=T, col=c("blue", "red", "green", "yellow"), 
    main="Frecuencia absoluta de edades")
dotchart(as.numeric(y), main="Frecuencia relativa de edades")



## ----ej5-----------------------------------------------------------------
m = lm(speed~dist, data=cars)
plot(cars, xlab="speed", ylab="dist", col="blue")
abline(m, col="red")


