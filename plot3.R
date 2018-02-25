data<- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE,na.strings="?")
library(dplyr)

DT<-tbl_df(data)
DT1 <- mutate(DT, dt=as.Date(Date,"%d/%m/%Y"))
SmallDT <- DT1[DT1$dt == "2007-02-01" | DT1$dt == "2007-02-02",]

DT2 <- mutate(SmallDT, tim = as.POSIXct(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S")))



#diag 3
png(filename="plot3.png", width=480, height=480)
par(oma=c(2,2,2,1), cex=0.8)
plot (DT2$tim, DT2$Sub_metering_1, ylab="Energy sub metering",xlab="", type="n",fg = "black")
lines (DT2$tim, DT2$Sub_metering_1, col="black")
lines (DT2$tim, DT2$Sub_metering_2, col="red")
lines (DT2$tim, DT2$Sub_metering_3, col="blue")
legend("topright", lty = 1, col = c("black","red","blue"), 
	legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), text.col=c("black"), text.font=1)
dev.off()