library(tidyverse)

db <- read.csv(file = "CS1.csv",header = TRUE,sep = ";")

head(db)

names(db)

#Verificando a base de dados

summary(db)
head(db)
str(db)
names(db)

#elaborando um modelo

mdl <- lm(satisfacao ~ idade+gravidade+ansiedade,data = db);summary(mdl)

