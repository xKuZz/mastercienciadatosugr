## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)


## ------------------------------------------------------------------------
library("VIM")
library(dplyr)
library(ggplot2)
library(corrplot)
df_baseball <- read.csv("baseball.dat", comment.char="@", header=F)
colnames(df_baseball) <- c("batting_average", "on_base_percentage", "runs", "hits", "doubles", "triples", "homeruns", "runs_batted_in", "walks", "strike_outs", "stolen_bases", "errors", 
                           "free_agency_eligibility", "free_agency", "arbitration_eligibility", "arbitration", "salary")
class(df_baseball)
apply(df_baseball, 2, class)


## ------------------------------------------------------------------------
dim(df_baseball)

## ------------------------------------------------------------------------
# Pasamos a factor
df_baseball$free_agency_eligibility <- as.factor(df_baseball$free_agency_eligibility)
df_baseball$free_agency <- as.factor(df_baseball$free_agency)
df_baseball$arbitration_eligibility <- as.factor(df_baseball$arbitration)
df_baseball$arbitration <- as.factor(df_baseball$arbitration)


## ------------------------------------------------------------------------
apply(df_baseball[-(13:16)], 2, min, na.rm=T)

## ------------------------------------------------------------------------
apply(df_baseball[-(13:16)], 2, max, na.rm=T)

## ------------------------------------------------------------------------
apply(df_baseball[-(13:16)], 2, mean, na.rm=T)


## ------------------------------------------------------------------------
apply(df_baseball[-(13:16)], 2, median, na.rm=T)


## ------------------------------------------------------------------------
apply(df_baseball[-(13:16)], 2, sd, na.rm=T)


## ------------------------------------------------------------------------
apply(df_baseball[-(13:16)], 2, mad, na.rm=T)


## ------------------------------------------------------------------------
# DETECCIÓN DE MUESTRAS DUPLICADAS
df_baseball[duplicated(df_baseball),]
# DETECCIÓN DE MISSING VALUES
 aggr(df_baseball, col=c('blue','red'), numbers=TRUE,
sortVars=TRUE, labels=names(df_baseball), cex.axis=.7, gap=3,
ylab=c("Histogram of missing data","Pattern"))


## ------------------------------------------------------------------------
# Qué pasa con los valores 0
df_baseball %>% filter(hits==1)
df_baseball %>% filter(strike_outs==1)
df_baseball %>% filter(runs==0)


## ------------------------------------------------------------------------
# TABLAS DE CONTIGENCIA
table(df_baseball$free_agency_eligibility)
table(df_baseball$free_agency)
table(df_baseball$arbitration_eligibility)
table(df_baseball$arbitration)


## ------------------------------------------------------------------------
# GENERACIÓN DE HISTOGRAMAS
ggplot(df_baseball, aes(x=batting_average)) + geom_histogram(aes(y=..density..), binwidth = 0.005, color="blue", fill="green") +
  ggtitle("Histograma de batting_average (binwidth 0.005)") + ylab("densidad") + geom_density(color="darkred")


## ------------------------------------------------------------------------
ggplot(df_baseball, aes(x=on_base_percentage)) + geom_histogram(aes(y=..density..), binwidth = 0.005, color="blue", fill="green") +
  ggtitle("Histograma de on_base_percentage (binwidth 0.005)") + ylab("densidad") + geom_density(color="darkred")


## ------------------------------------------------------------------------
ggplot(df_baseball, aes(x=runs)) + geom_histogram(aes(y=..density..), bins=40, color="blue", fill="green") +
  ggtitle("Histograma de runs (40 bins)") + ylab("densidad") + geom_density(color="darkred")

## ------------------------------------------------------------------------
ggplot(df_baseball, aes(x=hits)) + geom_histogram(aes(y=..density..), bins=60, color="blue", fill="green") +
  ggtitle("Histograma de hits (60 bins)") + ylab("densidad") + geom_density(color="darkred")

## ------------------------------------------------------------------------
ggplot(df_baseball, aes(x=doubles)) + geom_histogram(aes(y=..density..), bins=40, color="blue", fill="green") +
  ggtitle("Histograma de doubles (40 bins)") + ylab("densidad") + geom_density(color="darkred")

## ------------------------------------------------------------------------
ggplot(df_baseball, aes(x=triples)) + geom_histogram(aes(y=..density..), bins=15, color="blue", fill="green") +
  ggtitle("Histograma de triples (15 bins)") + ylab("densidad") + geom_density(color="darkred")


## ------------------------------------------------------------------------
ggplot(df_baseball, aes(x=homeruns)) + geom_histogram(aes(y=..density..), bins=40, color="blue", fill="green") +
  ggtitle("Histograma de homeruns (40 bins)") + ylab("densidad") + geom_density(color="darkred")


## ------------------------------------------------------------------------
ggplot(df_baseball, aes(x=runs_batted_in)) + geom_histogram(aes(y=..density..), bins=40, color="blue", fill="green") +
  ggtitle("Histograma de runs_batted_in (40 bins)") + ylab("densidad") + geom_density(color="darkred")


## ------------------------------------------------------------------------
ggplot(df_baseball, aes(x=walks)) + geom_histogram(aes(y=..density..), bins=50, color="blue", fill="green") +
  ggtitle("Histograma de walks (50 bins)") + ylab("densidad") + geom_density(color="darkred")


## ------------------------------------------------------------------------
ggplot(df_baseball, aes(x=strike_outs)) + geom_histogram(aes(y=..density..), bins=50, color="blue", fill="green") +
  ggtitle("Histograma de strike_outs (50 bins)") + ylab("densidad") + geom_density(color="darkred")


## ------------------------------------------------------------------------
ggplot(df_baseball, aes(x=stolen_bases)) + geom_histogram(aes(y=..density..), bins=30, color="blue", fill="green") +
  ggtitle("Histograma de stolen_bases (30 bins)") + ylab("densidad") + geom_density(color="darkred")


## ------------------------------------------------------------------------
ggplot(df_baseball, aes(x=errors)) + geom_histogram(aes(y=..density..), bins=30, color="blue", fill="green") +
  ggtitle("Histograma de errors (30 bins)") + ylab("densidad") + geom_density(color="darkred")


## ------------------------------------------------------------------------
ggplot(df_baseball, aes(x=salary)) + geom_histogram(aes(y=..density..), bins=40, color="blue", fill="green") +
  ggtitle("Histograma de salary (40 bins)") + ylab("densidad") + geom_density(color="darkred")

## ------------------------------------------------------------------------
df_baseball <- df_baseball %>% mutate(singles=hits - doubles - triples - homeruns)

## ------------------------------------------------------------------------
df_baseball %>% filter(singles < 0)


## ------------------------------------------------------------------------
df_baseball <- df_baseball %>% filter(!(singles < 0))

## ------------------------------------------------------------------------
df_baseball %>% arrange(desc(singles)) %>% select(singles) %>% head(10)


## ------------------------------------------------------------------------
ggplot(df_baseball, aes(x=singles)) + geom_histogram(aes(y=..density..), bins=50, color="blue", fill="green") +
ggtitle("Histograma de singles (50 bins)") + ylab("densidad") + geom_density(color="darkred")


## ------------------------------------------------------------------------
boxplot(df_baseball[-c(13:17)])


## ------------------------------------------------------------------------
y = cor(df_baseball[-c(13:16)], method="kendall")
corrplot(y, method="number")

## ------------------------------------------------------------------------
# Comprobación de hipótesis #1
# Homeruns vs Salario
ggplot(df_baseball, aes(x=homeruns, y=salary)) + geom_point() + geom_smooth(method="lm")


## ------------------------------------------------------------------------
# Comprobación de hipótesis #2
# Strike-out vs salario
ggplot(df_baseball, aes(x=strike_outs, y=salary)) + geom_point() + geom_smooth(method="lm")

## ------------------------------------------------------------------------
# Errors vs salario
ggplot(df_baseball, aes(x=errors, y=salary)) + geom_point() + geom_smooth(method="lm")

## ------------------------------------------------------------------------
# HIPÓTESIS #3 fue cogida de los histogramas anteriores
# HIPÓTESIS #4 free_ageny, arbitration (eligiblity) vs salario
ggplot(df_baseball,aes(y=salary)) + geom_boxplot(aes(x=arbitration_eligibility), fill="lightblue")


## ------------------------------------------------------------------------
ggplot(df_baseball,aes(y=salary)) + geom_boxplot(aes(x=free_agency_eligibility), fill="lightblue")

