# This is the continuation to exploratory analysis in r
install.packages("ggplot2")
library(ggplot2)


with(data = airquality, { ## Draws a graph with temperature and ozone 
  plot(Temp, Ozone, col = "black", pch = 20)
  lines(loess.smooth(x = Temp, y = Ozone))  
})

ggplot(data = airquality, aes(Temp, Ozone)) + ## Draws the same graph using ggplot package
          ## Necessary for drawing points and smooth line
          geom_point() + geom_smooth(method = "loess", se = FALSE)

# Using qplot function in the ggplot2 package 
data(mpg)
qplot(x = displ, y = hwy, data = mpg, color = drv) ## Drawing a scatterplot and Indicating different drv
qplot(x = displ, y = hwy, data = mpg, geom = c("smooth","point")) ## Using geom in qplot (should use point when overlaying smooth)
qplot(x = hwy, data = mpg, fill = drv, binwidth = 2) ## Draws a histogram
qplot(x = hwy, data = mpg, facets = drv ~., binwidth = 2, fill = drv) ## Separate the histogram by drv (Separating by Row)
qplot(x = drv, y = hwy, data = mpg, geom = "boxplot") ## Draws a boxplot     
qplot(x = displ, y = hwy, data = mpg, facets = .~drv) + geom_smooth()
       
# Using ggplot function
maacs <- read.csv(file = "data/bmi_pm25_no2_sim.csv")
g <- ggplot(data = maacs, mapping = aes(x = logpm25, y = NocturnalSympt)) ## Setup a plot parameter
g + geom_point() + geom_smooth(method = "lm") + facet_grid(.~bmicat) ## Draw scatterpoint + smooth line + separate the graph by factor

g + geom_point(color = "steelblue", size = 4, alpha = 0.2) ## Geompoint properties
g + geom_point(aes(color = bmicat), size = 4, alpha = 0.3) + ## Add legends to the plot
    labs(title = "MAACS Cohort") +
    labs(x = expression("log " * PM[2.5]), y = "Nocturnal Symptoms")
g + geom_point(aes(color = bmicat)) + theme_bw(base_family = "Times")
