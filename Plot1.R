library(datasets)

##Read the text file
powerConsumption = read.csv("./data/household_power_consumption.txt",header = TRUE,sep = ";",dec = ".")

##Generate a subset only for 2/1/2007 e 2/2/2007
powerConsumption01and02_02_2007 = subset(powerConsuption,Date == "1/2/2007" | Date == "2/2/2007" )

##Set png 
png("plot1.png", width=480, height=480)

##Generate plot 1
hist(as.numeric(powerConsumption01and02_02_2007$Global_active_power),col="red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")

dev.off()