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
#Plotting in png file
png("plot1.png", width = 480, height = 480)
hist(fin$global_active_power, main= "Global Active Power", col = "red", xlab = "Global active power (kilowatts)", ylab= "Frequency",ylim = c(0,1200), breaks = 20)
dev.off() # Closing PNG device