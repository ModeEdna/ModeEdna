# problem 2.2.2
s = 10000
df <- data.frame(matrix(data=NA, nrow=s, ncol=2))
mu1 <- 2
sd1 <- 2
mu2 <- 3
sd2 <- 1
df[1] <- rnorm(s, mu1, sd1)
df[2] <- rnorm(s, mu2, sd2)
x <- rowSums(df)
# mean
mean(x)
mu1 + mu2
# var
var(x)
sd1^2 + sd2^2
# sd
sd(x)
sqrt(sd1^2 + sd2^2)
