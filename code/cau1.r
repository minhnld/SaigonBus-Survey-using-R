# Group number:
# Assign number: 
# Student group (name and id)
#      Nguyen ...
#      Pham ...

# code below
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








