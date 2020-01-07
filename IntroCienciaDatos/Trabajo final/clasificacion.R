# Alumno: David Criado Ramón
# Introducción a la ciencia de datos (Clasificación)
# 0. Paquetes
library(MASS)
library(kknn)

# 1. Lectura de datos
df_contraceptive <- read.csv("contraceptive.dat", comment.char="@", header=F)
df_contraceptive_train1 <- read.csv("contraceptive-10-1tra.dat", comment.char="@", header=F)
df_contraceptive_test1 <- read.csv("contraceptive-10-1tst.dat", comment.char="@", header=F)
df_contraceptive_train2 <- read.csv("contraceptive-10-2tra.dat", comment.char="@", header=F)
df_contraceptive_test2 <- read.csv("contraceptive-10-2tst.dat", comment.char="@", header=F)
df_contraceptive_train3 <- read.csv("contraceptive-10-3tra.dat", comment.char="@", header=F)
df_contraceptive_test3 <- read.csv("contraceptive-10-3tst.dat", comment.char="@", header=F)
df_contraceptive_train4 <- read.csv("contraceptive-10-4tra.dat", comment.char="@", header=F)
df_contraceptive_test4 <- read.csv("contraceptive-10-4tst.dat", comment.char="@", header=F)
df_contraceptive_train5 <- read.csv("contraceptive-10-5tra.dat", comment.char="@", header=F)
df_contraceptive_test5 <- read.csv("contraceptive-10-5tst.dat", comment.char="@", header=F)
df_contraceptive_train6 <- read.csv("contraceptive-10-6tra.dat", comment.char="@", header=F)
df_contraceptive_test6 <- read.csv("contraceptive-10-6tst.dat", comment.char="@", header=F)
df_contraceptive_train7 <- read.csv("contraceptive-10-7tra.dat", comment.char="@", header=F)
df_contraceptive_test7 <- read.csv("contraceptive-10-7tst.dat", comment.char="@", header=F)
df_contraceptive_train8 <- read.csv("contraceptive-10-8tra.dat", comment.char="@", header=F)
df_contraceptive_test8 <- read.csv("contraceptive-10-8tst.dat", comment.char="@", header=F)
df_contraceptive_train9 <- read.csv("contraceptive-10-9tra.dat", comment.char="@", header=F)
df_contraceptive_test9 <- read.csv("contraceptive-10-9tst.dat", comment.char="@", header=F)
df_contraceptive_train10 <- read.csv("contraceptive-10-10tra.dat", comment.char="@", header=F)
df_contraceptive_test10 <- read.csv("contraceptive-10-10tst.dat", comment.char="@", header=F)

# Función para añadir nombres a las columnas y realizar las transformaciones de EDA
add_names_eda <- function(df) {
  colnames(df) <- c("wife_age", "wife_education", "husband_education", "children", 
                                  "wife_religion", "wife_working", "husband_occupation",
                                  "standard_of_living", "media_exposure", "contraceptive_method")
  df$wife_education <- factor(df$wife_education, c(1,2,3,4), c("Bajo", "Medio bajo", "Medio alto", "Alto"), ordered=T)
  df$husband_education <- factor(df$husband_education, c(1,2,3,4), c("Bajo", "Medio bajo", "Medio alto", "Alto"), ordered=T)
  df$wife_religion <- factor(df$wife_religion, c(0,1), c("No Islámica", "Islámica"), ordered=T)
  df$wife_working <- factor(df$wife_working, c(0,1), c("No", "Sí"), ordered=T)
  df$husband_occupation <- factor(df$husband_occupation, c(1,2,3,4), c("Grupo 1", "Grupo 2", "Grupo 3", "Grupo 4"), ordered=T)
  df$standard_of_living <- factor(df$standard_of_living, c(1,2,3,4), c("Bajo", "Medio bajo", "Medio alto", "Alto"), ordered=T)
  df$media_exposure <- factor(df$media_exposure, c(0,1), c("Buen acceso", "Mal acceso"), ordered=T)
  df$contraceptive_method <- factor(df$contraceptive_method, c(1,2,3), c("No usa", "Corto Plazo", "Largo plazo"))
  # Creamos children.cat
  b <- c(-Inf,0,1,4, Inf)
  l <- c("Sin hijos", "Hijo único", "Algunos hijos", "Muchos hijos")
  df$children.cat <- cut(df$children, breaks = b, labels=l, ordered=T)
  df$children <- NULL
  df
  
}

df_contraceptive <- add_names_eda(df_contraceptive)

# Generamos listas que contienen los folds de Validación Cruzada.
train_list <- list(df_contraceptive_train1, df_contraceptive_train2, df_contraceptive_train3, df_contraceptive_train4, df_contraceptive_train5, df_contraceptive_train6, df_contraceptive_train7, df_contraceptive_train8, df_contraceptive_train9, df_contraceptive_train10)
test_list <- list(df_contraceptive_test1, df_contraceptive_test2, df_contraceptive_test3, df_contraceptive_test4, df_contraceptive_test5, df_contraceptive_test6, df_contraceptive_test7, df_contraceptive_test8, df_contraceptive_test9, df_contraceptive_test10)

train_list <- lapply(train_list, add_names_eda)
test_list <- lapply(test_list, add_names_eda)

# Precisión en test con KNN
cv_knn_accuracy <- function(formula, k, train_list, test_list, ...) {
  sapply(1:length(train_list), function(i) {
    # Aplicamos modelo
    fit <- kknn(formula,train_list[[i]], test_list[[i]], k=k, ...)
    # Calculamos predicciones
    preds <- fit$fitted.values
    # Calculamos el accuracy
    sum(preds==test_list[[i]]$contraceptive_method)/length(preds)
  })
}

# Precisión en train con KNN
cv_knn_accuracy_train <- function(formula, k, train_list, test_list, ...) {
  sapply(1:length(train_list), function(i) {
    # Aplicamos modelo
    fit <- kknn(formula,train_list[[i]], train_list[[i]], k=k, ...)
    # Calculamos predicciones
    preds <- fit$fitted.values
    # Calculamos el accuracy
    sum(preds==train_list[[i]]$contraceptive_method)/length(preds)
  })
}

# Probamos knn hasta 25 (sin tener en cuenta múltiplos de 3, con distancia
# manhattan y euclidea)
cv_knn_1 <- cv_knn_accuracy(contraceptive_method~., 1, train_list, test_list)
cv_knn_2 <- cv_knn_accuracy(contraceptive_method~., 2, train_list, test_list)
cv_knn_4 <- cv_knn_accuracy(contraceptive_method~., 4, train_list, test_list)
cv_knn_5 <- cv_knn_accuracy(contraceptive_method~., 5, train_list, test_list)
cv_knn_7 <- cv_knn_accuracy(contraceptive_method~., 7, train_list, test_list)
cv_knn_8 <- cv_knn_accuracy(contraceptive_method~., 8, train_list, test_list)
cv_knn_10 <- cv_knn_accuracy(contraceptive_method~., 10, train_list, test_list)
cv_knn_11 <- cv_knn_accuracy(contraceptive_method~., 11, train_list, test_list)
cv_knn_13 <- cv_knn_accuracy(contraceptive_method~., 13, train_list, test_list)
cv_knn_14 <- cv_knn_accuracy(contraceptive_method~., 14, train_list, test_list)
cv_knn_16 <- cv_knn_accuracy(contraceptive_method~., 16, train_list, test_list)
cv_knn_17 <- cv_knn_accuracy(contraceptive_method~., 17, train_list, test_list)
cv_knn_19 <- cv_knn_accuracy(contraceptive_method~., 19, train_list, test_list)
cv_knn_20 <- cv_knn_accuracy(contraceptive_method~., 20, train_list, test_list)

cv_knn_1_m <- cv_knn_accuracy(contraceptive_method~., 1, train_list, test_list, distance=1)
cv_knn_2_m <- cv_knn_accuracy(contraceptive_method~., 2, train_list, test_list, distance=1)
cv_knn_4_m <- cv_knn_accuracy(contraceptive_method~., 4, train_list, test_list, distance=1)
cv_knn_5_m <- cv_knn_accuracy(contraceptive_method~., 5, train_list, test_list, distance=1)
cv_knn_7_m <- cv_knn_accuracy(contraceptive_method~., 7, train_list, test_list, distance=1)
cv_knn_8_m <- cv_knn_accuracy(contraceptive_method~., 8, train_list, test_list, distance=1)
cv_knn_10_m <- cv_knn_accuracy(contraceptive_method~., 10, train_list, test_list, distance=1)
cv_knn_11_m <- cv_knn_accuracy(contraceptive_method~., 11, train_list, test_list, distance=1)
cv_knn_13_m <- cv_knn_accuracy(contraceptive_method~., 13, train_list, test_list, distance=1)
cv_knn_14_m <- cv_knn_accuracy(contraceptive_method~., 14, train_list, test_list, distance=1)
cv_knn_16_m <- cv_knn_accuracy(contraceptive_method~., 16, train_list, test_list, distance=1)
cv_knn_17_m <- cv_knn_accuracy(contraceptive_method~., 17, train_list, test_list, distance=1)
cv_knn_19_m <- cv_knn_accuracy(contraceptive_method~., 19, train_list, test_list, distance=1)
cv_knn_20_m <- cv_knn_accuracy(contraceptive_method~., 20, train_list, test_list, distance=1)

l <- rbind(cv_knn_1, cv_knn_2, cv_knn_4, cv_knn_5, cv_knn_7, cv_knn_8, cv_knn_10, cv_knn_11, cv_knn_13, cv_knn_14, cv_knn_16, cv_knn_17, cv_knn_19, cv_knn_20)
l <- cbind(l, apply(l, 1, mean))

l_m <- rbind(cv_knn_1_m, cv_knn_2_m, cv_knn_4_m, cv_knn_5_m, cv_knn_7_m, cv_knn_8_m, cv_knn_10_m, cv_knn_11_m, cv_knn_13_m, cv_knn_14_m, cv_knn_16_m, cv_knn_17_m, cv_knn_19_m, cv_knn_20_m)
l_m <- cbind(l_m, apply(l_m, 1, mean))

round(l, 3)
round(l_m, 3)

# Knn en train del mejor modelo
cv_knn_16_m_train <- cv_knn_accuracy_train(contraceptive_method~., 16, train_list, test_list, distance=1)


# Comprobamos normalidad para LDA
df_contraceptive.numeric <- apply(df_contraceptive, 2, function(x) if (is.numeric(x)) x else as.numeric(as.factor(x)))
normality_test <- apply(df_contraceptive.numeric, 2, function(x) shapiro.test(x))
# Comprobamos variabilidad para LDA
var_test <- apply(df_contraceptive.numeric, 2, function(x) var(as.numeric(as.factor(x))))

# Pasamos a numérico las clases
train_list <- lapply(train_list, function(x) as.data.frame(apply(x, 2, function(y) if (is.numeric(y)) y else as.numeric(as.factor(y)))))
test_list <- lapply(test_list, function(x) as.data.frame(apply(x, 2, function(y) if (is.numeric(y)) y else as.numeric(as.factor(y)))))

# Función para aplicar LDA o QDA en validación cruzada
run_method_cv <- function(method, formula, train_list, test_list) {
  sapply(1:length(train_list), function(i) {
    # Aplicamos modelo
    fit <- method(formula,data=train_list[[i]])
    # Calculamos predicciones
    preds <- predict(fit, test_list[[i]])
    # Calculamos la precisión
    sum(preds$class == test_list[[i]]$contraceptive_method) / length(preds$class)
  })
}

# Calculamos CV para LDA
lda_cv <- run_method_cv(lda, contraceptive_method ~ ., train_list, test_list)

# Comprobamos varianza por clases en QDA
df_contraceptive.numeric <- as.data.frame(df_contraceptive.numeric)
sub1 <- subset(df_contraceptive.numeric, contraceptive_method==1)
sub2 <- subset(df_contraceptive.numeric, contraceptive_method==2)
sub3 <- subset(df_contraceptive.numeric, contraceptive_method==3)
var_test_class1 <- apply(sub1, 2, function(x) var(as.numeric(as.factor(x))))
var_test_class2 <- apply(sub2, 2, function(x) var(as.numeric(as.factor(x))))
var_test_class3 <- apply(sub3, 2, function(x) var(as.numeric(as.factor(x))))

# Aplicamos QDA en Validación Cruzada.
qda_cv <- run_method_cv(qda, contraceptive_method ~ ., train_list, test_list)


# Generamos tabla para test estadísticos
all_results <- cbind(cv_knn_16_m, lda_cv, qda_cv)

# Aplicamos friedman
test_friedman <- friedman.test(as.matrix(all_results))

# Mirar valor de accuracy en training en QDA y LDA
run_method_cv_train <- function(method, formula, train_list, test_list) {
  sapply(1:length(train_list), function(i) {
    # Aplicamos modelo
    fit <- method(formula,data=train_list[[i]])
    # Calculamos predicciones
    preds <- predict(fit, train_list[[i]])
    # Calculamos la precisión
    sum(preds$class == train_list[[i]]$contraceptive_method) / length(preds$class)
  })
}
  
# Miramos los valores de training
cv_lda_train <- run_method_cv_train(lda, contraceptive_method ~ ., train_list, test_list)
cv_qda_train <- run_method_cv_train(qda, contraceptive_method ~ ., train_list, test_list)
cbind(cv_knn_16_m_train, cv_lda_train, cv_qda_train)
