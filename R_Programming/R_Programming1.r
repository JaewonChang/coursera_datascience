# This is the brief introduction to R language

# Assigning the variable
x <- 1
print(x)

# R objects (Five basic or atomic classes)
# character, numeric, integer, complex, logical

# Creating vectors
x <- c(0.5, 0.6) ## numeric
x <- c(TRUE, FALSE) ## logical, T and F works well too
x <- c("a", "b", "c") ## character
x <- 9:29 ## integer
x <- c(1 + 0i, 2 + 4i) ## complex
vector(mode = "logical", length = 2) ## another way of creating a vector

# Mixing Objects
y <- c(1.7, "a") ## Becomes character
y <- c(TRUE, 2)  ## Becomes numeric
y <- c(TRUE, "a") ## Becomes character

# Creating Matrix
m <- matrix(data = 1:6, nrow = 3, ncol = 3) ## Starting from first column
dim(m) ## dimension of the matrix
m <- 1:10 
dim(m) <- c(2, 5) 
print(m)

x <- 1:3; y <- 10:12
cbind(x, y) ## Column-Binding
rbind(x, y) ## Row-Binding

# Creating List
created_list <- list(TRUE, 3.0, 7, "a", 1 + 0i) ## Can contain elements of different classes

# Mixing Values (NaN, NA)
x <- c(1, 2, NA, 10, 3)
is.na(x) ## Logical vector with F and T's
is.nan(x) ## NaN values are NA but converse is not true
y <- c(1, 3, NaN, NA, NA)
is.na(y)
is.nan(y)

# Creating Data.Frame
x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
data.matrix(x) ## Change the dataframe into matrix

# Reading From a URL connection
con <- url(description = "http://www.naver.com", "r") ## Opens the URL connection for reading
x <- readLines(con) ## Read the web page
close.connection(con)
