## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)


## ----struct1-------------------------------------------------------------
creciente <- function(v) {
  es_creciente <- T
  i <- 1
  while (i < length(v) && es_creciente) {
    if (v[i] >= v[i + 1]) {
      es_creciente <- F
    }
    i <- i + 1
  }
  es_creciente
}

v <- c(1,2,3,4,5,6,7)
creciente(v)


## ----struct1out2---------------------------------------------------------
v <- c(1,2,5,4,3,6,7)
creciente(v)


## ----struct2-------------------------------------------------------------
montecarlo <- function(x){
  hits <- 0
  for (i in 1:x){
    randoms <- runif(n=2, min=0, max=1)
    if (randoms[2] < randoms[1]^2){
      hits <- hits + 1
    }
  }
  hits / x
  
}

montecarlo(200)


## ----struct3-------------------------------------------------------------
lista <- list(c(1,3,2,4,5), c(3,2,1,6,7),c(5,4,3,2,1),c(7,8,5,10,2), c(9,8,7,6,5))
lista


## ----struct3order--------------------------------------------------------
lista_ordenada <- lapply(lista, sort)
lista_ordenada


## ----struct4-------------------------------------------------------------
# Creamos una matriz
matriz <- matrix(1:9, nrow=3, ncol=3)
# Encontramos los numeros impares
pos_neg <- which(abs(matriz)%%2==1)

# Los forzmaos a ser negativos
matriz_neg <- matriz
matriz_neg[pos_neg] <- -abs(matriz[pos_neg])
matriz_neg


## ----struct4part2--------------------------------------------------------
# Scamos el mínimo por columnas
mins <- apply(matriz_neg, 2, min)
mins


## ----struct5-------------------------------------------------------------
matriz <- matrix(c(6,8,4,11,7,3,9,1,10), nrow=3, ncol=3)
matriz


## ----struct5part2--------------------------------------------------------
mayor_que_siete <- function(v) {
  v[which(v>7)]
}
apply(matriz,1,mayor_que_siete)

