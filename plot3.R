## Plot3.R
## Eddie Kollar
## Assignment 1

#unzip("exdata-data-household_power_consumption.zip", exdir = "data")

data = read.table('data/household_power_consumption.txt', sep = ";", header = TRUE, stringsAsFactors=F)
data$Date = as.Date(data$Date, format="%d/%m/%Y") 

data_subset = subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
rm(data)

data_subset$DateTime = as.POSIXct(paste(as.Date(data_subset$Date), data_subset$Time))

with(data_subset, {
  plot(Sub_metering_1~DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~DateTime,col='Red') 
  lines(Sub_metering_3~DateTime,col='Blue') 
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 

dev.copy(png, file="plot3.png", height=480, width=480) 
dev.off()