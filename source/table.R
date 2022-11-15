#table
library("dpylr")
library("tidyverse")


gym <- read.csv("C:/Users/Phamily/Documents/info201/group project/project-group-7-section-ad/data/data.csv")


temp_filter <- gym %>% filter (temperature > 60 & number_people)
special <- temp_filter %>%
  group_by(special_day = is_holiday + is_weekend)
remove_rows <- special[,!names(special) %in% c("day_of_week","is_start_of_semester", "is_during_semester", "timestamp")]

sorted <- (remove_rows[order(remove_rows$temperature, decreasing = TRUE), ]   )
colnames(sorted)[colnames(sorted) == "number_people"] ="number_of_people"

view(remove_rows)

# Short description