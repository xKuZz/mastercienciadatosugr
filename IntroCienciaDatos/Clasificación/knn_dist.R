library(philentropy)
setwd("/Users/Julian/Dropbox/docencia/Master Ciencia de Datos/Introduccion a la ciencia de datos")

normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

knn <- function(train, test, k, method){
  n.test <- nrow(test)
  n.train <- nrow(train)
  if (n.train + n.test <= k) stop("k can not be more than n-1")
  neigh <- matrix(0, nrow = n.test, ncol = k) 
  ddist <- NULL
  for(i in 1:n.test) {
    for(j in 1:n.train) {
      xmat <- rbind(test[i,], train[j,]) #we make a 2 row matrix combining the current test and train rows
      ddist[j] <- distance(as.data.frame(xmat), method, k)  #then we calculate the distance and append it to the ddist vector.
    }
    neigh[i, ] <- sort(ddist)[2:(k + 1)] 
  }
  return(neigh)
}

#wbcd <- read.csv("https://resources.oreilly.com/examples/9781784393908/raw/ac9fe41596dd42fc3877cfa8ed410dd346c43548/Machine%20Learning%20with%20R,%20Second%20Edition_Code/Chapter%2003/wisc_bc_data.csv")
wbcd <- read.csv("wisc_bc_data.csv", stringsAsFactors = TRUE)
rownames(wbcd) <- wbcd$id
wbcd$id <- NULL
wbcd_n <- as.data.frame(lapply(wbcd[2:31], normalize))

wbcd_train<-wbcd_n[1:469,]
wbcd_test<-wbcd_n[470:549,]
wbcd_nn <-knn(wbcd_train, wbcd_test ,3, method="euclidean") #Cambiar el tipo de distancia usada en el paquete philentropy