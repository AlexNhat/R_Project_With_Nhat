# BÀi 2.1
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


# Câu b
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
hist(data1$TotalRevenue)

# CÃ¢u c
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
hist(data2$TotalRevenue)



# BÃ€i 2.2
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
hist(table_sql$TotalRenevue)
plot(density(table_sql$TotalRenevue))
boxplot(table_sql$TotalRenevue)
odbcClose(Alex_con)

#  CÃ¢u B
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
hist(table_sql1$TotalRenevue)
plot(density(table_sql1$TotalRenevue))
boxplot(table_sql1$TotalRenevue)
odbcClose(Alex_con)

# CÃ¢c c
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
hist(table_sql2$TotalRenevue)
plot(density(table_sql2$TotalRenevue))
boxplot(table_sql2$TotalRenevue)
odbcClose(Alex_con)
