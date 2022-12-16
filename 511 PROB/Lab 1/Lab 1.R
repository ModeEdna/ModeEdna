# !A
# It took 11 rolls to get 3 ones.
# 6, 2, 3 times
# 1B: Reusing the function to create a die roll
mytoss = function(p){
  u <- runif(1)
  x <- as.numeric(u < p)
  return(x)
}

#1B Reusing the attempts function
myattempts = function(p){ counter <- 0
while (mytoss(p) == 0){ counter <- counter + 1 }
return(counter) }

# 1C. Simulating the 
x <- sum(replicate(3,myattempts(1/6)))
x

# 1D. Simulate 10,000 times, put into a vector and find the percentage
x <- replicate(10000,sum(replicate(3,myattempts(1/6))))
y <- c()
for (i in x) {
  if (i > 11) {
    y <- c(y, i)
  }
}

percentage = length(y)/100

paste0('The percentage of attempts that did worse than my 11 rolls is ', percentage, '%')

----

# Problem 2
# A: What does it mean to set a seed? How could it be useful to the study of probability and statistics?
  # Setting a seed allows us to replicate the results of a random event. You select any number you want (seed)
  # and this ensures that any random event/variable you create can be repeated. This is useful for the study
  # of probability and statistics because other data scientist can recreate your experiment. If there were no
  # seed, the generation of random variables/events would make it impossible to get the same results as the 
  # author of the experiment.
# B: How might you run a similar simulation in python? are there any functions comparable to the ones used
# in problem #1 and #2?
  # There's a function in Python from the random module that allows you to set a seed (random.seed(x))
  # You can run the simulation with the same functions, the only difference is that the format for creating
  # them will be slightly different.
  # int() is like as.numeric(); random.uniform() is like runif(). I don't know if there is a function like replicate
  # but you can have a for loop/while loop and run it 10000 times.
# C: Reflect on your experiences during the boot camp this summer. What might be some advantages/disadvantages
# of R over Python?
  # I have a personal preference for Python over R. The syntax feels more natural, but that could be due to my 
  # prior knowledge of the language. I'm assuming each language has certain functions that the other doesn't,
  # which might me prefer one over the other depending on the work I'm doing.

----

# Problem 3
# Problem 1.5 in ch. 1 of Dalgaard. On p. 27, replicate was used to simulate the distribution of the mean of 20
# random numbers from the exponential distribution by repeating the operation 10 times. That code is

replicate(10,mean(rexp(20)))

# How would you do the same thing with sapply?
sapply(1:10, function(i) mean(rexp(20)))
