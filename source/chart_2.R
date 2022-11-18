# Scatter plot that shows average number of people at the gym at different temperature variances

# loads librarys that are used
library(tidyverse)
library(stringr)
library(ggplot2)

# loads the gym data
gym <- read.csv("../data/data.csv")

# removes unnecessary data and filters the temperatures
remove_rows_chart <- gym[,!names(gym) %in% c("day_of_week","is_start_of_semester",
                                             "is_during_semester", "timestamp")]
temp_filter <- remove_rows_chart %>% filter (hour > 10 & hour < 18)
avg_temp <- mean(temp_filter$temperature)
# creates new temperature_difference column with data regarding temperature deviation from average
temp_filter <- temp_filter %>% 
  mutate (
    temperature_difference = round(temperature - avg_temp)
  )
#x axis: temperature variance
#y axis: average number of people
average_people_per_temp <- temp_filter %>%
  group_by(temperature_difference) %>%
  summarize(
    average_people = mean(number_people)
  )


# Scatter plot with line linking temperature difference to average people in gym
# includes trend line
temp_variance_plot <- ggplot(average_people_per_temp, aes(x=temperature_difference, y=average_people)) +
  geom_point() +
  geom_line() +
  geom_smooth(method = "lm")
