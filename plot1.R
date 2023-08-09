library(stringr)
household_power_consumption <- read.delim('household_power_consumption.txt', sep = ';')
household_power_consumption$Date <- as.Date(household_power_consumption$Date,format = '%d/%m/%Y')
filt <- household_power_consumption[household_power_consumption$Date%in%c('2007-02-01','2007-02-02'),]


#plot1
hist(as.numeric(filt$Global_active_power), col = 'red',
     main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', ylim = c(0,1200),breaks=25, xlim=c(0,6));options(scipen=999)


png('plot%d.png',width = 480,height = 480,res=1)
dev.off()



