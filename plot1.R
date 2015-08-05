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
png(filename = "plot1.png", width = 480, height = 480)
with(
  interestedInterval, hist(
    Global_active_power, main = "Global Active Power"  , xlab = "Global Active Power (kilowatts)", col = "red"
  )
)
dev.off()

