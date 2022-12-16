x <- 0:50
# binomial
plot(x,dbinom(x,size=50,prob=.33),type="h")
# discrete uniform
library('extraDistr')
plot(x,ddunif(x,min=0,max=50), type='h')
# Bernoulli
plot(x,dbern(x,prob=.7), type='h')
# poisson
plot(x, dpois(x, 20))
# geometric
plot(x, dgeom(x,.25), type = 'h')
#### hypergeometric. successes we want, successes in pop, failures in pop, samples taken
plot(x, phyper(15, 70, 30, 20), type='h')
#### negative binomial
plot(x, dnbinom(x,4,.2), type='h')

ppois(1,.25)
