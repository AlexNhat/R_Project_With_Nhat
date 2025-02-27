library(stringr)
library(reshape2)
library(plyr)
source("tidy-data/data/xtable.r")
source("tidy-data/data/read-fwf.r")
options(stringsAsFactors = F)

cols <- data.frame(
  name = c("id" , "year" , "month" , "element"),
  start = c(1,      12,     16,       18),
  end =   c(11,     15,     17,       21))

t <- c("value","mflag","qflag","sflag")
names = c()

for (v in t){
  names <- c(names,str_c(v,rep(1:31), sep = "_"))
}

starts <- cumsum(c(22, rep(c(5,1,1,1),31)))
starts <- starts[-length(starts)]
ends <- c(starts[-1],starts[length(starts)]+1) - 1

values <- data.frame(name = names,start = starts,end = ends)
cols <- rbind(cols,values)

raw <- read.fwf2("tidy-data/data/weather.txt", cols)
raw <- subset(raw,year == 2010 & element %in% c("TMIN","TMAX"))
raw <- raw[, c(1:4, which(str_detect(names(raw),"value")))]
raw$id <- str_c(str_sub(raw$id,1,2),str_sub(raw$id,-5,-1))

names(raw)[-(1:4)] <- str_c("d",1:31)
raw[raw == -9999] <- NA
raw[-(1:4)] <- raw[-(1:4)] / 10
rownames(raw) <- NULL
raw$element <- tolower(raw$element)

xtable(raw,file = "tidy-data/data/weather-raw.tex",digits = 1)

clean1 <- melt(raw,id = 1:4, na.rm = T)
clean1$day <- as.integer(str_replace(clean1$variable,"d",""))
clean1$date <- as.Date(ISOdate(clean1$year,clean1$month,clean1$day))

clean1 <- clean1[c("id","date","element","value")]
clean1 <- arrange(clean1,date,element)
clean1$date <- as.character(clean1$date)
xtable(clean1[1:10,],file = "tidy-data/data/weather-clean-1.tex",digits = 1)

clean2 <- dcast(clean1,... ~ element)
xtable(clean2[1:10,],file = "tidy-data/data/weather-clean-2.tex",digits = 1)
