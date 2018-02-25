data<- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE,na.strings="?")
library(dplyr)

DT<-tbl_df(data)
DT1 <- mutate(DT, dt=as.Date(Date,"%d/%m/%Y"))
SmallDT <- DT1[DT1$dt == "2007-02-01" | DT1$dt == "2007-02-02",]

DT2 <- mutate(SmallDT, tim = as.POSIXct(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S")))



#diag 4	
png(filename="plot4.png", width=480, height=480)
par(mfrow = c(2,2), mar=c(5,5,2,1), mfg=c(3,2,3,2), cex=0.7)
	plot (DT2$tim, DT2$Global_active_power, ylab="Global Active Power", xlab="", fg="black", type="n")
	lines (DT2$tim, DT2$Global_active_power, col="black")

	plot (DT2$tim, DT2$Voltage, ylab="Voltage", xlab="datetime", fg="black", type="n")
	lines (DT2$tim, DT2$Voltage, col="black")
	
	
	plot (DT2$tim, DT2$Sub_metering_1, ylab="Energy sub metering",xlab="", type="n",fg = "black")
	legend("topright", , bty = "n",lty = 1, cex=0.8,col = c("black","red","blue"), 
		legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), text.col=c("black"), text.font=1)
	lines (DT2$tim, DT2$Sub_metering_1, col="black")
	lines (DT2$tim, DT2$Sub_metering_2, col="red")
	lines (DT2$tim, DT2$Sub_metering_3, col="blue")
	
	
	plot (DT2$tim, DT2$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", fg="black", type="n")
	lines (DT2$tim, DT2$Global_reactive_power, col="black")
dev.off()

