data<- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE,na.strings="?")
library(dplyr)

DT<-tbl_df(data)
DT1 <- mutate(DT, dt=as.Date(Date,"%d/%m/%Y"))
SmallDT <- DT1[DT1$dt == "2007-02-01" | DT1$dt == "2007-02-02",]

DT2 <- mutate(SmallDT, tim = as.POSIXct(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S")))



# diag 2
png(filename="plot2.png", width=480, height=480)
par(oma=c(2,2,2,1))
plot (DT2$tim, DT2$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", fg="black", type="n")
lines (DT2$tim, DT2$Global_active_power, col="black")
dev.off()
