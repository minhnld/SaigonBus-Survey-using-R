# cau1
install.packages("readxl")
library(readxl)
setwd("C:/Users/PALACE/OneDrive/Documents/roirac/assignment_CTRR_KHMT/data/RouteCell40")
routecell40<- list.files(pattern = "*.xlsx")
routecell40sheets <- lapply(routecell40,read_excel)
tapmauRoutecell40<- {}
for (i in 1:length(routecell40)){
  if ((as.integer(routecell40sheets[[i]][2,1]) <= 117) & (as.integer(routecell40sheets[[i]][2,1]) >= 57)) 
    (tapmauRoutecell40<- c(tapmauRoutecell40, routecell40[i]))
}
tapmauRoutecell40sheets<- lapply(tapmauRoutecell40, read_excel)
tapmauRoutecell40sheets<- na.omit(tapmauRoutecell40sheets)
save(tapmauRoutecell40sheets, file="tapmauRoutecell40.rda")
setwd("C:/Users/PALACE/OneDrive/Documents/roirac/assignment_CTRR_KHMT/data/JourneyCell40")
journeycell40<- list.files(pattern = "*.xlsx")
tapmauJourneycell40<- {}
for (i in 1:length(journeycell40)){
  if((as.integer(gsub(".xlsx","",journeycell40[i])) >=201) & (as.integer(gsub(".xlsx","",journeycell40[i])) <=670))
    (tapmauJourneycell40<- c(tapmauJourneycell40, journeycell40[i]))
}
tapmauJourneycell40sheets<- lapply(tapmauJourneycell40, read_excel)
tapmauJourneycell40sheets<- na.omit(tapmauJourneycell40sheets)
save(tapmauJourneycell40sheets, file="tapmauJourneycell40.rda")
#cau 2
load("C:/Users/PALACE/OneDrive/Documents/roirac/assignment_CTRR_KHMT/data/JourneyCell40/tapmauJourneycell40.rda")
length(tapmauJourneycell40sheets)
#cau 3
load("C:/Users/PALACE/OneDrive/Documents/roirac/assignment_CTRR_KHMT/data/RouteCell40/tapmauRoutecell40.rda")
length(tapmauRoutecell40sheets)
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
#cau 5
load("C:/Users/PALACE/OneDrive/Documents/roirac/assignment_CTRR_KHMT/data/RouteCell40/tapmauRoutecell40.rda")
#cau 5a
for (i in 1:length(tapmauRoutecell40sheets)){
  tapmauRoutecell40sheets[[i]]$Lat_Lng<- paste(tapmauRoutecell40sheets[[i]]$Lat,tapmauRoutecell40sheets[[i]]$Lng,sep=",")
  a<-length(unique(tapmauRoutecell40sheets[[i]]$Lat_Lng))
  print(paste("Route_Id:",tapmauRoutecell40sheets[[i]][2,1],": ",a))
}
#cau 5b
LatInput<- readline(prompt="nhap Lat: ")
LatInput<-as.integer(LatInput)
LngInput<- readline(prompt="nhap Lng: ")
LngInput<-as.integer(LngInput)
for (i in 1:length(tapmauRoutecell40sheets)){
  for(k in 1:nrow(tapmauRoutecell40sheets[[i]])){
    if ((tapmauRoutecell40sheets[[i]]$Lat[k] == LatInput)&(tapmauRoutecell40sheets[[i]]$Lng[k] == LngInput))
    {(print(paste("Route_Id:",tapmauRoutecell40sheets[[i]][2,1])))
      break}
  }}