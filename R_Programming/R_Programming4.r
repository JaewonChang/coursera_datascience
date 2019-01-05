## Continuation of Introduction to R_Programming

# Writes the function that prints string specified number of times
first_function <- function(num = 1) { ## Default parameter with one
  hello <- "Hello, world!\n"
  for (i in seq_len(num)) { 
    cat(hello)
  }
  chars <- nchar(x = hello) * num 
  chars ## This will also be return value otherwise type return(chars)
}
first_function(num = 3)

# Lapply: loop over a list
# Sapply: Same as lapply but simplifies the result
# apply: loop over a matrix margin
# tapply: loop over subset of a vector

# Loop functions (lapply and sapply)
x <- list(a = 1:5, b = rnorm(n = 10))
lapply(X = x, FUN = mean)
sapply(X = x, FUN = mean)
x <- 1:5
lapply(X = x, FUN = runif, min = 0, max = 10)
x <- list(a = matrix(data = 1:4, nrow = 2, ncol = 2), b = matrix(data = 1:6, nrow = 3, ncol = 2))
lapply(X = x, FUN = function(elt) elt[,1])

# Split Function
data("airquality")
s <- split(x = airquality, f = airquality$Month)
lapply(X = s, FUN = function(x) {
  colMeans(x = x[, c("Ozone", "Solar.R")], na.rm = T)
})

# Tapply Function
x <- c(rnorm(10), runif(10), rnorm(10))
f <- gl(3, 10) # it generates the factor levels
tapply(X = x, INDEX = f, FUN = mean)

# Apply Function
# rowSums = apply(data, 1, sum)
# rowMeans = apply(data, 1, mean)
# colSums = apply(data, 2, sum)
# colMeans = apply(data, 2, mean)
x <- matrix(data = rnorm(200), nrow = 20, ncol = 10)
apply(X = x, MARGIN = 2, FUN = mean) ## MARGIN 2 for column and 1 for row


