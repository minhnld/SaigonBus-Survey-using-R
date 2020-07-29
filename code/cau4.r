#cau 4
load("C:/Users/PALACE/OneDrive/Documents/roirac/assignment_CTRR_KHMT/data/RouteCell40/tapmauRoutecell40.rda")
RouteId<- {}
for (i in 1:length(tapmauRoutecell40sheets))
  (RouteId<- c(RouteId, as.integer(tapmauRoutecell40sheets[[i]][2,1])))
nearestId<- RouteId[which(abs(RouteId-67)==min(abs(RouteId-67)))]
for (i in 1:length(tapmauRoutecell40sheets)){
  if (as.integer(tapmauRoutecell40sheets[[i]][2,1])==nearestId)
    (Routecell40in4<- tapmauRoutecell40sheets[[i]])
}
#cau4a
Routecell40in4<- na.omit(Routecell40in4)
Routecell40in4$Lat_Lng<- paste(Routecell40in4$Lat,Routecell40in4$Lng,sep=",")
length(unique(Routecell40in4$Lat_Lng))
#cau4b
sum(as.integer(Distance))
#cau4c
VectorViTriCacGiaTriQuaNhieuLan<- which(table(Routecell40in4$Lat_Lng)>1)
Lat_Lng[c(VectorViTriCacGiaTriQuaNhieuLan)]
#cau4d
mean(as.integer(Distance))


        
 

