# This is the introduction to exploratory analysis in r

class <- c("numeric", "character", "factor", "numeric", "numeric")
pollution <- read.csv(file = "data/avgpm25.csv", colClasses = class) ## Read the data from the folder

# Run basic statistical analysis on the given data
summary(object = pollution$pm25) ## Brief statistcal summary of pm25
boxplot(x = pollution$pm25, col = "blue")
boxplot(formula = pm25 ~ region, data = pollution, col = "blue") ## Boxplot

install.packages("maps")
library(dplyr); library(maps)
filter(.data = pollution, pm25 > 15) ## We see that the outliers are in the west region (california)
map(database = "county", regions = "california") ## Draws a map
with(filter(.data = pollution, pm25 > 15), points(longitude, latitude, pch = 20))

hist(x = pollution$pm25, col = "green", breaks = 100) ## Draw a histogram
abline(v = mean(pollution$pm25), col = "red", lwd = 2) ## Draw a vertical line at the mean
abline(v = median(pollution$pm25), col = "blue", lwd = 2) ## Draw a vertical line at the median
rug(x = pollution$pm25)

table(... = pollution$region) %>% barplot(col = "wheat") ## Creat a barplots

## Now let's draw scatterplot
with(data = pollution, plot(x = latitude, y = pm25, col = region, xlab = "Latitude", ylab = "PM25"))
abline(h = 12, lwd = 2, lty = 2)
with(data = filter(.data = pollution, region == "west"), plot(x = latitude, y = pm25, main = "west")) 
with(data = subset(x = pollution, subset = region == "east"), plot( x = latitude, y = pm25, main = "east"))

## pdf(file = ".pdf") and close with dev.off() to save in directory
data("airquality") ## Use the airquality data 
with(data = airquality, {  ## Draw plot and smooth line with the given parameter
  plot(x = Temp, y = Ozone)
  lines(loess.smooth(x = Temp, y = Ozone))
})


