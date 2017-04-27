


data["NewDate"] <- as.Date(data$Date, "%d/%m/%Y")

data_plot <- data[data$NewDate == "2007-02-01" | data$NewDate == "2007-02-02", ]


datetime <- paste(as.Date(data_plot$NewDate), data_plot$Time) 
data_plot$Datetime <- as.POSIXct(datetime) 


with(data_plot, {
        plot(data_plot$Sub_metering_1~data_plot$Datetime, type="l",ylab="Energy sub meeting", xlab="")
        lines(data_plot$Sub_metering_2~data_plot$Datetime, col="red")
        lines(data_plot$Sub_metering_3~data_plot$Datetime, col="blue")
})

legend("topright", lty=1, col=c("black","red","blue"), legend=c("sub metering1","sub metering2","sub metering3"))


dev.copy(png, file="plot3.png", height=480, width=480) 
dev.off() 