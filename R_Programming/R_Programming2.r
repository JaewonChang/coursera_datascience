# Continuation of introduction to R programming basics

# Subsetting a vector
x <- c("a", "a", "b", "b", "c", "d")
x[1] ## First element
x[3] ## Third element
x[1:4]; x[c(1, 2, 3)]
x[x > "b"] ## a logical sequence to extract elements

# Subsetting a matrix
x <- matrix(data = 1:6, nrow = 2, ncol = 3)
x[1, 2] ## Element in the first row second column
x[1, ] ## Extract all the elements in first row
x[1, 2, drop = FALSE] ## Extract as matrix

# Subsetting a list
x <- list(foo = 1:4, bar = 0.6)
x[[1]]; x$foo; x["foo"] ## Gives out same result 
x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))
x[[c(1, 3)]]; x[[1]][[3]] ## Extracts the single element

# Removing NA values
x <- c(1, 2, NA, 4, NA, 6)
bad <- is.na(x) ## True for NA or NaN
x[!bad]
good <- complete.cases(x) ## Grabs read values
x[good]

head(airquality) ## To Test the complete.cases in data.frame
good <- complete.cases(airquality) 
head(airquality[good, ])

# Matrix Operation
x <- matrix(data = 1:4, nrow = 2, ncol = 2) ## Create the matrix 
y <- matrix(data = rep(x = 10, 4), nrow = 2, ncol = 2) ## Create the matrix with same values
x * y; x /y; x %*% y ## Last one is the matrix multiplication operation

# Date Object
datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")
x <- strptime(x = datestring, format = "%B %d, %Y %H:%M")

# Managing Data Frame with the dplyr package
install.packages("dplyr")
library(dplyr) ## Load the data

chicago <- readRDS("data/chicago.rds") ## Read the rds file from the folder

subset <- select(.data = chicago, city:date) ## selects the column to subset
subset_by_2 <- select(.data = chicago, ends_with("2"))
subset_by_alphabet <- select(.data = chicago, starts_with("d"))

subset <- filter(.data = chicago, dptp > 30 & tmpd > 70) ## filters the data frame's row

arrange.date <- arrange(.data = chicago, date) ## arrange the data by date
arrange.date.descending <- arrange(.data = chicago, desc(date))

rename.chicago.data <- rename(.data = chicago, dewpoint = dptp, pm25 = pm25tmean2) ## Change the column name of the data frame

add.variable.data <- mutate(.data = chicago, pm25.10.minus = pm25tmean2 - pm10tmean2) ## add another column to the data frame
just.variable <- transmute(.data = chicago, pm25.10.minus = pm25tmean2 - pm10tmean2)  ## just the added column

chicago.add.date <- mutate(.data = chicago, year = as.POSIXlt(date)$year + 1900) ## Summarize the data by date 
years <- group_by(chicago.add.date, year)
summarize(years, pm25 = mean(pm25tmean2, na.rm = T), 
          pm10 = max(pm10tmean2, na.rm = T))

# Pipeline operator
mutate(.data = chicago, month = as.POSIXlt(date)$mon + 1) %>%
    group_by(month) %>%
    summarize(pm25 = mean(x = pm25tmean2, na.rm = T),
              pm10 = max(x = pm10tmean2, na.rm = T))

              