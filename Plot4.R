## Coursera Exploratory Data Analysis
## Course Project 1

## Plot 4

## Download and unzip the data

if (!file.exists("./data/household_power_consumption.txt")) {
        download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./data/household_power_data.zip")
        unzip("./data/household_power_data.zip", overwrite = T, exdir = "./data")
}

## Load the data
fulldataset <- file("./data/household_power_consumption.txt")
febdata <- read.table(text = grep("^[1,2]/2/2007", readLines(fulldataset), value = TRUE),
                      col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
                                    "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                      sep = ";", header = TRUE, na.strings = "?")
close(fulldataset)

febdata$Datetime <- strptime(paste(febdata$Date, febdata$Time), "%d/%m/%Y %H:%M:%S")

## Make plot 4
plot4 <- function() {
        png("plot4.png", width=480, height=480, type="quartz")
        par(mfrow = c(2, 2))
        
        # plot 1 (TL)
        plot(febdata$Datetime, febdata$Global_active_power, type = "l", ylab = "Global Active Power", 
             xlab = "")
        
        # plot 2 (TR)
        plot(febdata$Datetime, febdata$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
        
        # plot 3 (BL)
        plot(febdata$Datetime, febdata$Sub_metering_1, type = "l", ylab = "Energy sub metering", 
             xlab = "", col = "black")
        points(febdata$Datetime, febdata$Sub_metering_2, type = "l", xlab = "", ylab = "Sub_metering_2", 
               col = "red")
        points(febdata$Datetime, febdata$Sub_metering_3, type = "l", xlab = "", ylab = "Sub_metering_3", 
               col = "blue")
        legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
                                                                                "Sub_metering_2", "Sub_metering_3"), bty = "n", )
        
        # plot 4 (BR)
        plot(febdata$Datetime, febdata$Global_reactive_power, type = "l", xlab = "datetime", 
             ylab = "Global_reactive_power", ylim = c(0, 0.5))
        
        dev.off()
        cat("plot4.png has been saved in", getwd())
}
plot4()
