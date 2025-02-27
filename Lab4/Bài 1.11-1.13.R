# B�i 1.11
library(stringr)
library(dplyr)
words <- stringr::words
# �???m ch??? age
sum(str_count(words, "age"))
str_subset(words, "age")

# T??m c�c t??? k???t th�c b???ng "ing"
 str_subset(words, "ing$")

# T??m c�c t??? ch???a "ing", nh�ng kh�ng k???t th�c b???ng "ing"
str_subset(words, "ing") %>%
  filter(!str_detect(., "ing$"))

# T??m c�c t??? c� t??? 10 k?? t??? tr??? l�n
str_subset(words, "\\b\\w{10,}\\b")

 str_subset(words, "^[aeiou]+$")
str_subset(words, "^[^aeiou]+$")
str_subset(words, "^([a-z])\\w*\\1$")



# B�i 1.12
library(stringr)
library(ds4psy)
 fruits <- ds4psy::fruits
 count_a <- sum(str_count(fruits, "a"))
 count_e <- sum(str_count(fruits, "e"))
 
 if (count_a > count_e) {
   cat("C� nhi???u lo???i tr�i c�y ch???a k?? t??? 'a' h�n k?? t??? 'e'.")
 } else if (count_a < count_e) {
   cat("C� nhi???u lo???i tr�i c�y ch???a k?? t??? 'e' h�n k?? t??? 'a'.")
 } else {
   cat("S??? lo???i tr�i c�y ch???a k?? t??? 'a' v� 'e' l� nh� nhau.")
 }

 
 
 count_ana <- sum(str_count(fruits, "ana"))
 count_po <- sum(str_count(fruits, "po"))
 
 if (count_ana > count_po) {
   cat("C� nhi???u lo???i tr�i c�y ch???a d??y k?? t??? 'ana' h�n d??y 'po'.")
 } else if (count_ana < count_po) {
   cat("C� nhi???u lo???i tr�i c�y ch???a d??y k?? t??? 'po' h�n d??y 'ana'.")
 } else {
   cat("S??? lo???i tr�i c�y ch???a d??y k?? t??? 'ana' v� 'po' l� nh� nhau.")
 }
 
 
 search_chars <- c("x", "y", "z")
 fruit_count_chars <- str_count(fruits, paste0("[", paste0(search_chars, collapse = ""), "]"))
 count_chars <- sum(fruit_count_chars > 0)
 fruits_chars <- fruits[fruit_count_chars > 0]
 
 cat("S??? lo???i tr�i c�y ch???a k?? t??? 'x', 'y' ho???c 'z':", count_chars, "\n")
 cat("Lo???i tr�i c�y ch???a k?? t??? 'x', 'y' ho???c 'z':", "\n")
 print(fruits_chars)
 

 berry_types <- c("strawberry", "raspberry", "blueberry", "blackberry")
 other_fruits <- fruits[!fruits %in% berry_types]
 fruit_count_chars <- str_count(other_fruits, "[xyz]")
 count_chars <- sum(fruit_count_chars > 0)
 fruits_chars <- other_fruits[fruit_count_chars > 0]
 
 cat("S??? lo???i tr�i c�y kh�ng ph???i l� h??? berries ch???a k?? t??? 'x', 'y' ho???c 'z':", count_chars, "\n")
 cat("Lo???i tr�i c�y kh�ng ph???i l� h??? berries ch???a k?? t??? 'x', 'y' ho???c 'z':", "\n")
 print(fruits_chars)
 

 
 
 # B�i 1.13
 library(stringr)
 library(ds4psy)
 fruits <- ds4psy::fruits
 # T???o tibble ft ch???a t�n c???a c�c lo???i tr�i c�y
 ft <- tibble(name = fruits)
 
 # Th�m c???t len ch???a �??? d�i c???a m???i t�n tr�i c�y
 ft <- ft %>% mutate(len = str_length(name))
 
 # Th�m c???t n_vow �???m s??? nguy�n �m trong m???i t�n tr�i c�y
 ft <- ft %>% mutate(n_vow = str_count(name, "[aeiou]"))
 
 # Th�m c???t n_con �???m s??? ph??? �m trong m???i t�n tr�i c�y
 ft <- ft %>% mutate(n_con = str_count(name, "[^aeiou]"))
 
 # X�c minh len b???ng t???ng c???a n_vow v� n_con cho t???t c??? c�c tr�i c�y trong ft
 ft <- ft %>% mutate(check_len = len == n_vow + n_con)
 
 # L???c c�c tr�i c�y ch???a h�n 50% nguy�n �m
 vowel_percent = ft %>% mutate(vowel_percent = n_vow / len * 100)
 
 vowel_above_50_percent <- vowel_percent %>% filter(vowel_percent > 50)
 print(ft)
 print(vowel_above_50_percent$name)
 
 
 

 




