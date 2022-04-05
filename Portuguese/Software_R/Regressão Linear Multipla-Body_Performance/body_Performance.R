library(tidyverse)
library(psych)
library(caTools)
library(corrplot)

df <- read.csv('bodyPerformance.csv',header = TRUE,sep = ',');head(df, 5)

str(df)

colSums(is.na(df))

df.corr <- df[,-c(2,12)]

df.corr = cor(df.corr)

corrplot(df.corr, method="number")

pairs.panels(df, col = "red")

split <- sample.split(df, SplitRatio = 0.7)

train_data <-  subset(df, split == TRUE)
test_data <- subset(df, split == FALSE)


model_1 <- lm(gripForce ~.,data = train_data );summary(model_1)

model_2 <- lm(gripForce ~. -systolic -sit.and.bend.forward_cm - height_cm,data = train_data);summary(model_2)

par(mfrow = c(2,2))

plot(model_2)

head(predict(model_2,newdata = test_data,interval = "confidence"))

head(predict(model_2, newdata = test_data,interval = "prediction"))
