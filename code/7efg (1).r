#----------7e,f,g----------#
setwd("F:/r/data")
load("JnGPS.rda")
max <- 0
maxi <-0
n<-0
j<-0
qd=c()
tt=c()
for ( i in 201: 670)
{ 
  j<-j+1
  tt[j]<-i
  n<-i
  k = length(JnGPS[[n]][[1]])
s <- sum(distVincentyEllipsoid(JnGPS[[n]][,c(2,1)]))
qd[j]<-s

}
sapxep<-data.frame(qd,tt)
sx <- sapxep[order(sapxep$qd),]
soxe <- sx[,c(2)]
save(soxe,file="soxe.rda")
print("Xe co quang duong dai nhat")
print(soxe[length(soxe)])
print("Xe co quang duong dai thu hai")
print(soxe[length(soxe)-1])
print("Danh sach cac xe theo thu tu chieu dai di chuyen giam dan")
for (i in 1: length(soxe))
{
  print(soxe[length(soxe)-i+1])
}


