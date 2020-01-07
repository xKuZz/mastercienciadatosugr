## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)


## ----io1-----------------------------------------------------------------
string <- readline("Introduzca un string: ") # Hola
numero <- readline("Introduzca un número: ") # 5
paste(rep(string, numero), collapse = "")


## ----io2-----------------------------------------------------------------
# Creamos las tablas.
limite <- 10
tabla_dos <- seq(2, 2 * limite, 2)
tabla_tres <- seq(3, 3 * limite, 3)
tabla_cinco <- seq(5, 5 * limite, 5)

# Las escribimos en un archivo.
write.table(tabla_dos, "dos.txt", row.names=FALSE, col.names=FALSE)
write.table(tabla_tres, "tres.txt", row.names=FALSE, col.names=FALSE)
write.table(tabla_cinco, "cinco.txt", row.names=FALSE, col.names=FALSE)


## ----io3-----------------------------------------------------------------
tabla_dos <- scan("dos.txt")
tabla_tres <- scan("tres.txt")
tabla_cinco <- scan("cinco.txt")

matriz <- cbind(tabla_dos, tabla_tres, tabla_cinco)
matriz


## ----io4-----------------------------------------------------------------
write.csv(matriz[1:5,], "prime.txt", row.names=F)
write.csv(matriz[6:10,], "fin.txt", row.names=F)


## ----io5-----------------------------------------------------------------
f <- readline("Introduzca el número de filas: ") # 3
c <- readline("Introduzca el número de columnas: ") # 5

# Generamos una fila con c columnas sin separación.
fila <- paste(rep('x', c), collapse = "")

# Repetimos el patrón en f filas.
salida <- paste(rep(fila, f), collapse='\n')

# Lo mostramos por pantalla.
cat(salida)

