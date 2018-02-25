data<- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE,na.strings="?")
library(dplyr)

DT<-tbl_df(data)
DT1 <- mutate(DT, dt=as.Date(Date,"%d/%m/%Y"))
SmallDT <- DT1[DT1$dt == "2007-02-01" | DT1$dt == "2007-02-02",]

DT2 <- mutate(SmallDT, tim = as.POSIXct(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S")))



# diag 1
png(filename="plot1.png", width=480, height=480)
par(oma=c(2,2,2,1))
hist(DT2$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main = "Global Active Power")
dev.off() 