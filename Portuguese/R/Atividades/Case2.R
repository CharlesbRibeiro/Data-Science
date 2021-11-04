library(tidyverse)


db <- read.csv(file = "CS2.csv",header = TRUE,sep = ";");head(db)

db2 <- db[,-c(1,2,8,13)]

model <- lm(mpg ~ .,data = db2)

model1 <- lm(mpg ~ .,data = db2)

step.Both <- step(model1, direction = "both",trace = 0)

extractAIC(step.Both)

model.step <- lm(mpg ~ car.truck + cid + drv + etw + axle,data = db2)

summary(model.step)

summary(model.step)

mpg_car1 = 48.338811-3.452904*0-0.029287*215+3.093682*0+2.553456*0-0.001227*4500-1.825530*3.07;print(mpg_car1)
