## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library("dplyr")
library("ggplot2")
library("car")


## ------------------------------------------------------------------------
hip <- read.table("http://astrostatistics.psu.edu/datasets/HIP_star.dat",
                  header=T, fill=T)


## ------------------------------------------------------------------------
dim(hip)


## ------------------------------------------------------------------------
sapply(hip, class)


## ------------------------------------------------------------------------
head(hip)


## ------------------------------------------------------------------------
head(hip$RA, n=100)


## ------------------------------------------------------------------------
print("Medias")
sapply(hip, mean, na.rm=T)


## ------------------------------------------------------------------------
print("Medianas")
sapply(hip, median, na.rm=T)


## ------------------------------------------------------------------------
print("Mínimos")
sapply(hip, min, na.rm=T)


## ------------------------------------------------------------------------
print("Máximos")
sapply(hip, max, na.rm=T)


## ------------------------------------------------------------------------
print("Mínimos y máximos")
sapply(hip, range, na.rm=T)


## ------------------------------------------------------------------------
print("Varianza, Desviación estándar, Desviación absoluta de la mediana")
c(var(hip$RA, na.rm=T), sd(hip$RA, na.rm=T), mad(hip$RA, na.rm=T))


## ------------------------------------------------------------------------
f = function(x) c(median(x), mad(x))  
f(hip[,3])



## ------------------------------------------------------------------------
apply(hip, 2, f)


## ------------------------------------------------------------------------
quantile(hip$RA, c(0.1, 0.5))


## ------------------------------------------------------------------------
quantile(hip$RA)


## ------------------------------------------------------------------------
summary(hip)


## ------------------------------------------------------------------------
hasNA = function(x) any(is.na(x)) 
apply(hip,2,hasNA)


## ------------------------------------------------------------------------
min(hip$B.V)


## ------------------------------------------------------------------------
apply(hip, 2, mean)


## ------------------------------------------------------------------------
hip1 = na.omit(hip)
apply(hip1, 2, mean)


## ------------------------------------------------------------------------
boxplot(hip)


## ------------------------------------------------------------------------
ggplot(hip, aes(x=RA, y=DE)) + 
  geom_point(col=ifelse(hip$DE > 0, "red", "green"))


## ------------------------------------------------------------------------
ggplot(hip, aes(x=RA, y=pmRA)) + geom_point(col="green")


## ------------------------------------------------------------------------
ggplot(hip, aes(x=RA, y=pmRA)) + geom_point(col="green") +
  geom_smooth(method=lm, formula = y ~ x + I(x^2))


## ------------------------------------------------------------------------
scatterplotMatrix(hip)


## ------------------------------------------------------------------------
hyades <- hip %>% filter(between(RA,50,100) &
                  between(DE, 0, 25) &
                  between(pmRA, 90, 130) &
                  between(pmDE, -60, -10) &
                  e_Plx < 5 &
                  (Vmag > 4 | B.V < 0.2))
dim(hyades)


## ------------------------------------------------------------------------
ggplot(hyades, aes(x=Vmag, y=B.V)) + geom_point(col="green")


## ------------------------------------------------------------------------
ggplot(hyades, aes(x=Vmag, y=B.V)) + geom_point(col="green") +
       geom_smooth(method="lm")


## ------------------------------------------------------------------------
head(iris)

## ------------------------------------------------------------------------
summary(iris)


## ------------------------------------------------------------------------
ggplot(iris, aes(x=Petal.Width)) + 
  geom_histogram(bins = 9, fill="blue", col="black") +
  labs(title="Histogram of Petal Width") + xlab("Petal Width")



## ------------------------------------------------------------------------
ggplot(iris, aes(x=Petal.Length)) + 
  geom_histogram(bins = 9, fill="blue", col="black") +
  labs(title="Histogram of Petal Length") + xlab("Petal Length")


## ------------------------------------------------------------------------
ggplot(iris, aes(x=Sepal.Width)) + 
  geom_histogram(bins = 9, fill="blue", col="black") +
  labs(title="Histogram of Sepal Width") + xlab("Sepal Width")


## ------------------------------------------------------------------------
ggplot(iris, aes(x=Sepal.Length)) + 
  geom_histogram(bins = 9, fill="blue", col="black") +
  labs(title="Histogram of Sepal Length") + xlab("Sepal Length")


## ------------------------------------------------------------------------
# No tomamos la especie para los cuartiles.
apply(iris[,1:4], 2, quantile)


## ------------------------------------------------------------------------
ggplot(iris, aes(x=Species, y=Petal.Width)) + geom_boxplot()


## ------------------------------------------------------------------------
df_setosa <- subset(iris[-5], iris$Species=="setosa")
df_versicolor <- subset(iris[-5], iris$Species=="versicolor")
df_virginica <- subset(iris[-5], iris$Species=="virginica")
q_setosa <- apply(df_setosa, 2, quantile)
q_versicolor <- apply(df_versicolor, 2, quantile)
q_virginica <- apply(df_virginica, 2, quantile)
colnames(q_setosa) <- paste0(colnames(q_setosa), ".Setosa")
colnames(q_versicolor) <- paste0(colnames(q_versicolor), ".Versicolor")
colnames(q_virginica) <- paste0(colnames(q_virginica), ".Virginica")
df_quantiles_iris <- as.data.frame(cbind(q_setosa, q_versicolor, q_virginica))
df_quantiles_iris$Percentil <- seq(0,100,25)
df_quantiles_iris

## ------------------------------------------------------------------------
library(reshape2)
# Utilizo melt de reshape2 para facilitar pintar muchos gráficos de líneas.
df_quantiles_iris2 <- melt(df_quantiles_iris, id.var="Percentil")
names(df_quantiles_iris2) <-c("Percentil", "Variable", "Valor")

ggplot(df_quantiles_iris2, aes(x=Percentil, y=Valor, colour=Variable)) +
  geom_line()


## ------------------------------------------------------------------------
ggplot(iris, aes(x=Species, y=Petal.Length)) + geom_boxplot()


## ------------------------------------------------------------------------
scatterplotMatrix(iris[-5])


## ------------------------------------------------------------------------
iris %>% mutate(proporcion=Sepal.Length/Sepal.Width)


## ------------------------------------------------------------------------
swiss


## ------------------------------------------------------------------------
ggplot(swiss, aes(x=Fertility)) + geom_density()
ggplot(swiss, aes(x=Agriculture)) + geom_density()
ggplot(swiss, aes(x=Examination)) + geom_density()
ggplot(swiss, aes(x=Education)) + geom_density()
ggplot(swiss, aes(x=Catholic)) + geom_density()
ggplot(swiss, aes(x=Infant.Mortality)) + geom_density()


## ------------------------------------------------------------------------
boxplot(swiss)


## ------------------------------------------------------------------------
ggplot(swiss, aes(x=Fertility, y=Catholic)) + geom_point()


## ------------------------------------------------------------------------
ggplot(swiss, aes(x=Education, y=Agriculture)) + geom_point()


## ------------------------------------------------------------------------
library("classifly")
olives


## ------------------------------------------------------------------------
scatterplotMatrix(olives[,3:length(olives)])


## ------------------------------------------------------------------------
boxplot(olives)

## ------------------------------------------------------------------------
boxplot(olives[-6])


## ------------------------------------------------------------------------
library("HSAUR2")
Lanza


## ------------------------------------------------------------------------
ggplot(Lanza, aes(x=study)) + geom_bar()


## ------------------------------------------------------------------------
ggplot(Lanza, aes(classification)) + geom_bar()


## ------------------------------------------------------------------------
library("vcdExtra")


## ------------------------------------------------------------------------
df_cancer <- as.data.frame(Cancer)
df_cancer1 <- df_cancer %>% group_by(Survival, Grade) %>% summarize(Freq=sum(Freq))
df_cancer2 <- df_cancer %>% group_by(Survival, Center) %>% summarize(Freq=sum(Freq))
ggplot(df_cancer1, aes(x=Survival, y=Freq, group=Grade, fill=Grade)) +
  geom_bar(stat="identity", position="dodge")

ggplot(df_cancer2, aes(x=Survival, y=Freq, group=Center, fill=Center)) +
  geom_bar(stat="identity", position="dodge")
  


## ------------------------------------------------------------------------
library("MASS")
scatterplotMatrix(crabs[,3:length(crabs)])


## ------------------------------------------------------------------------
frost <- as.data.frame(state.x77)$Frost


## ------------------------------------------------------------------------
class(frost)


## ------------------------------------------------------------------------
cut(frost, 3)


## ------------------------------------------------------------------------
cut(frost, 3, include.lowest=TRUE)


## ------------------------------------------------------------------------
frost <- cut(frost, 3, include.lowest=TRUE, labels=c("Bajo", "Medio", "Alto"))


## ------------------------------------------------------------------------
frost


## ------------------------------------------------------------------------
table(frost)


## ------------------------------------------------------------------------
library("dslabs")
library("tidyverse")


## ------------------------------------------------------------------------
murders


## ------------------------------------------------------------------------
murders %>% filter(population==max(population))


## ------------------------------------------------------------------------
murders %>% mutate(ratio=total/population) %>%
            filter(ratio==max(ratio))


## ------------------------------------------------------------------------
murders %>% mutate(ratio=total/population) %>%
            filter(ratio==min(ratio))


## ------------------------------------------------------------------------
murders %>% mutate(ratio=total/population) %>%
            arrange(region, ratio)


## ------------------------------------------------------------------------
murders %>% mutate(ratio=total/population) %>% 
            group_by(region) %>%
            summarize(mean(ratio))

