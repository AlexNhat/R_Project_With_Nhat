
# 2186400330 Lê Nguy???n Anh Nh???t

# Bài 1.1
library(tibble)
library(tidyr)
Name <- c("Billy", "Suzy",  "Lionel", "Jenny")
Quiz1 <- c(NA,"F", "B","A")
Quiz2 <- c("D", NA,"C","A")
Test1 <- c("C", NA,"B","B")

data1 <- data.frame(Name, Quiz1, Quiz2,Quiz3)
datab1<- as.tibble(data1)
# Bi???n ð???i thành tidy data
#tidy_data <- tidyr::gather(datab1, key = "Assessment", value = "Grade", -Name, na.rm = TRUE)
tidy_data <- datab1%>% pivot_longer(Quiz1:Test1, names_to = "Assesment", values_to = "Grade")%>% 
  arrange(Name, Assesment)

# In tidy data
print(tidy_data)


# Bài 1.2
library(tidyverse)
library(tibble)

# T???o b???ng d??? li???u ban ð???u
data <- tibble::tribble(
  ~Assessment, ~Billy, ~Suzy, ~Lionel, ~Jenny,
  "Quiz1", NA, "F", "B", "A",
  "Quiz2", "D", NA, "C", "A",
  "Test1", "C", NA, "B", "B"
)

# Bi???n ð???i thành tidy data
tidy_data1.2 <- tidyr::gather(data, key = "Name", value = "Grade", -Assessment, na.rm = TRUE)

# In k???t qu???
print(tidy_data1.2)

# Bài 1.3
library(tidyverse)
library(tidyr)
library(janitor)
data(world_bank_pop)
head(world_bank_pop)
class(world_bank_pop)
usa_pop <- world_bank_pop%>% filter(country == "USA")
tiny_data1.3 <- usa_pop%>% pivot_longer(cols ="2000":"2017", names_to = "Year", 
                                        values_to = "Value" )%>%
    pivot_wider(names_from = indicator, values_from = Value)%>%
  clean_names()

# Bài 1.4
library(tidyr)
library(tidyverse)
library(repurrrsive)
# L???y b??? d??? li???u sw_people
sw_people <- repurrrsive::sw_people

# Kh???i t???o m???t vector r???ng ð??? lýu tên
names_vector <- c()

# L???p qua t???ng ph???n t??? trong list sw_people
for (i in seq_along(sw_people)) {
  # L???y tên ??? d??ng 1
  name <- sw_people[[i]]$name
  # Thêm tên vào vector
  names_vector <- c(names_vector, name)
}
s_out <- sapply(sw_people, "[[", "name")
# In ra vector ch???a tên
print(names_vector)



# Bài 1.5
library(tidyr)
table3 <- tidyr::table3
class(table3)
# Cách 1
table3%>% separate(3, c("cases","population"))
# cach 2
table1.5 <-separate(table3,rate, c("cases","population"))
# separate dùng ð??? tách c???t ra thành các c???t







# Bài 1.6

library(ds4psy)
table6 <- ds4psy::table6

table1.6 <-table6 %>% separate(when_what,c("century","year","cases","population"))


# Bi???n ð???i thành tidy data
tidy_data <- table1.6 %>%
  tidyr::pivot_longer(cols = -country,
                      names_to = "variable",
                      values_to = "value")

# In ra tidy data
print(tidy_data)


# Bài 1.7
library(ds4psy)
library(tidyr)
table5 <- tidyr::table5
table5 <-table5 %>% unite(date, century, year, sep ="")
tidy_table5 <- tidyr::pivot_longer(table5, -country, values_drop_na = TRUE)

# Bài 1,8
library(tidyr)
library(dplyr)
storms <- dplyr::storms
head(storms)
data <- storms %>%
  unite(date, year, month, day, sep = "-")



# Bài 1.9
library(tidyr)
table4a

# Bài 1.10
library(tidyr)
library(dplyr)


de_1.9 <- tribble(
  ~pary, ~share_2013, ~share_2017,
  "CDU/CSU" ,0.415, 0.330,
  "SPD", 0.257, 0.205,
  "Others", 0.328, 0.465
  
)
de_1.10<- de_1.9 %>% gather(share_2013:share_2017, key ="election", value ="share")
    


# bài 1.11
library(tidyr)
library(dplyr)
table2 <- tidyr::table2
spread(data= table2, key = type, value =count)
table%>% spread(key=type,value = count, sep="_")

table2%>% pivot_wider(names_from = "type", values_from = "count")

# Bài 1.12
library(ds4psy)
library(tidyr)
table8 <- ds4psy::table8
table8_tidy <- table8%>% gather(key ="key", value = "value", cases_1999:popu_2000)%>%
  separate(col=key, into = c("type","year")) %>%
  spread(key=type,value ="value")
table8_tidy



# bài 1.13
library(tidyr)
construction <- tidyr::construction
head(construction)
table_tidy1.13 <- construction%>% gather(key ="side",value ="value", 
                                         Northeast:West)
table_tidy1.13 <- table_tidy1.13%>% gather(key ="unit",value ="count", 
                                           `1 unit` :`5 units or more`)
table_tidy1.13



# Bài 1.14 gi???ng 1,13
# Baid 1.15

library(tidyr)
relig_income <- tidyr::relig_income
tabe_tidy1.15 <- relig_income%>% pivot_longer(cols = `<$10k`:`>150k`, names_to = "$",
                                              values_to = "count")
table_tidy1.15

# Bài 1.16
library(tidyr)
us_rent_income <- tidyr::us_rent_income
us_rent_income
table_tidy1.16 <- us_rent_income%>% pivot_wider(names_from = variable,
                                                values_from = c(estimate,moe))
table_tidy1.16

# BÀi 1.17
library(ds4psy)
library(tidyr)
library(dplyr)
t_1 <-  ds4psy::t_1
t_2 <-  ds4psy::t_2
t_3 <-  ds4psy::t_3
t_4 <-  ds4psy::t_4







