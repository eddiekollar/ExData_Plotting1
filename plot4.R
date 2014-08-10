## Plot3.R
## Eddie Kollar
## Assignment 1

#unzip("exdata-data-household_power_consumption.zip", exdir = "data")

data = read.table('data/household_power_consumption.txt', sep = ";", header = TRUE, stringsAsFactors=F)
data$Date = as.Date(data$Date, format="%d/%m/%Y") 

data_subset = subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
rm(data)

data_subset$DateTime = as.POSIXct(paste(as.Date(data_subset$Date), data_subset$Time))

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0), cex = .50) 
with(data_subset, { 
  plot(Global_active_power~DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="") 
  plot(Voltage~DateTime, type="l", ylab="Voltage (volt)", xlab="") 
  plot(Sub_metering_1~DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="") 
  lines(Sub_metering_2~DateTime, col='Red') 
  lines(Sub_metering_3~DateTime, col='Blue') 
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), xjust= 0) 
  plot(Global_reactive_power~DateTime, type="l", ylab="Global Rective Power (kilowatts)", xlab="") 
}) 

dev.copy(png, file="plot4.png", height=480, width=480) 
dev.off()