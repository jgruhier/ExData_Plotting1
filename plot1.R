# load the sqldf library
options(gsubfn.engine = "R") # use this option on Mac
library(sqldf)

# load data within the 2 days period, with SQL query
data <- read.csv2.sql(file = "household_power_consumption.txt", 
                      sql = "SELECT * FROM file WHERE Date IN ('1/2/2007','2/2/2007')")

# create png device
png(file="plot1.png",width=480, height=480)

# plot
hist(data$Global_active_power, col = "red", xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", main="Global Active Power")

# closing device
dev.off()