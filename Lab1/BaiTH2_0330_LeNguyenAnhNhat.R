
# LÊ Nguy???n Anh Nh???t, 2186400330

# Bài 1.1: 

data <- read.csv("movies.csv")
str(data)
summary(data)
print(nrow(data))
print(ncol(data))

# Bài 1.2:

files <- list.files("E:/R programing/R_Dataset/CarbonSources")
setwd("E:/R programing/R_Dataset/CarbonSources")
for (carbon in files){
  cat("File ", carbon, "\n")
  data = read.table(file= carbon, header = TRUE, sep="\t")
  print(dim(data))
  print(head(carbon))
  str(data)
  print(summary(data))
  print("\n")
  
}

setwd("E:/R programing/R_Dataset")

# Bài 1.3
library("xlsx")

file <- list.files("Employee")
setwd("E:/R programing/R_Dataset/Employee")

for (empoyee in file){
data <- read.xlsx("Employee.xlsx",sheetIndex = 1)
print(head(data))
print(str(data))
col <- ncol(data)
row <- nrow(data)
cat("So luong du lieu la ", row,"\n" )
cat("So luowuong dong la ", col,"\n")
print(summary(data))
}

# BÃ€i 1.4
library("XML")
library("methods")
data <- xmlParse(file = "plant_catalog.xml")
rootdata <- xmlRoot(data)
rootsize <- xmlSize(rootdata)
cat("So Luong du lieu la, ", rootsize)
DataXML <- xmlToDataFrame("plant_catalog.xml")
str(DataXML)
summary(DataXML)


# Bài 1.5
library("rjson")
data <- fromJSON(file = "list1.json")
json_data_frame <- as.data.frame(data)
row <- nrow(json_data_frame)
str(json_data_frame)
cat("So luong du lieu: ", row, "\n")
summary(json_data_frame)

# Bài 1.6
setwd("E:/R programing/R_Dataset/json")
data <- fromJSON(file = "iris.json")
json_data_frame <- as.data.frame(data)
row <- nrow(json_data_frame)
str(json_data_frame)
cat("So luong du lieu: ", row, "\n")
summary(json_data_frame)

# Bài 1.7

files <- list.files("2020PRIRawFiles")
setwd("E:/R programing/R_Dataset/2020PRIRawFiles")
n <- 0
for (file in files){
  data <- read.csv(file)
  row < nrow(data)

  cat("Ten File la ", file,"\n")
  str(data)
  cat("So luong du lieu: ", row,"\n")
  summary(data)
  cat("\n")
  n<- n+1
  if(n==5){
    break
  }
}

# Bài 1.8
files <- list.files("coronavirus")
setwd("E:/R programing/R_Dataset/coronavirus")
n<-0
for (file in files){
  data <- read.csv(file, header = TRUE)
  row < nrow(data)
  # tÃªn file
  cat("Ten File la ", file,"\n")
  str(data)
  cat("So luong du lieu: ", row,"\n")
  summary(data)
  cat("\n")
  n<- n+1
  # Ä‘á»§ 5 file thÃ¬ dá»«ng
  if(n==2){
    break
  }
}


# Bài 1.9
files <- list.files("Omnilog")
setwd("E:/R programing/R_Dataset/Omnilog")
n<-0
for (file in files){
  data <- read.csv(file, header = TRUE)
  row < nrow(data)
  cat("Ten File la ", file,"\n")
  str(data)
  cat("So luong du lieu: ", row,"\n")
  summary(data)
  cat("\n")
  n<- n+1
  if(n==3){
    break
  }
}

# Bài 1.10
files <- list.files("rbook")
setwd("E:/R programing/R_Dataset/rbook")
n<-0
for (file in files){
  # TrÆ°á»ng há»£p file xlsx vÃ  cÃ²n láº¡i lÃ  file csv vá»›i file txt
  if (endsWith(file, ".xlsx")) {
    data <- read.xlsx(file,sheetIndex = 1)
  }
  
  else{
    if (endsWith(file, ".csv")) {
      data <- read.csv(file,header =TRUE)}
    else{
  data <- read.table(file, header = TRUE, sep ="\t")} }
  row < nrow(data)
  cat("Ten File la ", file,"\n")
  str(data)
  cat("So luong du lieu: ", row,"\n")
  summary(data)
  cat("\n")
  n<- n+1
  if(n==5){
    break
  }
}

cat("So Luong file da duyet la ", n)

# Bài 2.1
# Câu a

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


head(data)
tail(data)
dim(data)
attributes(data)
str(data)
summary(data)
var(data$TotalRevenue)
var(data$TotalProducts)
sum(is.na(data))
quantile(data$TotalRevenue)
quantile(data$TotalCustomer)


# Câu B
# S??? d???ng l???i connection bài trý???c
sql1 <- "select p.productCode, p.productName, P.productLine, sum(odd.quantityOrdered) as totalProduct,
		count(distinct  odd.orderNumber) as totalOrder, SUM(odd.quantityOrdered *odd.priceEach) as TotalRevenue
		from products as p inner join orderdetails as odd 
		on p.productCode =odd.productCode 
		group by p.productCode, p.productName, P.productLine"
result1 <-dbSendQuery(connection, sql1)
data1 <- fetch(result1)

head(data1)
tail(data1)
dim(data1)
attributes(data1)
str(data1)
summary(data1)
var(data1$TotalRevenue)
var(data1$totalProduct)
sum(is.na(data1))
quantile(data1$TotalRevenue)
quantile(data1$totalCustomer)

# Câu c
sql2 <- "select c.customerNumber, c.customerName, c.phone, c.city, 
		count(distinct  odd.orderNumber) as TotalOrders, 
		sum(odd.quantityOrdered) as totalProduct,
		SUM(odd.quantityOrdered *odd.priceEach) as TotalRevenue
		from customers as c inner join orders as od on c.customerNumber = od.customerNumber 
		inner join orderdetails as odd on  od.orderNumber =odd.orderNumber
		group by c.customerNumber, c.customerName, c.phone, c.city"
result2 <-dbSendQuery(connection, sql2)
data2 <- fetch(result2)

head(data2)
tail(data2)
dim(data2)
attributes(data2)
str(data2)
summary(data2)
mean(data2$TotalOrders)
var(data2$TotalRevenue)
var(data2$totalProduct)
sum(is.na(data2))


# BÀi 2.2
# Cau a
library(RODBC)
Alex_con = odbcConnect("Northwind")

table_sql <- sqlQuery(Alex_con, "SELECT e.EmployeeID, e.LastName, e.Title, e.BirthDate, 
	sum(od.Quantity) as TotalProducts, count(Distinct c.CustomerID) as TotalCustomers, 
	sum(od.UnitPrice*Quantity)  as TotalRenevue
	from Employees as e INNER JOIN Orders as o on  e.EmployeeID =  o.EmployeeID
	Inner join [Order Details] as od on o.OrderID = od.OrderID
	Inner join Customers as c on o.CustomerID = c.CustomerID
	GROUP BY  e.EmployeeID, e.LastName, e.Title, e.BirthDate")
head(table_sql)
tail(table_sql)
dim(table_sql)
attributes(table_sql)
str(table_sql)
summary(table_sql)
var(table_sql$TotalRenevue)
quantile(table_sql$TotalRenevue)
odbcClose(Alex_con)

#  Câu B
Alex_con = odbcConnect("Northwind")

table_sql1 <- sqlQuery(Alex_con,"SELECT p.ProductID, p.ProductName, p.UnitPrice,
    sum(od.Quantity) as TotalProducts,
		count(Distinct o.OrderID) as TotalOrder,
		sum(od.UnitPrice*Quantity) as TotalRenevue
	FROM Products p inner join [Order Details] od on p.ProductID = od.ProductID
	inner join Orders o on o.OrderID = od.OrderID
	Group by p.ProductID, p.ProductName, p.UnitPrice
")
head(table_sql1)
tail(table_sql1)
dim(table_sql1)
attributes(table_sql1)
str(table_sql1)
summary(table_sql1)
var(table_sql1$TotalRenevue)
quantile(table_sql1$TotalRenevue)
odbcClose(Alex_con)

# Câc c
Alex_con = odbcConnect("Northwind")

table_sql2 <- sqlQuery(Alex_con,"SELECT c.CustomerID, C.CompanyName, c.City, C.[Address], 
                      sum(od.Quantity) as TotalProducts,
                       count(Distinct o.OrderID) as TotalOrder,
                       sum(od.UnitPrice*Quantity) as TotalRenevue
                       FROM Customers c inner join Orders o on o.CustomerID = c.CustomerID
                       inner join [Order Details] od on o.OrderID = od.OrderID
                       Group by c.CustomerID, C.CompanyName, c.City, C.[Address]"
                       
)
head(table_sql2)
tail(table_sql2)
dim(table_sql2)
attributes(table_sql2)
str(table_sql2)
summary(table_sql2)
var(table_sql2$TotalRenevue)
quantile(table_sql2$TotalRenevue)
odbcClose(Alex_con)







# BÃ€i 3.1
library(rvest)
library(tidyverse)

url <- "https://en.wikipedia.org/wiki/List_of_countries_and_dependencies_by_population"
html <- read_html(url)
data <- html_table(html_nodes(html, "table")[[2]])
row = nrow(data)
str(data)
summary(data)


# BÃ€i 3.2
url <- "https://en.wikipedia.org/wiki/List_of_countries_and_dependencies_by_area"
html <- read_html(url)
data <- html_table(html_nodes(html, "table")[[2]])
row = nrow(data)
str(data)
summary(data)


# Bài 4.1
library(dplyr)
library(httr)
library("jsonlite")

response <- GET("https://api.binance.com/api/v3/klines?symbol=BTCUSDT&interval=1d&limit=365")
data <- fromJSON(content(response, "text"))

str(data)
print(nrow(data))
print(summary(data))

# Bài 4.2
response <- GET("https://dummyjson.com/products")

data_api <- fromJSON(content(response, "text"))
str(data_api)
print(nrow(data_api))
print(summary(data_api))


# Bài 5.1
library(foreign) 
data_sav <- read.spss("E:/R programing/R_Dataset/others/mathematics.sav",to.data.frame = TRUE )
print(head(data_sav))
print(tail(data_sav))
str(data_sav)
print(nrow(data_sav))
print(summarry(data_sav))

# BAi 5.2 ,
library("readr")
library(foreign) 
data_sav <- read.spss("E:/R programing/R_Dataset/others/attitudes.sav",to.data.frame = TRUE
                      , use.value.labels = FALSE, reencode = "UTF-8", use.missings = FALSE)

print(head(data_sav))
print(tail(data_sav))
str(data_sav)
print(nrow(data_sav))
print(summarry(data_sav))

# BÃ€i 6.1
library(sf)
my_data <- st_read("E:/R programing/R_Dataset/gis/TPTD_RgPhuong.shp")
library(ggplot2)
ggplot() +
  geom_sf(data = my_data)
# Hi???n th??? b???n ð??? trên màn h??nh
print(ggplot() + geom_sf(data = my_data))

ggsave("path/to/output.png", width = 10, height = 10, dpi = 300)

# Bài 6.2
library(sf)
my_data <- st_read("E:/R programing/R_Dataset/gis/TPTD_GiaoThong_Vung.shp")
library(ggplot2)
ggplot() +
  geom_sf(data = my_data)
# Hi???n th??? b???n ð??? trên màn h??nh
print(ggplot() + geom_sf(data = my_data))

ggsave("path/to/output.png", width = 10, height = 10, dpi = 300)

# Bài 6.3
#Camden_msoa11.shp
# Camden_lsoa11.shp
# Camden_oa11.shp
#E:/R programing/R_Dataset/gis/Camden/Camden_house_sales/Camden_house_sales.shp
library(sf)
library(ggplot2)
camden_map <- st_read("E:/R programing/R_Dataset/gis/Camden/Camden/shapefiles/Camden_lsoa11.shp")
housing_prices<- st_read("E:/R programing/R_Dataset/gis/Camden/Camden_house_sales/Camden_house_sales.shp")

# K???t h???p thông tin v??? giá nhà vào b???n ð???
camden_data <- st_join(camden_map, housing_prices, by = "LSOA11CD")
# V??? b???n ð??? v???i thông tin v??? giá nhà
ggplot() +
  geom_sf(data = camden_data) +
  geom_point(data = housing_prices, aes(x = oseast1m, y = osnrth1m, color = Price))


# Ð???c d??? li???u v??? dân s??? và giá nhà ??? t??? các file thông thý???ng
housing_prices <- read.csv("E:/R programing/R_Dataset/gis/Camden/camdenhousesales15.csv")





population <- st_read("E:/R programing/R_Dataset/gis/Camden/Camden_oa11/Camden_oa11.shp")



ggplot() +
  geom_sf(data = my_data2)
# Hi???n th??? b???n ð??? trên màn h??nh
print(ggplot() + geom_sf(data = my_data2))                     
                      
              
