
library(dplyr)
# Ð???c file csv
library(ggplot2)

data_csv <- read.csv("Air_Traffic_Passenger_Statistics.csv", header = T)
dim(data_csv)
head(data_csv)
tail(data_csv)
sum(is.na(data_csv))
str(data_csv)
summary(data_csv)

subset(data_csv, Passenger.Count == 1)
subset(data_csv, Passenger.Count == 659837)

# xem t???t c??? các chuy???n bay
Name_Airline <- unique(data_csv$Operating.Airline)
copy_data <- data_csv
copy_data$Operating.Airline <- as.integer(factor(copy_data$Operating.Airline))
copy_data$Operating.Airline.IATA.Code <- as.integer(factor(copy_data$Operating.Airline.IATA.Code))
copy_data$Boarding.Area <- as.integer(factor(copy_data$Boarding.Area))
copy_data$GEO.Region <- as.integer(factor(copy_data$GEO.Regi))
# n???i ð???a hay quôc t???
copy_data$GEO.Summary <- as.integer(factor(copy_data$GEO.Summary))

hist(copy_data$Passenger.Count)
boxplot(copy_data$Passenger.Count)
# Ki???m ð???nh phân ph???i chu???n shapiro
shapiro.test(copy_data$Passenger.Count[0:10000])

# Bi???u ð??? tr??n tên các chuy???n bay
pie(copy_data$Operating.Airline[0:100])

# Bi???u ð??? scatter
plot(copy_data$Operating.Airline, copy_data$Passenger.Count, xlab = "Name", ylab = "Count", 
     main = "Scatter plot name and count Air")

pie(table(copy_data$GEO.Summary), labels = c("Domestic","Intermational"))

# Hi???n th??? bi???u ð??? bar cho s??? chuy???n mà h??ng ðó bay ðý???c
barplot(table(copy_data$Operating.Airline), xlab="Name", ylab = "Count")


# h???i quy tuy???n tính
model <- lm(Activity.Period~Passenger.Count, data = copy_data)

plot(copy_data$Activity.Period, copy_data$Passenger.Count,
     main = "Linear Regression", xlab = "x", ylab = "y")
abline(model, col = "red")

