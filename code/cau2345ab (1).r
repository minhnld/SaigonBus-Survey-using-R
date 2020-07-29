#cau 2
load("E:/BTL_RR/data/Jn40.rda")
length(Jn40)
#cau 3
load("E:/BTL_RR/data/RC60.rda")
length(RC60)
#cau 4
load("E:/BTL_RR/data/RC60.rda")
RouteId<- {}
for (i in 1:length(RC60))
  (RouteId<- c(RouteId, as.integer(RC60[[i]][2,1])))
nearestId<- RouteId[which(abs(RouteId-67)==min(abs(RouteId-67)))]
nearestId<-nearestId[which(nearestId==min(nearestId))]
for (i in 1:length(RC60)){
  if (as.integer(RC60[[i]][2,1])==nearestId)
    (RC60in4<- RC60[[i]])
}
#cau4a
a<-{}
for (i in 1:nrow(RC60in4)){
  a<-c(a,RC60in4$Polyline[[i]])
}
length(unique(a))
#cau4b
sum(as.numeric(RC60in4$Distance))
#cau4c
VectorViTriCacGiaTriQuaNhieuLan<- which(table(a)>1)
VectorViTriCacGiaTriQuaNhieuLan
#cau4d
mean(as.numeric(RC60in4$Distance))
#cau 5
load("E:/BTL_RR/data/RC60.rda")
#cau 5a
for (i in 1:length(RC60)){
  a<-{}
  for (j in 1:nrow(RC60[[i]])){
    a<-c(a,RC60[[i]]$Polyline[[j]])
  }
  b<-length(unique(a))
  print(paste("Route_Id:",RC60[[i]][2,1],": ",b))
}
#cau 5b
LngInput<- readline(prompt="nhap Lng: ")
LngInput<-as.integer(LngInput)
LatInput<- readline(prompt="nhap Lat: ")
LatInput<-as.integer(LatInput)
Lng_Lat<-paste(LngInput,LatInput,sep = ",")
for (i in 1:length(RC60)){
  for(k in 1:nrow(RC60[[i]])){
    for (j in 1:length(RC60[[i]]$Polyline[[k]])){
      if (Lng_Lat==RC60[[i]]$Polyline[[k]][j]){
        (print(paste("Route_Id:",RC60[[i]][2,1])))
        break}
    }
    break}
}
