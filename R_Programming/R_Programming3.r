# Continuation of introduction to R_Programming 

# If-else statement
x <- runif(n = 1, min = -5, max = 10)
if (x > 0) {
  x <- "Positive"
} else {
  x <- "Negative"
}
print(x)

# For Loops
x <- c("a", "b", "c", "d")
for (i in seq_along(x)) { ## seq_along function gives a sequence based on the length of an object
  print(x[i])
}
for (letter in x) print(letter) ## This works same as the code above

# Nested For Loops
x <- matrix(data = 1:6, nrow = 2, ncol = 3)
for (i in seq_len(nrow(x))) { ## seq_len must take a number as a parameter
  for (j in seq_len(ncol(x))) {
    print(x[i, j])
  }
}

# While Loop
z <- 5
set.seed(seed = 20) ## Set the seed for random number generation 
while (z >= 3 && z <= 10) {
  coin <- rbinom(n = 1, size = 1, prob = 0.5)
  if (coin == 1) {
    z <- z + 1
  } else {
    z <- z - 1
  }
}
print(z)

# Next and break
for (i in 1:100) {
  if (i <= 20) {
    next ## Skips the first 20 iterations
  }
  if (i > 30) {
    break ## Stop the loop after 30 iterations
  }
  print(i)
}
