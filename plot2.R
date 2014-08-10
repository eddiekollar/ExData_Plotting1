## Plot2.R
## Eddie Kollar
## Assignment 1

#unzip("exdata-data-household_power_consumption.zip", exdir = "data")

data = read.table('data/household_power_consumption.txt', sep = ";", header = TRUE, stringsAsFactors=F)
data$Date = as.Date(data$Date, format="%d/%m/%Y") 

data_subset = subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
rm(data)

data_subset$DateTime = as.POSIXct(paste(as.Date(data_subset$Date), data_subset$Time))

with(data_subset, plot(Global_active_power~DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

dev.copy(png, file="plot2.png", height=480, width=480) 
dev.off()