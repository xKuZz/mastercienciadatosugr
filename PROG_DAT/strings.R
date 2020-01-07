## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)


## ----strings1------------------------------------------------------------
nombre <- c("David", "Criado", "Ramon")
nombre_abreviado <- paste(substr(nombre[1],1,1), nombre[2], nombre[3])
nombre_abreviado <- paste(nombre_abreviado, '.', sep='')
nombre_abreviado


## ----strings2------------------------------------------------------------
# Creamos un vector con varias fechas.
fechas <- c("1996-10-07", "2019-10-24", "2015-01-13", "2005-11-28")

# Extraemos los números y los pasamos a enteros.
fechas_descompuestas <- strsplit(fechas, split='-')
fechas_descompuestas <- as.integer(unlist(fechas_descompuestas))

# Seleccionamos los meses.
indices_meses <- seq(2, 2 + 3 * (length(fechas) - 1), 3)
meses <- fechas_descompuestas[indices_meses]

# Comprobamos si son impares.
meses_impares_pos <- which(meses%%2==1)

# Mostramos las fechas con meses impares.
fechas_impares <- fechas[meses_impares_pos]
fechas_impares


## ----strings3------------------------------------------------------------
frase <- "Esto es una frase, pero no cualquier frase"
# Descomponemos la frase tomando como puntos de separación
# el espacio o la coma seguida de espacio.
frase_descompuesta <- unlist(strsplit(frase, split= " |, "))
frase_descompuesta


## ----strings4------------------------------------------------------------
palabras <- c("hola", "azul", "naranja", "verde", "lata", "saco", "bola", "bolo", "vela")

# Seleccionamos todoas las palabras que contienen a o e.
# quitando aquellas que contienen i, o, u.
palabras_ae <- palabras[grep("[ae]", palabras)]

palabras_solo_ae <- palabras_ae[-grep("[iou]", palabras_ae)]
palabras_solo_ae



## ----strings5------------------------------------------------------------
dia <- c(31,5,7,11,28,31,2,25,30)
mes <- c(9,1,5,4,6,2,3,4,7)
anno <- c(2003,2007,2010,1995,1996,2013,2018,2019,2010)

# Juntamos las fechas en un string.
fechas_str <- paste(dia, mes, anno, sep='-')
fechas <- as.Date(fechas_str, format = "%d-%m-%Y")

# Eliminamos fechas inválidas (NA)
fechas <- na.exclude(fechas)
fechas

