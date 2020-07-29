# Group number:
# Assign number: 
# Student group (name and id)
#      Nguyen ...
#      Pham ...

# code below

# Cau 1:

install.packages("readxl")     #Package for reading file '.xlsx'
library(readxl)

#----- Read Route* file -----

setwd("E:/BTL_RR/data/RouteCell40")
RC40.names <- list.files(pattern = ".xlsx")
rc40 <- lapply(RC40.names,read_excel)
R.names <- {}
for (i in 1:length(RC40.names)){
  if ((as.integer(rc40[[i]][2,1]) <= 117) & (as.integer(rc40[[i]][2,1]) >= 57)){
    R.names<- c(R.names, RC40.names[i])
  }
}
RC40 <- lapply(R.names,read_excel)
for (i in 1:length(RC40))
  (RC40[[i]]<- na.omit(RC40[[i]]))
setwd("E:/BTL_RR/data/RouteGPS")
RGPS <- lapply(R.names,read_excel)
for (i in 1:length(RGPS))
  (RGPS[[i]]<- na.omit(RGPS[[i]]))
setwd("E:/BTL_RR/data/RouteCell60")
RC60 <- lapply(R.names,read_excel)
for (i in 1:length(RC60))
  (RC60[[i]]<- na.omit(RC60[[i]]))
#----- Polyline to Cell -----
#Cell60
install.packages("stringr")
library("stringr")
for (i in 1:length(RC60)){
  (RC60[[i]]$Polyline<-sapply(str_extract_all(RC60[[i]]$Polyline,"\\d+\\.*\\d*"),as.numeric))
  for (k in 1:nrow(RC60[[i]])){
    for (j in 1:length(RC60[[i]]$Polyline[[k]])){
      if (j%%2 != 0)
        (RC60[[i]]$Polyline[[k]][j]<- floor((((RC60[[i]]$Polyline[[k]][j]-106.309795))*10^5)/60))
      else (RC60[[i]]$Polyline[[k]][j]<- floor((((11.175186-RC60[[i]]$Polyline[[k]][j]))*10^5)/60))
    }
  }
}
for (i in 1:length(RC60)){
  for (k in 1:nrow(RC60[[i]])){
    RC60[[i]]$Polyline[[k]]<-c(RC60[[i]]$Polyline[[k]],RC60[[i]]$Lng[k],RC60[[i]]$Lat[k])
  }
}
for (i in 1:length(RC60)){
  for (k in 1:nrow(RC60[[i]])){
    RC60[[i]]$Polyline[[k]]<-RC60[[i]]$Polyline[[k]][RC60[[i]]$Polyline[[k]]>0]
  }
}
for (i in 1:length(RC60)){
  for (k in 1:nrow(RC60[[i]])){
    a<-{}
    for (j in 1:length(RC60[[i]]$Polyline[[k]])){
      if (j%%2 !=0)
        (a<-c(a,paste(RC60[[i]]$Polyline[[k]][j],RC60[[i]]$Polyline[[k]][j+1],sep = ",")))
    }
    RC60[[i]]$Polyline[[k]]<-a}}
#Cell40
for (i in 1:length(RC40)){
  (RC40[[i]]$Polyline<-sapply(str_extract_all(RC40[[i]]$Polyline,"\\d+\\.*\\d*"),as.numeric))
  for (k in 1:nrow(RC40[[i]])){
    for (j in 1:length(RC40[[i]]$Polyline[[k]])){
      if (j%%2 != 0)
        (RC40[[i]]$Polyline[[k]][j]<- floor((((RC40[[i]]$Polyline[[k]][j]-106.309795))*10^5)/60))
      else (RC40[[i]]$Polyline[[k]][j]<- floor((((11.175186-RC40[[i]]$Polyline[[k]][j]))*10^5)/60))
    }
  }
}
for (i in 1:length(RC40)){
  for (k in 1:nrow(RC40[[i]])){
    RC40[[i]]$Polyline[[k]]<-c(RC40[[i]]$Polyline[[k]],RC40[[i]]$Lng[k],RC40[[i]]$Lat[k])
  }
}
for (i in 1:length(RC40)){
  for (k in 1:nrow(RC40[[i]])){
    RC40[[i]]$Polyline[[k]]<-RC40[[i]]$Polyline[[k]][RC40[[i]]$Polyline[[k]]>0]
  }
}
for (i in 1:length(RC40)){
  for (k in 1:nrow(RC40[[i]])){
    a<-{}
    for (j in 1:length(RC40[[i]]$Polyline[[k]])){
      if (j%%2 !=0)
        (a<-c(a,paste(RC40[[i]]$Polyline[[k]][j],RC40[[i]]$Polyline[[k]][j+1],sep = ",")))
    }
    RC40[[i]]$Polyline[[k]]<-a}}
#----- Read Journey* file -----

setwd("E:/BTL_RR/data/JourneyCell40")
Jn40.names <- list.files(pattern = ".xlsx")
Jn.names <- {}
for (i in 1:length(Jn40.names)){
  if((as.integer(gsub(".xlsx","",Jn40.names[i])) >=201) & (as.integer(gsub(".xlsx","",Jn40.names[i])) <=670)){
    Jn.names <- c(Jn.names, Jn40.names[i])
  }
}
Jn40 <- lapply(Jn.names, read_excel)
for (i in 1:length(Jn40))
  (Jn40[[i]]<- na.omit(Jn40[[i]]))
setwd("E:/BTL_RR/data/JourneyGPS")
JnGPS <- lapply(Jn.names, read_excel)
for (i in 1:length(JnGPS))
  (JnGPS[[i]]<- na.omit(JnGPS[[i]]))
setwd("E:/BTL_RR/data/JourneyCell60")
Jn60 <- lapply(Jn.names,read_excel)
for (i in 1:length(Jn60))
  (Jn60[[i]]<- na.omit(Jn60[[i]]))

#----- Save Dataset -----

setwd("E:/BTL_RR/Data")
save(RC40, file="RC40.rda")
save(RGPS, file="RGPS.rda")
save(Jn40, file="Jn40.rda")
save(JnGPS, file="JnGPS.rda")
save(Jn60,file="Jn60.rda")
save(RC60,file="RC60.rda")







