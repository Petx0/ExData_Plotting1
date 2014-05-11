x<-read.delim("household_power_consumption.txt", 
              header = TRUE, 
              sep = ";", quote = "\"",
              dec = ".", 
              fill = TRUE, comment.char = "")

dates<-x[as.Date(x$Date,format="%d/%m/%Y")=="2007-02-01" |
           as.Date(x$Date,format="%d/%m/%Y")=="2007-02-02",]

dates$Global_active_power<- as.numeric(levels(dates$Global_active_power))[dates$Global_active_power]

plot( 
      dates$Global_active_power,
      type="l",
      ylab= "Global Active Power (kilowatts)",
      xlab= "",
      xaxt="n")

axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))

dev.copy(png, file="plot2.png")
dev.off()
