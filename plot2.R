
# Reading the text file first
a<-read.table("C:/Users/Sarikha/Desktop/R/Exploratory/hpc.txt", sep=";",header= TRUE, na.strings="?")

#Looking at the text file
summary(a)
str(a)

# some experimentation
# dat<-c("2012-03-04")
# dat<-strptime(dat,format="%Y-%m-%d")
# dat<-as.Date(dat,format="%y-%m-%d")
# class(dat)
# class(weekdays(dat))

#Save first column as date
a$Date<-strptime(a$Date,format = "%d/%m/%Y")
a$Date<-as.Date(a$Date,format = "%d/%m/%Y")
b<- subset(a, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#Adding date and time for more granularity
dt <- paste(as.Date(b$Date), b$Time)
b$dte<-as.POSIXct(dt)


#Opening a PNG file
png(filename = "plot2.png",width = 480, height = 480, units = "px")

#Plotting the histogram, as required
plot(b$Global_active_power~b$dte, type="l")

#Closing the connection
dev.off()
