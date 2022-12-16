# libraries
library(tidyverse)

#### problem 1 DONE
mytoss = function(p){
  u <- runif(1)
  x <- as.numeric(u < p)#when p is the larger number, there is a higher chance of being this argument true.
  return(x)
}
mytoss(.5) #success or failure when prob=0.5
myattempts = function(p){ counter <- 0
while (mytoss(p) == 0){ counter <- counter + 1 }
return(counter) }
myattempts(.2) #number of failures until the first success, when success prob =0.2

# 1.1 how are we supposed to use rgeom() here?
sims <- 10000
p = .75
dfd1 <- data.frame(table(rgeom(sims,p)))[1:5,]
dfd2 <- data.frame(table(replicate(sims,myattempts(p))))[1:5,]
df <- data.frame(dfd1,dfd2)
df <- subset(df, select = -c(Var1.1))
names(df)[1] <- 'Unit'
names(df)[2] <- 'rgeom'
names(df)[3] <- 'myattempts'
df$rgeomFraction <- df$rgeom/10000
df$myattemptsFraction <- df$myattempts/10000
vector <- c(0,1,2,3,4)
df$dgeom <- dgeom(vector,.75)


# 1.2 all are close to being the same
sims <- 10000
cols = 3
p = .3
df2 <- data.frame(matrix(NA,nrow=sims,ncol=cols))
for (i in 1:sims){
  df2[i,1] <- rgeom(1,p)
  df2[i,2] <- myattempts(p)
}
sd(df2$X1)
sd(df2$X2)
mean(df2$X1)
mean(df2$X2)
var(df2$X1)
var(df2$X2)

#1.3
sims <- 10000
cols = 3
p = .5
df3 <- data.frame(matrix(NA,nrow=sims,ncol=cols))
for (i in 1:sims){
  df3[i,1] <- rgeom(1,p)
  df3[i,2] <- myattempts(p)
}
c1 <- rgb(0,0,255,max = 255, alpha = 250, names = "blue")
c2 <- rgb(255,0,0, max = 255, alpha = 150, names = "red")
hga <- hist(df3$X1, plot = FALSE)
hgb <- hist(df3$X2, plot = FALSE)
plot(hga, col=c1, main = "Histogram of both functions' dsitribution", xlab='Number of attempts until first success (0.5)')
plot(hgb, col=c2, add=TRUE)

#1.4
sims <- 10000
cols = 3
p = .7
df4 <- data.frame(matrix(NA,nrow=sims,ncol=cols))
for (i in 1:sims){
  df4[i,1] <- rgeom(1,p)
  df4[i,2] <- myattempts(p)
}
library(reshape)
library(ggplot2)
df4.1 <- melt(df4)
df4.1$value <- df4.1$value
ggplot(df4.1) + geom_boxplot(aes(x=variable, y=value, color=variable)) + ylim(-1, 10)

#1.5
sims <- 10000
cols = 3
p = .2
df5 <- data.frame(matrix(NA,nrow=sims,ncol=cols))
for (i in 1:sims){
  df5[i,1] <- rgeom(1,p)
  df5[i,2] <- myattempts(p)
}
df5.1 <- melt(df5)
library(ggplot2)
colors <- c( 'royalblue4', 'sienna1')
ggplot(df5.1, aes(x = value, color = variable)) + scale_color_manual(values = colors) + stat_ecdf(lwd = 1.25, geom = "line") +
  ggtitle('ECDF of both distributions') + labs(x='Failures until first success',y='Probability')


#### problem 2 DONE
iters = 10000
df <- data.frame(matrix(NA,ncol=iters,nrow=20))
for (z in 1:iters){
  x <- 0
  for (i in 1:20){
    value <- runif(1, min=0, max=1+x)
    x <- value
    df[i,z] <- value
  }
}
hist(as.numeric(df[20,]))
mean(as.numeric(df[20,]))


#### problem 3 DONE
# 3.1
pgamma(q=12,shape=4,scale=2)
# 3.2
pgamma(q=5,shape=4,scale=2,lower.tail = FALSE)
# 3.3
1 - (pgamma(q=7,shape=4,scale=2,lower.tail = TRUE) + pgamma(q=9,shape=4,scale=2,lower.tail = FALSE))
# 3.4
qgamma(p=0.95,shape=4,scale=2)


#### problem 4 DONE?
##Case 1
s <- 10000
p <- .5
n <- 50
mean <- n*p
sd <- sqrt(n*p*(1-p))
bd <- rbinom(n=s,size=n,p=p)
nd <- rnorm(n=s,mean=mean,sd=sd)
# ensuring rules are met
n*p
n*(1-p)
# plotting
cdfb <- ecdf(bd)
#plot(cdfb)
cdfn <- ecdf(nd)
plot(cdfn,main='ECDF of both distributions, both requirements > 10')
lines(cdfb)
## comments: the cdfs are both very close. you can see one tracing the other.

## Case 2 NP is small and n(1-p) is large
s <- 10000
p <- .9
n <- 50
mean <- n*p
sd <- sqrt(n*p*(1-p))
bd <- rbinom(n=s,size=n,p=p)
nd <- rnorm(n=s,mean=mean,sd=sd)
# ensuring rules are met
n*p
n*(1-p)
# plotting
cdfb <- ecdf(bd)
#plot(cdfb)
cdfn <- ecdf(nd)
plot(cdfn,main='ECDF of both distributions, only np > 10')
lines(cdfb)
# comments: the ecdfs have similar shapes, but we can see the steps on the graph more clearly than before, it no longer looks continuous

## Case 3 NP and n(1-p) are both less than 10
s <- 10000
p <- .1
n <- 10
mean <- n*p
sd <- sqrt(n*p*(1-p))
bd <- rbinom(n=s,size=n,p=p)
nd <- rnorm(n=s,mean=mean,sd=sd)
# ensuring rules are met
n*p
n*(1-p)
# plotting
cdfb <- ecdf(bd)
#plot(cdfb)
cdfn <- ecdf(nd)
plot(cdfn,main='ECDF of both distributions, both requirements < 10')
lines(cdfb)
# comments: the ecdfs here are completely different. the steps are too few to resemble a curve. we're just looking at ~7 steps here.

#### problem 5 DONE, missing comments
library(openintro)
data("exam_grades")
exam_grades <- exam_grades %>% drop_na()
ex1 <- exam_grades$exam1
ex2 <- exam_grades$exam2
ex3 <- exam_grades$exam3
courseGrade <- exam_grades$course_grade

# qqnorms
qqnorm(ex1)
qqline(ex1)
qqnorm(ex2)
qqline(ex2)
qqnorm(ex3)
qqline(ex3)
qqnorm(courseGrade)
qqline(courseGrade)
# comments: qqnorm plots show that the course grades are closest to a normal distribution, while exam 1 and 2 have the curviest graphs.


#### problem 6
# exponential
vals <- rexp(1000,1)
probs <- pexp(vals,1)
plot.ecdf(probs)
# normal
vals <- rnorm(1000)
probs <- pnorm(vals)
plot.ecdf(probs)
# Cauchy
vals <- rcauchy(1000)
probs <- pcauchy(vals)
plot.ecdf(probs)


#### bonus
#get a random distribution
#take 2 random variables and sum them
#do it many times
#raise all the sums to the power of k
#prove that it remains normally distributed

vals <- rgamma(1000,2,3) # sum of two exponential random variables is a gamma distribution
p <- 0.01 # probability
a <- 0.1 # alpha value
while(p<=0.05){ # loop through values of p up to 0.05
  y <- vals^a # raise to the power of alpha
  p <- shapiro.test(y)[2] # check normality
  a <- a + 0.01 # increase alpha
}
qqnorm(y) # see normality distribution