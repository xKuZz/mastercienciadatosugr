## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library("ggplot2")
library("dplyr")


## ------------------------------------------------------------------------
stretch <- c(46, 54, 48, 50, 44, 42, 52)
distance <- c(148, 182, 173, 166, 198, 141, 166)
df <- as.data.frame(cbind(stretch, distance))


## ------------------------------------------------------------------------
ggplot(df, aes(x=stretch, y=distance)) + geom_point()


## ------------------------------------------------------------------------
year <- 1970:1979
snow.cover <- c(6.5, 12, 14.9, 10, 10.7, 7.9, 21.9, 12.5, 14.5, 9.2)
df <- as.data.frame(cbind(year, snow.cover))
df


## ------------------------------------------------------------------------
ggplot(df, aes(x=year, y=snow.cover)) + geom_point()


## ------------------------------------------------------------------------
ggplot(df, aes(x=year, y=snow.cover)) + geom_line()


## ------------------------------------------------------------------------
ggplot(df, aes(snow.cover)) + geom_histogram()


## ------------------------------------------------------------------------
ggplot(df, aes(snow.cover)) + geom_histogram(binwidth = 0.2)


## ------------------------------------------------------------------------
ggplot(df, aes(snow.cover)) + geom_density()


## ------------------------------------------------------------------------
df <- read.csv("weather_data_nyc_centralpark_2016.csv", na.strings="T")


## ------------------------------------------------------------------------
to_degrees <- function(f) (f-32)/1.8
to_mm <- function(i) i*25.4
names(df)[1] <- "date"
df <- df %>% mutate(date=as.Date(date, format="%d-%m-%y"),
                    maximum.temerature=to_degrees(maximum.temerature),
                    minimum.temperature=to_degrees(minimum.temperature),
                    average.temperature=to_degrees(average.temperature),
                    precipitation=to_mm(precipitation),
                    snow.fall=to_mm(snow.fall),
                    snow.depth=to_mm(snow.depth))


## ------------------------------------------------------------------------
ggplot(df, aes(x=date, y=minimum.temperature)) + geom_point()


## ------------------------------------------------------------------------
ggplot(df, aes(x=date, y=minimum.temperature)) + geom_line()


## ------------------------------------------------------------------------
ggplot(df, aes(x=date)) + geom_line(aes(y=minimum.temperature), col="blue") +
         geom_line(aes(y=maximum.temerature), col="red") + ggtitle("Temperatura máxima y mínima según fecha") + ylab("Temperatura")

