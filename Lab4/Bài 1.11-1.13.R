# BÀi 1.11
library(stringr)
library(dplyr)
words <- stringr::words
# ð???m ch??? age
sum(str_count(words, "age"))
str_subset(words, "age")

# T??m các t??? k???t thúc b???ng "ing"
 str_subset(words, "ing$")

# T??m các t??? ch???a "ing", nhýng không k???t thúc b???ng "ing"
str_subset(words, "ing") %>%
  filter(!str_detect(., "ing$"))

# T??m các t??? có t??? 10 k?? t??? tr??? lên
str_subset(words, "\\b\\w{10,}\\b")

 str_subset(words, "^[aeiou]+$")
str_subset(words, "^[^aeiou]+$")
str_subset(words, "^([a-z])\\w*\\1$")



# Bài 1.12
library(stringr)
library(ds4psy)
 fruits <- ds4psy::fruits
 count_a <- sum(str_count(fruits, "a"))
 count_e <- sum(str_count(fruits, "e"))
 
 if (count_a > count_e) {
   cat("Có nhi???u lo???i trái cây ch???a k?? t??? 'a' hõn k?? t??? 'e'.")
 } else if (count_a < count_e) {
   cat("Có nhi???u lo???i trái cây ch???a k?? t??? 'e' hõn k?? t??? 'a'.")
 } else {
   cat("S??? lo???i trái cây ch???a k?? t??? 'a' và 'e' là nhý nhau.")
 }

 
 
 count_ana <- sum(str_count(fruits, "ana"))
 count_po <- sum(str_count(fruits, "po"))
 
 if (count_ana > count_po) {
   cat("Có nhi???u lo???i trái cây ch???a d??y k?? t??? 'ana' hõn d??y 'po'.")
 } else if (count_ana < count_po) {
   cat("Có nhi???u lo???i trái cây ch???a d??y k?? t??? 'po' hõn d??y 'ana'.")
 } else {
   cat("S??? lo???i trái cây ch???a d??y k?? t??? 'ana' và 'po' là nhý nhau.")
 }
 
 
 search_chars <- c("x", "y", "z")
 fruit_count_chars <- str_count(fruits, paste0("[", paste0(search_chars, collapse = ""), "]"))
 count_chars <- sum(fruit_count_chars > 0)
 fruits_chars <- fruits[fruit_count_chars > 0]
 
 cat("S??? lo???i trái cây ch???a k?? t??? 'x', 'y' ho???c 'z':", count_chars, "\n")
 cat("Lo???i trái cây ch???a k?? t??? 'x', 'y' ho???c 'z':", "\n")
 print(fruits_chars)
 

 berry_types <- c("strawberry", "raspberry", "blueberry", "blackberry")
 other_fruits <- fruits[!fruits %in% berry_types]
 fruit_count_chars <- str_count(other_fruits, "[xyz]")
 count_chars <- sum(fruit_count_chars > 0)
 fruits_chars <- other_fruits[fruit_count_chars > 0]
 
 cat("S??? lo???i trái cây không ph???i là h??? berries ch???a k?? t??? 'x', 'y' ho???c 'z':", count_chars, "\n")
 cat("Lo???i trái cây không ph???i là h??? berries ch???a k?? t??? 'x', 'y' ho???c 'z':", "\n")
 print(fruits_chars)
 

 
 
 # Bài 1.13
 library(stringr)
 library(ds4psy)
 fruits <- ds4psy::fruits
 # T???o tibble ft ch???a tên c???a các lo???i trái cây
 ft <- tibble(name = fruits)
 
 # Thêm c???t len ch???a ð??? dài c???a m???i tên trái cây
 ft <- ft %>% mutate(len = str_length(name))
 
 # Thêm c???t n_vow ð???m s??? nguyên âm trong m???i tên trái cây
 ft <- ft %>% mutate(n_vow = str_count(name, "[aeiou]"))
 
 # Thêm c???t n_con ð???m s??? ph??? âm trong m???i tên trái cây
 ft <- ft %>% mutate(n_con = str_count(name, "[^aeiou]"))
 
 # Xác minh len b???ng t???ng c???a n_vow và n_con cho t???t c??? các trái cây trong ft
 ft <- ft %>% mutate(check_len = len == n_vow + n_con)
 
 # L???c các trái cây ch???a hõn 50% nguyên âm
 vowel_percent = ft %>% mutate(vowel_percent = n_vow / len * 100)
 
 vowel_above_50_percent <- vowel_percent %>% filter(vowel_percent > 50)
 print(ft)
 print(vowel_above_50_percent$name)
 
 
 

 




