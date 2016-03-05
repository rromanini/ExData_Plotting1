library(datasets)

##Read the text file
powerConsumption = read.csv("./data/household_power_consumption.txt",header = TRUE,sep = ";",dec = ".")

##Generate another dataset only for 2/1/2007 e 2/2/2007
powerConsumption01and02_02_2007 = subset(powerConsuption,Date == "1/2/2007" | Date == "2/2/2007" )

date_time <- strptime(paste(powerConsumption01and02_02_2007$Date, powerConsumption01and02_02_2007$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  

##Set png 
png("plot2.png", width=480, height=480)

##Generate Plot 2
plot(date_time, as.numeric(powerConsumption01and02_02_2007$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()