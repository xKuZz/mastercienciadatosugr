# Alumno: David Criado Ramón
# EDA contraceptive
library(VIM)
library(dplyr)
library(ggplot2)
library(corrplot)
# Lectura del dataset y comprobación de tipos
df_contraceptive <- read.csv("contraceptive.dat", comment.char="@", header=F)
class(df_contraceptive)
dim(df_contraceptive)
colnames(df_contraceptive) <- c("wife_age", "wife_education", "husband_education", "children", 
                                "wife_religion", "wife_working", "husband_occupation",
                                "standard_of_living", "media_exposure", "contraceptive_method")
class(df_contraceptive)
apply(df_contraceptive, 2, class)

# Pasamos a factores las clases
df_contraceptive$wife_education <- factor(df_contraceptive$wife_education, c(1,2,3,4), c("Bajo", "Medio bajo", "Medio alto", "Alto"), ordered=T)
df_contraceptive$husband_education <- factor(df_contraceptive$husband_education, c(1,2,3,4), c("Bajo", "Medio bajo", "Medio alto", "Alto"), ordered=T)
df_contraceptive$wife_religion <- factor(df_contraceptive$wife_religion, c(0,1), c("No Islámica", "Islámica"), ordered=T)
df_contraceptive$wife_working <- factor(df_contraceptive$wife_working, c(0,1), c("No", "Sí"), ordered=T)
df_contraceptive$husband_occupation <- factor(df_contraceptive$husband_occupation, c(1,2,3,4), c("Grupo 1", "Grupo 2", "Grupo 3", "Grupo 4"), ordered=T)
df_contraceptive$standard_of_living <- factor(df_contraceptive$standard_of_living, c(1,2,3,4), c("Bajo", "Medio bajo", "Medio alto", "Alto"),ordered=T)
df_contraceptive$media_exposure <- factor(df_contraceptive$media_exposure, c(0,1), c("Buen acceso", "Mal acceso"),ordered=T)
df_contraceptive$contraceptive_method <- factor(df_contraceptive$contraceptive_method, c(1,2,3), c("No usa", "Corto Plazo", "Largo plazo"))

# Medidas de tendencia central, dispersión y dominio
apply(df_contraceptive[,c(1,4)], 2, min, na.rm=T)
apply(df_contraceptive[,c(1,4)], 2, max, na.rm=T)
apply(df_contraceptive[,c(1,4)], 2, mean, na.rm=T)
apply(df_contraceptive[,c(1,4)], 2, median, na.rm=T)
apply(df_contraceptive[,c(1,4)], 2, sd, na.rm=T)
apply(df_contraceptive[,c(1,4)], 2, mad, na.rm=T)

moda <- function(x) as.integer(names(which.max(table(x))))
apply(df_contraceptive[,c(1,4)], 2, moda)

# Tablas para clases
apply(df_contraceptive[,-c(1,4)], 2, table)
# DETECCIÓN DE MISSING VALUES
aggr(df_contraceptive, col=c('blue','red'), numbers=TRUE,
     sortVars=TRUE, labels=names(df_contraceptive), cex.axis=.7, gap=3,
     ylab=c("Histogram of missing data","Pattern"))
# DETECCIÓN DE MUESTRAS DUPLICADAS
sum(duplicated(df_contraceptive))
df_contraceptive <- distinct(df_contraceptive)

# Actualización de medidas
apply(df_contraceptive[,c(1,4)], 2, min, na.rm=T)
apply(df_contraceptive[,c(1,4)], 2, max, na.rm=T)
apply(df_contraceptive[,c(1,4)], 2, mean, na.rm=T)
apply(df_contraceptive[,c(1,4)], 2, median, na.rm=T)
apply(df_contraceptive[,c(1,4)], 2, sd, na.rm=T)
apply(df_contraceptive[,c(1,4)], 2, mad, na.rm=T)
apply(df_contraceptive[,c(1,4)], 2, moda)

apply(df_contraceptive[,-c(1,4)], 2, table)
table(df_contraceptive$children)

# Gráficos que permitan visualizar los gráficos adecuadamente.
# 1. Histogramas de variables numéricas.
ggplot(df_contraceptive, aes(x=children)) + geom_histogram(aes(y=..density..), fill="lightblue", col="black", bins=8) +
  ggtitle("Número de hijos (8 bins)") + ylab("Densidad") + xlab("Número de hijos") + geom_density(color="darkred")
ggplot(df_contraceptive, aes(x=wife_age)) + geom_histogram(aes(y=..density..), fill="lightblue", col="black", bins=15) +
  ggtitle("Edad de la esposa (15 bins)") + ylab("Densidad") + xlab("Edad de la esposa") + geom_density(color="darkred")

# 2. Diagramas de barras
p1 <- ggplot(df_contraceptive, aes(x=wife_education)) + geom_bar(fill="lightblue") + 
  xlab("Nivel de educación de la esposa") + ylab("Recuento")
p2 <- ggplot(df_contraceptive, aes(x=husband_education)) + geom_bar(fill="lightblue") + 
  xlab("Nivel de educación del esposo") + ylab("Recuento")
p3 <- ggplot(df_contraceptive, aes(x=wife_religion)) + geom_bar(fill="lightblue") + 
  xlab("Religión de la esposa") + ylab("Recuento")
p4 <- ggplot(df_contraceptive, aes(x=wife_working)) + geom_bar(fill="lightblue") + 
  xlab("Esposa trabajando") + ylab("Recuento")
p5 <- ggplot(df_contraceptive, aes(x=husband_occupation)) + geom_bar(fill="lightblue") + 
  xlab("Ocupación del marido") + ylab("Recuento")
p6 <- ggplot(df_contraceptive, aes(x=standard_of_living)) + geom_bar(fill="lightblue") + 
  xlab("Nivel de vida") + ylab("Recuento")
p7 <- ggplot(df_contraceptive, aes(x=media_exposure)) + geom_bar(fill="lightblue") + 
  xlab("Exposición a medios de comunicación") + ylab("Recuento")
p8 <- ggplot(df_contraceptive, aes(x=contraceptive_method)) + geom_bar(fill="lightblue") + 
  xlab("Método anticonceptivo") + ylab("Recuento")

grid.arrange(p1, p2, p3, p4, p5, p6, p7
             , p8, ncol=2)

# Boxplot de variables categóricas
boxplot(df_contraceptive[,c(1,4)])


# Hipótesis 1: ¿Existe desconocimiento sobre el uso de anticonceptivos?
ggplot(df_contraceptive, aes(x=contraceptive_method, fill=media_exposure, label = stat(count))) + geom_bar(position="dodge") + 
  geom_text(stat='count', position = position_dodge(.9), vjust= -0.5, size=3) + xlab("Método anticonceptivo") + ylab("Recuento") + labs(fill="Medios de comunicación")

# Hipótesis 2: ¿Son más habituales los métodos anticonceptivos a corto plazo en parejas jóvenes y los de largo plazo en parejas de edad madura?
ggplot(df_contraceptive, aes(x=cut(wife_age, b=5, include.lowest = T), fill=contraceptive_method, label = stat(count))) + geom_bar(position="dodge") + 
  geom_text(stat='count', position = position_dodge(.9), vjust= -0.5, size=3) + xlab("Edad de la esposa") + ylab("Recuento") + labs(fill="Método anticonceptivo")

# Hipótesis 3: ¿Influye el número de hijos en el uso de métodos anticonceptivos?

# Creamos children.cat
b <- c(-Inf,0,1,4,Inf)
l <- c("Sin hijos", "Hijo único", "Algunos hijos", "Muchos hijos")
df_contraceptive$children.cat <- cut(df_contraceptive$children, breaks = b, labels=l)

ggplot(df_contraceptive, aes(x=children.cat, fill=contraceptive_method, label = stat(count))) + geom_bar(position="dodge") + 
  geom_text(stat='count', position = position_dodge(.9), vjust= -0.5, size=3) + xlab("Número de hijos") + ylab("Recuento") + labs(fill="Método anticonceptivo")

df_contraceptive$children <- NULL


