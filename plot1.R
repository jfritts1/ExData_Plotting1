

        ## read in data
#data <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?", stringsAsFactors = FALSE)        

        ## reset plots to 1 plot per window        
par(mfrow=c(1,1))
        
        ## format date and filter
data["NewDate"] <- as.Date(data$Date, "%d/%m/%Y")
data_plot <- data[data$NewDate == "2007-02-01" | data$NewDate == "2007-02-02", ]


        # plot 
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

        # save as png file
dev.copy(png, file="plot1.png", height=480, width=480) 
dev.off() 


