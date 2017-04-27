


        ## read in data
#data <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?", stringsAsFactors = FALSE)        

        ## format date and filter
data["NewDate"] <- as.Date(data$Date, "%d/%m/%Y")
data_plot <- data[data$NewDate == "2007-02-01" | data$NewDate == "2007-02-02", ]
datetime <- paste(as.Date(data_plot$NewDate), data_plot$Time) 
data_plot$Datetime <- as.POSIXct(datetime) 

        # set plot window settings
par(mfrow = c(2,2), mar=c(3,4,2,3.1))

        # plot 
with(data_plot, {
        
        
        plot(data_plot$Global_active_power~data_plot$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
        
        plot(data_plot$Voltage~data_plot$Datetime, type="l", ylab="Voltage", xlab="datetime")
        
        plot(data_plot$Sub_metering_1~data_plot$Datetime, type="l",ylab="Energy sub meeting", xlab="")
        lines(data_plot$Sub_metering_2~data_plot$Datetime, col="red")
        lines(data_plot$Sub_metering_3~data_plot$Datetime, col="blue")

        legend("topright", pch="-", col=c("black","red","blue"), legend=c("sub metering1","sub metering2","sub metering3"))

        plot(data_plot$Global_reactive_power~data_plot$Datetime, type="l", ylab="global_reactive_power", xlab="datetime")
                
})

        # save as png file      
dev.copy(png, file="plot4.png", height=480, width=480) 
dev.off() 