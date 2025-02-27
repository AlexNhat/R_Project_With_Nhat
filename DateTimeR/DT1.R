st <- Sys.Date()
typeof(st)

h <- base::date()
typeof(h)

s <- lubridate::today()
typeof(s)

library(ds4psy)
a <- ds4psy::cur_date()
typeof(a)
unclass(Sys.Date()- as.Date("1970-01-01"))== Sys.Date()

dt_titanic <- as.Date("1912-04-15")

format(dt_titanic, "The date %F denotes a %A in %B, in the %V, week of the year %Y.")

format(dt_titanic, "%y-%m-%d")

format(dt_titanic, "%a")

dt1 <- as.Date("2020-06-29", format = "%Y-%m-%d")



dt_born <- as.Date("2003-12-05")

(next_week <- Sys.Date()+0:6)
every_2_weeks <- seq(dt1, length=10, by="2 weeks")
every_2_months <- seq(dt1, length=3, by="2 months")
every_2_quarter <- seq(dt1, length=4, by="quarter")








