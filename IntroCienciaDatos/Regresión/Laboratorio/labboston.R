library("MASS")
library("ISLR")

# Consultar documentación sobre dataset "Boston"
?Boston

# Regresión lineal simple con cojunto "Boston"

# Previsualización de todas las variables respecto de la salida.
temp <- Boston
plotY <- function (x,y) {
  plot(temp[,y]~temp[,x], xlab=paste(names(temp)[x]," X",x,sep=""),
       ylab=names(temp)[y])
}
par(mfrow=c(3,4))
x <- sapply(1:(dim(temp)[2]-1), plotY, dim(temp)[2])
par(mfrow=c(1,1))

# Obtención de modelo lineal simple

fit1=lm(medv~lstat,data=Boston)
fit1

fit2=lm(medv~rm,data=Boston)
fit2

# Resumen y estadísticos.
# A partir de Pr(>|t|) 0.15, 0.2 empiezo a plantearme quitarlo.
# El F lo miramos en regresión lineal múltiple
# R cuadrado  depende de los parámetros. Residual standard error.
# Me sriven para comparar modelos con el mismo número de variables.
# Nos quedamos R cuadrado ajustado para comparar todos los modelos, que no depende.
summary(fit1) 
par(mfrow=c(2,1))
plot(medv~lstat,Boston)
abline(fit1,col="red")
confint(fit1)

summary(fit2)
plot(medv~rm,Boston)
abline(fit2,col="blue")
par(mfrow=c(1,1))
confint(fit2)

names(fit1)
# Residuos: Ajustes - Reales.
fit1$residuals

# Cálculo error cuadático medio
sqrt(sum(fit1$residuals^2)/length(fit1$residuals))
# Summary hace esto
sqrt(sum(fit1$residuals^2)/(length(fit1$residuals)-2))

# Tener en cuenta lo anterior para hacer las comparativas.

# Predecir nuevos valores
predict(fit1,data.frame(lstat=c(5,10,15)))

# Otro cálculo del error cuadrático
yprime=predict(fit1,data.frame(lstat=Boston$lstat))
sqrt(sum(abs(Boston$medv-yprime)^2)/length(yprime))

# Una vez finalizados los ajustes simples, probamos a hacer las múltiples
# Una vez cogida la mejor, probamos con todas las variables.
fit5=lm(medv~.,data=Boston)
summary(fit5)

# NO QUITAR DOS DE GOLPE EN EL TRABAJO
fit6=lm(medv~.-age-indus,data=Boston)
summary(fit6)