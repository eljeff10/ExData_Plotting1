## Coursera Exploratory Data Analysis
## Course Project 1

## Plot 2

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

## Make plot 2
plot2 <- function() {
        par(mfrow = c(1, 1))
        plot(febdata$Datetime, febdata$Global_active_power, type = "l", xlab = "",
            ylab = "Global Active Power (kilowatts)")
        dev.copy(png, file="plot2.png", width=480, height=480)
        dev.off()
        cat("plot2.png has been saved in", getwd())
}
plot2()
