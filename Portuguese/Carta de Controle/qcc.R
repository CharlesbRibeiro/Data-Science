library(qcc)


data(pistonrings)


attach(pistonrings)


d <- qcc.groups(diameter,sample)


#Boxplot

boxplot(diameter ~ sample,data = pistonrings)

# x-Bar

plot.xbar = qcc(d, type="xbar")

chart.xbar1 <- qcc(d[1:10,], type="xbar",newdata = d[11:20,])

chart.xbar2 <- qcc(d[1:20,], type="xbar",newdata = d[21:40,])


# R

chart.R1 <- qcc(d[1:10,], type="R",newdata = d[11:20,])

chart.R2 <- qcc(d[1:20,], type="R",newdata = d[21:40,])
