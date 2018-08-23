# Reading the text file first
a<-read.table("C:/Users/Sarikha/Desktop/R/Exploratory/hpc.txt", sep=";",header= TRUE, na.strings="?")

#Looking at the text file
summary(a)
str(a)


#Save first column as date
a$Date<-strptime(a$Date,format = "%d/%m/%Y")
a$Date<-as.Date(a$Date,format = "%d/%m/%Y")
b<- subset(a, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#Adding date and time for more granularity
dt <- paste(as.Date(b$Date), b$Time)
b$dte<-as.POSIXct(dt)


#Opening a PNG file
png(filename = "plot4.png",width = 480, height = 480, units = "px")

#Setting the window
par(mfrow = c(2,2))

# Plot 1
plot(b$Global_active_power ~ b$dte, ylab = "Global Active Power", xlab = "", type = "l")

# Plot 2
plot(b$Voltage ~ b$dte, ylab = "Voltage", xlab = "datetime", type = "l")

# Plot 3
plot(b$Sub_metering_1 ~ b$dte, ylab = "Energy sub metering", xlab = "", type = "l")
lines(b$Sub_metering_2 ~ b$dte, col = 'Red')
lines(b$Sub_metering_3 ~ b$dte, col = 'Blue')
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)

# Plot 4
plot(b$Global_reactive_power ~ b$dte, ylab = "Global_reactive_power", xlab = "datetime", type = "l")


#Closing the connection
dev.off()



