library(tidyr)
library(dplyr)
library(tibble)
library(xtable)
library(reshape2)
tb <- read.csv("tidy-data/data/tb.csv", header = TRUE, na.strings = "")
# Lay du lieu n�m 2000 v� chuyen ten  iso2 th�nh country
data_2000 <- tb %>%
  filter(year == 2000) %>%
  rename(country = iso2)

# ��a v??? d???ng tidy
data2.3 <- data_2000%>% gather(new_sp_m04:new_sp_mu, key = "male", value ="count_male", na.rm = TRUE)%>%
  gather(new_sp_f04:new_sp_fu,  key = "female", value ="count_female", na.rm = TRUE)
# L�u d??? li???u d�???i d???ng file latex
write.table(data2.3, file = "du lieu tb.tex", sep = "&", col.names = TRUE, 
            row.names = FALSE, quote = FALSE)


# X??? l?? c�c d??? li???u NA b???ng melt
melted_data <- reshape2::melt(data_2000, id.vars = c("country", "year"), na.rm = TRUE)

# L�u d??? li???u d�???i d???ng file latex
write.table(melted_data, file = "melted_data.tex", sep = "&", col.names = TRUE, row.names = FALSE, 
            quote = FALSE)

#  t�ch th�nh sex vs age
data_sex_age <- data_2000 %>%select(country, year, starts_with("new_sp_")) %>%
  gather(key , value, -country, -year, na.rm = TRUE) %>%
  separate(key, into = c("new_sp","type"), sep = "new_sp_")%>%
  select(-new_sp)%>%
  separate(type, into = c("sex","age"), sep=1)%>%
  mutate(sex = ifelse(sex == "m", "male", "female")) %>%
  select(country, year, sex, age, value)

write.table(data_sex_age, file = "data_sex_age.tex", sep = "&", col.names = TRUE, row.names = FALSE, 
            quote = FALSE)


