prob2 <- function(labels, size, probOfLabel, condProbs){
  phone <- sample(labels, size=sims, replace=TRUE,prob=probOfLabel)
  feature <- rep(NA, sims) # create a dummy variable first
  # 0 is disliked, 1 is liked
  feature[phone==labs[1]] <- sample(c(0,1), size=sum(phone==labs[1]), replace=TRUE, prob=condProbs[1:2])
  feature[phone==labs[2]] <- sample(c(0,1), size=sum(phone==labs[2]), replace=TRUE,prob=condProbs[3:4])
  feature[phone==labs[3]] <- sample(c(0,1), size=sum(phone==labs[3]), replace=TRUE,prob=condProbs[5:6])
  return(mean(phone[feature==1]==labs[1]))
}

labs <- c('I','ON', 'OS')
probslabel <- c(355/774,181/774,238/774)
condps <- c(c(0.18,0.82), c(0.49,0.51), c(0.51,0.49))

df = data.frame()
for (k in seq(10,10000,1)){
  sims <- k
  output = prob2(labs, sims , probslabel, condps)
  df = rbind(df, output)
}
plot.ts(df)

monteCarlo <- function(r){
  df = data.frame()
  for (k in seq(10,10000,1)){
    sims <- k
    output = prob2(labs, sims , probslabel, condps)
    df = rbind(df, output)
  }
  return(plot.ts(df))
}

monteCarlo(10000)

