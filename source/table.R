# Table

#loads tidyverse
library("tidyverse")

# reads the csv file
gym <- read.csv("../data/data.csv")

# filters the temperature to where it only shows above 60 degrees
temp_filter <- gym %>% filter (temperature > 60)

# combines holidays and weekends to find out if a day is special at all
special <- temp_filter %>%
  group_by(special_day = is_holiday + is_weekend)

# removes unnecessary columns
remove_rows <- special[,!names(special) %in% c("day_of_week","is_start_of_semester",
                                               "is_during_semester", "timestamp")]

# sorts the temperature in descdening order
sorted <- (remove_rows[order(remove_rows$temperature, decreasing = TRUE), ]   )

# changes the name of number_people to make it more readable
colnames(sorted)[colnames(sorted) == "number_people"] ="number_of_people"

# displays the table
view(sorted)

# short description
# A lot of the frequent hours happen to around the 14th hour. This suggest it's
# a popular time. Also the temperatures high in this region tend to be in the
# 9th month which may not be the same for UW. When the temperature is high,
# there does not seem to be a low amount of people at the gym.#table
