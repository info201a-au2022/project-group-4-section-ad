#Heat Map Visualization by Day of Week

#Loading ggplot2 library
library(ggplot2)

#Loads dplyr library
library(dplyr)

#Loads our project dataset
gym_data <- read.csv("../data/data.csv")

#Extracts weekdays as a separate column
gym_data <- gym_data %>%
  mutate(
    day = weekdays(as.Date(date))
  )

#Creates dataframe sorted by weekday that contains total people measured, total measurements, and average people per measurement
num_weekday <- gym_data %>%
  group_by(day) %>%
  summarize(
    day_count = n(),
    total_people = sum(number_people)
  ) %>%
  mutate(
    average_people = total_people / day_count,
    graph_axis = 1
  )

#Orders data from Monday to Sunday
num_weekday$day <- factor(num_weekday$day, levels = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))

#Creates heatmap of average people at any given time per day
average_people_chart <- ggplot(num_weekday) +
  geom_tile(mapping = aes(x = day, y = graph_axis, fill = average_people), color = "black") +
  theme(axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.x = element_blank()) + 
  scale_fill_gradient(low = "orange", high = "red")
  
