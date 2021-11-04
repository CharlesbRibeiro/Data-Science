x3 <- dbinom(x=3,size = 8,prob = .15);x3

No_defects <- dbinom(x=0,size = 8,prob = .15);No_defects

Yes_defects <- (1 - No_defects);Yes_defects

expected_value <- Yes_defects*8*1000;expected_value

ve <- rbinom(80,size = 8,prob = .15);ve

means <- mean(ve);means

ex <- 8*.15;ex

hist(ve)

H <- dbinom(4,6,0.3);H 

Mean <-6*0.30;Mean

DP <- 6*0.30*0.70;DP

h <- rbinom(80,size = 6,prob = .30);h

mean(h)

hist(h)

No_H <- dbinom(0,size = 10,prob = 0.5);No_H

coins <- rbinom(200,size = 1,prob = .5);coins

mean(coins)

hist(coins)

screw <- dbinom(4,size = 6,prob = 0.12);screw

s <- rbinom(210,size = 6,prob = 0.12);s

table(s)

hist(s)

V1 <- rexp(200,rate = 600);V1

hist(V1)