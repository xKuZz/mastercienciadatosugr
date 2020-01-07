## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)


## ----func1---------------------------------------------------------------
impares <- function(v) {
  length(which(v%%2==1))
}
prueba <- 1:10
n_impares <- impares(prueba)
n_impares


## ----func2---------------------------------------------------------------
cambio <- function(m) {
  m[which(is.na(m))] <- 0
  m
}

matriz <- matrix(1:9, nrow=3, ncol=3)
matriz[2,2] <- NA
matriz[3,1] <- NA
matriz <- cambio(matriz)
matriz


## ----func3---------------------------------------------------------------
unir <- function(v1, v2) {
  union(v1, v2)
}

v1 <- c(1,2,3,4,5,9)
v2 <- c(4,5,6,7,8,9,10)

v_out <- unir(v1, v2)
v_out



## ----func4---------------------------------------------------------------
vyc <- function(s) {
  letras <- unlist(strsplit(s, ''))
  pos_vocales <- grep("[aeiou]", letras)
  vocales <- letras[pos_vocales]
  consonantes <- letras[-pos_vocales]
  list(consonantes, vocales)
}

my_vic <- vyc("Prueba")
my_vic


## ----func5---------------------------------------------------------------
partir <- function(v, x, y=F) {
  pos_ini <- which(v==x)[1]
  if (y) {
    pos_fin <- which(v==y)[1]
  }
  else {
    pos_fin <- length(v)
  }
  v[pos_ini:pos_fin]
}

v <- c(1,2,3,4,5,3)
partir(v, 3, 5)

## ----func5out2-----------------------------------------------------------
partir(v,2)

