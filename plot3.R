# load the sqldf library
options(gsubfn.engine = "R") # use this option on Mac
library(sqldf)

# load data within the 2 days period, with SQL query
data <- read.csv2.sql(file = "household_power_consumption.txt", 
                      sql = "SELECT * FROM file WHERE Date IN ('1/2/2007','2/2/2007')")

# create formatted datetime field
data$datetime <- paste(data$Date, data$Time)
data$datetime <- strptime(data$datetime, "%d/%m/%Y %H:%M:%S")

# create png device
png(file="plot3.png",width=480, height=480, bg="transparent")

# plot with data
with(data, {
    plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(datetime, Sub_metering_2, col="red")
    lines(datetime, Sub_metering_3, col="blue")
})

# add legend
legend("topright", lwd = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# closing device
dev.off()