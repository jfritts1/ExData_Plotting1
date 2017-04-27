


##data <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?", stringsAsFactors = FALSE)        

data["NewDate"] <- as.Date(data$Date, "%d/%m/%Y")

data_plot <- data[data$NewDate == "2007-02-01" | data$NewDate == "2007-02-02", ]


datetime <- paste(as.Date(data_plot$NewDate), data_plot$Time) 
data_plot$Datetime <- as.POSIXct(datetime) 


plot(data_plot$Global_active_power~data_plot$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")


dev.copy(png, file="plot2.png", height=480, width=480) 
dev.off() 