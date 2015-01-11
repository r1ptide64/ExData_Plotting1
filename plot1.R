df<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE,colClasses="character")
df<-df[df$Date %in% c("1/2/2007","2/2/2007"),]
df[,3]<-as.numeric(df[,3])
png("plot1.png")
par(bg="transparent")
hist(df[,3],col="red",breaks=12,xlab="Global Activer Power (kilowatts)",main="Global Active Power")
dev.off()