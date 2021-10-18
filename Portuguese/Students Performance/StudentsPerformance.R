if (!require(tidyverse,corrplot)) install.packages('corrplot,tidyverse')
library(tidyverse,corrplot)

dados <- read.csv(file = "StudentsPerformance.csv",header = TRUE,sep = ";")

head(dados, 5)

str(dados)

colSums(is.na(dados))

summary(dados)

table(dados$gender,dados$race.ethnicity)

table(dados$gender,dados$test.preparation.course)

table(dados$race.ethnicity,dados$test.preparation.course)

table(dados$gender,dados$parental.level.of.education)

Means_SEX <- dados %>%
  group_by(gender)%>%
  summarise_at(vars(math.score,reading.score,writing.score),list(mean = mean));Means_SEX

Means_ethnicity <- dados %>%
  group_by(race.ethnicity)%>%
  summarise_at(vars(math.score,reading.score,writing.score),list(mean = mean));Means_ethnicity

dados_scores <- select(dados,reading.score,writing.score,math.score)

box_scores <- boxplot(dados_scores,
                      main = "Box-Plot das notas das materias",
                      xlab = " Matérias",
                      pch  = 16,
                      col = "orange",
                      horizontal = FALSE);box_scores

ggplot(dados, aes(math.score)) + 
  geom_histogram(aes(y=..density..)) + 
  geom_density(col = "red")+
  ggtitle('Distribution of Math Score')

ggplot(dados, aes(reading.score)) + 
  geom_histogram(aes(y=..density..)) + 
  geom_density(col = "red")+
  ggtitle('Distribution of reading Score')

ggplot(dados, aes(writing.score)) + 
  geom_histogram(aes(y=..density..)) + 
  geom_density(col = "red")+
  ggtitle('Distribution of writing Score')

ggplot(dados_scores,aes(sample=math.score))+
  stat_qq(shape=19,size=3.5,col='dodgerblue4')+
  stat_qq_line(lwd=1.5,col='brown1')+
  labs(y='Quantiles of sample')+
  labs(x='Quantiles of theoretical')+
  ggtitle("QQ-Plot Math.Score")


ggplot(dados_scores,aes(sample=reading.score))+
  stat_qq(shape=19,size=3.5,col='dodgerblue4')+
  stat_qq_line(lwd=1.5,col='brown1')+
  labs(y='Quantiles of sample')+
  labs(x='Quantiles of theoretical')+
  ggtitle("QQ-Plot Reading.Score")

ggplot(dados_scores,aes(sample=writing.score))+
  stat_qq(shape=19,size=3.5,col='dodgerblue4')+
  stat_qq_line(lwd=1.5,col='brown1')+
  labs(y='Quantiles of sample')+
  labs(x='Quantiles of theoretical')+
  ggtitle('QQ-Plot Writing Score')

a <- shapiro.test(dados$math.score)$p.value
b <- shapiro.test(dados$reading.score)$p.value
c <- shapiro.test(dados$writing.score)$p.value

shapiro_score <- c(a,b,c)

shapiro_score < 0.05


wilcox_math.score <- wilcox.test(math.score ~ gender,alternative = "two.sided",data = dados)$p.value

wilcox_reading.score <- wilcox.test(reading.score ~ gender,alternative = "two.sided",data = dados)$p.value

wilcox_writing.score <- wilcox.test(writing.score ~ gender,alternative = "two.sided",data = dados)$p.value


wilcox_p.values <- c(wilcox_math.score, wilcox_reading.score, wilcox_writing.score)

wilcox_p.values < 0.05
