x<-read.delim("household_power_consumption.txt", 
              header = TRUE, 
              sep = ";", quote = "\"",
              dec = ".", 
              fill = TRUE, comment.char = "")

dates<-x[as.Date(x$Date,format="%d/%m/%Y")=="2007-02-01" |
           as.Date(x$Date,format="%d/%m/%Y")=="2007-02-02",]

gap<- as.numeric(levels(dates$Global_active_power))[dates$Global_active_power]
         
hist(gap,
      xlab= "Global Active Power (kilowatts)",
      main="Global Active Power",
      breaks= 12,
      xlim=c(0,6),
      col= "red",
      xaxt = "n",
      yaxt = "n")

axis(1,at=c(0,2,4,6))
axis(2,at=c(0,200,400,800,1000,1200))
dev.copy(png, file="plot1.png")
dev.off()
