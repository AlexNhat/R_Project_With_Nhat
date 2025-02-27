Bushisms <- ds4psy::Bushisms

change_B <- c("I" = "you", "my" = "your",
              "your" = "my", "Your" = "My",
              "you" = "I","You" = "I")
str_replace_all(Bushisms,pattern = change_B)

str_replace_all(Bushisms,"([aeoiu])","\\1b\1")
