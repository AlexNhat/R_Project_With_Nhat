library(stringr)
library(readr)

df <- read.csv("file copy R.csv", header = TRUE, encoding = "UTF-8")
column_names <- colnames(df)
print(column_names)
print("-------------")
sequences <- df$String

# Lo???i b??? c�c th??? kh�ng li�n quan
processed_sequences <- c()

for (seq in sequences) {
  # Lo???i b??? d???u ch???m, d???u ph???y
  processed_seq <- str_replace_all(seq, "[.,]", "")
  # Lo???i b??? c�c c�u haha, hehe
  processed_seq <- str_replace_all(processed_seq, "\\b([Hh][Aa]ha+|[Hh]ehe
                                   |hjhj|hoho|Vhh|hmm|goihoihoijoljio)\\b", "")
  # Nh???ng chu???i kh�ng li�n quan �???n c�u h???i
  processed_seq <- str_replace_all(processed_seq, "\\b[��]�ng|C�|��ng|[Oo]k|Next]\\b", "")
  
  if (nchar(processed_seq) > 5) {
    processed_sequences <- c(processed_sequences, processed_seq)
  }
}

print(processed_sequences)
data_string <-data.frame(opinion = processed_sequences)
 
tich_cuc <- c("T???t", "Hay","gi�p",  "th???t s??? t???t", "h�???ng l???i", "�???t ph�", "h�i l??ng","hay"
             ,"h???u �ch", "tuy???t v???i", "ph�t tri???n","th�ng minh","tien ich",
             "gi???i th�ch","ti???n l???i","hi???u qu???")

tieu_cuc <- c("th???t nghi???p", "kh???ng ho???ng", "ngu","sai", "ph??? thu???c", "Kh�ng t???t","c� th???",
              "gi???m","sai", "quan ng???i")

trung_tinh <-c("B??nh th�???ng", "t�y", "Ch�nh x�c", "Kh�ng c� ?? ki???n")



khonglq <- c("Ko", "No problem","Ng??? �i", "Th�m", "nothing")
# �???m s??? l�???ng
sl_tich_cuc <- 0
sl_tieu_cuc <-0
sl_trung_tinh <-0
sl_khong_lien_quan <- 0

# H�m ph�n lo???i ?? ki???n
phan_loai_y_kien <- function(text) {
  tich_cuc_count <- sum(grepl(paste(tich_cuc, collapse = "|"), text, ignore.case = TRUE))
  tieu_cuc_count <- sum(grepl(paste(tieu_cuc, collapse = "|"), text, ignore.case = TRUE))
  trung_tinh_count <- sum(grepl(paste(trung_tinh, collapse = "|"), text, ignore.case = TRUE))
  klq_count <- sum(grepl(paste(khonglq, collapse = "|"), text, ignore.case = TRUE))
  if( klq_count >0&&trung_tinh_count==0){
    return ("?? ki???n kh�ng li�n quan")
  }
  
  
  if (tich_cuc_count > tieu_cuc_count) {
    return("?? ki???n t�ch c???c")
  } else if (tich_cuc_count < tieu_cuc_count) {
    return("?? ki???n ti�u c???c")
  } else {
    return("?? ki???n trung t�nh")
  }

}
tichcuc <- c()
tieucuc <- c()
trung_tinh<- c()
klq <- c()
for (i in 1:nrow(data_string)) {
  opinion <- as.character(data_string[i, "opinion"])
  
  # Ph�n lo???i ?? ki???n
  loai_y_kien <- phan_loai_y_kien(opinion)
  
  # T�ng bi???n �???m t��ng ???ng
  if (loai_y_kien == "?? ki???n t�ch c???c") {
    sl_tich_cuc <- sl_tich_cuc + 1
    tichcuc <- c(tichcuc, opinion)
  } else if (loai_y_kien == "?? ki???n ti�u c???c") {
    sl_tieu_cuc <- sl_tieu_cuc + 1
    tieucuc <- c(tieucuc, opinion)
  } else if (loai_y_kien == "?? ki???n trung t�nh") {
    sl_trung_tinh <- sl_trung_tinh + 1
    trung_tinh <- c(trung_tinh, opinion)
  } else {
    sl_khong_lien_quan <- sl_khong_lien_quan + 1
    klq <- c(klq, opinion)
  }
}

# Hi???n th??? k???t qu???
cat("S??? l�???ng ?? ki???n t�ch c???c:", sl_tich_cuc, "\n")
cat("S??? l�???ng ?? ki???n ti�u c???c:", sl_tieu_cuc, "\n")
cat("S??? l�???ng ?? ki???n trung t�nh:", sl_trung_tinh, "\n")
cat("S??? l�???ng ?? ki???n kh�ng li�n quan:", sl_khong_lien_quan, "\n")

Cau_tichcuc <-data.frame("tich_cuc" = tichcuc)
Cau_tieucuc <-data.frame("tieu_cuc" = tieucuc)
Cau_trungtinh <-data.frame("trung_tinh" = trung_tinh, encodeString("utf-8"))
Cau_klq <-data.frame("klq" = klq)

view(Cau_tichcuc)
view(Cau_tieucuc)
view(Cau_trungtinh)
view(Cau_klq)
