Trumpisms <- ds4psy::Trumpisms

change_T <- c("i" = "!", "s" = "$")
str_replace_all(Trumpisms,pattern = change_T)
str_replace_all(Trumpisms,"(.)\\1","wall")

chartr(old = "is",new = "!$",x =Trumpisms)
gsub(pattern ="(.)\\1","wall",x = Trumpisms )
