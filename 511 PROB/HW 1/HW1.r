# x <- c(1:100)*0.01
# c <- cos(pi*x)
# y <- runif(100)
# 
# df <- data.frame(x,c,y)
# 
# ### P(A|B)
# library(ggplot2)
# g <- ggplot(df, aes(x))
# g <- g + geom_point(aes(y=y), colour='blue')
# g <- g + geom_line(aes(y=c), colour='red')
# g


# my code
xr <- runif(100000, min=0, max=1)
yr <- runif(100000, min=0, max=1)

dfr <- data.frame(xr, yr)

dfr$A <- ifelse(dfr$xr < .5, TRUE, FALSE)
dfr$B <- ifelse(dfr$yr < cos(pi*xr), TRUE, FALSE)

mean(dfr$B)

sum(dfr[dfr$B==TRUE,]$B)

sum(dfr[dfr$B==TRUE,]$A) / sum(dfr[dfr$B==TRUE,]$B)

sum(dfr[dfr$A==TRUE,]$B) / sum(dfr[dfr$A==TRUE,]$A)
