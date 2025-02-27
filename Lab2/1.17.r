library(ds4psy)
library(tidyr)
library(dplyr)
t_1 <-  ds4psy::t_1
t_2 <-  ds4psy::t_2
t_3 <-  ds4psy::t_3
t_4 <-  ds4psy::t_4

t_1_tidy <- t_1 %>%
  pivot_wider(names_from = shape,values_from = shape_time)%>%
  pivot_wider(names_from = color,values_from = color_time)

t_2_tidy <-t_2 %>% 
  gather(key = "variable", value = "value")

t_3_tidy <- t_3 %>% 
  gather(key = "variable", value = "value")

t_4_tidy <- t_4 %>% 
  gather(key = "variable", value = "value")