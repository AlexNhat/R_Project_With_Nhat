library(stringr)
library(foreign)
library(plyr)
library(reshape2)
source("tidy-data/data/xtable.r")

pew <-read.spss("tidy-data/data/pew.sav")
pew <- as.data.frame(pew)

religion <- pew[c("q16","reltrad","income")]
religion$reltrad <- as.character(religion$reltrad)
religion$reltrad <- str_replace(religion$reltrad," Churches","")
religion$reltrad <- str_replace(religion$reltrad,"Protestant"," Prot")
religion$reltrad[religion$q16 == " Athetist (do not believe in God) "] <- "Athetist"
religion$reltrad[religion$q16 == " Agnostic (not sure if there is a God) "] <- "Agnostic"
religion$reltrad <- str_trim(religion$reltrad)
religion$reltrad <- str_replace_all(religion$reltrad," \\(.*?\\)","")

religion$income <- c("Less than $10,000" = "<$10k",
                    "10 to under $20,000" = "$10-20K",
                    "20 to under $30,000" = "$20-30K",
                    "30 to under $40,000" = "$30-40K",
                    "40 to under $50,000" = "$40-50K",
                    "50 to under $75,000" = "$50-75K",
                    "75 to under $100,000" = "$75-100K",
                    "100 to under $150,000" = "$100-150K",
                    "$150,000 or more" =">$150K",
                    "Don't know/Refused (VOL.)" = "Don't know/refuse")[religion$income]

religion$income <- factor(religion$income,levels = c("<$10k","$10-20K",
                                                  "$20-30K","$30-40K","$40-50K",
                                                   "$50-75K","$75-100K","$100-150K",
                                                  ">$150K","Don't know/refuse"))

counts <- count(religion, c("reltrad","income"))
names(counts)[1] <- "religion"

xtable(counts[1:10,], file = "tidy-data/data/pew-clean.tex")


raw <- dcast(counts,religion ~ income)
write.csv(raw, file = "tidy-data/data/pew-raw.csv")
