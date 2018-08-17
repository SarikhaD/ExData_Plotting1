
# Reading the text file first
a<-read.table("C:/Users/Sarikha/Desktop/R/Exploratory/hpc.txt", sep=";",header= TRUE, na.strings="?")

#Looking at the text file
summary(a)

#Opening a PNG file
png(filename = "plot1.png",width = 480, height = 480, units = "px")

#Plotting the histogram, as required
hist(a$Global_active_power, col="red",ylab="Frequency", main="Global Active Power",xlab="Global Active Power (kilowatt)")

#Closing the connection
dev.off()