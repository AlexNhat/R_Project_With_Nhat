# Calandar time

Sys.time()
lubridate::now()

tnow <- Sys.time()
tnow
class(tnow)
typeof(tnow)
is.numeric(tnow)
mode(tnow)
tx <- unclass(tnow)

tx ==  difftime(tnow, as.POSIXct("1970-01-01 00:00:00", tz ="UTC"), units = "secs")
format(tnow, "%A/%a/%u")
format(tnow, "%Y/%y/%c")
format(tnow, "%v/%j")

format(tnow, "%H:%M:%S (%Z, %z)")

format(tnow, "%H:%M %p")

tm1 <- as.POSIXct("10:30:45", format="%H:%M:%S")

dtp1 <- as.POSIXct("2020-07-01 07:12:59")

strptime(tnow, "%Y-%m-%d %H:%M:%S")

Sys.timezone()

t_berlin <- as.POSIXct("2020-12-24 23:59:59", tz= "Europe/Berlin")
t_nga <- as.POSIXct("2020-12-24 23:59:59", tz= "Europe/Moscow")

txmas <- "2020-12-24 20:00:00"
t1 <- as.POSIXct(txmas, tz= "UTC") - as.POSIXct(txmas, tz = "Australia/Sydney")
t2 <- as.POSIXct(txmas, tz ="UTC")

trunc(t1, units = "mins")









#  <- local Time
ctnow <- tnow
ltnow <- as.POSIXlt(tnow)
ctnow
ltnow

xm_lt <- as.POSIXlt("2020-12-24 18:15:30", tz="Europe/Oslo")
xm_lt
unlist(xm_lt)
trunc(xm_lt, "mins")
trunc(xm_lt, "months")
trunc(xm_lt, "days")
trunc(xm_lt, "years")
trunc(xm_lt, "hours")
as.POSIXlt(tnow, tz = "Asia/Saigon")






