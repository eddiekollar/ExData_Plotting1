## Plot1.R
## Eddie Kollar
## Assignment 1

## unzip("exdata-data-household_power_consumption.zip", exdir = "data")

data = read.table('data/household_power_consumption.txt', sep = ";", header = TRUE, stringsAsFactors=F)
data$Date = as.Date(data$Date, format="%d/%m/%Y") 

data_subset = subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
rm(data)

data_subset$DateTime = as.POSIXct(paste(as.Date(data_subset$Date), data_subset$Time))

with(data_subset, hist(as.double(Global_active_power), main="Global Active Power",  
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red"))

dev.copy(png, file="plot1.png", height=480, width=480) 
dev.off()
