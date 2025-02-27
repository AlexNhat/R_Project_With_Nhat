
# Bài 1.1
library(stringr)
# Greek Letter
"\u03B1/\u0391"  
"\u03B2/\u0392"  
"\u03B3/\u0393"  
"\u03B4/\u0394"  
"\u03B5/\u0395"  
"\u03C6/\u03A6"  
"\u03C7/\u03A7"  
"\u03C8/\u03A8"  
"\u03C9/\u03A9"  
"\u03C3/\u03A3"

# card suits
"\u2660/\u2664"
"\u2665/\u2661"
"\u2666/\u2662"
"\u2663/\u2667"

#Dice SYmbol
"\u2680" 
"\u2681"
"\u2682"
"\u2683"
"\u2684"  
"\u2685"

# Ding barts
"\u2702" 
"\u270D"
"\u270E"

#Pointer
"\u261C"   
"\u261D"   
"\u261E"   
"\u261F"


# Dashes
"\u2013"  
"\u2014"  
"\u2015"


# Emoji
"\U1F642"  
"\U1F605"  
"\U1F63E"  
"\U1F607" 
"\U1F631"

# Bài 1.2

# Misc. Symbols:
"\u2600"
"\u2601"
"\u2602"
"\u2603"
"\u2605"  
"\u2606"
"\u260E"

#hazard etc.
"\u2620"   
"\u2622"   
"\u262E"   
"\u262F"


# planets/genders
"\u2640" 
"\u2641"  
"\u2642" 
"\u26A7" 

#Zodiac
"\u2648"   
"\u264B"   
"\u2653"   


#Music
"\U1D11E"  
"\U2669"   
"\U266B"   

#others
"\U2615"   
"\U1D2E0"  
"\U10CB1"
"\U2757"   
"\U267F"   
"\U26BD"   
"\U26F5"  

# Bài 1.3
# Print Dashes
cat("Dashes: \u2013 \u2014 \u2015\n")

# Print Emoticons
cat("Emoticons: \U0001F642 \U0001F605 \U0001F63E \U0001F607 \U0001F631\n")

# Print Misc. symbols
cat("Misc. symbols: \u2615 \u264B \u26A7 \u267F \u26BD \u26F5\n")


# bài 1.4
# Display A B C
cat(paste(LETTERS[1:3], collapse = " "), "\n")
# Display x y z
cat(paste(letters[24:26], collapse = " "), "\n")

# Display Nov Dec
cat(paste(month.abb[11:12], collapse = " "), "\n")

# Display July August September
cat(paste(month.name[7:9], collapse = " "), "\n")

# Display May June July
cat(paste(month.name[c(5, 6, 7)], collapse = " "), "\n")



# Bài 1.5
# T???o vector s??? nguyên t??? -25 ð???n 50
my_vector <- sample(-25:50, 20, replace = TRUE)

# Chuy???n ð???i sang ki???u character
my_vector <- as.character(my_vector)

# S???p x???p l???i vector
my_vector <- sort(my_vector)
print(class(my_vector))
print(typeof(my_vector))
# Hi???n th??? vector sau khi s???p x???p
print(my_vector)






# Bài 1.6
library(dplyr)

# T???o tibble t??? h???ng s??? LETTERS
my_tibble <- tibble(
  participant = LETTERS,
  initials = paste0(sample(LETTERS, 26, replace = FALSE), ".H."),
  age = sample(18:30, length(LETTERS), replace = TRUE),
  may_drink = age > 19
)

# Hi???n th??? tibble
print(my_tibble)


# BÀi 1.7

library(stringi)
library(stringr)
paragraph  <- "Far over the misty mountains cold To dungeons deep and caverns old We must away ere break of day To seek the pale enchanted gold. The dwarves of  yore made mighty spells, While hammers fell like ringing bells In places deep,  where dark things sleep, In hollow halls beneath the fells. For ancient king  and elvish lord There many a gleaming golden hoard They shaped and wrought,  and light they caught To hide in gems on hilt of sword. On silver necklaces  they strung The flowering stars, on crowns they hung The dragon-fire, in  twisted wire They meshed the light of moon and sun. Far over the misty  mountains cold To dungeons deep and caverns old We must away, ere break of  day, To claim our long-forgotten gold. Goblets they carved there for  themselves And harps of gold; where no man delves There lay they long, and  many a song Was sung unheard by men or elves. The pines were roaring on the height, The winds were moaning in the night. The fire was red, it flaming  spread; The trees like torches blazed with light. The bells were ringing in  the dale And men they looked up with faces pale; The dragon’s ire more fierce  than fire Laid low their towers and houses frail. The mountain smoked beneath  the moon; The dwarves they heard the tramp of doom. They fled their hall to  dying fall Beneath his feet, beneath the moon. Far over the misty mountains  grim To dungeons deep and caverns dim We must away, ere break of day, To win our harps and gold from him!
"

# Ð???m s??? k?? t???
char_count <- nchar(paragraph)

# Ð???m s??? t???
word_count <- length(str_split(paragraph, "\\s+")[[1]])

# Chuy???n sang ch??? HOA
uppercase <- str_to_upper(paragraph)

# Chuy???n sang ch??? thý???ng
lowercase <- str_to_lower(paragraph)

# Chuy???n sang ki???u tiêu ð???
titlecase <- str_to_title(paragraph)

# Chuy???n sang ki???u in hoa ð???u câu
sentencecase <- str_to_sentence(paragraph)

# T???o vector câu
sentences <- str_split(paragraph, "\\.")[[1]]

# In k???t qu???
cat("S??? k?? t???:", char_count, "\n")
cat("S??? t???:", word_count, "\n")
cat("Ch??? HOA:", uppercase, "\n")
cat("Ch??? thý???ng:", lowercase, "\n")
cat("Ki???u tiêu ð???:", titlecase, "\n")
cat("Ki???u in hoa ð???u câu:", sentencecase, "\n")
cat("Vector câu:", "\n")
print(sentences)



# Bài 1.8
library(stringr)
text <- "The cat sat on the mat.The mad hatter had heard her, so what?The fat dad was so sad."

str_view_all(text,"\\b[:alpha:]+at\\b")
str_extract_all(text,"\\b[:alpha:]+at\\b")

str_view_all(text,"\\b[:alpha:]{3}\\b")
str_extract_all(text,"\\b[:alpha:]{3}\\b")

str_view_all(text,boundary("word"))
str_view_all(text,boundary("sentence"))
str_view_all(text,"T")
str_view_all(text, regex("A", ignore_case = TRUE))
str_view_all(text, "hat", match = T)

str_replace_all(text, "[aeiou]","_")

str_replace_all(text, "([aeiou])","\\1\\1\\1")
str_replace_all(text, "[aeiou]",c("1","2","3"))

# Bài 1.9
library(stringr)
str_flatten(letters)
str_flatten(letters, collapse = "_")
str_flatten(letters, collapse = "+")
str_flatten(letters, collapse = "-")

paste(letters, collapse = "")
paste(letters, collapse = "_")


# Bài 1.10
text = "In this chapter, you will learn a consisten way to organise your data in R, 
an organisation called tidy data. Getting your data into this format requires some upfront work, 
but that work pays off in the long term.
One you have tidy data and tidy tools provided by packages in the tidyverse, 
you will spend much less time munging data from one representation to another, 
allowing you to spend more time on the analytic questions at hand."

# T??m danh t??? ði kèm v???i m???o t??? týõng ???ng
noun_phrases <- str_extract_all(text, "\\b(the|a|an) \\w+")

# In danh sách các danh t??? ði kèm m???o t??? týõng ???ng
cat("Danh t??? ði kèm m???o t??? týõng ???ng:\n")
for (phrase in noun_phrases[[1]]) {
  cat(phrase, "\n")
}
























