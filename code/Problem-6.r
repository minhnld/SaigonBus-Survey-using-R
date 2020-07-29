# Cau 6
load("D:/BTL_RR/data/Jn40.rda")
JnId = 201                #JourneyId to calculate
n = JnId-200
Celpass <- Jn40[[n]][c(TRUE,diff(as.numeric(interaction(Jn40[[n]][,c(1,2)]))) != 0),]
Celpass <- aggregate(list(Times=Celpass[[3]]),Celpass[,c(1,2)],length)

#----- a -----
Celpass.num=nrow(Celpass)     #Number of cells passed

#----------6b+c----------#
load("D:/BTL_RR/data/JnGPS.rda")
JnId = 230
n = JnId -200
library(geosphere)
s <- sum(distVincentyEllipsoid(JnGPS[[n]][,c(2,1)]))
t <- 0
for (i in 1:nrow(JnGPS[[n]])) {
  if (all(JnGPS[[n]][i,c(1,2)]==JnGPS[[n]][(i+1),c(1,2)])==F){
    t <- t+JnGPS[[n]][[3]][i+1]-JnGPS[[n]][[3]][i]
  }
}
v=s/t

#----- d -----
table(Celpass$Times)
hist(Celpass$Times,xlab="Times",main="Times passed by bus")

#----- e -----
Times.common <- subset(Celpass,Times==as.numeric(names(sort(table(Celpass$Times),T)[1])))

