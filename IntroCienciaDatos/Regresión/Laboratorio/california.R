# Alumno: David Criado Ramón
# Lectura del dataset
library("kknn")
California <- read.csv("california.dat", comment.char="@", header=F)
n<-length(names(California)) -1;
names(California)[1:n] <- paste ("X", 1:n, sep=""); names(California)[n+1] <- "Y"
# Representación gráfica de relaciones entre predictores y variable a estimar.
temp <- California
plotY <- function (x,y) {
  plot(temp[,y]~temp[,x], xlab=names(temp)[x], ylab=names(temp)[y])
}
par(mfrow=c(2,4)); x<-sapply(1:(dim(temp)[2]-1), plotY, dim(temp)[2]); par(mfrow=c(1,1))

# X8 es la variable que parece tener una representación lineal con más fiabilidad,
# el resto no queda claro, x7 x5 y x4 se parecen mucho entre sí y parece más posible
# la existencia de modelo lineal en ellas que en el resto.
fitx8 <- lm(Y~X8, California)
fitx7 <- lm(Y~X7, California)
fitx5 <- lm(Y~X5, California)
fitx4 <- lm(Y~X4, California)

# Resumen de los modelos
summary(fitx8)
summary(fitx7)
summary(fitx5)
summary(fitx4)
# El test estadístico no descarta que alguna no sea relación lineal.
# x8 da el mejor R cuadrado con 0.4734. Recordar mirar siempre el ajustado.

# Representación gráfica de los modelos lineales simples obtenidos
par(mfrow=c(2,2))
plot(Y~X8, California)
abline(fitx8,col="red")
plot(Y~X7, California)
abline(fitx7,col="red")
plot(Y~X5, California)
abline(fitx5,col="red")
plot(Y~X4, California)
abline(fitx4,col="red")

# Modelos multivariable
#Modelo que usa el logaritmo por ser Y=ln(median house value)
#recomendado en el website que describe el problema
fit1=lm(Y~X8+I(X8^2)+I(X8^3)+I(log(X3))+I(log(X4/X6))
        +I(log(X5/X6))+I(log(X6/X7))+I(log(X7)),California)
# Todas las variables
fit2=lm(Y~.,California)
summary(fit2) 
# El test no descarta que haya relación lineal
fit3=lm(Y~.+X4*X7*X8, California)
summary(fit3)
fit4=lm(Y~.+I(X1^2)+I(X6^2)+I(X8^2)+I(X8^3)+I(X8^4)
        +X7*X8*X4*X5*X6, California)
summary(fit4)

# Resumen de R cuadrados con los modelos múltiples.
# El mejor R^2 es el del último modelo, producirá overfitting?

summary(fit1)$adj.r.squared
summary(fit2)$adj.r.squared
summary(fit3)$adj.r.squared
summary(fit4)$adj.r.squared

# Vemos cuál de los modelos de regresión simple y múltiple son los mejores en CV
nombre <- "california"
run_lm_fold <- function(i, x, formula, tt = "test") {
  file <- paste(x, "-5-", i, "tra.dat", sep=""); x_tra <- read.csv(file, comment.char="@")
  file <- paste(x, "-5-", i, "tst.dat", sep=""); x_tst <- read.csv(file, comment.char="@")
  In <- length(names(x_tra)) - 1
  names(x_tra)[1:In] <- paste ("X", 1:In, sep=""); names(x_tra)[In+1] <- "Y"
  names(x_tst)[1:In] <- paste ("X", 1:In, sep=""); names(x_tst)[In+1] <- "Y"
  if (tt == "train") { test <- x_tra }
  else { test <- x_tst }
  fitMulti=lm(formula,x_tra)
  yprime=predict(fitMulti,test)
  sum(abs(test$Y-yprime)^2)/length(yprime) ##MSE
}
lmMSEtrainx8<-mean(sapply(1:5,run_lm_fold,nombre, Y~X8, "train"))
lmMSEtestx8<-mean(sapply(1:5,run_lm_fold,nombre, Y~X8,"test"))
lmMSEtrainx7<-mean(sapply(1:5,run_lm_fold,nombre, Y~X7, "train"))
lmMSEtestx7<-mean(sapply(1:5,run_lm_fold,nombre, Y~X7,"test"))
lmMSEtrainx5<-mean(sapply(1:5,run_lm_fold,nombre, Y~X5, "train"))
lmMSEtestx5<-mean(sapply(1:5,run_lm_fold,nombre, Y~X5,"test"))
lmMSEtrainx4<-mean(sapply(1:5,run_lm_fold,nombre, Y~X4, "train"))
lmMSEtestx4<-mean(sapply(1:5,run_lm_fold,nombre, Y~X4,"test"))
lmMSEtrainfit1<-mean(sapply(1:5,run_lm_fold,nombre, Y~X8+I(X8^2)+I(X8^3)+I(log(X3))+I(log(X4/X6))
                            +I(log(X5/X6))+I(log(X6/X7))+I(log(X7)), "train"))
lmMSEtestfit1<-mean(sapply(1:5,run_lm_fold,nombre, Y~X8+I(X8^2)+I(X8^3)+I(log(X3))+I(log(X4/X6))
                           +I(log(X5/X6))+I(log(X6/X7))+I(log(X7)),"test"))
lmMSEtrainfit2<-mean(sapply(1:5,run_lm_fold,nombre, Y~., "train"))
lmMSEtestfit2<-mean(sapply(1:5,run_lm_fold,nombre, Y~.,"test"))
lmMSEtrainfit3<-mean(sapply(1:5,run_lm_fold,nombre, Y~.+X4*X7*X8, "train"))
lmMSEtestfit3<-mean(sapply(1:5,run_lm_fold,nombre, Y~.+X4*X7*X8,"test"))
lmMSEtrainfit4<-mean(sapply(1:5,run_lm_fold,nombre, Y~.+I(X1^2)+I(X6^2)+I(X8^2)+I(X8^3)+I(X8^4)
                            +X7*X8*X4*X5*X6, "train"))
lmMSEtestfit4<-mean(sapply(1:5,run_lm_fold,nombre, Y~.+I(X1^2)+I(X6^2)+I(X8^2)+I(X8^3)+I(X8^4)
                           +X7*X8*X4*X5*X6,"test"))

nombre <- "california"
run_knn_fold <- function(i, x, tt = "test") {
  file <- paste(x, "-5-", i, "tra.dat", sep="")
  x_tra <- read.csv(file, comment.char="@")
  file <- paste(x, "-5-", i, "tst.dat", sep="")
  x_tst <- read.csv(file, comment.char="@")
  In <- length(names(x_tra)) - 1
  names(x_tra)[1:In] <- paste ("X", 1:In, sep="")
  names(x_tra)[In+1] <- "Y"
  names(x_tst)[1:In] <- paste ("X", 1:In, sep="")
  names(x_tst)[In+1] <- "Y"
  if (tt == "train") {
    test <- x_tra
  }
  else {
    test <- x_tst
  }
  fitMulti=kknn(Y~.,x_tra,test)
  yprime=fitMulti$fitted.values
  sum(abs(test$Y-yprime)^2)/length(yprime) ##MSE
}
knnMSEtrain<-mean(sapply(1:5,run_knn_fold,nombre,"train"))
knnMSEtest<-mean(sapply(1:5,run_knn_fold,nombre,"test"))

# knn con todas las variables nos propociona el mejor MSE en test.
# El mejor MSE en regresion lineal es el de fit3

# Comparativa LM, KNN, M5'
#leemos la tabla con los errores medios de test
resultados <- read.csv("regr_test_alumnos.csv")
tablatst <- cbind(resultados[,2:dim(resultados)[2]])
colnames(tablatst) <- names(resultados)[2:dim(resultados)[2]]
rownames(tablatst) <- resultados[,1]
#leemos la tabla con los errores medios de entrenamiento
resultados <- read.csv("regr_train_alumnos.csv")
tablatra <- cbind(resultados[,2:dim(resultados)[2]])
colnames(tablatra) <- names(resultados)[2:dim(resultados)[2]]
rownames(tablatra) <- resultados[,1]

##lm (other) vs knn (ref)
# + 0.1 porque wilcox R falla para valores == 0 en la tabla
difs <- (tablatst[,1] - tablatst[,2]) / tablatst[,1]
wilc_1_2 <- cbind(ifelse (difs<0, abs(difs)+0.1, 0+0.1), ifelse (difs>0, abs(difs)+0.1, 0+0.1))
colnames(wilc_1_2) <- c(colnames(tablatst)[1], colnames(tablatst)[2])
head(wilc_1_2)

LMvsKNNtst <- wilcox.test(wilc_1_2[,1], wilc_1_2[,2], alternative = "two.sided", paired=TRUE)
Rmas <- LMvsKNNtst$statistic
pvalue <- LMvsKNNtst$p.value
LMvsKNNtst <- wilcox.test(wilc_1_2[,2], wilc_1_2[,1], alternative = "two.sided", paired=TRUE)
Rmenos <- LMvsKNNtst$statistic
Rmas
Rmenos
pvalue

# El test no indica que haya diferencia significativas entre ellos LM y KNN (p-value muy alto)
test_friedman <- friedman.test(as.matrix(tablatst))
test_friedman
# p-value < 0.05 existen diferencias significativas entre al menos un par de algoritmos

# post-hoc Holm para ver qué pares tienen diferencias significativas
tam <- dim(tablatst)
groups <- rep(1:tam[2], each=tam[1])
pairwise.wilcox.test(as.matrix(tablatst), groups, p.adjust = "holm", paired = TRUE)
# Existen diferencias significativas entre M5' y el resto con algo más de un 90 %
# de confianza
