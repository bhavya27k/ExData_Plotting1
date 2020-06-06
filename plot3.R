#Reading test file into table 
data <- read.table("household_power_consumption.txt", sep=";", skip=1)
#Renaming columns
names(data) <- c("date","time","global_active_power","global_reactive_power","voltage","global_intensity","submetering1","submetering2","submetering3")
data$date <- as.Date(data$date, "%d/%m/%Y")
date1 <- as.Date("2007-02-01", "%Y-%m-%d")
date2 <- as.Date("2007-02-02", "%Y-%m-%d")
#Selecting required range of rows
fin <- data[data$date== date1 | data$date == date2,]
fin$global_active_power <- as.numeric(fin$global_active_power)
fin$datetime <- with(fin, as.POSIXct(paste(date, time), format="%Y-%m-%d %H:%M:%S"))
fin$day <- weekdays(fin$datetime)
#Opening png device and creating plot3
png("plot3.png", width = 480, height = 480)
plot(fin$datetime, fin$submetering1, type="l",ylab = "Energy sub metering", xlab=" ",ylim = c(0,40))
lines(fin$datetime,fin$submetering2, type="l", col="red")
lines(fin$datetime,fin$submetering3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red","blue"), lty= c(1,1,1))
dev.off()

