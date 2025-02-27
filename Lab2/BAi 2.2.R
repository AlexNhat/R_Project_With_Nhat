# Bài 2.2
library(tidyr)
library(dplyr)
library(tibble)
library(stringr)
library(xtable)
library(reshape2)


billboard  <- read.csv("tidy-data/data/billboard.csv")
names(billboard)[2] <- "artist"
billboard$artist <- iconv(billboard$artist, "MAC","ASCII//translit")
billboard$track <- str_replace(billboard$track, "\\(,.*?\\)","")


long_name <- nchar(billboard$track)>20
billboard$track[long_name] <- paste0(substr(billboard$track[long_name],0,20),"...")

clean <- reshape2::melt(billboard, id =1:7, na.rm = TRUE)
clean$week <-  as.integer(str_replace_all(clean$variable,"[^0-9]
                                          +",""))
clean$variable <- NULL




data2.2 <- billboard%>%gather(x1st.week:x76th.week, key ="week", value ="rank", na.rm = TRUE )%>%
  select(year, artist, track, date.entered, date.peaked, week, rank)

data2.2$week <- gsub(".week", "", data2.2$week)

write.table(data2.2, file = "du_lieu.tex", sep = "&", row.names = TRUE, col.names = TRUE, quote = FALSE)


# Du lieu bai Hat
songs_data <- billboard[, c("artist.inverted", "track", "genre")]
songs_table <- xtable(songs_data)

# Lýu ð???i tý???ng xtable thành file LaTeX
file_name <- "du_lieu_bai_hat.tex"
print.xtable(songs_table, file = file_name, include.rownames = FALSE)


# T???o ra d??? li???u x???p h???ng
highest_rank <- data2.2 %>%
  group_by(track) %>%
  filter(rank == min(rank, na.rm = TRUE)) %>%
  select(track,week, rank)

rank_data <- highest_rank[, c("track", "week", "rank")]
rank_table <- xtable(rank_data)
file_name = "Du lieu rank cua bai hat.tex"
print.xtable(rank_table, file = file_name, include.rownames = FALSE)





