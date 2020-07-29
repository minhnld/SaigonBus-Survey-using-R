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
