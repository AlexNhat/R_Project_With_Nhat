flowery <- tolower(ds4psy::flowery)

set_rose <- "rose|rosa|sory"
sum(str_count(flowery,pattern = set_rose))

str_view_all(flowery,set_rose)


set_rose_love <- "garden|flower|friend|love|save"
set_horror_crime <- "bitch|bullet|crime|hell|lie|loss|murder|rape|thief|zombie"
set_body_part <- "belly|breast|gut|head|leg|nose|toe"
set_objects <- "bolder|moon|rock|stein|stone|pebble|thing"

sum(str_count(flowery,pattern = set_rose_love))
sum(str_count(flowery,pattern = set_horror_crime))
sum(str_count(flowery,pattern = set_body_part))
sum(str_count(flowery,pattern = set_objects))

first_two <- str_extract(flowery,pattern = "[:alpha:]+ [:alpha:]+")
first_two <- str_trim(first_two)


tb <- tibble(first_two) %>%
  mutate(wrd_1 = str_extract(first_two,"[:alpha:]+(?= )"),
         len_1 = nchar(wrd_1),
         len_2 = nchar(first_two) - len_1 - 1,
         first = len_1 > len_2) 


first_two <- str_split(first_two," ",simplify = TRUE)
tb <- as_tibble(first_two) %>%
  mutate(len_1 = nchar(V1),
         len_2 = nchar(V2),
         first = len_1>len_2)

theme_1 <- tb$V1[tb$first]
theme_2 <- tb$V2[!tb$first]
themes <- c(theme_1,theme_2)
themes
