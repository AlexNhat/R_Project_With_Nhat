library(tidyr)
library(ds4psy)
library(dplyr)
knitr::kable(tidyr::table4a,caption = "table4a:TB cases per country and year.")

table4a <- tidyr::table4a
data <- table4a%>% pivot_longer(`1999`:`2000`, values_to = "population",names_to = "year")

#
table3 <- tidyr::table3
data2 <- separate(data = table3, col =rate, into = c("cases", "population" ), sep ="/", remove= TRUE)

# d??? l???i c???t d??? li???u khi remove là FAlSe
# convert TRUE d??? l???i ki???u d??? li???u c?? khi tách ra

table3%>%separate(3, c("cases","population"), remove =T)
table3%>%separate(3, c("cases","population"), remove =F)
table3%>%separate(3, c("cases","population"), convert = T)

table6 <- ds4psy::table6

data <- table6%>% separate(2,c("when","population"), sep ="/", convert = T)%>%
  separate(col = when, into = c("when","type"), sep="_", convert = TRUE)%>%
  separate(col = type, into = c("year","cases"), convert = F)%>%
  unite("year",when:year,remove =TRUE, sep = "")
  
table5 <- tidyr::table5
table5%>%unite("year", century,year, sep="")


data <-gather(data = table4a,key = year, value = cases,`1999`:`2000`, factor_key = F)

spread(data = table2, key = type, value= count,sep = "-")








table2 <- tidyr::table2

table2
table2 %>%pivot_wider(names_from = "type",values_from = "count")





table8 <- ds4psy::table8

dim(table8) # 3 x 5

table8_tidy <- table8 %>%
  gather(key = "key", value = "value",
         cases_1999:popu_2000) %>%
  separate(col = key, into = c("type", "year")) %>%
  spread(key = type, value = "value")

names(table8_tidy)[4] <- "population"
# fix variable name
table8_tidy






table8 <- ds4psy::table8

dim(table8)
t8a <- table8 %>%
  select(country:cases_2000) %>%
  gather(key = "key", value = "cases",
         cases_1999:cases_2000) %>%
  separate(col = key, into = c("drop", "year")) %>%
  select(country, year, cases) %>%
  arrange(country, year)
t8a

t8b <- table8 %>%
  select(country, popu_1999:popu_2000) %>%
  gather(key = "key", value = "population",
         popu_1999:popu_2000) %>%
  separate(col = key, into = c("drop", "year")) %>%
  select(country, year, population) %>%
  arrange(country, year)
t8b

table8_tidy_2 <- dplyr::left_join(t8a, t8b)
table8_tidy_2
table8_tidy_2b <- t8a # copy
table8_tidy_2b$population <- t8b$population
# CAREFUL: Ensure that both tables are in
same order (see arrange above)!
  table8_tidy_2b




table8 <- ds4psy::table8

dim(table8) # 3 x 5

#> [1] 3 5

# Convert into data frame:

table8 <- as.data.frame(table8)

dim(table8)
table8_long <- stats::reshape(table8,varying = list(cases = c("cases_1999", "cases_2000"), 
                                           
                        population = c("popu_1999", "popu_2000")), direction = "long",
                              
                              v.names = c("cases", "population"), # to rename combined variables
                              
                              timevar = "time", # name of time variable
                              
                              idvar = "nr" # name of id variable
                              
)

table8_long

table8_long$year <- NA 
table8_long$year[table8_long$time == 1] <- 1999
table8_long$year[table8_long$time == 2] <- 2000
table8_tidy_3 <- table8_long %>%select(country, year, cases, population) %>%
  arrange(country, year)
table8_tidy_3$year <- as.character(table8_tidy_3$year)
table8_tidy_3 <- tibble::as_tibble(table8_tidy_3)
table8_tidy_3










table8 <- ds4psy::table8

dim(table8) 

table8_tidy_4 <- table8 %>%tidyr::pivot_longer(cols = cases_1999:popu_2000,
                      
                      names_to = c(".value", "year"),
                      
                      names_sep = "_")
table8_tidy_4$year <- as.character(table8_tidy_4$year)
table8_tidy_4 <- table8_tidy_4 %>% rename(population =popu)

table8_tidy_4






all.equal(table8_tidy, table8_tidy_2,check.attributes = FALSE) 
all.equal(table8_tidy, table8_tidy_2b,check.attributes = FALSE) 
all.equal(table8_tidy, table8_tidy_3, check.attributes = FALSE) 
all.equal(table8_tidy, table8_tidy_4,check.attributes = FALSE)















myVector <- c(NA, "TP", 4, 6.7, 'c', NA,
              12)

myVector
myVector <- c(NA, "TP", 4, 6.7, 'c', NA,12) 
is.na(myVector)

myVector <- c(NA, "TP", 4, 6.7, 'c', NA, 12)
which(is.na(myVector))
myVector <- c(NA, "TP", 4, 6.7, 'c', NA, 12)
sum(is.na(myVector))


myVector <- c(NA, 100, 241, NA, 0 / 0, 101, 0 /0)
is.nan(myVector)








myVector <- c(NA, "TP", 4, 6.7, 'c', NA, 12)
na.exclude(myVector)

# omit

myVector <- c(NA, "TP", 4, 6.7, 'c', NA, 12)
na.omit(myVector)

# fail

myVector <- c(NA, "TP", 4, 6.7, 'c', NA, 12)
na.fail(myVector)




myVector1 <- c(200, 112, NA, NA, NA, 49, NA,
               190)

logicalVector1 <- is.na(myVector1)

newVector1 = myVector1[! logicalVector1]

print(newVector1)


myVector2 <- c(100, 121, 0 / 0, 123, 0 / 0, 49, 0 / 0,
               290)

logicalVector2 <- is.nan(myVector2)

newVector2 = myVector2[! logicalVector2]

print(newVector2)









dataframe <- data.frame(Name = c("Bhuwanesh",
                                 "Anil", "Jai", "Naveen"), Physics = c(98, 87, 91, 94),
                        Chemistry = c(NA, 84, 93, 87), Mathematics = c(91,
                                                                       86, NA, NA))

print(dataframe)
listMissingColumns <-colnames(dataframe)[ apply(dataframe,2, anyNA)]

print(listMissingColumns)





meanMissing <- apply(dataframe[,colnames(dataframe) %in%
                                 listMissingColumns], 2, mean, na.rm = TRUE)
print(meanMissing)

medianMissing <- apply(dataframe[,colnames(dataframe) %in%
                                   listMissingColumns], 2, median, na.rm = TRUE)
print(medianMissing)





