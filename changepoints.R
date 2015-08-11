library(changepoint)
help(package = changepoint)
?changepoint

data("HC1", package = "changepoint")

plot(HC1, type = "l")

set.seed(1)
x <- c(rnorm(100,0,1),rnorm(100,10,1))
ans <- cpt.mean(HC1, penalty = "CROPS", pen.value = c(0.2, 1), method = "PELT")
