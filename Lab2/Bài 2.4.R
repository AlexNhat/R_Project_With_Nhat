library(tidyr)
library(dplyr)
library(tibble)
library(xtable)
library(foreign)

pew <- read.spss("tidy-data/data/pew.sav", to.data.frame = TRUE,  use.value.labels = FALSE)
pew <- pew[, c("weight","psraid", 'int_date', "lang","type", "state","form"
               ,"income","children","q1","q1a","q2","q2a","q3a")]
# L???Y 500 D??NG D??? LI???U

pew_new <- head(pew, 500)

pew$income <- factor(pew$income, levels = c("$<10k"))


data_pew <- pew_new %>% gather(q1:q2a, key ="question1_2a", value ="Count1_2a",na.rm = TRUE )%>%
                 select(weight, psraid, int_date,type, cregion,state,question1_2a,Count1_2a)
write.table(data_pew, file = "data_question.tex", sep = "&", col.names = TRUE, row.names = FALSE, 
            quote = FALSE)