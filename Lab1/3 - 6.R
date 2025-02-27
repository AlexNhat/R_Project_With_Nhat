# B?????i 3.1
library(rvest)
library(tidyverse)

url <- "https://en.wikipedia.org/wiki/List_of_countries_and_dependencies_by_population"
html <- read_html(url)
data <- html_table(html_nodes(html, "table")[[2]])
row = nrow(data)
str(data)
summary(data)


# B?????i 3.2
url <- "https://en.wikipedia.org/wiki/List_of_countries_and_dependencies_by_area"
html <- read_html(url)
data <- html_table(html_nodes(html, "table")[[2]])
row = nrow(data)
str(data)
summary(data)


# B??i 4.1
library(dplyr)
library(httr)
library("jsonlite")

response <- GET("https://api.binance.com/api/v3/klines?symbol=BTCUSDT&interval=1d&limit=365")
data <- fromJSON(content(response, "text"))

str(data)
print(nrow(data))
print(summary(data))

# B??i 4.2
response <- GET("https://dummyjson.com/products")

data_api <- fromJSON(content(response, "text"))
str(data_api)
print(nrow(data_api))
print(summary(data_api))


# B??i 5.1
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

# B?????i 6.1
library(sf)
my_data <- st_read("E:/R programing/R_Dataset/gis/TPTD_RgPhuong.shp")
library(ggplot2)
ggplot() +
  geom_sf(data = my_data)
# Hi???n th??? b???n ????? tr??n m??n h??nh
print(ggplot() + geom_sf(data = my_data))

ggsave("path/to/output.png", width = 10, height = 10, dpi = 300)

# B??i 6.2
library(sf)
my_data <- st_read("E:/R programing/R_Dataset/gis/TPTD_GiaoThong_Vung.shp")
library(ggplot2)
ggplot() +
  geom_sf(data = my_data)
# Hi???n th??? b???n ????? tr??n m??n h??nh
print(ggplot() + geom_sf(data = my_data))

ggsave("path/to/output.png", width = 10, height = 10, dpi = 300)

# B??i 6.3
#Camden_msoa11.shp
# Camden_lsoa11.shp
# Camden_oa11.shp
#E:/R programing/R_Dataset/gis/Camden/Camden_house_sales/Camden_house_sales.shp
library(sf)
library(ggplot2)
camden_map <- st_read("E:/R programing/R_Dataset/gis/Camden/Camden/shapefiles/Camden_lsoa11.shp")
housing_prices<- st_read("E:/R programing/R_Dataset/gis/Camden/Camden_house_sales/Camden_house_sales.shp")

# K???t h???p th??ng tin v??? gi?? nh?? v??o b???n ?????
camden_data <- st_join(camden_map, housing_prices, by = "LSOA11CD")
# V??? b???n ????? v???i th??ng tin v??? gi?? nh??
ggplot() +
  geom_sf(data = camden_data) +
  geom_point(data = housing_prices, aes(x = oseast1m, y = osnrth1m, color = Price))


# ?????c d??? li???u v??? d??n s??? v?? gi?? nh?? ??? t??? c??c file th??ng th?????ng
housing_prices <- read.csv("E:/R programing/R_Dataset/gis/Camden/camdenhousesales15.csv")





population <- st_read("E:/R programing/R_Dataset/gis/Camden/Camden_oa11/Camden_oa11.shp")



ggplot() +
  geom_sf(data = my_data2)
# Hi???n th??? b???n ????? tr??n m??n h??nh
print(ggplot() + geom_sf(data = my_data2))                     


