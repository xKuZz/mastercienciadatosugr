# Alumno: David Criado Ramón
# Introducción a la Ciencia de Datos (Regresión)
# Paquetes
library(kknn)
library(dplyr)
library(ggplot2)

# 1. Lectura del dataset y particiones
df_baseball <- read.csv("baseball.dat", comment.char="@", header=F)
df_baseball_train1 <- read.csv("baseball-5-1tra.dat", comment.char="@", header=F)
df_baseball_test1 <- read.csv("baseball-5-1tst.dat", comment.char="@", header=F)
df_baseball_train2 <- read.csv("baseball-5-2tra.dat", comment.char="@", header=F)
df_baseball_test2 <- read.csv("baseball-5-2tst.dat", comment.char="@", header=F)
df_baseball_train3 <- read.csv("baseball-5-3tra.dat", comment.char="@", header=F)
df_baseball_test3 <- read.csv("baseball-5-3tst.dat", comment.char="@", header=F)
df_baseball_train4 <- read.csv("baseball-5-4tra.dat", comment.char="@", header=F)
df_baseball_test4 <- read.csv("baseball-5-4tst.dat", comment.char="@", header=F)
df_baseball_train5 <- read.csv("baseball-5-5tra.dat", comment.char="@", header=F)
df_baseball_test5 <- read.csv("baseball-5-5tst.dat", comment.char="@", header=F)

# 2. Hacer las transformaciones extraidas del EDA
add_singles_drop_Wrong_data <- function(df) {
  colnames(df) <- c("batting_average", "on_base_percentage", "runs", "hits", "doubles", "triples", "homeruns", "runs_batted_in", "walks", "strike_outs", "stolen_bases", "errors", 
                    "free_agency_eligibility", "free_agency", "arbitration_eligibility", "arbitration", "salary")
  df %>% mutate(singles=hits-homeruns-doubles-triples) %>%
        filter(singles >= 0)
}

df_baseball <- add_singles_drop_Wrong_data(df_baseball)
train_list <- list(df_baseball_train1, df_baseball_train2, df_baseball_train3, df_baseball_train4, df_baseball_train5)
test_list <- list(df_baseball_test1, df_baseball_test2, df_baseball_test3, df_baseball_test4, df_baseball_test5)

train_list <- lapply(train_list, add_singles_drop_Wrong_data)
test_list <- lapply(test_list, add_singles_drop_Wrong_data)

# 3. Empezamos con las regresiones lineales simples
# 3.1 Cálculo de correlaciones
df_cor <- cor(df_baseball, method="kendall")
df_cor

# 3.2 Cálculo de las regresiones lineales simples

fit1 <- lm(salary ~ runs_batted_in, data=df_baseball)
fit2 <- lm(salary ~ runs, data=df_baseball)
fit3 <- lm(salary ~ hits, data=df_baseball)
fit4 <- lm(salary ~ doubles, data=df_baseball)
fit5 <- lm(salary ~ singles, data=df_baseball)

# 3.3 Muestra de resúmenes (R cuadrado ajustado)
summary(fit1)
summary(fit2)
summary(fit3)
summary(fit4)
summary(fit5)


# 3.4 CV regresión lineal simple.
cv_lm_mse <- function(formula, train_list, test_list) {
  # Calculamos los ajustes
  fits <- lapply(train_list, lm, formula=formula)
  # Realizamos las predicciones en test y calculamos el mse
  mse <- sapply(1:length(train_list), function(i, fits, test) {
    # Calculamos predicciones
    preds <- predict(fits[[i]], test[[i]])
    # Calculamos el MSE
    sum(abs(test[[i]]$salary-preds)^2)/length(preds)
  }, fits=fits, test=test_list)
  
}

mse_fit1 <- cv_lm_mse(salary ~ runs_batted_in, train_list, test_list)
mse_fit2 <- cv_lm_mse(salary ~ runs, train_list, test_list)
mse_fit3 <- cv_lm_mse(salary ~ hits, train_list, test_list)
mse_fit4 <- cv_lm_mse(salary ~ doubles, train_list, test_list)
mse_fit5 <- cv_lm_mse(salary ~ singles, train_list, test_list)


mse_fit1
mean(mse_fit1)
mse_fit2
mean(mse_fit2)
mse_fit3
mean(mse_fit3)
mse_fit4
mean(mse_fit4)
mse_fit5
mean(mse_fit5)

# 4. Regresión lineal múltiple
multifit1 <- lm(salary ~ ., data = df_baseball)
summary(multifit1)

# En el primer modelo nos sale que no está definida porque
# está altamente correlacionada con otra. Vamos a quitar hits y dejar singles de entre las dos.

multifit2 <- lm(salary ~ .-hits, data=df_baseball)
summary(multifit2)
# Quitamos doubles
multifit3 <- lm(salary ~ .-hits-doubles, data=df_baseball)
summary(multifit3)
# Quitamos homeruns
multifit4 <- lm(salary ~ .-hits-doubles-homeruns, data=df_baseball)
summary(multifit4)
# Quitamos walks
multifit5 <- lm(salary ~ .-hits-doubles-homeruns-walks, data=df_baseball)
summary(multifit5)
# Quitamos batting_average
multifit6 <- lm(salary ~ .-hits-doubles-homeruns-walks-batting_average, data=df_baseball)
summary(multifit6)
# Quitamos on_base_percentage
multifit7 <- lm(salary ~ .-hits-doubles-homeruns-walks-batting_average-on_base_percentage, data=df_baseball)
summary(multifit7)
# Quitamos arbitration
multifit8 <- lm(salary ~ .-hits-doubles-homeruns-walks-batting_average-on_base_percentage-arbitration, data=df_baseball)
summary(multifit8)
# Quitamos errors
multifit9 <- lm(salary ~ .-hits-doubles-homeruns-walks-batting_average-on_base_percentage-arbitration-errors, data=df_baseball)
summary(multifit9)
# Quitamos triples
multifit10 <- lm(salary ~ .-hits-doubles-homeruns-walks-batting_average-on_base_percentage-arbitration-errors-triples, data=df_baseball)
summary(multifit10)
# Quitamos free_agency
multifit11 <- lm(salary ~ .-hits-doubles-homeruns-walks-batting_average-on_base_percentage-arbitration-errors-triples-free_agency, data=df_baseball)
summary(multifit11)
# Quitamos stolen_bases
multifit12 <- lm(salary ~ .-hits-doubles-homeruns-walks-batting_average-on_base_percentage-arbitration-errors-triples-free_agency-stolen_bases, data=df_baseball)
summary(multifit12)

# Quitamos singles
multifit13 <- lm(salary ~ .-hits-doubles-homeruns-walks-batting_average-on_base_percentage-arbitration-errors-triples-free_agency-stolen_bases-singles, data=df_baseball)
summary(multifit13)

# Quitamos runs
multifit14 <- lm(salary ~ .-hits-doubles-homeruns-walks-batting_average-on_base_percentage-arbitration-errors-triples-free_agency-stolen_bases-singles-runs, data=df_baseball)
summary(multifit14)

# Quitamos strike_outs
multifit15 <- lm(salary ~ .-hits-doubles-homeruns-walks-batting_average-on_base_percentage-arbitration-errors-triples-free_agency-stolen_bases-singles-runs-strike_outs, data=df_baseball)
summary(multifit15)

# Quitamos arbitration_eligibility
multifit16 <- lm(salary ~ .-hits-doubles-homeruns-walks-batting_average-on_base_percentage-arbitration-errors-triples-free_agency-stolen_bases-singles-runs-strike_outs-arbitration_eligibility, data=df_baseball)
summary(multifit16)
# QUITAR ARBITRATION_ELIGIBILITY YA ES PERDER DEMASIADA INFO (BAJO MI PUNTO DE VISTA)
# Buscamos interacciones en el fit más interpretable
ggplot(df_baseball, aes(x=runs_batted_in, y=salary, col=arbitration_eligibility)) + geom_point()
ggplot(df_baseball, aes(x=runs_batted_in, y=salary, col=free_agency_eligibility)) + geom_point()
ggplot(df_baseball, aes(x=runs_batted_in, y=salary, col=free_agency_eligibility|arbitration_eligibility)) + geom_point()
# Añadimos el or
add_comp_eligibility <- function(df) {
  df %>% mutate(comp_eligibility=free_agency_eligibility|arbitration_eligibility)
}
df_baseball <- add_comp_eligibility(df_baseball)
train_list <- lapply(train_list, add_comp_eligibility)
test_list <- lapply(test_list, add_comp_eligibility)

# INTERACCIONES
multifitinter1 <- lm(salary ~ runs_batted_in*comp_eligibility+free_agency_eligibility, data=df_baseball)
summary(multifitinter1)

# Añadimos logaritmo al salario
multifit.nl.1 <- lm(log(salary) ~ runs_batted_in*comp_eligibility+free_agency_eligibility, data=df_baseball)
summary(multifit.nl.1)

# Añadimos interacción entre runs y rbi
multifit.nl.2 <- lm(log(salary) ~ runs*runs_batted_in+runs_batted_in*comp_eligibility+free_agency_eligibility, data=df_baseball)
summary(multifit.nl.2)

# CV 5-fold
# Versión para log

cv_lm_mse_log <- function(formula, train_list, test_list) {
  # Calculamos los ajustes
  fits <- lapply(train_list, lm, formula=formula)
  # Realizamos las predicciones en test y calculamos el mse
  mse <- sapply(1:length(train_list), function(i, fits, test) {
    # Calculamos predicciones
    preds <- predict(fits[[i]], test[[i]])
    # Calculamos el MSE
    sum(abs(test[[i]]$salary-exp(preds))^2)/length(preds)
  }, fits=fits, test=test_list)
  
}

cvmulti10 <- cv_lm_mse(salary ~ .-hits-doubles-homeruns-walks-batting_average-on_base_percentage-arbitration-errors-triples-comp_eligibility, train_list, test_list)
cvmulti15 <- cv_lm_mse(salary ~ .-hits-doubles-homeruns-walks-batting_average-on_base_percentage-arbitration-errors-triples-free_agency-stolen_bases-singles-runs-strike_outs-comp_eligibility, train_list, test_list)
cvinter1 <- cv_lm_mse(salary ~ runs_batted_in*comp_eligibility+free_agency_eligibility, train_list, test_list)
cvnl1 <- cv_lm_mse_log(log(salary) ~ runs_batted_in*comp_eligibility+free_agency_eligibility, train_list, test_list)
cvnl2 <- cv_lm_mse_log(log(salary) ~ runs*runs_batted_in + runs_batted_in*comp_eligibility+free_agency_eligibility, train_list, test_list)
cvcompleto <- cv_lm_mse(salary ~ . -singles-comp_eligibility, train_list, test_list)
# KNN para regresión

cv_knn_mse <- function(formula, k, train_list, test_list) {
  sapply(1:length(train_list), function(i) {
    # Aplicamos modelo
    fit <- kknn(formula,train_list[[i]], test_list[[i]], k=k)
    # Calculamos predicciones
    preds <- fit$fitted.values
    # Calculamos el MSE
    sum(abs(test_list[[i]]$salary-preds)^2)/length(preds)
  })
}

cv_knn_mse_log <- function(formula, k, train_list, test_list) {
  sapply(1:length(train_list), function(i) {
    # Aplicamos modelo
    fit <- kknn(formula,train_list[[i]], test_list[[i]], k=k)
    # Calculamos predicciones
    preds <- fit$fitted.values
    # Calculamos el MSE
    sum(abs(test_list[[i]]$salary-exp(preds))^2)/length(preds)
  })
}
# Knn k=3
knn3cvmulti10 <- cv_knn_mse(salary ~ .-hits-doubles-homeruns-walks-batting_average-on_base_percentage-arbitration-errors-triples-comp_eligibility, 3, train_list, test_list)
knn3cvmulti15 <- cv_knn_mse(salary ~ .-hits-doubles-homeruns-walks-batting_average-on_base_percentage-arbitration-errors-triples-free_agency-stolen_bases-singles-runs-strike_outs-comp_eligibility, 3, train_list, test_list)
knn3cvinter1 <- cv_knn_mse(salary ~ runs_batted_in*comp_eligibility+free_agency_eligibility, 3, train_list, test_list)
knn3cvnl1 <- cv_knn_mse_log(log(salary) ~ runs_batted_in*comp_eligibility+free_agency_eligibility, 3, train_list, test_list)
knn3cvnl2 <- cv_knn_mse_log(log(salary) ~ runs*runs_batted_in + runs_batted_in*comp_eligibility+free_agency_eligibility, 3, train_list, test_list)
knn3completo <- cv_knn_mse(salary ~ ., 3, train_list, test_list)
knn3logcompleto <- cv_knn_mse_log(log(salary) ~ ., 3, train_list, test_list)
mean(knn3cvmulti10)
mean(knn3cvmulti15)
mean(knn3cvinter1)
mean(knn3cvnl1)
mean(knn3cvnl2)
mean(knn3completo)
mean(knn3logcompleto)
# knn k=5
knn5cvmulti10 <- cv_knn_mse(salary ~ .-hits-doubles-homeruns-walks-batting_average-on_base_percentage-arbitration-errors-triples-comp_eligibility, 5, train_list, test_list)
knn5cvmulti15 <- cv_knn_mse(salary ~ .-hits-doubles-homeruns-walks-batting_average-on_base_percentage-arbitration-errors-triples-free_agency-stolen_bases-singles-runs-strike_outs-comp_eligibility, 5, train_list, test_list)
knn5cvinter1 <- cv_knn_mse(salary ~ runs_batted_in*comp_eligibility+free_agency_eligibility, 5, train_list, test_list)
knn5cvnl1 <- cv_knn_mse_log(log(salary) ~ runs_batted_in*comp_eligibility+free_agency_eligibility, 5, train_list, test_list)
knn5cvnl2 <- cv_knn_mse_log(log(salary) ~ runs*runs_batted_in + runs_batted_in*comp_eligibility+free_agency_eligibility, 5, train_list, test_list)
knn5completo <- cv_knn_mse(salary ~ ., 5, train_list, test_list)
knn5logcompleto <- cv_knn_mse_log(log(salary) ~ ., 5, train_list, test_list)

mean(knn5cvmulti10)
mean(knn5cvmulti15)
mean(knn5cvinter1)
mean(knn5cvnl1)
mean(knn5cvnl2)
mean(knn5completo)
mean(knn5logcompleto)

# knn k=7
knn7cvmulti10 <- cv_knn_mse(salary ~ .-hits-doubles-homeruns-walks-batting_average-on_base_percentage-arbitration-errors-triples-comp_eligibility, 7, train_list, test_list)
knn7cvmulti15 <- cv_knn_mse(salary ~ .-hits-doubles-homeruns-walks-batting_average-on_base_percentage-arbitration-errors-triples-free_agency-stolen_bases-singles-runs-strike_outs-comp_eligibility, 7, train_list, test_list)
knn7cvinter1 <- cv_knn_mse(salary ~ runs_batted_in*comp_eligibility+free_agency_eligibility, 7, train_list, test_list)
knn7cvnl1 <- cv_knn_mse_log(log(salary) ~ runs_batted_in*comp_eligibility+free_agency_eligibility, 7, train_list, test_list)
knn7cvnl2 <- cv_knn_mse_log(log(salary) ~ runs*runs_batted_in + runs_batted_in*comp_eligibility+free_agency_eligibility, 7, train_list, test_list)
knn7completo <- cv_knn_mse(salary ~ ., 7, train_list, test_list)
knn7logcompleto <- cv_knn_mse_log(log(salary) ~ ., 7, train_list, test_list)

mean(knn7cvmulti10)
mean(knn7cvmulti15)
mean(knn7cvinter1)
mean(knn7cvnl1)
mean(knn7cvnl2)
mean(knn7completo)
mean(knn7logcompleto)

# Comparativa LM, KNN, M5'
#leemos la tabla con los errores medios de test
resultados <- read.csv("regr_test_alumnos.csv")
tablatst <- cbind(resultados[,2:dim(resultados)[2]])
colnames(tablatst) <- names(resultados)[2:dim(resultados)[2]]
rownames(tablatst) <- resultados[,1]

# Ponemos nuestros valores de test de LM y knn (modelos generales)
tablatst["baseball", 1] <- mean(cvcompleto)
tablatst["baseball", 2] <- mean(knn7completo)

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

