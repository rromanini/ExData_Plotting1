library(datasets)

##Read the text file
powerConsumption = read.csv("./data/household_power_consumption.txt",header = TRUE,sep = ";",dec = ".")

##Generate another dataset only for 2/1/2007 e 2/2/2007
powerConsumption01and02_02_2007 = subset(powerConsuption,Date == "1/2/2007" | Date == "2/2/2007" )

date_time <- strptime(paste(powerConsumption01and02_02_2007$Date, powerConsumption01and02_02_2007$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  

Sub_metering1 <- as.numeric(powerConsumption01and02_02_2007$Sub_metering_1) 
Sub_metering2 <- as.numeric(powerConsumption01and02_02_2007$Sub_metering_2) 
Sub_metering3 <- as.numeric(powerConsumption01and02_02_2007$Sub_metering_3) 

#set png image
png("plot3.png", width=480, height=480) 

#Generate plot 3
plot(date_time, Sub_metering1, type="l", ylab="Energy Submetering", xlab="") 
lines(date_time, Sub_metering2, type="l", col="red") 
lines(date_time, Sub_metering3, type="l", col="blue") 

#Create legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue")) 

dev.off() 
