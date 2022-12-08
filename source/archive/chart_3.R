# Scatter plot that shows number of people going to gym against temperature
# Shows a 2d density estimation over the scatter plot

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

# Renames the data to make them readable
colnames(temp_filter)[colnames(temp_filter) == "number_people"] ="Number_of_People"
colnames(temp_filter)[colnames(temp_filter) == "temperature"] ="Temperature"

# Scatter plot with the 2d density estimation
scatterplot <- ggplot(temp_filter, aes(x=Number_of_People, y=Temperature)) +
  geom_point()
scatterplot + geom_density_2d()
# Gradient color
scatterplot + stat_density_2d(aes(fill = ..level..), geom="polygon")
scatterplot + stat_density_2d(aes(fill = ..level..), geom="polygon")+
  scale_fill_gradient(low="yellow", high="gold")

# short description:
# The purpose of this scatterplot is to compare the amount of people that go to the gym
# against temperature. It filters out odd times so it only shows the times during the main
# parts of the day. There seems to be a frequent amount of times that there is around
# 40 people going to the gym when the temperature is around 60-65. The lower the temperature
# the less people go the gym. Whether its a special day or does not seem to affect it.
