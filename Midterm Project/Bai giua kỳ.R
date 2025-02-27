
setwd("E:/R programing/R_Dataset")
# Làm v???i file csv hotel_booking.csv
data_csv <- read.csv("hotel_bookings.csv", header = TRUE)
head(data_csv)
tail(data_csv)
dim(data_csv)
names(data_csv)
str(data_csv)

summary(data_csv)
mean(data_csv$lead_time)# trung b??nh
var(data_csv$lead_time)
sum(is.na(data_csv)) #T???ng s??? d??? li???u thi???u
quantile(data_csv$lead_time)
hist(data_csv$lead_time)
barplot(data_csv$lead_time, xlab = "time")
plot(data_csv$lead_time, data_csv$booking_changes)


# d??? li???u  Business-employment-data-september-2022-quarter-csv.csv
data_csv2 <- read.csv("Business-employment-data-september-2022-quarter-csv.csv", header =TRUE)
head(data_csv2)
tail(data_csv2)
names(data_csv2)
dim(data_csv2)
str(data_csv2)
summary(data_csv2)
sum(is.na(data_csv2)) #T???ng s??? d??? li???u thi???u
hist(data_csv2$Data_value)
pie(table(data_csv2$Data_value))
boxplot(Period~Data_value, data = data_csv2 )
# Ch???n ng???u nhiên 500 d??ng t??? b??? d??? li???u c???a b???n
sampled_data <- data_csv2[sample(nrow(data_csv2), 500),]
# gi???i h???n s??? lý???ng m???u
barplot(sampled_data$Data_value, xlab = "Data value")




# 1 file t??? d??? li???u CarbonSources

data_txt <- read.table("E:/R programing/R_Dataset/CarbonSources/BSU1072.txt", header= TRUE
                       ,sep ="\t")
head(data_txt)
tail(data_txt)
names(data_txt)
dim(data_txt)
sum(is.na(data_txt))
str(data_txt)A
summary(data_txt)
var(data_txt$Sorbitol)
# t??m tôc ð??? tãng l???n nh???t
max <- 0
name <- NA
for (data in names(data_txt)[2:6]){
  if (max < var(data_txt[data])){
    max <- var(data_txt[data])
    name <- data
  }
}
print(name)
var(data_txt$Rhamnose)

quantile(data_txt$Rhamnose)

hist(data_txt$Rhamnose)
hist(data_txt$Sorbitol)
pie(table(data_txt$Rhamnose))
barplot(data_txt$Lactose, xlab = "Lactose")
plot(data_txt$Lactose,type = "o", col = "red")
# Tính ma tr???n týõng quan
cor_mat <- cor(data_txt)

# V??? heatmap
heatmap(cor_mat)


# database



library(RMySQL)
connection <- dbConnect(RMySQL::MySQL(),
                        dbname ='productsmgt', host = 'localhost', port =3306,
                        user ='root', password ="1234")
dbListTables(connection)
sql <- "SELECT e.employeeNumber, e.lastName, e.firstName, e.jobTitle,
				SUM(od.quantityOrdered) as TotalProducts,
				SUM(od.quantityOrdered *od.priceEach) as TotalRevenue,
				COUNT(DISTINCT c.customerNumber) as TotalCustomer
FROM employees e
	INNER JOIN customers c on c.salesRepemployeeNumber = e.employeeNumber
	INNER JOIN orders o on o.customerNumber = c.customerNumber
	INNER JOIN orderdetails od on od.orderNumber =o.orderNumber
GROUP BY e.employeeNumber,e.lastName,e.firstName,e.jobTitle"

result <-dbSendQuery(connection, sql)
data <- fetch(result)

class(data)
head(data)
tail(data)
dim(data)
names(data)
str(data)
summary(data)
var(data$TotalRevenue)
var(data$TotalProducts)
sum(is.na(data))
quantile(data$TotalRevenue)
quantile(data$TotalCustomer)
hist(data$TotalRevenue)
pie(table(data$TotalCustomer))
plot(data$TotalRevenue, type = "l", xlab = "Employee Index", ylab = "Total Revenue")
plot(data$TotalProducts, data$TotalRevenue, 
     xlab = "Total Products", ylab = "Total Revenue",
     main = "Scatter plot of Total Products and Total Revenue")

# Tính ma tr???n týõng quan gi???a các bi???n
cor_matrix <- cor(data[, c("TotalProducts", "TotalRevenue", "TotalCustomer")])

# V??? heatmap
heatmap(cor_matrix, annot = TRUE)

boxplot(data$TotalProducts, data$TotalRevenue, main="Boxplot of TotalProducts and TotalRevenue", 
        names=c("TotalProducts", "TotalRevenue"), col=c("orange", "green"), las=1)
# h???i quy tuy???n tính
model <- lm(TotalRevenue ~ TotalProducts, data = data)
plot(TotalRevenue ~ TotalProducts, data = data, main = "Linear Regression", 
     xlab = "Total Products", ylab = "Total Revenue")
abline(model, col = "red")


