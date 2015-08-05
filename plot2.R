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
png(filename = "plot2.png", width = 480, height = 480)
with(
  interestedInterval, plot(
    DateTime, interestedInterval$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""
  )
)
dev.off()
