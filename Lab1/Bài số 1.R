
# Bài 1.1
movies <- read.csv("movies.csv", header = TRUE)
names(movies)
head(movies)
tail(movies)
dim (movies)
attributes(movies)
str(movies)
summary(movies)
var(movies$revenue)
quantile(movies$revenue)
hist(movies$revenue)
plot(density(movies$revenue))

# BÀi 1.2
library(readr)
dir_path <- "CarbonSources/"
files <- list.files(dir_path)

for (carbon in files){
  # l???y ðý???ng d???n ð???n file
  file_path <- paste0(dir_path, carbon)
  cat("File ", carbon, "\n")
  data <- read.table(file_path, header = TRUE, sep="\t")
  print(dim(data))
  print(head(data))
  print(tail(data))
  print(names(data))
  print(attributes(data))
  print(str(data))
  print(summary(data))
  print(var(data$Sorbitol))
  print(quantile(data$Sorbitol))
  hist(data$Sorbitol)
  distMatix = as.matrix(dist(data[,2:7]))
  heatmap(distMatix)
  print("\n")
}



# Bài 1.3
library("xlsx")
emplooyee <- read.xlsx("Employee/Employee.xlsx",sheetIndex = 1)
names(emplooyee)
head( emplooyee)
tail(emplooyee)
dim (emplooyee)
attributes(emplooyee)
str(emplooyee)
summary(emplooyee)

var(emplooyee$Age)
quantile(emplooyee$Age)
hist(emplooyee$Age)
plot(density(emplooyee$Age))
pie(table(emplooyee$Age))

# Bài 1.4
library("XML")
library("methods")
data <- xmlParse(file = "plant_catalog.xml")
rootdata <- xmlRoot(data)
# chuy???n v??? d???ng data frame
DataXML <- xmlToDataFrame("plant_catalog.xml")
# Phân tích Price, lo???i b??? ði d???u ðô la
DataXML$PRICE <- as.numeric(gsub("\\$", "",DataXML$PRICE ))
names(DataXML)
head(DataXML)
tail(DataXML)
dim (DataXML)
attributes(DataXML)
str(DataXML)
summary(DataXML)
var(DataXML$PRICE )
quantile(DataXML$PRICE )
hist(DataXML$PRICE)
plot(density(DataXML$PRICE))
pie(table(DataXML$PRICE))

# Bài 1.5
library("jsonlite")
data <- fromJSON("json/list1.json")
json_data_frame <- as.data.frame(data)
# chuy???n c???t Age v??? ki???u int
json_data_frame$Age <- as.integer(json_data_frame$Age)
names(json_data_frame)
head(json_data_frame)
tail(json_data_frame)
dim (json_data_frame)
attributes(json_data_frame)
str(json_data_frame)
summary(json_data_frame)
var(json_data_frame$Age)
quantile(json_data_frame$Age)
hist(json_data_frame$Age)
plot(density(json_data_frame$Age))
pie(table(json_data_frame$Age))

# Bài 1.6
library("rjson")
data <- fromJSON(file = "json/iris.json")
json_data_frame1 <- as.data.frame(data)
# chuy???n c???t Age v??? ki???u int

names(json_data_frame1)
head(json_data_frame1)
tail(json_data_frame1)
dim (json_data_frame1)
attributes(json_data_frame1)
str(json_data_frame1)
summary(json_data_frame1)
var(json_data_frame1$sepalLength)
quantile(json_data_frame1$sepalLength)
hist(json_data_frame1$sepalLength)
pie(table(json_data_frame1$sepalLength))
boxplot(json_data_frame1$sepalLength)


# Bài 1.7


dir_path <- "2020PRIRawFiles/"
files <- list.files(dir_path)
n <- 0
for (file in files){
  file_path <- paste0(dir_path, file)
  cat("File ", file, "\n")

  data <- read.csv(file_path, header =  TRUE)
  print(head(data))
  print(tail(data))
  print(dim (data))
  print(attributes(data))
  print(str(data))
  print(summary(data))
  print(var(data$VoteCount))
  print(quantile(data$VoteCount))
  hist(data$VoteCount)
  plot(density(data$VoteCount))
  pie(table(data$VoteCount))
  boxplot(table(data$VoteCount))
  
  
  n<- n+1
  if(n==5){
    break
  }
  cat("\n")
}

# Bài 1.8

data = read.csv("coronavirus/coronavirus.csv")

data$province = as.factor(data$province)
data$country = as.factor(data$country)
data$iso2 = as.factor(data$iso2)
data$iso3 = as.factor(data$iso3)
data$uid = as.factor(data$uid)
data$code3 = as.factor(data$code3)
data$population = as.factor(data$population)
data$continent_name = as.factor(data$continent_name)
data$continent_code = as.factor(data$continent_name)
data$long = as.factor(data$long)
data$lat = as.factor(data$lat)
print(data)
head(data)
dim(data)
str(data)
names(data)
attributes(data)
summary(data)
quantile(data$cases)
var(data$cases)
hist(data$cases)
plot(density(data$cases))
pie(table(data$country))
boxplot(data$cases)

data_x = read.csv("coronavirus/vaccination-data.csv")
print(data_x)
head(data_x)
dim(data_x)
str(data_x)
names(data_x)
attributes(data_x)
summary(data_x)

# Bài 1.9
dir_path = "Omnilog/"
datasets <- list()

for (file_name in list.files(dir_path)) {
  data = read.csv(paste0(dir_path, file_name))
  datasets[[file_name]] = data
}
data_x = datasets[2:5]
n<-0
for (data in data_x){
  data$Data.File = as.factor(data$Data.File)
  data$Position = as.factor(data$Position)
  data$Plate.Type = as.factor(data$Plate.Type)
  data$Strain.Name = as.factor(data$Strain.Name)
  data$Strain.Number = as.factor(data$Strain.Number)
  
  print(data)
  head(data)
  dim(data)
  str(data)
  names(data)
  attributes(data)
  summary(data)
  quantile(data$A01)
  var(data$A01)
  hist(data$A01)
  plot(density(data$A01))
  cov(data[,10:12])
  cor(data[,10:12])
  boxplot(data[,10:12])
  
  plot(data[,10:12])
  pairs(data[,10:12])
  if (n==3){
    break
  }
  
}


# Bài 1.10
dir_path ="rbook/"
files <- list.files("rbook")
n<-0
for (file in files){
    file_path =paste0(dir_path, file)

  if (endsWith(file, ".xlsx")) {
    data <- read.xlsx(file_path,sheetIndex = 1)
  }
  
  else{
    if (endsWith(file, ".csv")) {
      data <- read.csv(file_path,header =TRUE)}
    else{
      data <- read.table(file_path, header = TRUE, sep ="\t")} }
  row <- nrow(data)
  cat("Ten File la ", file,"\n")
  print(str(data))
  cat("So luong du lieu: ", row,"\n")
  print(summary(data))
  cat("\n")
  n<- n+1
  if(n==5){
    break
  }
}









