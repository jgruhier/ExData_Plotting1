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
png(file="plot2.png",width=480, height=480, bg="transparent")

# plot
plot(data$datetime, data$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")

# closing device
dev.off()