# This is the continuation to exploratory analysis in r

# Hierarchical Clustering
set.seed(1234)
x <- rnorm(n = 12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(n = 12, mean = rep(c(1, 2, 1), each =4), sd = 0.2)
plot(x = x, y = y, col = "blue", pch = 19, cex = 2)
text(x = x + 0.05, y = y + 0.05, labels = as.character(1:12))

dataFrame <- data.frame(x = x, y = y) ## Create the dataframe with the randomly generated values
distance.dataFrame <- dist(x = dataFrame, method = "euclidean") ## Calculate the euclidean distance
rdistxy <- as.matrix(distance.dataFrame)  ## Put them in matrix
diag(rdistxy) <- diag(rdistxy) + 100000 ## To remove the value from the consideration
ind <- which(rdistxy == min(rdistxy), arr.ind = TRUE)

par(mfrow = c(1, 2))
plot(x = x, y = y, col = "blue", pch = 19, cex = 2)
text(x = x + 0.05, y = y + 0.05, labels = as.character(1:12))
points(x[ind[1, ]], y[ind[1, ]], col = "orange", pch = 19, cex = 2) ## Which two points are close together

# Kmean Clustering
par(mfrow = c(1, 1))
set.seed(1234) ## Set the data for the Kmean example
x <- rnorm(n = 12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(n = 12, mean = rep(c(1, 2, 1), each =4), sd = 0.2)
plot(x = x, y = y, col = "blue", pch = 19, cex = 2)
text(x = x + 0.05, y = y + 0.05, labels = as.character(1:12))
dataFrame <- data.frame(x = x, y = y)
kmeansObj <- kmeans(x = dataFrame, centers = 3)
kmeansObj$cluster <- as.factor(kmeansObj$cluster)
ggplot(data = dataFrame, mapping = aes(x = x, y = y, color = kmeansObj$cluster)) + geom_point()
