## Coursera Exploratory Data Analysis
## Course Project 1

## Plot 1

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

## Make plot 1
plot1 <- function() {
        par(mfrow = c(1, 1))
        hist(febdata$Global_active_power, main = "Global Active Power", ylab = "Frequency", 
           xlab = "Global Active Power (kilowatts)", col = "red", breaks = 13, ylim = c(0, 
              1200), xlim = c(0, 6), xaxp = c(0, 6, 3))
        dev.copy(png, file="plot1.png", width=480, height=480)
        dev.off()
        cat("Plot1.png has been saved in", getwd())
}
plot1()