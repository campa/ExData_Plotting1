household_power_consumption <-
  read.csv(
    "household_power_consumption.txt", na.strings = c("?", ""), sep = ";", stringsAsFactors =
      FALSE
  )
household_power_consumption$Date <-
  as.Date(household_power_consumption$Date,  format = "%d/%m/%Y")
interestedInterval <-
  subset(
    household_power_consumption, household_power_consumption$Date >= as.Date("2007-02-01",  format = "%Y-%m-%d") &
      household_power_consumption$Date <= as.Date("2007-02-02",  format = "%Y-%m-%d")
  )
interestedInterval$DateTime <-
  strptime(paste(
    format(interestedInterval$Date,  format = "%d-%m-%Y"), interestedInterval$Time, sep =
      "|"
  ),  format = "%d-%m-%Y|%H:%M:%S")
png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

# First
with(
  interestedInterval, plot(
    DateTime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = ""
  )
)

#Second
with(
  interestedInterval, plot(
    DateTime, Voltage, type = "l", ylab = "Voltage", xlab = "datetime"
  )
)

#Third
colors <- c("black", "red", "blue")
with(
  interestedInterval, plot(
    DateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = colors[1]
  )
)
with(interestedInterval,lines(DateTime, Sub_metering_2, type = "l",  col = colors[2]))
with(interestedInterval,lines(DateTime, Sub_metering_3, type = "l",  col = colors[3]))
legend(
  "topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = colors, bty = "n"
)

#Fourth
with(
  interestedInterval,
  plot(
    DateTime, interestedInterval$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime"
  )
)

dev.off()
