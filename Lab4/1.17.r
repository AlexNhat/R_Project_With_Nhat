sentences <- stringr::sentences

numbers <- c("one","two","three","four","five","six","seven","eight","nine","ten")
n_match <- str_c(numbers,collapse = "|")

has_number <- str_subset(sentences,n_match)
length(has_number)

n_matches <- str_extract(has_number,n_match)
table(n_matches)

mult_n_match <- sentences[str_count(sentences,n_match)>1]
str_view_all(mult_n_match,n_match)
