# Tidy data
library(tidyverse)
library(dplyr)
library(tidyr)


df <- read.csv("file copy R.csv", header = TRUE, encoding = "UTF-8")
head(df)
df["Another.website"]
data <-  df[, c("X.U.FEFF.Gender","School_Year", "School_Name","Use.","Another.website",
                "PrioritizeofChatGPTvsAnotherWebsite")]

tidydata <- data%>%separate(Another.website, 
into= c("Wikipedia.org", "Google.com", "Youtube.com", "Google Scholar","kh�c"), sep=",")


data_web <- data %>%
  mutate(Wikipedia.org = as.numeric(grepl("Wikipedia.org", Another.website)),
         Google.com = as.numeric(grepl("Google.com", Another.website)),
         Youtube.com = as.numeric(grepl("Youtube.com", Another.website)),
         `Google Scholar` = as.numeric(grepl("Google Scholar", Another.website)),
         kh�c = as.numeric(grepl("Kh�c", Another.website))) %>%
  select(-Another.website)


tidydata_long <-data_web %>%
pivot_longer(cols = starts_with(c("Wikipedia.org", "Google.com", 
                                "Youtube.com", "Google Scholar", "kh�c")),
               names_to = "Website",
               values_to = "Value")


# V??? bi???u �??? b???c thang
library(ggplot2)

# T�nh t???ng c???a 5 c???t
totals <- colSums(data_web[, c("Wikipedia.org", "Google.com", "Youtube.com", "Google Scholar", "kh�c")])

# T???o data frame m???i ch???a t???ng c???a 5 c???t
totals_df <- data.frame(Website = names(totals), Total = totals)

# V??? bi???u �??? c???t n???m ngang
ggplot(totals_df, aes(x = Total, y = Website)) +
  geom_col(fill = "steelblue") +
  labs(x = "Total", y = "Website") +
  ggtitle("Total Counts of Websites")







# Bi???u �??? h??nh b�nh

library(ggplot2)

# T�nh t???ng c???a 5 c???t
totals <- colSums(data_web[, c("Wikipedia.org", "Google.com", "Youtube.com", "Google Scholar", "kh�c")])

# T???o data frame m???i ch???a t???ng c???a 5 c???t
totals_df <- data.frame(Website = names(totals), Total = totals)

# V??? bi???u �??? h??nh b�nh
ggplot(totals_df, aes(x = "", y = Total, fill = Website)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  labs(fill = "Website", x = NULL, y = NULL) +
  ggtitle("Distribution of Websites")