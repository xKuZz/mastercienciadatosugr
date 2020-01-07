## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)


## ------------------------------------------------------------------------
new_hope <- c(460.998007, 314.4)
empire_strikes <- c(290.475067, 247.9)
return_jedi = c(309.306177, 165.8)


## ------------------------------------------------------------------------
star_wars_matrix <- matrix(c(new_hope, empire_strikes, return_jedi), 3, 2, byrow=T)
star_wars_matrix


## ------------------------------------------------------------------------
rownames(star_wars_matrix) <- c("New Hope", "Empire Strikes", "Return Jedi")
colnames(star_wars_matrix) <- c("Ventas USA", "Ventas resto países")
star_wars_matrix


## ------------------------------------------------------------------------
worldwide_vector = star_wars_matrix[,1] + star_wars_matrix[,2]
worldwide_vector


## ------------------------------------------------------------------------
all_wars_matrix <- cbind(star_wars_matrix, worldwide_vector)
all_wars_matrix


## ------------------------------------------------------------------------
colSums(star_wars_matrix)


## ------------------------------------------------------------------------
non_us_all <- mean(star_wars_matrix[,2])
non_us_all


## ------------------------------------------------------------------------
non_us_some <- mean(star_wars_matrix[1:2,2])
non_us_some


## ------------------------------------------------------------------------
M <- star_wars_matrix * 100000 / 5
colnames(M) <- c("Entradas USA", "Entradas resto países")
M


## ------------------------------------------------------------------------
i <- array(c(1:10),dim=c(5,2))
i

## ------------------------------------------------------------------------
dim(i)


## ------------------------------------------------------------------------
nrow(i)


## ------------------------------------------------------------------------
ncol(i)


## ------------------------------------------------------------------------
datos <- read.table("array_datos.txt")
datos


## ------------------------------------------------------------------------
write.csv2(datos, file = "array_datos.csv", row.names = F)

