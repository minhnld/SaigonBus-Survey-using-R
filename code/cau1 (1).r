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

setwd("D:/BTL_RR/Data/RouteCell40")
RC40.names <- list.files(pattern = ".xlsx")
rc40 <- lapply(RC40.names,read_excel)
R.names <- {}
for (i in 1:length(RC40.names)){
  if ((as.integer(rc40[[i]][2,1]) <= 117) & (as.integer(rc40[[i]][2,1]) >= 57)){
    R.names<- c(R.names, RC40.names[i])
  }
}
RC40 <- lapply(R.names,read_excel)
RC40 <- na.omit(RC40)
setwd("D:/BTL_RR/Data/RouteGPS")
RGPS <- lapply(R.names,read_excel)
RGPS <- na.omit(RGPS)
setwd("D:/BTL_RR/Data/RouteCell60")
RC60 <- lapply(R.names,read_excel)
RC60 <- na.omit(RC60)

#----- Read Journey* file -----

setwd("D:/BTL_RR/Data/JourneyCell40")
Jn40.names <- list.files(pattern = ".xlsx")
Jn.names <- {}
for (i in 1:length(Jn40.names)){
  if((as.integer(gsub(".xlsx","",Jn40.names[i])) >=201) & (as.integer(gsub(".xlsx","",Jn40.names[i])) <=670)){
    Jn.names <- c(Jn.names, Jn40.names[i])
  }
}
Jn40 <- lapply(Jn.names, read_excel)
Jn40 <- na.omit(Jn40)
setwd("D:/BTL_RR/Data/JourneyGPS")
JnGPS <- lapply(Jn.names, read_excel)
JnGPS <- na.omit(JnGPS)
setwd("D:/BTL_RR/Data/JourneyCell60")
Jn60 <- lapply(Jn.names,read_excel)
Jn60 <- na.omit(Jn60)

#----- Save Dataset -----

setwd("D:/BTL_RR/Data")
save(RC40, file="RC40.rda")
save(RGPS, file="RGPS.rda")
save(Jn40, file="Jn40.rda")
save(JnGPS, file="JnGPS.rda")
save(Jn60,file="Jn60.rda")
save(RC60,file="RC60.rda")

#--------------------------------------------------

# Cau 2
load("D:/BTL_RR/Data/JnGPS.rda")
length(JnGPS)        #Number of buses in dataset

#--------------------------------------------------

# Cau 3
load("D:/BTL_RR/Data/RGPS.rda")
length(RGPS)         #Number of routes in dataset

#--------------------------------------------------

# Cau 4
load("D:/BTL_RR/Data/RC40.rda")
RouteId <- {}
for (i in 1:length(RC40)) {
  RouteId <- c(RouteId,RC40[[i]][2,1])
}
nearestId <- min(RouteId[which(abs(RouteId-67)==min(abs(RouteId-67)))])
for (i in 1:length(RC40)){
  if (as.integer(RC40[[i]][2,1])==nearestId){
    Route <- RC40[[i]]
  }
}

#----- a -----


