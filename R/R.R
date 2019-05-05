KEY <- "9ca00cce5f0e10a9f03fb0b20b8b6a30a688db63"

library(censusapi)
library(stringr)

availableapis <- listCensusApis()

availablevars2017 <- listCensusMetadata(vintage = '2017', name='acs/acs5')

write.csv(availablevars2017, 'vars.csv')

testdata <- getCensus(name="acs/acs5", vintage=2017, key=KEY, vars=c("B01001_001E","B04006_092E","B04006_091E","B04006_063E","B04006_064E",
                                                                     "B04006_061E","B04006_051E","B04006_042E","B04006_040E","B04006_006E"),
                                 region = "tract:*", regionin = "state:36;county:005,047,061,081,085")
data <- getCensus(name="acs/acs5", vintage=2017, key=KEY, vars=c("B01001_001E","B04006_092E","B04006_091E","B04006_063E","B04006_064E",
                                                                     "B04006_061E","B04006_051E","B04006_042E","B04006_040E","B04006_006E"),
                      region = "tract:*", regionin = "state:36;county:005,047,061,081,085")

data$ukrainian <- data$B04006_092E
data$turkish <- data$B04006_091E
data$romanian <- data$B04006_063E
data$russian <- data$B04006_064E
data$polish <- data$B04006_061E
data$italian <- data$B04006_051E
data$german <- data$B04006_042E
data$french <- data$B04006_040E
data$arabian <- data$B04006_006E
for (i in 14:22){
  data[,i][is.nan(data[,i])] <- 0
}
data_slim <- data[,c(1:4,14:22)]

names <- read.csv('dat1.csv')
data_slim$county = str_remove(data_slim$county, "^0+")
data_slim <- merge(data_slim,names,by='county',all = T)
data_slim$boro_ct2010 <- paste(data_slim$fips,data_slim$tract,sep="")
write.csv(data_slim, "census_data.csv")
