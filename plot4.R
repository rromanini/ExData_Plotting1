library(datasets)

##Read the text file
powerConsumption = read.csv("./data/household_power_consumption.txt",header = TRUE,sep = ";",dec = ".")

##Generate another dataset only for 2/1/2007 e 2/2/2007
powerConsumption01and02_02_2007 = subset(powerConsuption,Date == "1/2/2007" | Date == "2/2/2007" )

date_time <- strptime(paste(powerConsumption01and02_02_2007$Date, powerConsumption01and02_02_2007$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  

globalActivePower <- as.numeric(powerConsumption01and02_02_2007$Global_active_power) 
globalReactivePower <- as.numeric(powerConsumption01and02_02_2007$Global_reactive_power) 

voltage <- as.numeric(powerConsumption01and02_02_2007$Voltage) 

subMetering1 <- as.numeric(powerConsumption01and02_02_2007$Sub_metering_1) 
subMetering2 <- as.numeric(powerConsumption01and02_02_2007$Sub_metering_2) 
subMetering3 <- as.numeric(powerConsumption01and02_02_2007$Sub_metering_3) 

#Define png image
png("plot4.png", width=480, height=480) 

#Generate plot 4
par(mfrow = c(2, 2))  

#first 
plot(date_time, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2) 

#second
plot(date_time, voltage, type="l", xlab="datetime", ylab="Voltage") 

#third
plot(date_time, subMetering1, type="l", ylab="Energy Submetering", xlab="") 
lines(date_time, subMetering2, type="l", col="red") 
lines(date_time, subMetering3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o") 

#forth
plot(date_time, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power") 
 
dev.off() 
